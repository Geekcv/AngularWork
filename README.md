//  Build the request data
let data = {
    fn: "common_fn",
    se: "lo_us",
    data: { 
        "phone": "abhishek",
        "password": "123"
    }
};

//  Convert to JSON string
let jsonStr = JSON.stringify(data);

//  URL encode
let urlEncoded = encodeURIComponent(jsonStr);

//  Base64 encode
let base64Encoded = btoa(urlEncoded);

//  Save into environment variable
pm.environment.set("payload", base64Encoded);


------------------------------------------------------


let encrypted;

try {
    // If response is JSON with "payload"
    encrypted = pm.response.json().payload;
} catch (e) {
    // Else, take raw response text
    encrypted = pm.response.text();
}

// Base64 decode
let base64Decoded = atob(encrypted);

// URL decode
let urlDecoded = decodeURIComponent(base64Decoded);

let jsonData;
try {
    jsonData = JSON.parse(urlDecoded);
} catch (e) {
    jsonData = { raw: urlDecoded };
}

// Log in console
console.log("Decoded Response:", jsonData);

// Show visualizer
pm.visualizer.set(`
<html>
<head>
  <style>
    body { font-family: Arial, sans-serif; padding: 10px; }
    pre {
      background: #f4f4f4;
      padding: 10px;
      border-radius: 8px;
      white-space: pre-wrap;
      word-break: break-word;
    }
  </style>
</head>
<body>
  <h3>Decoded API Response</h3>
  <pre>{{json}}</pre>
</body>
</html>
`, {
    json: JSON.stringify(jsonData, null, 2)
});







async function checkRecurringTasks() {
    const today = new Date();
    const todayStr = today.toDateString();
    const dayOfWeek = today.toLocaleString('default', { weekday: 'long' });
    const date = today.getDate();
    const customDAteSel = `${date.toString().length < 2 ? "0" + date.toString() : date.toString()}-${(today.getMonth() + 1).toString().length < 2 ? "0" + (today.getMonth() + 1).toString() : (today.getMonth() + 1).toString()}`;

    const sqlquery = `
        SELECT *
        FROM ${schema}.recurring_task
        WHERE activestatus = 0 AND (
            (schedule_type = '0') OR
            (schedule_type = '1' AND schedule_details->'reminder_on' @> $1) OR
            (schedule_type = '2' AND schedule_details->'reminder_on' @> $2) OR
            (schedule_type = '3' AND schedule_details->'reminder_on' @> $3)
        );
    `;
    const params = [
        JSON.stringify([dayOfWeek]),
        JSON.stringify([customDAteSel]),
        JSON.stringify([customDAteSel])
    ];

    connect_db.query(sqlquery, params, async (err, result) => {
        if (err) {
            console.error("Error during recurring task check:", err);
            return;
        }

        for (let i = 0; i < result.rows.length; i++) {
            let task = result.rows[i];
            let taskDetails = task.taskdetails;
            let commentdetails = task.commentdetails;
            let remind_me_before = task.schedule_details.remind_me_before !== "" 
                ? parseInt(task.schedule_details.remind_me_before) 
                : 1;

            let CURRENT_DATE = new Date();
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
