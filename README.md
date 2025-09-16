function checkRecurringTasks() {
    const today = new Date();
    const todayStr = today.toDateString();
    const dayOfWeek = today.toLocaleString('default', { weekday: 'long' });
    const date = today.getDate();
    const month = today.getMonth() + 1; // 1-12
    const monthStr = String(month).padStart(2, '0');
    const dayStr = String(date).padStart(2, '0');
    const todayMonthDay = `${monthStr}-${dayStr}`; // e.g., "09-16"

    const sqlquery = `
        SELECT *
        FROM ${schema}.recurring_task
        WHERE activestatus = 0;
    `;

    connect_db.query(sqlquery, [], async (err, result) => {
        if (err) {
            console.error("Error during recurring task check:", err);
            return;
        }

        for (let j = 0; j < result.rows.length; j++) {
            async function loop(i) {
                const task = result.rows[i];
                const taskDetails = task.taskdetails;
                const commentdetails = task.commentdetails;

                // ✅ Determine recurrence type
                const recurrenceType = task.schedule_details.type;
                const reminderSets = task.schedule_details.reminder_on ?? [];

                for (let set of reminderSets) {
                    if (!set.reminders) continue;

                    let shouldTrigger = false;

                    switch (recurrenceType) {
                        case "Daily":
                            shouldTrigger = true; // Runs every day
                            break;

                        case "Weekly":
                            shouldTrigger = set.reminders.includes(dayOfWeek);
                            break;

                        case "Monthly":
                            // Match by date (only check DD part)
                            shouldTrigger = set.reminders.some(r => {
                                const parts = String(r).split('-');
                                return parts.length === 2 && parts[1] === dayStr;
                            });
                            break;

                        case "Yearly":
                            // Match full MM-DD
                            shouldTrigger = set.reminders.includes(todayMonthDay);
                            break;
                    }

                    if (!shouldTrigger) continue;

                    // ✅ Prepare completion date
                    const remind_me_before = set.remind_me_before?.length > 0
                        ? parseInt(set.remind_me_before[0])
                        : 1;
                    const CURRENT_DATE = new Date();
                    const completiondate = new Date(CURRENT_DATE.setDate(CURRENT_DATE.getDate() + remind_me_before));

                    // ✅ Last task check (same as your code)
                    const lastTaskQuery = `
                        SELECT active_status, row_id, completion_date
                        FROM ${schema}.tasks
                        WHERE recurringid = $1
                        ORDER BY cr_on DESC
                        LIMIT 1;
                    `;
                    const lastTaskRes = await connect_db.query(lastTaskQuery, [task.row_id]);

                    if (lastTaskRes.rows.length > 0) {
                        const lastTask = lastTaskRes.rows[0];
                        const isCompleted = lastTask.active_status === 1;
                        const completedEarly = new Date(lastTask.completion_date) <= new Date();

                        if (isCompleted || completedEarly) {
                            console.log(`Skipping recurring task ${task.row_id} (already completed)`);
                            continue;
                        } else {
                            console.log(`Sending reminder for task ${task.row_id}`);
                            await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, lastTask.row_id);
                            continue;
                        }
                    }

                    // ✅ Prepare task data
                    const taskColumns = {
                        organizationid: taskDetails.organizationid ?? task.organizationid,
                        title: taskDetails.title,
                        description: taskDetails.description,
                        assigned_to: JSON.stringify(taskDetails.assigned_to),
                        assigned_by: taskDetails.assigned_by ?? task.created_by,
                        checklist: JSON.stringify(taskDetails.checklist),
                        completion_date: completiondate.toDateString(),
                        task_type: 1,
                        recurringid: task.row_id,
                    };

                    if (!taskColumns.organizationid || !taskColumns.assigned_by) {
                        console.warn(`Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`);
                        continue;
                    }

                    // ✅ Create new task
                    const resp = await addTask(taskColumns, taskDetails.assigned_to, taskDetails.assigned_by);

                    // ✅ Send WA notification
                    const whatsappTAskDetails = {
                        title: taskDetails.title,
                        description: taskDetails.description,
                        assignedby: taskDetails.assigned_by,
                        completion_date: completiondate.toDateString(),
                        organizationid: taskDetails.organizationid
                    };

                    if (completiondate.toDateString() !== todayStr && taskDetails.organizationid != '1739861234068_66iA') {
                        await notifyOnWA(whatsappTAskDetails, taskDetails.assigned_to);
                    }

                    // ✅ Add comments if available
                    if (commentdetails) {
                        const commentColumns = {
                            taskid: resp.data.row_id,
                            comment: commentdetails.comment,
                            userid: commentdetails.userid,
                            attachments: JSON.stringify(commentdetails.attachments),
                            organizationid: commentdetails.organizationid
                        };
                        const tablename = schema + '.comments';
                        await db_query.addData(tablename, commentColumns, commentdetails.row_id, "Comment");
                    }

                    await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, resp.data.row_id);
                }
            }
            loop(j);
        }
    });
            let completiondate = new Date(CURRENT_DATE.setDate(CURRENT_DATE.getDate() + remind_me_before));

            // ✅ 1. Check if last created task is already completed
            let lastTaskQuery = `
                SELECT status, completion_date
                FROM ${schema}.tasks
                WHERE recurringid = $1
                ORDER BY cr_on DESC
                LIMIT 1;
            `;
            let lastTaskRes = await connect_db.query(lastTaskQuery, [task.row_id]);

            if (lastTaskRes.rows.length > 0) {
                let lastTask = lastTaskRes.rows[0];
                let isCompleted = lastTask.status === 'COMPLETED';
                let completedEarly = new Date(lastTask.completion_date) <= today;

                if (isCompleted || completedEarly) {
                    // ✅ Task already completed → skip creation & notification
                    console.log(`Skipping recurring task ${task.row_id} (already completed)`);
                    continue;
                } else {
                    // ✅ Task not completed → send reminder only
                    console.log(`Sending reminder for task ${task.row_id}`);
                    await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, lastTask.row_id);
                    continue;
                }
            }

            // ✅ 2. Create new task (only if no previous task exists)
            let taskColumns = {
                row_id: taskDetails.row_id,
                organizationid: taskDetails.organizationid,
                title: taskDetails.title,
                description: taskDetails.description,
                assigned_to: JSON.stringify(taskDetails.assigned_to),
                assigned_by: taskDetails.assigned_by,
                checklist: JSON.stringify(taskDetails.checklist),
                completion_date: completiondate.toDateString(),
                task_type: 1,
                recurringid: task.row_id,
            };

            let resp = await addTask(taskColumns, taskDetails.assigned_to, taskDetails.assigned_by);

            // Send WhatsApp notification (only if not for today's date)
            if (completiondate.toDateString() !== todayStr && taskDetails.organizationid != '1739861234068_66iA') {
                await notifyOnWA({
                    title: taskDetails.title,
                    description: taskDetails.description,
                    assignedby: taskDetails.assigned_by,
                    completion_date: completiondate.toDateString(),
                    organizationid: taskDetails.organizationid
                }, taskDetails.assigned_to);
            }

            // Add comment if exists
            if (commentdetails) {
                let commentColumns = {
                    taskid: resp.data.row_id,
                    comment: commentdetails.comment,
                    userid: commentdetails.userid,
                    attachments: JSON.stringify(commentdetails.attachments),
                    organizationid: commentdetails.organizationid
                };
                await db_query.addData(schema + '.comments', commentColumns, commentdetails.row_id, "Comment");
            }

            // Notify user for newly created task
            await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, resp.data.row_id);
        }
    });
}



🧠 Step 1 – Understanding Your JSON

Example JSON for each type:

// Weekly
{
  "type": "Weekly",
  "reminder_on": [
    { "reminders": ["Monday"], "complete_till": "Tuesday", "remind_me_before": ["1"] },
    { "reminders": ["Monday"], "complete_till": "Wednesday", "remind_me_before": ["2"] }
  ]
}

type: Weekly (means it repeats every week)

reminders: ["Monday"] → Runs only if today is Monday

remind_me_before: ["1"] → Completion date is 1 day after reminder



---

// Daily
{
  "type": "Daily",
  "reminder_on": [
    { "reminders": [], "complete_till": "", "remind_me_before": [] }
  ]
}

type: Daily

reminders: [] → Empty means it runs every single day

remind_me_before: [] → We will still add a default completion date (1 day ahead)



---

// Monthly
{
  "type": "Monthly",
  "reminder_on": [
    { "reminders": ["09-16","09-20"], "complete_till": [20,21], "remind_me_before": [1,3] }
  ]
}

type: Monthly

reminders: ["09-16", "09-20"] → Means run only if today’s date matches one of these dates

If today = 16 Sept → MATCH ✅

If today = 20 Sept → MATCH ✅

If today = 21 Sept → ❌ NO match



---

// Yearly
{
  "type": "Yearly",
  "reminder_on": [
    { "reminders": ["09-16"], "complete_till": ["28-09"], "remind_me_before": [2] }
  ]
}

type: Yearly

reminders: ["09-16"] → Means run only if today’s month-day matches

If today = 16 Sept → MATCH ✅

If today = 16 Oct → ❌ NO match




function checkRecurringTasks() {
    const today = new Date();  
    const todayStr = today.toDateString();  
    const dayOfWeek = today.toLocaleString('default', { weekday: 'long' });  
    const date = today.getDate();  

    const sqlquery = `
    SELECT *
    FROM ${schema}.recurring_task
    WHERE activestatus = 0;
    `;

    connect_db.query(sqlquery, [], async (err, result) => {
        if (err) {
            console.error("Error during recurring task check:", err);
        } else {
            for (var j = 0; j < result.rows.length; j++) {
                async function loop(i) {
                    var task = result.rows[i];
                    const taskDetails = task.taskdetails;
                    const commentdetails = task.commentdetails;

                    // ✅ Parse reminder sets properly
                    const reminderSets = task.schedule_details.reminder_on ?? [];

                    for (let set of reminderSets) {
                        if (!set.reminders || !Array.isArray(set.reminders)) continue;

                        if (set.reminders.includes(dayOfWeek)) {
                            var remind_me_before = set.remind_me_before?.length > 0 ? parseInt(set.remind_me_before[0]) : 1;
                            var CURRENT_DATE = new Date();
                            var completiondate = new Date(CURRENT_DATE.setDate(CURRENT_DATE.getDate() + remind_me_before));

                            // 1. Check last created task
                            const lastTaskQuery = `
                                SELECT active_status, row_id, completion_date
                                FROM ${schema}.tasks
                                WHERE recurringid = $1
                                ORDER BY cr_on DESC
                                LIMIT 1;
                            `;
                            const lastTaskRes = await connect_db.query(lastTaskQuery, [task.row_id]);

                            if (lastTaskRes.rows.length > 0) {
                                const lastTask = lastTaskRes.rows[0];
                                const isCompleted = lastTask.active_status === 1;
                                const completedEarly = new Date(lastTask.completion_date) <= new Date();

                                if (isCompleted || completedEarly) {
                                    console.log(`Skipping recurring task ${task.row_id} (already completed)`);
                                    continue; // ✅ Don't exit loop — check next reminder set
                                } else {
                                    console.log(`Sending reminder for task ${task.row_id}`);
                                    await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, lastTask.row_id);
                                    continue; // ✅ Still allow next reminder set to run
                                }
                            }

                            // 2. Prepare task data
                            var taskColumns = {  
                                organizationid: taskDetails.organizationid ?? task.organizationid,  
                                title: taskDetails.title,  
                                description: taskDetails.description,  
                                assigned_to: JSON.stringify(taskDetails.assigned_to),  
                                assigned_by: taskDetails.assigned_by ?? task.created_by,  
                                checklist: JSON.stringify(taskDetails.checklist),  
                                completion_date: completiondate.toDateString(),  
                                task_type: 1,  
                                recurringid: task.row_id,  
                            };

                            if (!taskColumns.organizationid || !taskColumns.assigned_by) {
                                console.warn(`Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`);
                                continue; // ✅ Don't break whole function, just skip this one
                            }

                            // 3. Create new task
                            var resp = await addTask(taskColumns, taskDetails.assigned_to, taskDetails.assigned_by);

                            var whatsappTAskDetails = {  
                                title: taskDetails.title,  
                                description: taskDetails.description,  
                                assignedby: taskDetails.assigned_by,  
                                completion_date: completiondate.toDateString(),  
                                organizationid: taskDetails.organizationid  
                            };

                            if (completiondate.toDateString() !== todayStr && taskDetails.organizationid != '1739861234068_66iA') {  
                                await notifyOnWA(whatsappTAskDetails, taskDetails.assigned_to);  
                            }

                            if (commentdetails != undefined) {  
                                var commentColumns = {  
                                    taskid: resp.data.row_id,  
                                    comment: commentdetails.comment,  
                                    userid: commentdetails.userid,  
                                    attachments: JSON.stringify(commentdetails.attachments),  
                                    organizationid: commentdetails.organizationid  
                                };
                                var tablename = schema + '.comments';  
                                await db_query.addData(tablename, commentColumns, commentdetails.row_id, "Comment");  
                            }

                            await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, resp.data.row_id);
                        }
                    }
                }
                loop(j);
            }
        }
    });
}

