async function checkRecurringTasks() {
  // Instead of: const today = new Date();
  const today = new Date("2025-09-21"); // YYYY-MM-DD format
  const dayOfWeek = today.toLocaleString("default", { weekday: "long" });
  const todayDate = today.getDate().toString().padStart(2, "0");
  const todayMonth = (today.getMonth() + 1).toString().padStart(2, "0");
  const todayDM = `${todayDate}-${todayMonth}`; // DD-MM

  const sqlquery = `SELECT * FROM ${schema}.recurring_task WHERE activestatus = 0;`;

  connect_db.query(sqlquery, [], async (err, result) => {
    if (err) {
      console.error("Error fetching recurring tasks:", err);
      return;
    }

    for (let task of result.rows) {
      const taskDetails = task.taskdetails;
      const type = task.schedule_details?.type ?? "Weekly";
      const reminderSets = task.schedule_details?.reminder_list ?? [];

      for (let set of reminderSets) {
        if (!set) continue;

        let isToday = false;
        let completionDate = new Date(today);
        let remindIndex = 0;

        switch (type) {
          case "Daily":
            isToday = true;
            remindIndex = 0;
            completionDate = new Date(today); // today
            break;

          case "Weekly":
            remindIndex = set.reminder_on.findIndex((d) => d === dayOfWeek);
            isToday = remindIndex !== -1;
            if (isToday) {
              const remindDays = parseInt(
                set.remind_me_before[remindIndex] ??
                  set.remind_me_before[0] ??
                  0
              );
              completionDate.setDate(today.getDate() + remindDays);
            }
            break;

          case "Monthly":
            remindIndex = set.reminder_on.findIndex((d) => d === todayDM);
            isToday = remindIndex !== -1;
            if (isToday) {
              if (set.complete_till) {
                // Use complete_till as day of month
                const day = parseInt(set.complete_till);
                const month = today.getMonth();
                const year = today.getFullYear();
                completionDate = new Date(year, month, day);
              } else {
                // Fallback to remind_me_before
                const remindDays = parseInt(
                  set.remind_me_before[remindIndex] ??
                    set.remind_me_before[0] ??
                    0
                );
                completionDate.setDate(today.getDate() + remindDays);
              }
            }
            break;

          case "Yearly":
            remindIndex = set.reminder_on.findIndex((d) => d === todayDM);
            isToday = remindIndex !== -1;
            if (isToday) {
              if (set.complete_till) {
                const [day, month] = set.complete_till.split("-");
                const year = today.getFullYear();
                completionDate = new Date(
                  year,
                  parseInt(month) - 1,
                  parseInt(day)
                );
              } else {
                const remindDays = parseInt(
                  set.remind_me_before[remindIndex] ??
                    set.remind_me_before[0] ??
                    0
                );
                completionDate.setDate(today.getDate() + remindDays);
              }
            }
            break;

          default:
            continue; // Unknown type
        }

        if (!isToday) continue;

        const completionDateStr = completionDate.toISOString().split("T")[0];

        // Check if task already exists
        const existingTaskQuery = `SELECT * FROM ${schema}.tasks WHERE recurringid = $1 AND completion_date = $2`;
        const existingTaskRes = await connect_db.query(existingTaskQuery, [
          task.row_id,
          completionDateStr,
        ]);

        if (existingTaskRes.rows.length > 0) {
          const existingTask = existingTaskRes.rows[0];
          if (existingTask.active_status === 0) {
            console.log(
              `Reminder: Task already exists for ${taskDetails.title}`
            );
          }
          continue;
        }

        // Prepare new task
        const taskColumns = {
          row_id: libFunc.randomid(),
          organizationid: taskDetails.organizationid ?? task.organizationid,
          title: taskDetails.title,
          description: taskDetails.description,
          assigned_to: JSON.stringify(taskDetails.assigned_to),
          assigned_by: taskDetails.assigned_by ?? task.created_by,
          checklist: JSON.stringify(taskDetails.checklist),
          completion_date: completionDateStr,
          task_type: 1,
          recurringid: task.row_id,
        };

        if (!taskColumns.organizationid || !taskColumns.assigned_by) {
          console.warn(
            `Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`
          );
          continue;
        }

        await addTask(
          taskColumns,
          taskDetails.assigned_to,
          taskDetails.assigned_by
        );

        console.log(
          `✅ Created recurring task for ${taskDetails.title} on ${completionDateStr}`
        );
      }
    }
  });
}
