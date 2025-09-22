const connect_db = require("./connect_db/db_connect.js");
const libFunc = require("./functions.js");
const queries = require("./connect_db/queries.js");
const jwt = require("./authentication/auth_config");
const query = require("./connect_db/queries.js");
const { v4: uuidv4 } = require("uuid");
const { verify } = require("crypto");
var atob = require("atob");
var fs = require("fs");
// const publicIp = require('public-ip');
// import {publicIp, publicIpv4, publicIpv6} from 'public-ip';

module.exports = function () {
  this.common_fn = common_fn;
};

let common_fn = {
  // Registration
  cr_ad: createAdmin,
  saveuser,
  verifyuser,
  ch_pass: changePassword,

  si_up_doc: signUpDoctor,
  si_up_pat: signUpPatient,
  lo_us: loginUser,
  up_doc: updateDoctor,
  up_pat: updatePatient,
  up_doc_data: updateDoctordata,

  // signUp self
  si_up_pat_self: signUpPatientSelf,
  fe_pats_deactive: fetchDeactivePatients,

  si_up_doc_self: signUpDoctorSelf,
  fe_docs_deactive: fetchDoctorsdeactive,

  //login with email
  log_with_email: loginwithemail,

  cr_grop: createGroup,

  // lo_pat: loginPatient,

  fe_docs: fetchDoctors,
  fe_sepefic_doc: fetchSepesficDoctors,

  fe_pats: fetchPatients,
  fe_pats_by_ad: fetchPatientsByAdmin,
  fe_spefic_pats: fetchSepeficPatients,

  req_apt: requestAppointment,
  // acc_apt_req
  cr_apt: createAppointment,
  up_apt: updateAppointment,
  fe_apt_pats: fetchAppointmentsForPatients,
  fe_apt_docs: fetchAppointmentsForDoctors,

  // simple audio and video upload
  up_media: uploadMediaFiles,
  fe_media: fetchMedia,

  // upload media of tele session
  up_tel_ses: uploadtelepsychiatrySsessionsMediaFiles,
  fe_tel_ses: fetchsychiatrySsessionsmediametadatafouser,

  // upload media of inperson session
  up_inperson: uploadinpersonSsessionsMediaFiles,
  fe_inperson: fetchinpersonsessionsmediametadatafouser,

  // tele
  fe_tele_apoint: fetchaTeleSessionAppointments,

  //opd
  req_opd_apt: requestOPDAppointment,
  fe_opd_apt: fetchopdAppointmentsForPatients,
  fe_opd_docs: fetchopdAppointmentsForDoctors,
  fe_opd_apt_docs: fetchOpdAppointmentsForDoctors,
  cr_opd: createOpdAppointment,
  up_opd_apt: updateOpdAppointment,

  // forms builder
  cr_forms: saveforms,
  up_forms: updateforms,
  load_forms: loadforms,
  load_allForms: loadallforms,
  cr_for_ta: crateFormTable,
  sa_forms_data: saveforms_data,
  show_forms_res: showFormsResponse,
  show_forms_res_count: showFormsResponseCount,

  // fetch media
  fe_media_of_user: fetchmediametadatafouser,
  fe_mediadata: fetchmediametadetailsbyid,

  // delete
  del_doc: deletedoctor,
  del_pat: softDeleteOrStatusChangePatients,
  del_media: softDeleteOrStatusChangeaudiomedia,
  del_teleappoint: softDeleteOrStatusChangeaudioTeleappointments,
  del_opdappoint: softDeleteOrStatusChangeaudioOPDappointments,

  edit_user: editUserProfile,

  // formdata seperate forms
  up_media_form: updateFormsMedia,

  // create admins
  cr_admins: createAdminsprofile,
  up_admin_profile: updateAdminProfile,
  up_researchers_profile: updateResearchersprofile,
  fe_sepefic_Admin: fetchSepesficAdmins,
  fe_sepefic_researchers: fetchSepesficresearchers,
  up_participate_profile: up_participate_profile,
  fe_sepefic_participate: fetchSepesficparticipate,

  // checkrecurringtask
  ch_re: checkRecurringTasks,
};

// DB TABLES
const schema = "prosys";
const usersTable = schema + ".t_users";
const doctorsTable = schema + ".t_doctors";
const patientsTable = schema + ".t_patients";
const appointmentTable = schema + ".t_appointments";
const opdappointmentTable = schema + ".t_opdappointments";
const mediaTable = schema + ".t_media";
const formsSchemaTable = schema + ".t_forms";
const teleSessionMedia = schema + ".t_telepsychiatry_sessions";
const inpersonSsessions = schema + ".t_inperson_sessions";
const studiesTable = schema + ".t_studies";
const GroupTable = schema + ".t_studies_group";
const adminTable = schema + ".t_admindata";

function encodeRespData(data) {
  return btoa(encodeURIComponent(JSON.stringify(data)));
}

// async function checkRecurringTasks() {
//   const today = new Date();
//   const todayStr = today.toDateString();
//   const dayOfWeek = today.toLocaleString("default", { weekday: "long" });
//   const date = today.getDate();
//   const month = today.getMonth() + 1;
//   const todayKey = `${date.toString().padStart(2, "0")}-${month
//     .toString()
//     .padStart(2, "0")}`;

//   const sqlquery = `
//       SELECT *
//       FROM ${schema}.recurring_task
//       WHERE activestatus = 0;
//   `;

//   connect_db.query(sqlquery, [], async (err, result) => {
//     if (err) {
//       console.error("Error fetching recurring tasks:", err);
//       return;
//     }

//     for (let task of result.rows) {
//       const taskDetails = task.taskdetails;
//       const commentdetails = task.commentdetails;
//       const type = task.schedule_details?.type ?? "Weekly";
//       const reminderSets = task.schedule_details?.reminder_list ?? [];

//       for (let set of reminderSets) {
//         if (!set) continue;

//         const completeTill = set.complete_till;
//         const remindBeforeList = set.remind_me_before ?? [];

//         for (let rb of remindBeforeList) {
//           const remindDays = parseInt(rb);
//           let completionDate;

//           // Compute completionDate based on type
//           if (type === "Weekly") {
//             completionDate = getNextWeekdayDate(completeTill, remindDays);
//           } else if (type === "Monthly") {
//             completionDate = getNextMonthDate(completeTill, remindDays);
//           } else if (type === "Yearly") {
//             completionDate = getNextYearDate(completeTill, remindDays);
//           } else if (type === "Daily") {
//             completionDate = new Date();
//             completionDate.setDate(completionDate.getDate() + remindDays);
//           }

//           const completionDateStr = completionDate.toDateString();

//           // Check if task already exists
//           const existingTaskQuery = `
//                       SELECT *
//                       FROM ${schema}.tasks
//                       WHERE recurringid = $1 AND completion_date = $2
//                   `;
//           const existingTaskRes = await connect_db.query(existingTaskQuery, [
//             task.row_id,
//             completionDateStr,
//           ]);

//           if (existingTaskRes.rows.length > 0) {
//             const existingTask = existingTaskRes.rows[0];
//             if (existingTask.active_status === 0) {
//               // Pending task, send reminder

//               console.log("nitify user")
//               // await notifyUser(
//               //   taskDetails.assigned_to,
//               //   taskDetails.assigned_by,
//               //   taskDetails.title,
//               //   existingTask.row_id
//               // );
//             }
//             continue; // Skip task creation
//           }

//           // Prepare new task
//           const taskColumns = {
//             organizationid: taskDetails.organizationid ?? task.organizationid,
//             title: taskDetails.title,
//             description: taskDetails.description,
//             assigned_to: JSON.stringify(taskDetails.assigned_to),
//             assigned_by: taskDetails.assigned_by ?? task.created_by,
//             checklist: JSON.stringify(taskDetails.checklist),
//             completion_date: completionDateStr,
//             task_type: 1,
//             recurringid: task.row_id,
//           };

//           if (!taskColumns.organizationid || !taskColumns.assigned_by) {
//             console.warn(
//               `Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`
//             );
//             continue;
//           }

//           // Create new task
//           const resp = await addTask(
//             taskColumns,
//             taskDetails.assigned_to,
//             taskDetails.assigned_by
//           );

//           // Send notifications

//           console.log("Send notifications")
//           // await notifyUser(
//           //   taskDetails.assigned_to,
//           //   taskDetails.assigned_by,
//           //   taskDetails.title,
//           //   resp.data.row_id
//           // );

//           // Add comment if exists
//           // if (commentdetails) {
//           //   const commentColumns = {
//           //     taskid: resp.data.row_id,
//           //     comment: commentdetails.comment,
//           //     userid: commentdetails.userid,
//           //     attachments: JSON.stringify(commentdetails.attachments),
//           //     organizationid: commentdetails.organizationid,
//           //   };
//           //   await db_query.addData(
//           //     `${schema}.comments`,
//           //     commentColumns,
//           //     commentdetails.row_id,
//           //     "Comment"
//           //   );
//           // }
//         }
//       }
//     }
//   });
// }

// async function addTask(taskColumns, assignedto, userid) {

//   return new Promise(async (resolve, reject) => {
//       var tablename = schema + '.tasks';
//       var resp = await db_query.addData(tablename, taskColumns, null, "Task");
//       // console.log("resp", resp);
//       resolve(resp);
//       // libFunc.sendResponse(res, resp);
//   })
// }

// async function checkRecurringTasks() {
//   const today = new Date();
//   const todayStr = today.toDateString();
//   const dayOfWeek = today.toLocaleString("default", { weekday: "long" });
//   const date = today.getDate();
//   const month = today.getMonth() + 1;
//   const todayKey = `${date.toString().padStart(2, "0")}-${month
//     .toString()
//     .padStart(2, "0")}`;

//   const sqlquery = `
//       SELECT *
//       FROM ${schema}.recurring_task
//       WHERE activestatus = 0;
//   `;

//   connect_db.query(sqlquery, [], async (err, result) => {
//     if (err) {
//       console.error("Error fetching recurring tasks:", err);
//       return;
//     }

//     for (let task of result.rows) {
//       const taskDetails = task.taskdetails;
//       const commentdetails = task.commentdetails;
//       const type = task.schedule_details?.type ?? "Weekly";
//       const reminderSets = task.schedule_details?.reminder_list ?? [];

//       for (let set of reminderSets) {
//         if (!set) continue;

//         const completeTill = set.complete_till;
//         const remindBeforeList = set.remind_me_before ?? [];

//         // ✅ Skip if complete_till is required but missing
//         if (!completeTill && type !== "Daily") {
//           console.warn(`Skipping task ${task.row_id}: Missing complete_till`);
//           continue;
//         }

//         for (let rb of remindBeforeList) {
//           const remindDays = parseInt(rb);
//           let completionDate;

//           try {
//             if (type === "Weekly") {
//               completionDate = getNextWeekdayDate(completeTill, remindDays);
//             } else if (type === "Monthly") {
//               completionDate = getNextMonthDate(completeTill, remindDays);
//             } else if (type === "Yearly") {
//               completionDate = getNextYearDate(completeTill, remindDays);
//             } else if (type === "Daily") {
//               completionDate = new Date();
//               completionDate.setDate(completionDate.getDate() + remindDays);
//             }
//           } catch (e) {
//             console.error(
//               `Invalid completeTill format for task ${task.row_id}:`,
//               completeTill
//             );
//             continue;
//           }

//           // ✅ Skip if invalid date
//           if (!completionDate || isNaN(completionDate.getTime())) {
//             console.warn(
//               `Skipping task ${task.row_id}: Invalid completionDate`
//             );
//             continue;
//           }

//           // ✅ Always use ISO date format for PostgreSQL
//           const completionDateStr = completionDate.toISOString().split("T")[0];

//           // Check if task already exists
//           const existingTaskQuery = `
//             SELECT *
//             FROM ${schema}.tasks
//             WHERE recurringid = $1 AND completion_date = $2
//           `;
//           const existingTaskRes = await connect_db.query(existingTaskQuery, [
//             task.row_id,
//             completionDateStr,
//           ]);

//           if (existingTaskRes.rows.length > 0) {
//             const existingTask = existingTaskRes.rows[0];
//             if (existingTask.active_status === 0) {
//               console.log("Notify user for pending task", existingTask.row_id);
//             }
//             continue;
//           }

//           // Prepare new task
//           const taskColumns = {
//             row_id: libFunc.randomid(),
//             organizationid: taskDetails.organizationid ?? task.organizationid,
//             title: taskDetails.title,
//             description: taskDetails.description,
//             assigned_to: JSON.stringify(taskDetails.assigned_to),
//             assigned_by: taskDetails.assigned_by ?? task.created_by,
//             checklist: JSON.stringify(taskDetails.checklist),
//             completion_date: completionDateStr,
//             task_type: 1,
//             recurringid: task.row_id,
//           };

//           if (!taskColumns.organizationid || !taskColumns.assigned_by) {
//             console.warn(
//               `Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`
//             );
//             continue;
//           }

//           // Create new task
//           const resp = await addTask(
//             taskColumns,
//             taskDetails.assigned_to,
//             taskDetails.assigned_by
//           );

//           console.log(`Created recurring task for ${completionDateStr}`);
//         }
//       }
//     }
//   });
// }

// async function addTask(taskColumns, assignedto, userid) {
//   return new Promise(async (resolve, reject) => {
//     try {
//       const tablename = `${schema}.tasks`;

//       // Build dynamic insert query
//       const keys = Object.keys(taskColumns);
//       const values = Object.values(taskColumns);
//       const placeholders = keys.map((_, idx) => `$${idx + 1}`).join(", ");

//       const insertQuery = `
//         INSERT INTO ${tablename} (${keys.join(", ")})
//         VALUES (${placeholders})
//         RETURNING *;
//       `;

//       const result = await queries.customQuery(insertQuery, values);
//       resolve({ success: true, data: result[0] });
//     } catch (err) {
//       console.error("Error inserting task:", err);
//       reject(err);
//     }
//   });
// }

// Helper: Next weekday date with offset
// function getNextWeekdayDate(weekday, daysBefore = 0) {
//   const weekdays = [
//     "Sunday",
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thursday",
//     "Friday",
//     "Saturday",
//   ];
//   const today = new Date();
//   let targetIndex = weekdays.indexOf(weekday);
//   if (targetIndex < 0) targetIndex = today.getDay();
//   const diff = (targetIndex - today.getDay() + 7) % 7;
//   const result = new Date(today);
//   result.setDate(today.getDate() + diff - daysBefore);
//   return result;
// }

// // Helper: Next month date
// function getNextMonthDate(completeTill, daysBefore = 0) {
//   const today = new Date();
//   let targetDay = parseInt(completeTill);
//   const result = new Date(today.getFullYear(), today.getMonth(), targetDay);
//   if (result < today) result.setMonth(result.getMonth() + 1);
//   result.setDate(result.getDate() - daysBefore);
//   return result;
// }

// // Helper: Next year date
// function getNextYearDate(completeTill, daysBefore = 0) {
//   const [day, month] = completeTill.split("-").map(Number);
//   const today = new Date();
//   let result = new Date(today.getFullYear(), month - 1, day);
//   if (result < today) result.setFullYear(result.getFullYear() + 1);
//   result.setDate(result.getDate() - daysBefore);
//   return result;
// }

// ..............
// async function checkRecurringTasks() {
//   const today = new Date();
//   const todayStr = today.toDateString();
//   const dayOfWeek = today.toLocaleString("default", { weekday: "long" });

//   const sqlquery = `
//       SELECT *
//       FROM ${schema}.recurring_task
//       WHERE activestatus = 0;
//   `;

//   connect_db.query(sqlquery, [], async (err, result) => {
//     if (err) {
//       console.error("Error fetching recurring tasks:", err);
//       return;
//     }

//     for (let task of result.rows) {
//       const taskDetails = task.taskdetails;
//       const commentdetails = task.commentdetails;
//       const type = task.schedule_details?.type ?? "Weekly";
//       const reminderSets = task.schedule_details?.reminder_list ?? [];

//       for (let set of reminderSets) {
//         if (!set) continue;

//         // 1. Check if today matches any reminder_on in this object
//         const dayIndex = set.reminder_on.findIndex((d) => d === dayOfWeek);
//         if (dayIndex === -1) continue; // Today not in this reminder_on, skip

//         // 2. Get corresponding remind_me_before for today
//         const remindDays = parseInt(set.remind_me_before[dayIndex] ?? 0);

//         // 3. Compute completion date
//         const completionDate = new Date();
//         completionDate.setDate(completionDate.getDate() + remindDays);
//         const completionDateStr = completionDate.toISOString().split("T")[0]; // YYYY-MM-DD

//         // 4. Check if task for this object and completion date already exists
//         const existingTaskQuery = `
//           SELECT *
//           FROM ${schema}.tasks
//           WHERE recurringid = $1 AND completion_date = $2
//         `;
//         const existingTaskRes = await connect_db.query(existingTaskQuery, [
//           task.row_id,
//           completionDateStr,
//         ]);

//         if (existingTaskRes.rows.length > 0) {
//           const existingTask = existingTaskRes.rows[0];
//           if (existingTask.active_status === 0) {
//             console.log(
//               `Reminder: Task already exists for ${taskDetails.title} (row_id=${task.row_id})`
//             );
//             // await notifyUser(taskDetails.assigned_to, taskDetails.assigned_by, taskDetails.title, existingTask.row_id);
//           }
//           continue; // Skip creating new task for this object
//         }

//         // 5. Prepare new task row
//         const taskColumns = {
//           row_id: libFunc.randomid(),
//           organizationid: taskDetails.organizationid ?? task.organizationid,
//           title: taskDetails.title,
//           description: taskDetails.description,
//           assigned_to: JSON.stringify(taskDetails.assigned_to),
//           assigned_by: taskDetails.assigned_by ?? task.created_by,
//           checklist: JSON.stringify(taskDetails.checklist),
//           completion_date: completionDateStr,
//           task_type: 1,
//           recurringid: task.row_id,
//         };

//         if (!taskColumns.organizationid || !taskColumns.assigned_by) {
//           console.warn(
//             `Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`
//           );
//           continue;
//         }

//         // 6. Insert into tasks table
//         const resp = await addTask(
//           taskColumns,
//           taskDetails.assigned_to,
//           taskDetails.assigned_by
//         );
//         console.log(
//           `✅ Created recurring task for ${taskDetails.title} (row_id=${task.row_id}) on ${completionDateStr}`
//         );

//         // 7. Optional: Add comment if exists
//         // if (commentdetails) {
//         //   const commentColumns = {
//         //     taskid: resp.data.row_id,
//         //     comment: commentdetails.comment,
//         //     userid: commentdetails.userid,
//         //     attachments: JSON.stringify(commentdetails.attachments),
//         //     organizationid: commentdetails.organizationid,
//         //   };
//         //   await db_query.addData(`${schema}.comments`, commentColumns, commentdetails.row_id, "Comment");
//         // }
//       }
//     }
//   });
// }

// async function checkRecurringTasks() {
//   const today = new Date();
//   const dayOfWeek = today.toLocaleString("default", { weekday: "long" });
//   const todayDate = today.getDate().toString().padStart(2, "0");
//   const todayMonth = (today.getMonth() + 1).toString().padStart(2, "0");
//   const todayDM = `${todayDate}-${todayMonth}`; // DD-MM

//   const sqlquery = `SELECT * FROM ${schema}.recurring_task WHERE activestatus = 0;`;

//   connect_db.query(sqlquery, [], async (err, result) => {
//     if (err) {
//       console.error("Error fetching recurring tasks:", err);
//       return;
//     }

//     for (let task of result.rows) {
//       const taskDetails = task.taskdetails;
//       const type = task.schedule_details?.type ?? "Weekly";
//       const reminderSets = task.schedule_details?.reminder_list ?? [];

//       for (let set of reminderSets) {
//         if (!set) continue;

//         let isToday = false;
//         let remindIndex = 0;

//         switch (type) {
//           case "Daily":
//             // Always true
//             isToday = true;
//             remindIndex = 0;
//             break;

//           case "Weekly":
//             remindIndex = set.reminder_on.findIndex((d) => d === dayOfWeek);
//             isToday = remindIndex !== -1;
//             break;

//           case "Monthly":
//             remindIndex = set.reminder_on.findIndex((d) => d === todayDM);
//             isToday = remindIndex !== -1;
//             break;

//           case "Yearly":
//             remindIndex = set.reminder_on.findIndex((d) => d === todayDM);
//             isToday = remindIndex !== -1;
//             break;

//           default:
//             continue; // Unknown type
//         }

//         if (!isToday) continue;

//         const remindDays = parseInt(set.remind_me_before[remindIndex] ?? 0);

//         // Compute completion date
//         const completionDate = new Date(today);
//         completionDate.setDate(completionDate.getDate() + remindDays);
//         const completionDateStr = completionDate.toISOString().split("T")[0];

//         // Check existing task
//         const existingTaskQuery = `
//           SELECT * FROM ${schema}.tasks
//           WHERE recurringid = $1 AND completion_date = $2
//         `;
//         const existingTaskRes = await connect_db.query(existingTaskQuery, [
//           task.row_id,
//           completionDateStr,
//         ]);

//         if (existingTaskRes.rows.length > 0) {
//           const existingTask = existingTaskRes.rows[0];
//           if (existingTask.active_status === 0) {
//             console.log(`Reminder: Task already exists for ${taskDetails.title}`);
//           }
//           continue;
//         }

//         // Prepare task data
//         const taskColumns = {
//           row_id: libFunc.randomid(),
//           organizationid: taskDetails.organizationid ?? task.organizationid,
//           title: taskDetails.title,
//           description: taskDetails.description,
//           assigned_to: JSON.stringify(taskDetails.assigned_to),
//           assigned_by: taskDetails.assigned_by ?? task.created_by,
//           checklist: JSON.stringify(taskDetails.checklist),
//           completion_date: completionDateStr,
//           task_type: 1,
//           recurringid: task.row_id,
//         };

//         if (!taskColumns.organizationid || !taskColumns.assigned_by) {
//           console.warn(
//             `Skipping recurring task ${task.row_id}: Missing organizationid or assigned_by`
//           );
//           continue;
//         }

//         const resp = await addTask(
//           taskColumns,
//           taskDetails.assigned_to,
//           taskDetails.assigned_by
//         );

//         console.log(`✅ Created recurring task for ${taskDetails.title} on ${completionDateStr}`);
//       }
//     }
//   });
// }

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



async function addTask(taskColumns, assignedto, userid) {
  return new Promise(async (resolve, reject) => {
    try {
      const tablename = `${schema}.tasks`;

      // Build dynamic insert query
      const keys = Object.keys(taskColumns);
      const values = Object.values(taskColumns);
      const placeholders = keys.map((_, idx) => `$${idx + 1}`).join(", ");

      const insertQuery = `
        INSERT INTO ${tablename} (${keys.join(", ")})
        VALUES (${placeholders})
        RETURNING *;
      `;

      const result = await queries.customQuery(insertQuery, values);
      resolve({ success: true, data: result[0] });
    } catch (err) {
      console.error("Error inserting task:", err);
      reject(err);
    }
  });
}

//  async function saveuser(req, res) {
//   try {
//     console.log("inside saveuser");
//     console.log("email-->", req.body.user.profile.emails[0].value);
//     const email = req.body.user.profile.emails[0].value;

//    const columns_email = ["row_id","user_email",];
//      let clause_query = "";
//       if (email) {
//         clause_query = `user_email = '${email}' AND deleted=0 AND active=0`;
//       }

//       const response_email = await queries.selectQuery(usersTable, columns_email, clause_query);

//       console.log("resonse_email",response_email.length > 0)

//       if (response_email.length > 0) {
//          if (response_email && response_email.length > 0) {
//       const token = jwt.generateToken(
//         { row_id: response_email[0].row_id, user_email: response_email[0].user_email },
//         "5d"
//       );
//       return token
//     }
//       }else{
//  const userTableColumns = [
//       {
//         row_id: libFunc.randomid(),
//         user_email: email,
//         google_profile: JSON.stringify(req.body.user),
//         user_type:1,
//       },
//     ];
//     const usersTableReturnField = "row_id";
//     const userTableResp = await queries.insertQuery(
//       usersTable,
//       userTableColumns,
//       usersTableReturnField
//     );
//     console.log("userTableResp------>", userTableResp);
//     console.log("userTableResp.length", userTableResp.length > 0, userTableResp.length);
//     const columns = ["row_id", "user_email"];
//     let clause = "";
//     if (email) {
//       clause = `user_email = '${email}' AND deleted=0 AND active=0`;
//     }
//     const resp = await queries.selectQuery(usersTable, columns, clause);
//     console.log("Login resp ===>", resp);
//     if (resp && resp.length > 0) {
//       const token = jwt.generateToken(
//         { row_id: resp[0].row_id, user_email: resp[0].user_email },
//         "5d"
//       );
//       return token
//     }
//       }

//   } catch (error) {
//     console.log("Error in saveuser:", error);
//     // return res.status(500).send(
//     //   encodeRespData({ msg: "Something went wrong", status: 2 })
//     // );
//   }
// }

function generatePassword() {
  var length = 8,
    charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
    retVal = "";
  for (var i = 0, n = charset.length; i < length; ++i) {
    retVal += charset.charAt(Math.floor(Math.random() * n));
  }
  return retVal;
}

async function saveuser(req, res) {
  console.log("inside saveuser", req.body);

  try {
    const userData = req.body.user;
    if (!userData) throw new Error("User data is missing in request body.");

    const userType = userData.user_type || 2;
    const googleId = userData.google_id;
    const email = userData.email || null;
    const name = userData.name || "Unknown";
    const doctorId = userData.doctorId;
    const gender = userData.gender || "NotSpecified";
    if (!googleId) throw new Error("Google ID is missing.");

    const row_id = libFunc.randomid();
    const dummyPassword = generatePassword();

    console.log("dummy password", dummyPassword);
    const existingUser = await queries.customQuery(
      `SELECT * FROM config.t_users WHERE user_contact_number = '${googleId}'`
    );

    let userRowId;
    const userRows = existingUser.rows || existingUser; // Safe access

    if (userRows.length > 0) {
      userRowId = userRows[0].row_id;
    } else {
      await queries.customQuery(
        `INSERT INTO config.t_users (row_id, user_contact_number, user_password, user_type,user_email,active)
         VALUES ('${row_id}', '${googleId}', '${dummyPassword}', ${userType},'${email}',1)`
      );
      userRowId = row_id;
    }

    if (userType === 1) {
      const doctorCheck = await queries.customQuery(
        `SELECT * FROM config.t_doctors WHERE user_row_id = '${userRowId}'`
      );
      const doctorRows = doctorCheck.rows || doctorCheck;

      if (doctorRows.length === 0) {
        const docRowId = libFunc.randomid();
        await queries.customQuery(
          `INSERT INTO config.t_doctors (row_id, user_row_id, doctor_name, doctor_email, doctor_type, doctor_gender)
           VALUES ('${docRowId}', '${userRowId}', '${name}', '${email}', '1', 'male')`
        );
      }
    } else if (userType === 2) {
      const patientCheck = await queries.customQuery(
        `SELECT * FROM config.t_patients WHERE user_row_id ='${userRowId}'`,
        []
      );
      const patientRows = patientCheck.rows || patientCheck;

      if (patientRows.length === 0) {
        const patientRowId = libFunc.randomid();
        await queries.customQuery(
          `INSERT INTO config.t_patients (row_id, user_row_id, doc_row_id, patient_name, patient_email, patient_gender, patient_age)
           VALUES ('${patientRowId}', '${userRowId}', '${doctorId}', '${name}', '${email}', '${gender}', '0')`,
          []
        );
      }
    }

    return {
      success: true,
      userRowId,
      message: userRows.length > 0 ? "User already exists" : "New user created",
    };
  } catch (error) {
    console.error("Error saving user:", error);

    // if (!res.headersSent) {
    //   return res
    //     .status(500)
    //     .send({ message: "Error saving user", error: error.message });
    // }
  }
}

async function verifyuser(req, res) {
  console.log("inside verifyuser------>", req.body.user.email);
  const email = req.body.user.email;

  const columns = ["row_id", "user_password", "user_type"];
  // Check if identifier is an email (basic validation)
  const isEmail = email;

  // Build the clause based on input type
  let clause = "";
  if (isEmail) {
    clause = `user_email = '${isEmail}' AND deleted=0 AND active=0`;
  }

  const resp = await queries.selectQuery(usersTable, columns, clause);
  console.log("verify user resp ===>", resp);

  if (resp.length > 0) {
    return true;
  }
}

// async function loginwithemail(req,res) {
//   console.log("req----", req);

//       const stateRaw =req.data;
//   console.log("stateRaw",stateRaw)

//    try {
//     const  email  = req.data;
//     const identifier = email;

//     console.log("email ---///",email)
//     if (identifier) {

//       const columns = ["row_id", "user_password", "user_type"];
//       // Check if identifier is an email (basic validation)
//       const isEmail = identifier.includes("@");

//       // Build the clause based on input type
//       let clause = "";
//       if (isEmail) {
//         clause = `user_email = '${identifier}' AND deleted=0 AND active=0`;
//       } else {
//         clause = `user_contact_number = '${identifier}' AND deleted=0 AND active=0`;
//       }

//       const resp = await queries.selectQuery(usersTable, columns, clause);
//       console.log("Login resp ===>", resp);

//       if (resp.length > 0) {
//         let user_details = "";

//         if (resp[0].user_type == "1" || resp[0].user_type == "0") {
//           const doc_columns = [
//             `${usersTable}.row_id`,
//             "firstname",
//             "lastname",
//             "doctor_email",
//             "user_contact_number",
//             "doctor_gender",
//             "photo_path"
//           ];

//           const doc_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
//           const joins = [
//             {
//               join_type: "left",
//               table1: usersTable,
//               table2: doctorsTable,
//               table1_col: "row_id",
//               table2_col: "user_row_id",
//             },
//           ];
//           const doc_resp = await queries.selectQuery(
//             usersTable,
//             doc_columns,
//             doc_clause,
//             joins
//           );
//           console.log("doc_resp ===>", doc_resp);
//           user_details = doc_resp[0];
//         }

//         if (resp[0].user_type == "2") {
//           const pat_columns = [
//             `${usersTable}.row_id`,
//             "patient_firstname",
//             "patient_lastname",
//             "patient_email",
//             "user_contact_number",
//             "patient_gender",
//             "patient_age",
//           ];

//           const pat_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
//           const joins = [
//             {
//               join_type: "left",
//               table1: usersTable,
//               table2: patientsTable,
//               table1_col: "row_id",
//               table2_col: "user_row_id",
//             },
//           ];
//           const pat_resp = await queries.selectQuery(
//             usersTable,
//             pat_columns,
//             pat_clause,
//             joins
//           );
//           console.log("pat_resp ===>", pat_resp);
//           user_details = pat_resp[0];
//         }

//         if (email ) {
//           const token = jwt.generateToken(
//             { row_id: resp[0].row_id, user_type: resp[0].user_type },
//             "5d"
//           );
//           res.status(200).send(
//             encodeRespData({
//               msg: "Login successful",
//               token,
//               user_type: resp[0].user_type,
//               user_details,
//               status: 0,
//             })
//           );
//         } else {
//           console.log("Invalid credentials")
//           res.send(encodeRespData({ msg: "Invalid credentials", status: 1 }));
//         }
//       } else {
//           console.log("Invalid credentials")

//         res.send(encodeRespData({ msg: "Invalid credentials", status: 1 }));

//       }
//     } else {
//           console.log("Please fill all the required fields")

//       res.send(
//         encodeRespData({
//           msg: "Please fill all the required fields",
//           status: 1,
//         })
//       );
//     }
//   } catch (error) {
//     console.log("Something went wrong",error);
//     res.send(encodeRespData({ msg: "Something went wrong", status: 2 }));
//   }

// }

async function loginwithemail(req, res) {
  console.log("req----????????", req.email);

  const stateRaw = req.email;
  console.log("stateRaw", stateRaw);

  try {
    const email = req.email;
    const identifier = email;

    console.log("email ---///", email);
    if (identifier) {
      const columns = ["row_id", "user_password", "user_type"];
      // Check if identifier is an email (basic validation)
      const isEmail = identifier.includes("@");

      // Build the clause based on input type
      let clause = "";
      if (isEmail) {
        clause = `user_email = '${identifier}' AND deleted=0 AND active=0`;
      } else {
        clause = `user_contact_number = '${identifier}' AND deleted=0 AND active=0`;
      }

      const resp = await queries.selectQuery(usersTable, columns, clause);
      console.log("Login resp ===>", resp);

      if (resp.length > 0) {
        let user_details = "";

        if (resp[0].user_type == "1" || resp[0].user_type == "0") {
          const doc_columns = [
            `${usersTable}.row_id`,
            "firstname",
            "lastname",
            "doctor_email",
            "user_contact_number",
            "doctor_gender",
            "photo_path",
          ];

          const doc_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
          const joins = [
            {
              join_type: "left",
              table1: usersTable,
              table2: doctorsTable,
              table1_col: "row_id",
              table2_col: "user_row_id",
            },
          ];
          const doc_resp = await queries.selectQuery(
            usersTable,
            doc_columns,
            doc_clause,
            joins
          );
          console.log("doc_resp ===>", doc_resp);
          user_details = doc_resp[0];
        }

        if (resp[0].user_type == "2") {
          const pat_columns = [
            `${usersTable}.row_id`,
            "patient_firstname",
            "patient_lastname",
            "patient_email",
            "user_contact_number",
            "patient_gender",
            "patient_age",
          ];

          const pat_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
          const joins = [
            {
              join_type: "left",
              table1: usersTable,
              table2: patientsTable,
              table1_col: "row_id",
              table2_col: "user_row_id",
            },
          ];
          const pat_resp = await queries.selectQuery(
            usersTable,
            pat_columns,
            pat_clause,
            joins
          );
          console.log("pat_resp ===>", pat_resp);
          user_details = pat_resp[0];
        }

        console.log("inside email -----------");
        const token = jwt.generateToken(
          { row_id: resp[0].row_id, user_type: resp[0].user_type },
          "5d"
        );
        res.send(
          encodeRespData({
            msg: "Login successful",
            token,
            user_type: resp[0].user_type,
            user_details,
            status: 0,
          })
        );
      } else {
        console.log("Invalid credentials");

        // res.send(encodeRespData({ msg: "Invalid credentials", status: 1 }));
      }
    } else {
      console.log("Please fill all the required fields");

      //   res.send(
      //     encodeRespData({
      //       msg: "Please fill all the required fields",
      //       status: 1,
      //     })
      //   );
    }
  } catch (error) {
    console.log("Something went wrong", error);
    // res.send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function createAdmin(req, res) {
  try {
    const { phone, password, name, email } = req.data;
    const columns = [
      {
        row_id: libFunc.randomid(),
        user_contact_number: phone,
        user_password: password,
        user_type: 0,
      },
    ];
    const returnField = "row_id";
    const resp = await queries.insertQuery(usersTable, columns, returnField);
    console.log(resp);
    if (resp.length > 0) {
      res.status(201).send(encodeRespData({ msg: "Admin Created" }));
    } else {
      res.status(500).send(encodeRespData({ msg: "Something went wrong" }));
    }
  } catch (error) {
    console.log(error);
    res.status(500).send(encodeRespData({ msg: "Something went wrong" }));
  }
}

// Doctors Registration
async function signUpDoctor(req, res) {
  // const systeminfo = req.reqdata.useragent

  const os = req.reqdata.useragent.os;
  const browser = req.reqdata.useragent.browser;
  const platform = req.reqdata.useragent.platform;
  const version = req.reqdata.useragent.version;
  // const ip = req.reqdata.ip.slice(7,50)
  const ip = req.ipdata.slice(7, 50);
  const url = req.reqdata.rawHeaders[17];

  // const ipdata = await publicIp.publicIpv4(); // For IPv4
  //     // const ipdata2 = await publicIp.publicIpv6(); // For IPv6
  //   console.log(`Your public IP address is: ${ipdata}`);

  console.log(`Your public IP address is: ${req.ipdata.slice(7, 50)}`);

  const systeminfo = {
    os: os,
    browser: browser,
    platform: platform,
    version: version,
    ip: ip,
    url: url,
  };

  console.log("sys data----> ", systeminfo);

  try {
    console.log("user id from token===>", req.user_id);
    const user_row_id = req.user_id;
    const {
      doctor_fname,
      doctor_lname,
      doctor_email,
      doctor_phone,
      doctor_password,
      // doctor_type,
      institution,
      photo_path,
      doctor_gender,
    } = req.data;

    const existingUser = await queries.customQuery(`
      SELECT user_email, user_contact_number FROM ${usersTable}
      WHERE user_email = '${doctor_email.trim()}'
      OR user_contact_number = '${doctor_phone.trim()}'
    `);

    console.log("existingUser", existingUser);
    if (existingUser.length > 0) {
      const user = existingUser[0];
      if (user.user_email === doctor_email.trim()) {
        return res.send(
          encodeRespData({
            msg: "Email address you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
      if (user.user_contact_number === doctor_phone.trim()) {
        return res.send(
          encodeRespData({
            msg: "Phone number you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
    }

    if (doctor_fname && doctor_password) {
      // Check user authority
      const checkAuthorityColumn = ["user_type"];
      const checkAuthorityClause = `row_id = '${user_row_id}'`;
      const checkAuthorityResp = await queries.selectQuery(
        usersTable,
        checkAuthorityColumn,
        checkAuthorityClause
      );
      console.log(checkAuthorityResp);
      if (checkAuthorityResp.length > 0) {
        if (checkAuthorityResp[0].user_type == 0) {
          await connect_db.query("BEGIN TRANSACTION");
          const userTableColumns = [
            {
              row_id: libFunc.randomid(),
              user_contact_number: doctor_phone,
              user_password: doctor_password,
              user_type: 1,
              user_email: doctor_email,
            },
          ];
          const usersTableReturnField = "row_id";
          const userTableResp = await queries.insertQuery(
            usersTable,
            userTableColumns,
            usersTableReturnField
          );
          console.log(userTableResp);
          if (userTableResp.length > 0) {
            const columns = [
              {
                row_id: libFunc.randomid(),
                user_row_id: userTableResp[0].row_id,
                firstname: doctor_fname,
                lastname: doctor_lname,
                institution,
                doctor_email,
                // doctor_type,
                doctor_gender,
                photo_path,
                system_data: JSON.stringify(systeminfo),
              },
            ];

            const returnFields = "row_id";
            const resp = await queries.insertQuery(
              doctorsTable,
              columns,
              returnFields
            );
            console.log(resp);
            if (resp.length > 0) {
              await connect_db.query("COMMIT");
              res
                .status(201)
                .send(
                  encodeRespData({ msg: "Registration successful", status: 0 })
                );
            } else {
              await connect_db.query("ROLLBACK");
              res
                .status(500)
                .send(
                  encodeRespData({ msg: "Something went wrong", status: 1 })
                );
            }
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res.status(403).send(
            encodeRespData({
              msg: "You don't have access for this request",
              status: 1,
            })
          );
        }
      }
    } else {
      await connect_db.query("ROLLBACK");
      res.status(403).send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function signUpDoctorSelf(req, res) {
  try {
    // console.log("user id from token===>", req.user_id);
    // const user_row_id = req.user_id;
    const {
      doctor_fname,
      doctor_lname,
      doctor_email,
      doctor_phone,
      doctor_password,
      // doctor_type,
      institution,
      doctor_gender,
      photo_path,
    } = req.data;

    if (
      !doctor_fname ||
      !doctor_lname ||
      !doctor_email ||
      !doctor_phone ||
      !doctor_password ||
      !institution ||
      !doctor_gender
    ) {
      return res.send(
        encodeRespData({
          msg: "All fields are required",
          status: 1,
        })
      );
    }

    const existingUser = await queries.customQuery(`
      SELECT user_email, user_contact_number FROM ${usersTable}
      WHERE user_email = '${doctor_email.trim()}'
      OR user_contact_number = '${doctor_phone.trim()}'
    `);

    console.log("existingUser", existingUser);
    if (existingUser.length > 0) {
      const user = existingUser[0];
      if (user.user_email === doctor_email.trim()) {
        return res.send(
          encodeRespData({
            msg: "Email address you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
      if (user.user_contact_number === doctor_phone.trim()) {
        return res.send(
          encodeRespData({
            msg: "Phone number you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
    }
    // Check user authority
    const checkAuthorityResp = await queries.selectQuery(usersTable);
    console.log(checkAuthorityResp);
    await connect_db.query("BEGIN TRANSACTION");
    const userTableColumns = [
      {
        row_id: libFunc.randomid(),
        user_contact_number: doctor_phone.trim(),
        user_password: doctor_password.trim(),
        user_type: 1,
        active: 1,
        user_email: doctor_email.trim(),
      },
    ];
    const usersTableReturnField = "row_id";
    const userTableResp = await queries.insertQuery(
      usersTable,
      userTableColumns,
      usersTableReturnField
    );
    console.log(userTableResp);
    if (userTableResp.length > 0) {
      const columns = [
        {
          row_id: libFunc.randomid(),
          user_row_id: userTableResp[0].row_id,
          firstname: doctor_fname,
          lastname: doctor_lname,
          doctor_email,
          // doctor_type,
          institution,
          doctor_gender,
          photo_path,
        },
      ];

      const returnFields = "row_id";
      const resp = await queries.insertQuery(
        doctorsTable,
        columns,
        returnFields
      );
      console.log(resp);
      if (resp.length > 0) {
        await connect_db.query("COMMIT");
        res
          .status(201)
          .send(
            encodeRespData({ msg: "Approval pending by admin", status: 0 })
          );
      } else {
        await connect_db.query("ROLLBACK");
        res
          .status(500)
          .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
      }
    } else {
      await connect_db.query("ROLLBACK");
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

// Patients Registration
async function signUpPatient(req, res) {
  try {
    console.log("user data===>", req.data);
    const user_row_id = req.user_id;
    console.log("user_id", req.user_id);
    const {
      patient_fname,
      patient_lname,
      patient_email,
      patient_number,
      patient_password,
      patient_gender,
      patient_age,
      qualifications,
      qualifications_details,
      study_name,
      study_arm,
      researcher_name,
      researcher_mobile,
      researcher_email,
      photo_path,
    } = req.data;

    const existingUser = await queries.customQuery(`
      SELECT user_email, user_contact_number FROM ${usersTable}
      WHERE user_email = '${patient_email.trim()}'
      OR user_contact_number = '${patient_number.trim()}'
    `);

    console.log("existingUser", existingUser);
    if (existingUser.length > 0) {
      const user = existingUser[0];
      if (user.user_email === patient_email.trim()) {
        return res.send(
          encodeRespData({
            msg: "Email address you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
      if (user.user_contact_number === patient_number.trim()) {
        return res.send(
          encodeRespData({
            msg: "Phone number you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
    }

    if (user_row_id && patient_fname && patient_password) {
      const checkAuthorityColumn = ["user_type"];
      const checkAuthorityClause = `row_id = '${user_row_id}'`;
      const checkAuthorityResp = await queries.selectQuery(
        usersTable,
        checkAuthorityColumn,
        checkAuthorityClause
      );
      console.log(checkAuthorityResp);
      if (checkAuthorityResp.length > 0) {
        // console.log("auth...",checkAuthorityResp[0].user_type)
        if (
          checkAuthorityResp[0].user_type == 1 ||
          checkAuthorityResp[0].user_type == 0
        ) {
          await connect_db.query("BEGIN TRANSACTION");
          const userTableColumns = [
            {
              row_id: libFunc.randomid(),
              user_contact_number: patient_number,
              user_password: patient_password,
              user_type: 2,
              user_email: patient_email,
            },
          ];
          const usersTableReturnField = "row_id";
          const onConflict = {
            field: "user_contact_number",
            action: "DO NOTHING",
          };
          const userTableResp = await queries.insertQuery(
            usersTable,
            userTableColumns,
            usersTableReturnField,
            onConflict
          );
          console.log(userTableResp);
          if (userTableResp.length > 0) {
            let columns = [];

            if (checkAuthorityResp[0].user_type == 1) {
              columns = [
                {
                  row_id: libFunc.randomid(),
                  user_row_id: userTableResp[0].row_id,
                  doc_row_id: user_row_id,
                  patient_firstname: patient_fname,
                  patient_lastname: patient_lname,
                  patient_email,
                  patient_gender,
                  patient_age,
                  qualifications,
                  qualifications_details,
                  photo_path,
                },
              ];
            } else {
              columns = [
                {
                  row_id: libFunc.randomid(),
                  user_row_id: userTableResp[0].row_id,
                  doc_row_id: req.data.doctor_id,
                  patient_firstname: patient_fname,
                  patient_lastname: patient_lname,
                  patient_email,
                  patient_gender,
                  patient_age,
                  admin_row_id: user_row_id,
                  photo_path,
                },
              ];
            }

            const returnFields = "row_id";
            const resp = await queries.insertQuery(
              patientsTable,
              columns,
              returnFields
            );
            console.log("resp===============", resp[0].row_id);
            if (resp.length > 0) {
              let columns = [];

              if (checkAuthorityResp[0].user_type == 1) {
                columns = [
                  {
                    row_id: libFunc.randomid(),
                    study_name: study_name,
                    study_arm: study_arm,
                    researcher_name: researcher_name,
                    researcher_mobile: researcher_mobile,
                    researcher_email: researcher_email,
                    pat_row_id: resp[0].row_id,
                    doc_row_id: user_row_id,
                  },
                ];
              } else {
                columns = [
                  {
                    row_id: libFunc.randomid(),
                    study_name: study_name,
                    study_arm: study_arm,
                    researcher_name: researcher_name,
                    researcher_mobile: researcher_mobile,
                    researcher_email: researcher_email,
                    pat_row_id: resp[0].row_id,
                    doc_row_id: req.data.doctor_id,
                  },
                ];
              }

              const returnFields = "row_id";
              const respponse = await queries.insertQuery(
                studiesTable,
                columns,
                returnFields
              );
              console.log(respponse);

              await connect_db.query("COMMIT");
              res
                .status(201)
                .send(
                  encodeRespData({ msg: "Registration successful", status: 0 })
                );
            } else {
              await connect_db.query("ROLLBACK");
              res
                .status(500)
                .send(
                  encodeRespData({ msg: "Something went wrong", status: 1 })
                );
            }
          } else {
            await connect_db.query("ROLLBACK");
            console.log("User exist====>");
            res.status(500).send(
              encodeRespData({
                msg: "User with this number already exist",
                status: 1,
              })
            );
          }
        } else {
          await connect_db.query("ROLLBACK");
          res.status(403).send(
            encodeRespData({
              msg: "You don't have access for this request",
              status: 1,
            })
          );
        }
      } else {
      }
    } else {
      await connect_db.query("ROLLBACK");
      res.status(403).send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");

    console.log(error);
    res.status(500).send(
      encodeRespData({
        msg: "User with this contact already exist",
        status: 2,
      })
    );
  }
}

async function signUpPatientSelf(req, res) {
  try {
    console.log("user data===>", req.data);
    const user_row_id = null;
    const {
      doctor_id,
      patient_fname,
      patient_lname,
      patient_email,
      patient_number,
      patient_password,
      patient_gender,
      patient_age,
      qualifications,
      qualifications_details,
      study_name,
      study_arm,
      researcher_name,
      researcher_mobile,
      researcher_email,
      photo_path,
    } = req.data;

    const existingUser = await queries.customQuery(`
      SELECT user_email, user_contact_number FROM ${usersTable}
      WHERE user_email = '${patient_email.trim()}'
      OR user_contact_number = '${patient_number.trim()}'
    `);

    console.log("existingUser", existingUser);
    if (existingUser.length > 0) {
      const user = existingUser[0];
      if (user.user_email === patient_email.trim()) {
        return res.send(
          encodeRespData({
            msg: "Email address you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
      if (user.user_contact_number === patient_number.trim()) {
        return res.send(
          encodeRespData({
            msg: "Phone number you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
    }

    if (patient_fname && patient_password) {
      // console.log("auth...",checkAuthorityResp[0].user_type)
      await connect_db.query("BEGIN TRANSACTION");
      const userTableColumns = [
        {
          row_id: libFunc.randomid(),
          user_contact_number: patient_number,
          user_password: patient_password,
          user_type: 2,
          active: 1,
          user_email: patient_email,
        },
      ];
      const usersTableReturnField = "row_id";
      const onConflict = {
        field: "user_contact_number",
        action: "DO NOTHING",
      };
      const userTableResp = await queries.insertQuery(
        usersTable,
        userTableColumns,
        usersTableReturnField,
        onConflict
      );
      console.log(userTableResp);
      if (userTableResp.length > 0) {
        let columns = [];

        columns = [
          {
            row_id: libFunc.randomid(),
            user_row_id: userTableResp[0].row_id,
            doc_row_id: doctor_id,
            patient_firstname: patient_fname,
            patient_lastname: patient_lname,
            patient_email,
            patient_gender,
            patient_age,
            qualifications,
            qualifications_details,
            photo_path,
          },
        ];

        const returnFields = "row_id";
        const resp = await queries.insertQuery(
          patientsTable,
          columns,
          returnFields
        );
        console.log(resp);
        if (resp.length > 0) {
          let columns = [];

          columns = [
            {
              row_id: libFunc.randomid(),
              study_name: study_name,
              study_arm: study_arm,
              researcher_name: researcher_name,
              researcher_mobile: researcher_mobile,
              researcher_email: researcher_email,
              pat_row_id: resp[0].row_id,
              doc_row_id: doctor_id,
            },
          ];

          const returnFields = "row_id";
          const response = await queries.insertQuery(
            studiesTable,
            columns,
            returnFields
          );
          console.log(response);

          await connect_db.query("COMMIT");
          res.status(201).send(
            encodeRespData({
              msg: "Approval pending by researcher",
              status: 0,
            })
          );
        } else {
          await connect_db.query("ROLLBACK");
          res
            .status(500)
            .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
        }
      } else {
        await connect_db.query("ROLLBACK");
        console.log("User exist====>");
        res.status(500).send(
          encodeRespData({
            msg: "User with this number already exist",
            status: 1,
          })
        );
      }
    } else {
      await connect_db.query("ROLLBACK");
      res.status(403).send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");

    console.log(error);
    res.status(500).send(
      encodeRespData({
        msg: "User with this contact already exist",
        status: 2,
      })
    );
  }
}

// User Login
// async function loginUser(req, res) {
//   try {
//     const { phone, password } = req.data;
//     if (phone && password) {
//       const columns = ["row_id", "user_password", "user_type"];
//       const clause = `user_contact_number = '${phone}' AND deleted=0 AND active=0`;
//       const resp = await queries.selectQuery(usersTable, columns, clause);
//       console.log("Login resp===>", resp);
//       if (resp.length > 0) {
//         let user_details = "";
//         // if(resp[0].user_type == "0"){

//         // }
//         if (resp[0].user_type == "1" || resp[0].user_type == "0") {
//           const doc_columns = [
//             `${usersTable}.row_id`,
//             "doctor_name",
//             "doctor_email",
//             "user_contact_number",
//             "doctor_gender",
//           ];

//           const doc_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
//           const joins = [
//             {
//               join_type: "left",
//               table1: usersTable,
//               table2: doctorsTable,
//               table1_col: "row_id",
//               table2_col: "user_row_id",
//             },
//           ];
//           const doc_resp = await queries.selectQuery(
//             usersTable,
//             doc_columns,
//             doc_clause,
//             joins
//           );
//           console.log("doc_resp===>", doc_resp);
//           user_details = doc_resp[0];
//         }

//         if (resp[0].user_type == "2") {
//           const pat_columns = [
//             `${usersTable}.row_id`,
//             "patient_name",
//             "patient_email",
//             "user_contact_number",
//             "patient_gender",
//             "patient_age",
//           ];

//           const pat_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
//           const joins = [
//             {
//               join_type: "left",
//               table1: usersTable,
//               table2: patientsTable,
//               table1_col: "row_id",
//               table2_col: "user_row_id",
//             },
//           ];
//           const pat_resp = await queries.selectQuery(
//             usersTable,
//             pat_columns,
//             pat_clause,
//             joins
//           );
//           console.log("pat_resp===>", pat_resp);
//           user_details = pat_resp[0];
//         }

//         if (password.trim() === resp[0].user_password) {
//           const token = jwt.generateToken(
//             { row_id: resp[0].row_id, user_type: resp[0].user_type },
//             "5d"
//           );
//           res.status(200).send(
//             encodeRespData({
//               msg: "Login successfull",
//               token,
//               user_type: resp[0].user_type,
//               user_details,
//               status: 0,
//             })
//           );
//         } else {
//           res
//             .status(404)
//             .send(encodeRespData({ msg: "Invalid credentials", status: 1 }));
//         }
//       } else {
//         res
//           .status(404)
//           .send(encodeRespData({ msg: "Invalid credentials", status: 1 }));
//       }
//     } else {
//       res.status(403).send(
//         encodeRespData({
//           msg: "Please fill all the required fields",
//           status: 1,
//         })
//       );
//     }
//   } catch (error) {
//     console.log(error);
//     res
//       .status(500)
//       .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
//   }
// }

async function loginUser(req, res) {
  console.log("req", req);
  try {
    const { phone, email, password } = req.data;
    const identifier = phone.trim() || email.trim();
    // console.log("a", identifier, password);

    if (identifier && password) {
      // console.log("b");
      // Prepare columns
      const columns = ["row_id", "user_password", "user_type"];
      // Check if identifier is an email (basic validation)
      const isEmail = identifier.includes("@");

      // Build the clause based on input type
      let clause = "";
      if (isEmail) {
        clause = `user_email = '${identifier}' AND deleted=0 AND active=0`;
      } else {
        clause = `user_contact_number = '${identifier}' AND deleted=0 AND active=0`;
      }

      const resp = await queries.selectQuery(usersTable, columns, clause);
      console.log("Login resp ===>", resp);

      if (resp.length > 0) {
        let user_details = "";

        if (resp[0].user_type == "0") {
          const doc_columns = [
            `${usersTable}.row_id`,
            "firstname",
            "lastname",
            "email",
            "user_contact_number",
            "gender",
            "photo_path",
          ];

          const doc_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
          const joins = [
            {
              join_type: "left",
              table1: usersTable,
              table2: adminTable,
              table1_col: "row_id",
              table2_col: "user_row_id",
            },
          ];
          const doc_resp = await queries.selectQuery(
            usersTable,
            doc_columns,
            doc_clause,
            joins
          );
          console.log("doc_resp ===>", doc_resp);
          user_details = doc_resp[0];
        }

        if (resp[0].user_type == "1") {
          const doc_columns = [
            `${usersTable}.row_id`,
            "firstname",
            "lastname",
            "doctor_email",
            "user_contact_number",
            "doctor_gender",
            "photo_path",
          ];

          const doc_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
          const joins = [
            {
              join_type: "left",
              table1: usersTable,
              table2: doctorsTable,
              table1_col: "row_id",
              table2_col: "user_row_id",
            },
          ];
          const doc_resp = await queries.selectQuery(
            usersTable,
            doc_columns,
            doc_clause,
            joins
          );
          console.log("doc_resp ===>", doc_resp);
          user_details = doc_resp[0];
        }

        if (resp[0].user_type == "2") {
          const pat_columns = [
            `${usersTable}.row_id`,
            "patient_firstname",
            "patient_lastname",
            "patient_email",
            "user_contact_number",
            "patient_gender",
            "patient_age",
            "photo_path",
          ];

          const pat_clause = `${usersTable}.row_id = '${resp[0].row_id}'`;
          const joins = [
            {
              join_type: "left",
              table1: usersTable,
              table2: patientsTable,
              table1_col: "row_id",
              table2_col: "user_row_id",
            },
          ];
          const pat_resp = await queries.selectQuery(
            usersTable,
            pat_columns,
            pat_clause,
            joins
          );
          console.log("pat_resp ===>", pat_resp);
          user_details = pat_resp[0];
        }

        if (password.trim() === resp[0].user_password) {
          const token = jwt.generateToken(
            { row_id: resp[0].row_id, user_type: resp[0].user_type },
            "5d"
          );

          console.log("ASdfas--------");
          //  Update last login timestamp
          if (resp[0].user_type === 0 || resp[0].user_type === 1) {
            console.log("ASdfas555--------");

            const timestamp = Date.now();
            currentDate = new Date(timestamp);

            await queries.updateQuery(
              usersTable,
              { last_login_on: this.currentDate },
              `row_id = '${resp[0].row_id}'`
            );
          } else if (resp[0].user_type === 2) {
            await queries.updateQuery(
              usersTable,
              { last_login_on: this.currentDate },
              `row_id = '${resp[0].row_id}'`
            );
          }

          res.status(200).send(
            encodeRespData({
              msg: "Login successful.Welcome back!",
              token,
              user_type: resp[0].user_type,
              user_details,
              status: 0,
            })
          );
        } else {
          console.log("Invalid credentials");
          res.send(
            encodeRespData({
              msg: "Incorrect credentials. Please check your credentials and try again",
              status: 1,
            })
          );
        }
      } else {
        console.log("Invalid credentials");

        res.send(
          encodeRespData({
            msg: "Incorrect credentials. Please check your credentials and try again",
            status: 1,
          })
        );
      }
    } else {
      console.log("Please fill all the required fields");

      res.send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.log("Something went wrong", error);
    res.send(
      encodeRespData({
        msg: "Something went wrong while logging in. Please try again later.",
        status: 2,
      })
    );
  }
}

// async function updateDoctor(req, res) {
//   try {
//     console.log("user id from token===>", req.user_id);
//     const user_row_id = req.user_id;
//     const {
//       doc_row_id,
//       doctor_name,
//       doctor_email,
//       doctor_phone,
//       doctor_password,
//       doctor_gender,
//     } = req.data;
//     if (doctor_name && doctor_password) {
//       // Check user authority
//       const checkAuthorityColumn = ["user_type"];
//       const checkAuthorityClause = `row_id = '${user_row_id}'`;
//       const checkAuthorityResp = await queries.selectQuery(
//         usersTable,
//         checkAuthorityColumn,
//         checkAuthorityClause
//       );
//       console.log(checkAuthorityResp);
//       if (checkAuthorityResp.length > 0) {
//         if (checkAuthorityResp[0].user_type == 0) {
//           await connect_db.query("BEGIN TRANSACTION");
//           const userTableColumns = {
//             user_contact_number: doctor_phone,
//             user_password: doctor_password,
//             user_type: 1,
//           };
//           const usersTableClaue = `row_id = '${doc_row_id}'`;
//           const userTableResp = await queries.updateQuery(
//             usersTable,
//             userTableColumns,
//             usersTableClaue
//           );
//           console.log(userTableResp);
//           if (userTableResp > 0) {
//             const columns = {
//               doctor_name,
//               doctor_email,
//               doctor_type,
//               doctor_gender,
//             };

//             const clause = `user_row_id = '${doc_row_id}'`;
//             const resp = await queries.updateQuery(
//               doctorsTable,
//               columns,
//               clause
//             );
//             console.log(resp);
//             if (resp > 0) {
//               await connect_db.query("COMMIT");
//               res
//                 .status(201)
//                 .send(
//                   encodeRespData({ msg: "Doctor details updated", status: 0 })
//                 );
//             } else {
//               await connect_db.query("ROLLBACK");
//               res
//                 .status(500)
//                 .send(
//                   encodeRespData({ msg: "Something went wrong", status: 1 })
//                 );
//             }
//           } else {
//             await connect_db.query("ROLLBACK");
//             res
//               .status(500)
//               .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
//           }
//         } else {
//           await connect_db.query("ROLLBACK");
//           res.status(403).send(
//             encodeRespData({
//               msg: "You don't have access for this request",
//               status: 1,
//             })
//           );
//         }
//       }
//     } else {
//       await connect_db.query("ROLLBACK");
//       res.status(403).send(
//         encodeRespData({
//           msg: "Please fill all the required fields",
//           status: 1,
//         })
//       );
//     }
//   } catch (error) {
//     console.log(error);
//     res
//       .status(500)
//       .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
//   }
// }

async function updateDoctor(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    const user_row_id = req.user_id;
    const { row_id, name, email, phone, gender } = req.data;
    if (name && email) {
      // Check user authority
      const checkAuthorityColumn = ["user_type"];
      const checkAuthorityClause = `row_id = '${user_row_id}'`;
      const checkAuthorityResp = await queries.selectQuery(
        usersTable,
        checkAuthorityColumn,
        checkAuthorityClause
      );
      console.log("checkAuthorityResp", checkAuthorityResp);
      if (checkAuthorityResp.length > 0) {
        if (checkAuthorityResp[0].user_type == 1) {
          await connect_db.query("BEGIN TRANSACTION");
          const userTableColumns = {
            user_contact_number: phone,
            user_email: email,
            user_type: 1,
          };
          const usersTableClaue = `row_id = '${row_id}'`;
          const userTableResp = await queries.updateQuery(
            usersTable,
            userTableColumns,
            usersTableClaue
          );
          console.log(userTableResp);
          if (userTableResp > 0) {
            const columns = {
              doctor_name: name,
              doctor_email: email,
              doctor_gender: gender,
            };

            const clause = `user_row_id = '${row_id}'`;
            const resp = await queries.updateQuery(
              doctorsTable,
              columns,
              clause
            );
            console.log(resp);
            if (resp > 0) {
              await connect_db.query("COMMIT");
              res
                .status(201)
                .send(
                  encodeRespData({ msg: "Doctor details updated", status: 0 })
                );
            } else {
              await connect_db.query("ROLLBACK");
              res
                .status(500)
                .send(
                  encodeRespData({ msg: "Something went wrong", status: 1 })
                );
            }
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res.status(403).send(
            encodeRespData({
              msg: "You don't have access for this request",
              status: 1,
            })
          );
        }
      }
    } else {
      await connect_db.query("ROLLBACK");
      res.status(403).send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function updatePatient(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    // console.log("req",req)
    const Tokenuser_row_id = req.user_id;
    const {
      patient_email,
      patient_name,
      patient_firstname,
      patient_lastname,
      user_contact_number,
      user_password,
      patient_gender,
      patient_age,
      user_row_id,
      qualifications,
      qualifications_details,
    } = req.data;

    console.log("pat id", req.data);

    // console.log("res-->",req.data)
    // console.log("insde ")
    // Check user authority
    const checkAuthorityColumn = ["user_type"];
    const checkAuthorityClause = `row_id = '${Tokenuser_row_id}'`;
    const checkAuthorityResp = await queries.selectQuery(
      usersTable,
      checkAuthorityColumn,
      checkAuthorityClause
    );
    console.log("checkAuthorityResp", checkAuthorityResp);
    if (checkAuthorityResp.length > 0) {
      if (
        checkAuthorityResp[0].user_type == 1 ||
        checkAuthorityResp[0].user_type == 0
      ) {
        await connect_db.query("BEGIN TRANSACTION");
        const userTableColumns = {
          user_contact_number: user_contact_number,
          user_password: user_password,
          user_email: patient_email,
        };
        const usersTableClaue = `row_id = '${user_row_id}'`;
        const userTableResp = await queries.updateQuery(
          usersTable,
          userTableColumns,
          usersTableClaue
        );
        // console.log("userTableRespo",userTableResp);

        if (userTableResp > 0) {
          const columns = {
            patient_name,
            patient_firstname,
            patient_lastname,
            patient_email,
            patient_gender,
            patient_age,
            qualifications,
            qualifications_details,
          };

          console.log("column", columns);
          const clause = `user_row_id = '${user_row_id}'`;
          const resp = await queries.updateQuery(
            patientsTable,
            columns,
            clause
          );
          // console.log("resp-->567",resp);
          // console.log("resp-->1234",resp > 0);

          if (resp > 0) {
            await connect_db.query("COMMIT");
            res
              .status(201)
              .send(
                encodeRespData({ msg: "Patients details updated", status: 0 })
              );
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res
            .status(500)
            .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
        }
      } else {
        await connect_db.query("ROLLBACK");
        res.status(403).send(
          encodeRespData({
            msg: "You don't have access for this request",
            status: 1,
          })
        );
      }
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function updateDoctordata(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    // console.log("req",req)
    const Tokenuser_row_id = req.user_id;
    const {
      doctor_email,
      doctor_gender,
      doctor_name,
      firstname,
      lastname,
      user_contact_number,
      user_password,
      institution,
      user_row_id,
    } = req.data;

    console.log("pat id", req.data);

    // console.log("res-->",req.data)
    // console.log("insde ")
    // Check user authority
    const checkAuthorityColumn = ["user_type"];
    const checkAuthorityClause = `row_id = '${Tokenuser_row_id}'`;
    const checkAuthorityResp = await queries.selectQuery(
      usersTable,
      checkAuthorityColumn,
      checkAuthorityClause
    );
    console.log("checkAuthorityResp", checkAuthorityResp);
    if (checkAuthorityResp.length > 0) {
      if (
        checkAuthorityResp[0].user_type == 1 ||
        checkAuthorityResp[0].user_type == 0
      ) {
        await connect_db.query("BEGIN TRANSACTION");
        const userTableColumns = {
          user_contact_number: user_contact_number,
          user_password: user_password,
          user_email: doctor_email,
        };
        const usersTableClaue = `row_id = '${user_row_id}'`;
        const userTableResp = await queries.updateQuery(
          usersTable,
          userTableColumns,
          usersTableClaue
        );
        // console.log("userTableRespo",userTableResp);

        if (userTableResp > 0) {
          const columns = {
            doctor_name,
            firstname,
            lastname,
            doctor_email,
            doctor_gender,
            institution,
          };

          console.log("column", columns);
          const clause = `user_row_id = '${user_row_id}'`;
          const resp = await queries.updateQuery(doctorsTable, columns, clause);
          // console.log("resp-->567",resp);
          // console.log("resp-->1234",resp > 0);

          if (resp > 0) {
            await connect_db.query("COMMIT");
            res
              .status(201)
              .send(
                encodeRespData({ msg: "Researcher details updated", status: 0 })
              );
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res
            .status(500)
            .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
        }
      } else {
        await connect_db.query("ROLLBACK");
        res.status(403).send(
          encodeRespData({
            msg: "You don't have access for this request",
            status: 1,
          })
        );
      }
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchDoctors(req, res) {
  try {
    const {
      row_id = null,
      doc_name = null,
      limit = 30,
      page = 1,
      showDeleted = 0,
    } = req.data;

    console.log("req data", req.data);
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.active`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.last_login_on`,
      `${usersTable}.user_password`,
      "firstname",
      "lastname",
      "doctor_name",
      "institution",
      "doctor_email",
      `${usersTable}.suspension_on`,
      "doctor_gender",
      `${doctorsTable}.cr_on`,
      "system_data",
      `${doctorsTable}.row_id`,
    ];

    let active = 0;
    // let clause = `config.t_users.active = ${active}`;
    let clause = `config.t_users.deleted = 0 And config.t_users.active =0`;

    if (row_id) {
      clause = `${usersTable}.row_id = '${row_id}'`;
    }

    if (doc_name) {
      if (clause) {
        clause += ` AND doctor_name ILIKE '%${doc_name}%' `;
      } else {
        clause = `doctor_name ILIKE '%${doc_name}%' `;
      }
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: doctorsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];

    const offset = (page - 1) * limit;

    const orderBy = "cr_on";

    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      orderBy,
      offset,
      // null,
      limit
    );
    // console.log("Doctors===>", resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "All doctors Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no doctors.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch Doctors Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchSepesficDoctors(req, res) {
  try {
    const user_row_id = req.data.row_id;
    const {
      row_id = null,
      doc_name = null,
      limit = 30,
      page = 1,
      showDeleted = 0,
    } = req.data;

    console.log("req data", req.data);
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "photo_path",
      "firstname",
      "lastname",
      "doctor_name",
      "institution",
      "doctor_email",
      `${usersTable}.active`,
      "doctor_gender",
      `${doctorsTable}.cr_on`,
      "system_data",
      `${doctorsTable}.row_id`,
    ];

    let active = 0;
    // let clause = `config.t_users.active = ${active}`;
    let clause = `config.t_users.deleted = 0 And config.t_users.active =0`;

    if (user_row_id) {
      clause = `${usersTable}.row_id = '${user_row_id}'`;
    }

    if (doc_name) {
      if (clause) {
        clause += ` AND doctor_name ILIKE '%${doc_name}%' `;
      } else {
        clause = `doctor_name ILIKE '%${doc_name}%' `;
      }
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: doctorsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];

    const offset = (page - 1) * limit;

    const orderBy = "doctor_name";

    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      orderBy,
      offset,
      // null,
      limit
    );
    console.log("Doctors===>", resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "doctors details Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no doctors.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch Doctors Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchDoctorsdeactive(req, res) {
  try {
    const {
      row_id = null,
      doc_name = null,
      limit = 30,
      page = 1,
      showDeleted = 0,
    } = req.data;

    console.log("req data", req.data);
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "firstname",
      "lastname",
      "doctor_email",
      "doctor_gender",
      "active",
    ];

    let del = 0;
    let active = 1;
    let clause = `config.t_users.active = ${active}`;

    // let clause;
    // if (row_id) {
    //   clause = `${usersTable}.row_id = '${row_id}'`;
    // }

    // if (!showDeleted) {
    //   clause += `AND deleted = 0 And active =1`;
    // }

    if (doc_name) {
      if (clause) {
        clause += ` AND doctor_name ILIKE '%${doc_name}%'`;
      } else {
        clause = `doctor_name ILIKE '%${doc_name}%'`;
      }
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: doctorsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];

    const offset = (page - 1) * limit;

    const orderBy = "config.t_users.cr_on";

    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      orderBy,
      offset,
      // null,
      limit
    );
    console.log("Doctors===>", resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "All doctors Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no doctors.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch Doctors Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchPatients(req, res) {
  console.log("request -----------", req.data);
  try {
    const doc_row_id = req.user_id;
    console.log("doc_row_id===>", doc_row_id);
    const {
      row_id = null,
      name = null,
      limit = 10,
      page = 1,
      showDeleted = 0,
    } = req.data;
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "patient_name",
      "patient_firstname",
      "patient_lastname",
      "patient_email",
      "patient_gender",
      "patient_age",
      "qualifications",
      "qualifications_details",
      "active",
    ];
    let clause = `doc_row_id = '${doc_row_id}'`;
    if (row_id) {
      clause += row_id ? ` AND ${usersTable}.row_id = '${row_id}'` : null;
    }
    if (name) {
      clause += ` AND patient_name ILIKE '%${name}%'`;
    }

    if (!showDeleted) {
      clause += `AND ${usersTable}.deleted = 0 And ${usersTable}.active =0`;
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: patientsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];
    let offset = (page - 1) * 10;
    let orderBy = "up_on";
    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      null,
      // orderBy,
      offset,
      limit
    );
    // console.log(resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "patients Data Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no patiints.", status: 0 }));
    }
  } catch (error) {
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchSepeficPatients(req, res) {
  console.log("request -----------", req.data.row_id);

  try {
    const user_row_id = req.data.row_id;
    // console.log("doc_row_id===>", doc_row_id);
    const {
      row_id = null,
      name = null,
      limit = 10,
      page = 1,
      showDeleted = 0,
    } = req.data;
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "patient_name",
      "patient_firstname",
      "patient_lastname",
      "patient_email",
      "patient_gender",
      "patient_age",
      "qualifications",
      "qualifications_details",
      "active",
      "photo_path",
    ];
    let clause = `user_row_id = '${user_row_id}'`;
    if (row_id) {
      clause += row_id ? ` AND ${usersTable}.row_id = '${row_id}'` : null;
    }
    if (name) {
      clause += ` AND patient_name ILIKE '%${name}%'`;
    }

    if (!showDeleted) {
      clause += `AND ${usersTable}.deleted = 0 And ${usersTable}.active =0`;
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: patientsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];
    let offset = (page - 1) * 10;
    let orderBy = "up_on";
    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      null,
      // orderBy,
      offset,
      limit
    );
    // console.log(resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "patients Data Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no patiints.", status: 0 }));
    }
  } catch (error) {
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchDeactivePatients(req, res) {
  try {
    const doc_row_id = req.user_id;
    console.log("doc_row_id===>", doc_row_id);
    const {
      row_id = null,
      name = null,
      limit = 10,
      page = 1,
      showDeleted = 0,
    } = req.data;
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "patient_name",
      "patient_email",
      "patient_gender",
      "patient_age",
      "qualifications",
      "qualifications_details",
      "active",
    ];
    let clause = `doc_row_id = '${doc_row_id}'`;
    if (row_id) {
      clause += row_id ? ` AND ${usersTable}.row_id = '${row_id}'` : null;
    }
    if (name) {
      clause += ` AND patient_name ILIKE '%${name}%'`;
    }

    if (!showDeleted) {
      clause += `AND deleted = 0 And active =1`;
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: patientsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];
    let offset = (page - 1) * 10;
    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      null,
      offset,
      limit
    );
    // console.log(resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "patients Data Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no patiints.", status: 0 }));
    }
  } catch (error) {
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchPatientsByAdmin(req, res) {
  // console.log("requesting -----------=====================",req)
  try {
    const { user_id, user_type } = req; // Assuming middleware sets these
    const { row_id = null, name = null, limit = 10, page = 1 } = req.data;

    const offset = (page - 1) * limit;

    let sql = `
      SELECT
        pt.row_id as patient_row_id,
        pt.patient_name,pt.patient_firstname,pt.patient_lastname,
        pt.patient_email,
        pt.patient_gender,
        pt.patient_age,
        usr.user_contact_number as patient_contact, usr.row_id as user_row_id,
        doc.doctor_name,
        doc.doctor_email,
        doc.doctor_gender,
        doc.doctor_type
      FROM config.t_patients pt
      INNER JOIN config.t_users usr ON pt.user_row_id = usr.row_id
      INNER JOIN config.t_doctors doc ON pt.doc_row_id = doc.user_row_id 
      WHERE 1 = 1 and usr.deleted = 0 And usr.active =0
    `;

    console.log("user type", user_type);
    // If not admin (user_type !== 1), restrict to doctor’s patients
    if (user_type === 1) {
      sql += ` AND pt.doc_row_id = '${user_id}'`;
    }

    // Optional filters
    // if (row_id) {
    //   sql += ` AND pt.row_id = '${row_id}'`;
    // }

    if (name) {
      sql += ` AND pt.patient_name ILIKE '%${name}%'`;
    }

    // Pagination
    sql += ` ORDER BY pt.cr_on DESC LIMIT ${limit} OFFSET ${offset}`;

    // Execute query (assuming pg client `db`)
    const result = await queries.customQuery(sql);

    // console.log("rsulut-----", result);

    if (result) {
      res.status(200).send(
        encodeRespData({
          msg: "Patients data fetched successfully",
          data: result,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No patients found", status: 0 }));
    }
  } catch (error) {
    console.error("fetchPatients error:", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function requestAppointment(req, res) {
  try {
    const pat_row_id = req.user_id;
    const {
      time_of_apt,
      date_of_apt,
      appt_type,
      virtual_link = null,
      updatedby_row_id,
    } = req.data;

    const docRowIdColumn = ["doc_row_id"];
    const docRowIdClause = `user_row_id = '${pat_row_id}'`;
    const docRowIdResp = await queries.selectQuery(
      patientsTable,
      docRowIdColumn,
      docRowIdClause
    );
    console.log("doctors data----------", docRowIdResp);
    const doc_row_id = docRowIdResp[0].doc_row_id;
    console.log("doc_row_id===>", doc_row_id);

    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${date}/${month}/${year}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;
    console.log(fullDate);
    console.log(time);

    const columns = [
      {
        row_id: libFunc.randomid(),
        doc_row_id,
        pat_row_id,
        date_of_req: fullDate,
        time_of_req: time,
        date_of_apt,
        time_of_apt,
        appointment_details: JSON.stringify({
          appt_type,
          virtual_link,
          appt_status: 6,
          updatedby_row_id: pat_row_id,
        }),
      },
    ];

    const returnField = "row_id";
    const resp = await queries.insertQuery(
      appointmentTable,
      columns,
      returnField
    );
    console.log(resp);
    if (resp.length > 0) {
      res.status(201).send(
        encodeRespData({
          msg: "Appointment booked successfully",
          status: 0,
        })
      );
    } else {
      res.status(500).send(
        encodeRespData({
          msg: "Something went wrong",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.log("APT Request Error===>", error);
    res.status(500).send(
      encodeRespData({
        msg: "Something went wrong",
        status: 2,
      })
    );
  }
}

async function createAppointment(req, res) {
  try {
    const doc_row_id = req.user_id;
    const {
      pat_row_id,
      time_of_apt,
      date_of_apt,
      appt_type,
      virtual_link = null,
      updatedby_row_id,
    } = req.data;

    console.log("data", req.data);
    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${year}-${month}-${date}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;
    console.log(fullDate);
    console.log(time);

    const columns = [
      {
        row_id: libFunc.randomid(),
        pat_row_id,
        doc_row_id,
        time_of_req: time,
        date_of_req: fullDate,
        date_of_apt,
        time_of_apt,
        appointment_details: JSON.stringify({
          appt_type,
          virtual_link,
          appt_status: 6,
          updatedby_row_id: doc_row_id,
        }),
      },
    ];
    const returnField = "row_id";

    console.log("befor insert into appointment table", columns);
    const resp = await queries.insertQuery(
      appointmentTable,
      columns,
      returnField
    );
    console.log("Appointment =========>", resp);
    if (resp.length > 0) {
      res
        .status(201)
        .send(encodeRespData({ msg: "Appointment scheduled", status: 0 }));
    } else {
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    console.log("Appointment error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function createGroup(req, res) {
  try {
    const { group_name } = req.data;

    console.log("data", req.data);

    const columns = [
      {
        row_id: libFunc.randomid(),
        group_name,
      },
    ];
    const returnField = "row_id";

    console.log("befor insert into group data table", columns);
    const resp = await queries.insertQuery(GroupTable, columns, returnField);
    console.log("data =========>", resp);
    if (resp.length > 0) {
      res.status(201).send(encodeRespData({ msg: "group created", status: 0 }));
    } else {
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    console.log("Appointment error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}
async function createOpdAppointment(req, res) {
  try {
    const doc_row_id = req.user_id;
    const {
      pat_row_id,
      time_of_apt,
      date_of_apt,
      appt_type,
      virtual_link = null,
      updatedby_row_id,
    } = req.data;

    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${year}-${month}-${date}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;
    console.log(fullDate);
    console.log(time);

    const columns = [
      {
        row_id: libFunc.randomid(),
        pat_row_id,
        doc_row_id,
        time_of_req: time,
        date_of_req: fullDate,
        date_of_apt,
        time_of_apt,
        appointment_details: JSON.stringify({
          appt_type,
          virtual_link,
          appt_status: 6,
          updatedby_row_id: doc_row_id,
        }),
      },
    ];
    const returnField = "row_id";
    const resp = await queries.insertQuery(
      opdappointmentTable,
      columns,
      returnField
    );
    console.log("Appointment ===>", resp);
    if (resp.length > 0) {
      res
        .status(201)
        .send(encodeRespData({ msg: "Appointment scheduled", status: 0 }));
    } else {
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    console.log("Appointment error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function requestOPDAppointment(req, res) {
  try {
    const pat_row_id = req.user_id;
    const {
      time_of_apt,
      date_of_apt,
      appt_type,
      virtual_link = null,
      updatedby_row_id,
    } = req.data;

    const docRowIdColumn = ["doc_row_id"];
    const docRowIdClause = `user_row_id = '${pat_row_id}'`;
    const docRowIdResp = await queries.selectQuery(
      patientsTable,
      docRowIdColumn,
      docRowIdClause
    );
    const doc_row_id = docRowIdResp[0].doc_row_id;
    console.log("doc_row_id===>", doc_row_id);

    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${date}/${month}/${year}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;
    console.log(fullDate);
    console.log(time);

    const columns = [
      {
        row_id: libFunc.randomid(),
        doc_row_id,
        pat_row_id,
        date_of_req: fullDate,
        time_of_req: time,
        date_of_apt,
        time_of_apt,
        appointment_details: JSON.stringify({
          appt_type,
          virtual_link,
          appt_status: 6,
          updatedby_row_id: pat_row_id,
        }),
      },
    ];

    const returnField = "row_id";
    const resp = await queries.insertQuery(
      opdappointmentTable,
      columns,
      returnField
    );
    console.log(resp);
    if (resp.length > 0) {
      res.status(201).send(
        encodeRespData({
          msg: "Appoinment booked successfully",
          status: 0,
        })
      );
    } else {
      res.status(500).send(
        encodeRespData({
          msg: "Something went wrong",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.log("APT Request Error===>", error);
    res.status(500).send(
      encodeRespData({
        msg: "Something went wrong",
        status: 2,
      })
    );
  }
}

// async function updateAppointment(req, res) {
//   const updatedby_row_id = req.user_id;

//   try {
//     const {
//       row_id,
//       time = null,
//       date = null,
//       appointment_request_status = null,
//     } = req.data;
//     const columns = [];
//     if (time) {
//       columns.push(`time_for_apt = '${time}'`);
//     }
//     if (date) {
//       columns.push(`date_for_apt = '${date}'`);
//     }
//     if (appointment_request_status !== null) {
//       columns.push(
//         `appointment_details = appointment_details || '{"appt_status": ${appointment_request_status}}'`
//       ); //0: pending, 1: complete, 2: cancel
//     }
//     const clause = `row_id = '${row_id}'`;
//     // console.log("columns===>", columns);
//     // console.log("row_id", row_id);
//     // const resp = await queries.updateQuery(appointmentTable, columns, clause);
//     // console.log(resp);

//     let cols = columns.join(", ");
//     console.log(cols);

//     const query = `UPDATE ${appointmentTable} SET up_on = now(), ${cols}  WHERE ${clause}`;
//     console.log(query);
//     const resp = await connect_db.query(query);
//     console.log(resp.rowCount)
//     if (resp.rowCount > 0) {
//       res
//         .status(201)
//         .send(encodeRespData({ msg: "Appointment updated", status: 0 }));
//     } else {
//       res
//         .status(400)
//         .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
//     }
//   } catch (error) {
//     res
//       .status(500)
//       .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
//   }
// }

async function updateAppointment(req, res) {
  const updatedby_row_id = req.user_id;

  try {
    const {
      row_id,
      time = null,
      date = null,
      appointment_request_status = null,
    } = req.data;

    const columns = [];

    if (time) {
      columns.push(`time_for_apt = '${time}'`);
    }

    if (date) {
      columns.push(`date_for_apt = '${date}'`);
    }

    //1. Determine if updater is a doctor or patient
    let userType = null;
    let userName = null;

    const docQuery = `SELECT doctor_name FROM config.t_doctors WHERE user_row_id = '${updatedby_row_id}'`;
    const patQuery = `SELECT patient_name FROM config.t_patients WHERE user_row_id = '${updatedby_row_id}'`;

    const docRes = await connect_db.query(docQuery);
    const patRes = await connect_db.query(patQuery);

    if (docRes.rows.length > 0) {
      userType = "Researcher";
      userName = docRes.rows[0].doctor_name;
    } else if (patRes.rows.length > 0) {
      userType = "Participant";
      userName = patRes.rows[0].patient_name;
    } else {
      return res.status(404).send(
        encodeRespData({
          msg: "User not found in doctor or patient records",
          status: 3,
        })
      );
    }

    // 2. Add appointment_details update
    if (appointment_request_status !== null) {
      const detailsPatch = {
        appt_status: appointment_request_status,
        updatedby_row_id,
        updatedby_user_name: userName,
        updatedby_user_type: userType,
      };

      columns.push(
        `appointment_details = appointment_details || '${JSON.stringify(
          detailsPatch
        )}'`
      );
    }

    // 3. Build and execute query
    const clause = `row_id = '${row_id}'`;
    const cols = columns.join(", ");
    const query = `UPDATE config.t_appointments SET up_on = now(), ${cols} WHERE ${clause}`;

    console.log("Query:", query);
    const resp = await connect_db.query(query);

    if (resp.rowCount > 0) {
      res.status(201).send(
        encodeRespData({
          msg: "Appointment updated",
          status: 0,
        })
      );
    } else {
      res.status(400).send(
        encodeRespData({
          msg: "Update failed",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.error("Error in updateAppointment:", error);
    res.status(500).send(
      encodeRespData({
        msg: "Something went wrong",
        status: 2,
      })
    );
  }
}

async function updateOpdAppointment(req, res) {
  const updatedby_row_id = req.user_id;

  try {
    const {
      row_id,
      time = null,
      date = null,
      appointment_request_status = null,
    } = req.data;

    const columns = [];

    if (time) {
      columns.push(`time_for_apt = '${time}'`);
    }

    if (date) {
      columns.push(`date_for_apt = '${date}'`);
    }

    //1. Determine if updater is a doctor or patient
    let userType = null;
    let userName = null;

    const docQuery = `SELECT doctor_name FROM config.t_doctors WHERE user_row_id = '${updatedby_row_id}'`;
    const patQuery = `SELECT patient_name FROM config.t_patients WHERE user_row_id = '${updatedby_row_id}'`;

    const docRes = await connect_db.query(docQuery);
    const patRes = await connect_db.query(patQuery);

    if (docRes.rows.length > 0) {
      userType = "Researcher";
      userName = docRes.rows[0].doctor_name;
    } else if (patRes.rows.length > 0) {
      userType = "Participant";
      userName = patRes.rows[0].patient_name;
    } else {
      return res.status(404).send(
        encodeRespData({
          msg: "User not found in doctor or patient records",
          status: 3,
        })
      );
    }

    // 2. Add appointment_details update
    if (appointment_request_status !== null) {
      const detailsPatch = {
        appt_status: appointment_request_status,
        updatedby_row_id,
        updatedby_user_name: userName,
        updatedby_user_type: userType,
      };

      columns.push(
        `appointment_details = appointment_details || '${JSON.stringify(
          detailsPatch
        )}'`
      );
    }

    // 3. Build and execute query
    const clause = `row_id = '${row_id}'`;
    const cols = columns.join(", ");
    const query = `UPDATE config.t_opdappointments SET up_on = now(), ${cols} WHERE ${clause}`;

    console.log("Query:", query);
    const resp = await connect_db.query(query);

    if (resp.rowCount > 0) {
      res.status(201).send(
        encodeRespData({
          msg: "Appointment updated",
          status: 0,
        })
      );
    } else {
      res.status(400).send(
        encodeRespData({
          msg: "Update failed",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.error("Error in updateAppointment:", error);
    res.status(500).send(
      encodeRespData({
        msg: "Something went wrong",
        status: 2,
      })
    );
  }
}

async function fetchAppointmentsForPatients(req, res) {
  try {
    const pat_row_id = req.user_id;
    console.log("YES");
    const columns = [
      `${appointmentTable}.row_id AS apt_row_id`,
      "doctor_name",
      "firstname",
      "lastname",
      `${usersTable}.user_contact_number`,
      "date_of_req",
      "time_of_req",
      "date_of_apt",
      "time_of_apt",
      "appointment_details",
    ];
    const clause = `${appointmentTable}.pat_row_id = '${pat_row_id}' AND appointment_details ->> 'appt_status' != '4' AND ${appointmentTable}.deleted = 0`;
    const join = [
      {
        join_type: "left",
        table1: appointmentTable,
        table2: doctorsTable,
        table1_col: "doc_row_id",
        table2_col: "user_row_id",
      },
      {
        join_type: "left",
        table1: appointmentTable,
        table2: usersTable,
        table1_col: "doc_row_id",
        table2_col: "row_id",
      },
    ];
    const orderBy = "date_of_req, time_of_req";
    const resp = await queries.selectQuery(
      appointmentTable,
      columns,
      clause,
      join,
      orderBy
    );
    // console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "Appointments Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No Appointments. Make one", status: 0 }));
    }
  } catch (error) {
    console.log("fetch patients appointments", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchOpdAppointmentsForDoctors(req, res) {
  try {
    const doc_row_id = req.user_id;
    const { pat_row_id } = req.data;
    // console.log("YES Doctors");

    const columns = [
      `${opdappointmentTable}.row_id AS apt_row_id`,
      `${usersTable}.user_contact_number AS pat_cont_no`,
      "patient_name",
      "date_of_req",
      "time_of_req",
      "date_of_apt",
      "time_of_apt",
      "appointment_details",
    ];
    //  0: pending, 1: accept, 2: reject, 3: complete, 4: cancel, 5:reschedule
    let clause = `${opdappointmentTable}.doc_row_id = '${doc_row_id}' AND appointment_details ->> 'appt_status' != '4' AND ${opdappointmentTable}.deleted = 0`;
    if (pat_row_id) {
      clause += ` AND pat_row_id = '${pat_row_id}'`;
    }
    const join = [
      {
        join_type: "left",
        table1: opdappointmentTable,
        table2: patientsTable,
        table1_col: "pat_row_id",
        table2_col: "user_row_id",
      },
      {
        join_type: "left",
        table1: opdappointmentTable,
        table2: usersTable,
        table1_col: "pat_row_id",
        table2_col: "row_id",
      },
    ];
    const resp = await queries.selectQuery(
      opdappointmentTable,
      columns,
      clause,
      join
    );
    // console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "Appointments Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No Appointments.", status: 0 }));
    }
  } catch (error) {
    console.log("fetch doctors appointments error", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchAppointmentsForDoctors(req, res) {
  try {
    const doc_row_id = req.user_id;
    const { pat_row_id } = req.data;
    // console.log("YES Doctors");

    const columns = [
      `${appointmentTable}.row_id AS apt_row_id`,
      `${usersTable}.user_contact_number AS pat_cont_no`,
      "patient_name",
      "date_of_req",
      "time_of_req",
      "date_of_apt",
      "time_of_apt",
      "appointment_details",
    ];
    //  0: pending, 1: accept, 2: reject, 3: complete, 4: cancel, 5:reschedule
    let clause = `${appointmentTable}.doc_row_id = '${doc_row_id}' AND appointment_details ->> 'appt_status' != '4' AND ${appointmentTable}.deleted = 0`;
    if (pat_row_id) {
      clause += ` AND pat_row_id = '${pat_row_id}'`;
    }
    const join = [
      {
        join_type: "left",
        table1: appointmentTable,
        table2: patientsTable,
        table1_col: "pat_row_id",
        table2_col: "user_row_id",
      },
      {
        join_type: "left",
        table1: appointmentTable,
        table2: usersTable,
        table1_col: "pat_row_id",
        table2_col: "row_id",
      },
    ];
    const resp = await queries.selectQuery(
      appointmentTable,
      columns,
      clause,
      join
    );
    // console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "Appointments Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No Appointments.", status: 0 }));
    }
  } catch (error) {
    console.log("fetch doctors appointments error", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchopdAppointmentsForPatients(req, res) {
  try {
    const pat_row_id = req.user_id;
    console.log("YES");
    const columns = [
      `${opdappointmentTable}.row_id AS apt_row_id`,
      "doctor_name",
      "firstname",
      "lastname",
      `${usersTable}.user_contact_number`,
      "date_of_req",
      "time_of_req",
      "date_of_apt",
      "time_of_apt",
      "appointment_details",
    ];
    const clause = `${opdappointmentTable}.pat_row_id = '${pat_row_id}' AND appointment_details ->> 'appt_status' != '4' AND ${opdappointmentTable}.deleted = 0`;
    const join = [
      {
        join_type: "left",
        table1: opdappointmentTable,
        table2: doctorsTable,
        table1_col: "doc_row_id",
        table2_col: "user_row_id",
      },
      {
        join_type: "left",
        table1: opdappointmentTable,
        table2: usersTable,
        table1_col: "doc_row_id",
        table2_col: "row_id",
      },
    ];
    const orderBy = "date_of_req, time_of_req";
    const resp = await queries.selectQuery(
      opdappointmentTable,
      columns,
      clause,
      join,
      orderBy
    );
    // console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "Appointments Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No Appointments. Make one", status: 0 }));
    }
  } catch (error) {
    console.log("fetch patients appointments", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchMedia(req, res) {
  try {
    // FOr doctors pat_row_id is mandatory but for patients row_id is being taken from token itself
    const user_row_id = req.user_id;
    const { pat_row_id = null, media_type } = req.data;
    // console.log(req.data);
    const user_type = await getUserType(user_row_id);
    console.log("user_type===>", user_type);
    const columns = [
      `${mediaTable}.row_id AS media_row_id`,
      "patient_name",
      "patient_firstname",
      "patient_lastname",
      "doctor_name",
      "date",
      "time",
      "media_name",
      "media_link",
      "media_type",
      "sender",
      "filename",
      "description",
      "filesize",
      "pat_row_id",
    ];
    let clause = `media_type = '${media_type}' AND status = '0' AND t_media.deleted = 0 AND t_users.deleted = 0`;
    if (user_type == 1) {
      clause += ` AND ${mediaTable}.doc_row_id = '${user_row_id}'`;
      if (pat_row_id) {
        clause += ` AND pat_row_id = '${pat_row_id}'`;
      }
    } else if (user_type == 2) {
      clause += ` AND pat_row_id = '${user_row_id}'`;
    }
    const join = [
      {
        join_type: "left",
        table1: mediaTable,
        table2: patientsTable,
        table1_col: "pat_row_id",
        table2_col: "user_row_id",
      },

      {
        join_type: "left",
        table1: mediaTable,
        table2: doctorsTable,
        table1_col: "doc_row_id",
        table2_col: "user_row_id",
      },

      {
        join_type: "left",
        table1: mediaTable,
        table2: usersTable,
        table1_col: "pat_row_id",
        table2_col: "row_id",
      },
    ];
    const resp = await queries.selectQuery(mediaTable, columns, clause, join);
    console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(encodeRespData({ msg: "Media Fetched", data: resp, status: 0 }));
    } else {
      res
        .status(203)
        .send(
          encodeRespData({ msg: "No Appointments.", data: resp, status: 0 })
        );
    }
  } catch (error) {
    console.log(error);
  }
}

async function uploadMediaFiles(req, res) {
  console.log("request---", req);
  try {
    const sender = req.user_id;
    console.log("sender===>", sender);
    let {
      receiver_row_id = null,
      file_name,
      file_path,
      media_type,
      filename,
      description,
      filesize,
    } = req.data;
    console.log("req.data", req.data);
    const user_type = await getUserType(sender);
    console.log(user_type);
    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${year}-${month}-${date}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;

    let receiverColumn;
    let receiverClause;
    let receiverResp;

    // if (senderResponse[0].user_type == 1) {
    //   receiverColumn = ["user_row_id"];
    //   receiverClause = `doc_row_id = '${sender}'`;
    //   receiverResp = await queries.selectQuery(
    //     patientsTable,
    //     receiverColumn,
    //     receiverClause
    //   );
    // } else
    if (user_type == 2) {
      receiverColumn = ["doc_row_id"];
      receiverClause = `user_row_id = '${sender}'`;
      receiverResp = await queries.selectQuery(
        patientsTable,
        receiverColumn,
        receiverClause
      );
      receiver_row_id = receiverResp[0].doc_row_id;
    }

    // const docColumn = ["doc_row_id"];
    // const docClause = `user_row_id = '${sender}'`;
    // const docResp = await queries.selectQuery(
    //   patientsTable,
    //   docColumn,
    //   docClause
    // );
    // console.log("Doc row id===>", docResp);

    const columns = [
      {
        row_id: libFunc.randomid(),
        pat_row_id: user_type == 2 ? sender : receiver_row_id,
        doc_row_id: user_type == 1 ? sender : receiver_row_id,
        time,
        date: fullDate,
        media_name: file_name,
        media_link: file_path,
        media_type,
        status: 0,
        sender,
        filename,
        description,
        filesize,
      },
    ];
    const returnField = "row_id";
    const resp = await queries.insertQuery(mediaTable, columns, returnField);
    console.log("media uploaded RESP====>", resp);
    if (resp.length > 0) {
      res
        .status(201)
        .send(encodeRespData({ msg: "Media uploaded", status: 0 }));
    } else {
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function getUserType(row_id) {
  try {
    const columns = ["user_type"];
    const clause = `row_id = '${row_id}'`;
    const resp = await queries.selectQuery(usersTable, columns, clause);
    return resp[0].user_type;
  } catch (error) {}
}

// /uploads/videos/1730798151244_LONG DRIVE Bollywood Mix - Arijit Singh _ Full Album _ 2 Hour Nonstop _ Apna Bana Le, Zaalima & More.mp4
// /uploads/videos/1730798151244_SUNIYAN SUNIYAN (Official Video) Juss x MixSingh.mp3
// /uploads/videos/1730798151244_Numb (Official Music Video) [4K UPGRADE] – Linkin Park.mp3

// save cooments

// forms builder api

//

function saveforms(req, res) {
  var row_id = libFunc.randomid();
  var formsSchema = req.data;
  console.log("req--------->", req);
  const column = {
    row_id: row_id,
    form_data: JSON.stringify(formsSchema),
  };
  //   console.log("cloumn data", column)

  var data = query.insertData(formsSchemaTable, column);

  const resp = {
    status: 0,
    msg: "forms sechema created successfully",
    data: data,
    row_id: row_id,
  };

  console.log("response", resp.data);
  libFunc.sendResponse(res, resp);
}

function updateforms(req, res) {
  const column = {
    tablename: req.data[0],
  };
  const cond = {
    row_id: req.data[1],
  };

  var data = query.updateData(formsSchemaTable, column, cond);

  const resp = {
    status: 0,
    msg: "Updated successfully",
    data: data,
  };

  // console.log("response", resp)
  libFunc.sendResponse(res, resp);
}

async function loadforms(req, res) {
  const cond = {
    tablename: req.data.row_id,
  };

  var resp = await query.fetchData(formsSchemaTable, cond);
  console.log("fetch res", resp);
  libFunc.sendResponse(res, resp);
}

async function loadallforms(req, res) {
  var resp = await query.fetchData(formsSchemaTable);
  console.log("fetch res", resp);
  libFunc.sendResponse(res, resp);
}

function crateFormTable(req, res) {
  var table_name = req.data;

  var data = [
    { id: "form_data", fdtype: "jsonb", required: true },
    { id: "others_data", fdtype: "jsonb" },
  ];

  var data = query.createTable(schema, table_name, data);

  const resp = {
    status: 0,
    msg: "table created successfully",
  };

  console.log("response", resp);
  libFunc.sendResponse(res, resp);
}

function saveforms_data(req, res) {
  console.log("req", req);
  var row_id = libFunc.randomid();
  var formsData = req.data[0];
  var othersData = req.data[2];

  var sumb_info = schema + "." + req.data[1];

  console.log("sumb_info", sumb_info);
  console.log("formsdata", req.data[0]);

  console.log("req", req);

  const column = {
    row_id: row_id,
    form_data: JSON.stringify(formsData),
    others_data: JSON.stringify(othersData),
  };

  var data = query.insertData(sumb_info, column);

  const resp = {
    status: 0,
    msg: "Forms data saved successfully",
  };

  console.log("response", resp);
  libFunc.sendResponse(res, resp);
}

async function showFormsResponseCount(req, res) {
  console.log("request", req.data);
  const cond = {
    form_id: req.data.form_id,
  };

  var table_name = schema + "." + req.data.form_id;

  var resp = await query.count(table_name);
  console.log("fetch res -->", resp);
  libFunc.sendResponse(res, resp);
}

async function showFormsResponse(req, res) {
  try {
    console.log("request", req.data.row_id);

    const schemaPrefix = schema + "." + req.data.tablename;
    const patientsId = req.data.patientsId;

    // pagination values
    const page = parseInt(req.data.page) || 1;
    const limit = parseInt(req.data.limit) || 10;
    const offset = (page - 1) * limit;

    // ✅ 1. Fetch paginated results
    const data = await queries.customQuery(`
      SELECT * FROM ${schemaPrefix}
      WHERE others_data @> '{"pat_row_id":"${patientsId}"}'
      ORDER BY cr_on DESC
      LIMIT ${limit} OFFSET ${offset}
    `);

    // ✅ 2. Total count for pagination
    const countResult = await queries.customQuery(`
      SELECT COUNT(*) FROM ${schemaPrefix}
      WHERE others_data @> '{"pat_row_id":"${patientsId}"}'
    `);

    const total = parseInt(countResult[0].count);

    console.log("fetch res -->", data);

    // ✅ 3. Return paginated data with metadata
    libFunc.sendResponse(res, {
      data,
      page,
      limit,
      total,
    });
  } catch (err) {
    console.error("Error in showFormsResponse:", err);
    libFunc.sendError(res, "Server error while fetching form data");
  }
}

async function fetchmediametadatafouser(req, res) {
  console.log("req", req);
  const cond = {
    AND: {
      pat_row_id: req.data.pat_row_id.row_id,
      media_type: req.data.pat_row_id.media_type,
      deleted: 0,
    },
  };

  var resp = await query.fetchData(mediaTable, cond);

  console.log("resp-->", resp);
  libFunc.sendResponse(res, resp);
}

async function fetchmediametadetailsbyid(req, res) {
  console.log("req", req);
  const cond = {
    AND: {
      row_id: req.data.mediaData.row_id,
      media_type: req.data.mediaData.media_type,
      deleted: 0,
    },
  };

  var resp = await query.fetchData(mediaTable, cond);

  console.log("resp-->", resp);
  libFunc.sendResponse(res, resp);
}

async function deletedoctor(req, res) {
  console.log("req--->", req);

  const column = {
    deleted: req.data.delvalue.updatevalue,
  };
  const cond = {
    user_row_id: req.data.delvalue.doc_row_id,
  };

  var data = await query.updateData(doctorsTable, column, cond);

  const column1 = {
    deleted: req.data.delvalue.updatevalue,
  };
  const cond1 = {
    row_id: req.data.delvalue.doc_row_id,
  };

  var data = await query.updateData(usersTable, column1, cond1);

  const resp = {
    status: 0,
    msg: "deleted successfully",
    data: data,
  };

  // console.log("response", resp)
  libFunc.sendResponse(res, resp);
}

async function softDeleteOrStatusChangePatients(req, res) {
  try {
    const { row_id, deleted, active } = req.data.delvalue;

    console.log("backend side data req", req.data);

    // if (!row_id) {
    //   const resp = {
    //     status: 1,
    //     msg: "row_id is required",
    //   };

    //   // console.log("resp", resp);
    //   return libFunc.sendResponse(res, resp);
    // }

    const timestamp = Date.now();
    const currentDate = new Date(timestamp);

    const updateData = {
      up_on: new Date().toISOString(),
      suspension_on: currentDate,
    };

    let messages = [];

    if (typeof deleted !== "undefined") {
      updateData.deleted = deleted;
      if (deleted) {
        messages.push("Deleted successfully");
      } else {
        messages.push("Restored successfully");
      }
    }

    if (typeof active !== "undefined") {
      updateData.active = active;
      if (active) {
        messages.push("Deactivated successfully");
      } else {
        messages.push("Activated successfully");
      }
    }

    console.log("updatedata", updateData);

    if (Object.keys(updateData).length === 1) {
      const resp = {
        status: 1,
        msg: "Nothing to update. Provide deleted or active.",
      };

      // console.log("resp", resp);
      // Only up_on exists
      return libFunc.sendResponse(res, resp);
    }

    // Update branch
    await query.updateData(usersTable, updateData, { row_id: row_id });

    const response = {
      status: 0,
      msg: messages.join(" & "), // Join messages if both updated
    };

    // console.log("Response:", response);
    libFunc.sendResponse(res, response);
  } catch (error) {
    // console.error("Error updating student:", error);
    libFunc.sendResponse(res, {
      status: 1,
      msg: "An error occurred while Patients",
      error: error.message,
    });
  }
  // console.log("resp", resp);
  // return libFunc.sendResponse(res, resp);
}

async function softDeleteOrStatusChangeaudiomedia(req, res) {
  try {
    const { row_id, deleted, active } = req.data.delvalue;

    console.log("backend side data req", req.data);

    const updateData = {
      up_on: new Date().toISOString(),
    };

    let messages = [];

    if (typeof deleted !== "undefined") {
      updateData.deleted = deleted;
      if (deleted) {
        messages.push("student soft-deleted successfully");
      } else {
        messages.push("student restored successfully");
      }
    }

    if (typeof active !== "undefined") {
      updateData.active = active;
      if (active) {
        messages.push("student deactivated successfully");
      } else {
        messages.push("student activated successfully");
      }
    }

    console.log("updatedata", updateData);

    if (Object.keys(updateData).length === 1) {
      const resp = {
        status: 1,
        msg: "Nothing to update. Provide deleted or active.",
      };

      // console.log("resp", resp);
      // Only up_on exists
      return libFunc.sendResponse(res, resp);
    }

    // Update branch
    await query.updateData(mediaTable, updateData, { row_id: row_id });

    const response = {
      status: 0,
      msg: messages.join(" & "), // Join messages if both updated
    };

    // console.log("Response:", response);
    libFunc.sendResponse(res, response);
  } catch (error) {
    // console.error("Error updating student:", error);
    libFunc.sendResponse(res, {
      status: 1,
      msg: "An error occurred while Patients",
      error: error.message,
    });
  }
  // console.log("resp", resp);
  // return libFunc.sendResponse(res, resp);
}

async function softDeleteOrStatusChangeaudioTeleappointments(req, res) {
  try {
    const { row_id, deleted, active } = req.data.delvalue;

    console.log("backend side data req", req.data);

    const updateData = {
      up_on: new Date().toISOString(),
    };

    let messages = [];

    if (typeof deleted !== "undefined") {
      updateData.deleted = deleted;
      if (deleted) {
        messages.push("student soft-deleted successfully");
      } else {
        messages.push("student restored successfully");
      }
    }

    if (typeof active !== "undefined") {
      updateData.active = active;
      if (active) {
        messages.push("student deactivated successfully");
      } else {
        messages.push("student activated successfully");
      }
    }

    console.log("updatedata", updateData);

    if (Object.keys(updateData).length === 1) {
      const resp = {
        status: 1,
        msg: "Nothing to update. Provide deleted or active.",
      };

      // console.log("resp", resp);
      // Only up_on exists
      return libFunc.sendResponse(res, resp);
    }

    // Update branch
    await query.updateData(appointmentTable, updateData, { row_id: row_id });

    const response = {
      status: 0,
      msg: messages.join(" & "), // Join messages if both updated
    };

    // console.log("Response:", response);
    libFunc.sendResponse(res, response);
  } catch (error) {
    // console.error("Error updating student:", error);
    libFunc.sendResponse(res, {
      status: 1,
      msg: "An error occurred while Patients",
      error: error.message,
    });
  }
  // console.log("resp", resp);
  // return libFunc.sendResponse(res, resp);
}

async function softDeleteOrStatusChangeaudioOPDappointments(req, res) {
  try {
    const { row_id, deleted, active } = req.data.delvalue;

    console.log("backend side data req", req.data);

    const updateData = {
      up_on: new Date().toISOString(),
    };

    let messages = [];

    if (typeof deleted !== "undefined") {
      updateData.deleted = deleted;
      if (deleted) {
        messages.push("student soft-deleted successfully");
      } else {
        messages.push("student restored successfully");
      }
    }

    if (typeof active !== "undefined") {
      updateData.active = active;
      if (active) {
        messages.push("student deactivated successfully");
      } else {
        messages.push("student activated successfully");
      }
    }

    console.log("updatedata", updateData);

    if (Object.keys(updateData).length === 1) {
      const resp = {
        status: 1,
        msg: "Nothing to update. Provide deleted or active.",
      };

      // console.log("resp", resp);
      // Only up_on exists
      return libFunc.sendResponse(res, resp);
    }

    // Update branch
    await query.updateData(opdappointmentTable, updateData, { row_id: row_id });

    const response = {
      status: 0,
      msg: messages.join(" & "), // Join messages if both updated
    };

    // console.log("Response:", response);
    libFunc.sendResponse(res, response);
  } catch (error) {
    // console.error("Error updating student:", error);
    libFunc.sendResponse(res, {
      status: 1,
      msg: "An error occurred while Patients",
      error: error.message,
    });
  }
  // console.log("resp", resp);
  // return libFunc.sendResponse(res, resp);
}

async function editUserProfile(req, res) {
  try {
  } catch (error) {}
}

async function uploadtelepsychiatrySsessionsMediaFiles(req, res) {
  try {
    const sender = req.user_id;
    console.log("sender===>", sender);
    let {
      pat_row_id,
      file_name,
      file_path,
      media_type,
      filename,
      description,
      filesize,
    } = req.data;
    console.log("req.data", req.data);
    const user_type = await getUserType(sender);
    console.log(user_type);
    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${year}-${month}-${date}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;

    const columns = [
      {
        row_id: libFunc.randomid(),
        pat_row_id: pat_row_id,
        doc_row_id: sender,
        time,
        date: fullDate,
        media_name: file_name,
        media_link: file_path,
        media_type,
        status: 0,
        sender,
        filename,
        description,
        filesize,
      },
    ];
    const returnField = "row_id";
    const resp = await queries.insertQuery(
      teleSessionMedia,
      columns,
      returnField
    );
    console.log("media uploaded RESP====>", resp);
    if (resp.length > 0) {
      res
        .status(201)
        .send(encodeRespData({ msg: "Media uploaded", status: 0 }));
    } else {
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchsychiatrySsessionsmediametadatafouser(req, res) {
  console.log("req", req);
  const cond = {
    AND: {
      pat_row_id: req.data.pat_row_id.row_id,
      media_type: req.data.pat_row_id.media_type,
    },
  };

  var resp = await query.fetchData(teleSessionMedia, cond);

  console.log("resp-->", resp);
  libFunc.sendResponse(res, resp);
}

async function uploadinpersonSsessionsMediaFiles(req, res) {
  try {
    const sender = req.user_id;
    console.log("sender===>", sender);
    let {
      pat_row_id,
      file_name,
      file_path,
      media_type,
      filename,
      description,
      filesize,
    } = req.data;
    console.log("req.data", req.data);
    const user_type = await getUserType(sender);
    console.log(user_type);
    const d = new Date();

    const date = ("0" + d.getDate()).slice(-2);
    const month = ("0" + (d.getMonth() + 1)).slice(-2);
    const year = d.getFullYear();
    const fullDate = `${year}-${month}-${date}`;

    let hour = d.getHours();
    let mins = ("0" + d.getMinutes()).slice(-2);
    const time = `${hour}:${mins}`;

    const columns = [
      {
        row_id: libFunc.randomid(),
        pat_row_id: pat_row_id,
        doc_row_id: sender,
        time,
        date: fullDate,
        media_name: file_name,
        media_link: file_path,
        media_type,
        status: 0,
        sender,
        filename,
        description,
        filesize,
      },
    ];
    const returnField = "row_id";
    const resp = await queries.insertQuery(
      inpersonSsessions,
      columns,
      returnField
    );
    console.log("media uploaded RESP====>", resp);
    if (resp.length > 0) {
      res
        .status(201)
        .send(encodeRespData({ msg: "Media uploaded", status: 0 }));
    } else {
      res
        .status(500)
        .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchinpersonsessionsmediametadatafouser(req, res) {
  console.log("req", req);
  const cond = {
    AND: {
      pat_row_id: req.data.pat_row_id.row_id,
      media_type: req.data.pat_row_id.media_type,
    },
  };

  var resp = await query.fetchData(inpersonSsessions, cond);

  console.log("resp-->", resp);
  libFunc.sendResponse(res, resp);
}

async function fetchaTeleSessionAppointments(req, res) {
  try {
    const doc_row_id = req.user_id;
    console.log("YES");
    const columns = [
      `${appointmentTable}.row_id AS apt_row_id`,
      `${appointmentTable}.pat_row_id`,
      "patient_name",
      `${usersTable}.user_contact_number`,
      "date_of_req",
      "time_of_req",
      "date_of_apt",
      "time_of_apt",
      "appointment_details",
    ];
    const clause = `${appointmentTable}.doc_row_id = '${doc_row_id}' AND appointment_details ->> 'appt_status' != '4' AND ${appointmentTable}.deleted=0
     AND ${usersTable}.deleted=0
    `;
    const join = [
      {
        join_type: "right",
        table1: appointmentTable,
        table2: patientsTable,
        table1_col: "pat_row_id",
        table2_col: "user_row_id",
      },
      {
        join_type: "left",
        table1: appointmentTable,
        table2: usersTable,
        table1_col: "pat_row_id",
        table2_col: "row_id",
      },
    ];
    const orderBy = "date_of_req, time_of_req";
    const resp = await queries.selectQuery(
      appointmentTable,
      columns,
      clause,
      join,
      orderBy
    );
    console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "Appointments Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No Appointments. Make one", status: 0 }));
    }
  } catch (error) {
    console.log("fetch patients appointments", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchopdAppointmentsForDoctors(req, res) {
  try {
    const doc_row_id = req.user_id;
    console.log("YES");
    const columns = [
      `${opdappointmentTable}.row_id AS apt_row_id`,
      `${opdappointmentTable}.pat_row_id`,
      "patient_name",
      `${usersTable}.user_contact_number`,
      "date_of_req",
      "time_of_req",
      "date_of_apt",
      "time_of_apt",
      "appointment_details",
    ];
    const clause = `${opdappointmentTable}.doc_row_id = '${doc_row_id}' AND appointment_details ->> 'appt_status' != '4' AND ${opdappointmentTable}.deleted = 0 
    AND ${usersTable}.deleted = 0`;
    const join = [
      {
        join_type: "right",
        table1: opdappointmentTable,
        table2: patientsTable,
        table1_col: "pat_row_id",
        table2_col: "user_row_id",
      },
      {
        join_type: "left",
        table1: opdappointmentTable,
        table2: usersTable,
        table1_col: "pat_row_id",
        table2_col: "row_id",
      },
    ];
    const orderBy = "date_of_req, time_of_req";
    const resp = await queries.selectQuery(
      opdappointmentTable,
      columns,
      clause,
      join,
      orderBy
    );
    console.log(resp);
    if (resp.length > 0) {
      res
        .status(200)
        .send(
          encodeRespData({ msg: "Appointments Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "No Appointments. Make one", status: 0 }));
    }
  } catch (error) {
    console.log("fetch patients appointments", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function updateFormsMedia(req, res) {
  console.log("req", req.data);
  const { row_id, formdata } = req.data;

  console.log("formdata", formdata);

  // ============ Update existing checker ============
  const updateData = {
    formdata: JSON.stringify(formdata),
    up_on: new Date().toISOString(),
  };

  await query.updateData(mediaTable, updateData, { row_id: row_id });

  response = {
    status: 0,
    msg: "forms updated successfully",
  };
  libFunc.sendResponse(res, response);
}

async function changePassword(req, res) {
  console.log("change password", req.user_id, req.data);
  try {
    const { currentPassword, confirmPassword } = req.data;

    const row_id = req.user_id;

    if (!row_id || !currentPassword || !confirmPassword) {
      return res.send(
        encodeRespData({
          msg: "All fields are required",
          status: 1,
        })
      );
    }

    // Step 1: Fetch user with matching current password
    const columns = ["row_id", "user_password"];
    const clause = `row_id = '${row_id}' AND user_password = '${currentPassword}' `;
    const userResp = await queries.selectQuery(usersTable, columns, clause);

    console.log("userResp", userResp);
    if (!userResp || userResp.length === 0) {
      return res.send(
        encodeRespData({
          msg: "Current password is incorrect",
          status: 1,
        })
      );
    }

    // Step 2: Update to new password
    const updateData = { user_password: confirmPassword };
    const updateClause = `row_id = '${row_id}'`;
    const updateResp = await query.updateQuery(
      usersTable,
      updateData,
      updateClause
    );

    console.log("updateResp", updateResp);
    if (updateResp > 0) {
      return res.send(
        encodeRespData({
          msg: "Password changed successfully",
          status: 0,
        })
      );
    } else {
      return res.send(
        encodeRespData({
          msg: "Failed to update password",
          status: 1,
        })
      );
    }
  } catch (error) {
    console.error("Change password error:", error);
    return res.send(
      encodeRespData({
        msg: "Something went wrong",
        status: 1,
      })
    );
  }
}

async function createAdminsprofile(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    const user_row_id = req.user_id;
    const {
      firstname,
      lastname,
      email,
      phone,
      password,
      // doctor_type,
      photo_path,
      gender,
    } = req.data;

    const existingUser = await queries.customQuery(`
      SELECT user_email, user_contact_number FROM ${usersTable}
      WHERE user_email = '${email.trim()}'
      OR user_contact_number = '${phone.trim()}'
    `);

    console.log("existingUser", existingUser);
    if (existingUser.length > 0) {
      const user = existingUser[0];
      if (user.user_email === email.trim()) {
        return res.send(
          encodeRespData({
            msg: "Email address you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
      if (user.user_contact_number === phone.trim()) {
        return res.send(
          encodeRespData({
            msg: "Phone number you're trying to use has already been used to create an account on the platform",
            status: 1,
          })
        );
      }
    }

    if (firstname && password) {
      // Check user authority
      const checkAuthorityColumn = ["user_type"];
      const checkAuthorityClause = `row_id = '${user_row_id}'`;
      const checkAuthorityResp = await queries.selectQuery(
        usersTable,
        checkAuthorityColumn,
        checkAuthorityClause
      );
      console.log(checkAuthorityResp);
      if (checkAuthorityResp.length > 0) {
        if (checkAuthorityResp[0].user_type == 3) {
          await connect_db.query("BEGIN TRANSACTION");
          const userTableColumns = [
            {
              row_id: libFunc.randomid(),
              user_contact_number: phone,
              user_password: password,
              user_type: 0,
              user_email: email,
            },
          ];
          const usersTableReturnField = "row_id";
          const userTableResp = await queries.insertQuery(
            usersTable,
            userTableColumns,
            usersTableReturnField
          );
          console.log(userTableResp);
          if (userTableResp.length > 0) {
            const columns = [
              {
                row_id: libFunc.randomid(),
                user_row_id: userTableResp[0].row_id,
                firstname: firstname,
                lastname: lastname,
                email,
                gender,
                photo_path,
              },
            ];

            const returnFields = "row_id";
            const resp = await queries.insertQuery(
              adminTable,
              columns,
              returnFields
            );
            console.log(resp);
            if (resp.length > 0) {
              await connect_db.query("COMMIT");
              res
                .status(201)
                .send(
                  encodeRespData({ msg: "Registration successful", status: 0 })
                );
            } else {
              await connect_db.query("ROLLBACK");
              res
                .status(500)
                .send(
                  encodeRespData({ msg: "Something went wrong", status: 1 })
                );
            }
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res.status(403).send(
            encodeRespData({
              msg: "You don't have access for this request",
              status: 1,
            })
          );
        }
      }
    } else {
      await connect_db.query("ROLLBACK");
      res.status(403).send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function updateAdminProfile(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    const user_row_id = req.user_id;
    const { row_id, firstname, lastname, email, phone, gender, photo_path } =
      req.data;

    // Check user authority
    const checkAuthorityColumn = ["user_type"];
    const checkAuthorityClause = `row_id = '${user_row_id}'`;
    const checkAuthorityResp = await queries.selectQuery(
      usersTable,
      checkAuthorityColumn,
      checkAuthorityClause
    );
    console.log("checkAuthorityResp-----", checkAuthorityResp);
    if (checkAuthorityResp.length > 0) {
      if (checkAuthorityResp[0].user_type === 0) {
        await connect_db.query("BEGIN TRANSACTION");
        const userTableColumns = {
          user_contact_number: phone,
          user_email: email,
        };
        const usersTableClaue = `row_id = '${user_row_id}'`;
        const userTableResp = await queries.updateQuery(
          usersTable,
          userTableColumns,
          usersTableClaue
        );
        console.log(userTableResp);
        if (userTableResp > 0) {
          const columns = {
            firstname: firstname,
            lastname: lastname,
            gender: gender,
            email: email,
            photo_path: photo_path,
          };

          const clause = `user_row_id = '${user_row_id}'`;
          const resp = await queries.updateQuery(adminTable, columns, clause);
          console.log("resp-->", resp);
          if (resp > 0) {
            await connect_db.query("COMMIT");
            res
              .status(201)
              .send(
                encodeRespData({ msg: "Admin details updated", status: 0 })
              );
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res
            .status(500)
            .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
        }
      } else {
        await connect_db.query("ROLLBACK");
        res.status(403).send(
          encodeRespData({
            msg: "You don't have access for this request",
            status: 1,
          })
        );
      }
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function updateResearchersprofile(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    const user_row_id = req.user_id;
    const { row_id, firstname, lastname, email, phone, gender, photo_path } =
      req.data;

    // Check user authority
    const checkAuthorityColumn = ["user_type"];
    const checkAuthorityClause = `row_id = '${user_row_id}'`;
    const checkAuthorityResp = await queries.selectQuery(
      usersTable,
      checkAuthorityColumn,
      checkAuthorityClause
    );
    console.log("checkAuthorityResp-----", checkAuthorityResp);
    if (checkAuthorityResp.length > 0) {
      if (checkAuthorityResp[0].user_type === 1) {
        await connect_db.query("BEGIN TRANSACTION");
        const userTableColumns = {
          user_contact_number: phone,
          user_email: email,
        };
        const usersTableClaue = `row_id = '${user_row_id}'`;
        const userTableResp = await queries.updateQuery(
          usersTable,
          userTableColumns,
          usersTableClaue
        );
        console.log(userTableResp);
        if (userTableResp > 0) {
          const columns = {
            firstname: firstname,
            lastname: lastname,
            doctor_gender: gender,
            doctor_email: email,
            photo_path: photo_path,
          };

          const clause = `user_row_id = '${user_row_id}'`;
          const resp = await queries.updateQuery(doctorsTable, columns, clause);
          console.log("resp-->", resp);
          if (resp > 0) {
            await connect_db.query("COMMIT");
            res
              .status(201)
              .send(
                encodeRespData({ msg: "Researcher details updated", status: 0 })
              );
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res
            .status(500)
            .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
        }
      } else {
        await connect_db.query("ROLLBACK");
        res.status(403).send(
          encodeRespData({
            msg: "You don't have access for this request",
            status: 1,
          })
        );
      }
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchSepesficAdmins(req, res) {
  try {
    const user_row_id = req.data.row_id;
    const {
      row_id = null,
      doc_name = null,
      limit = 30,
      page = 1,
      showDeleted = 0,
    } = req.data;

    console.log("req data", req.data);
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "firstname",
      "lastname",
      "photo_path",
      "email",
      "gender",
      `${adminTable}.cr_on`,
      `${adminTable}.row_id`,
    ];

    let active = 0;
    // let clause = `config.t_users.active = ${active}`;
    let clause = `config.t_users.deleted = 0 And config.t_users.active =0`;

    if (user_row_id) {
      clause = `${usersTable}.row_id = '${user_row_id}'`;
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: adminTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];

    const offset = (page - 1) * limit;

    const orderBy = "cr_on";

    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      orderBy,
      offset,
      // null,
      limit
    );
    console.log("Doctors===>", resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "admin details Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no admin.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch Doctors Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchSepesficresearchers(req, res) {
  try {
    const user_row_id = req.data.row_id;
    const {
      row_id = null,
      doc_name = null,
      limit = 30,
      page = 1,
      showDeleted = 0,
    } = req.data;

    console.log("req data", req.data);
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      "firstname",
      "lastname",
      "photo_path",
      "doctor_email",
      "doctor_gender",
      `${doctorsTable}.cr_on`,
      `${doctorsTable}.row_id`,
    ];

    let active = 0;
    // let clause = `config.t_users.active = ${active}`;
    let clause = `config.t_users.deleted = 0 And config.t_users.active =0`;

    if (user_row_id) {
      clause = `${usersTable}.row_id = '${user_row_id}'`;
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: doctorsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];

    const offset = (page - 1) * limit;

    const orderBy = "cr_on";

    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      orderBy,
      offset,
      // null,
      limit
    );
    console.log("Doctors===>", resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "admin details Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no admin.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch Doctors Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function up_participate_profile(req, res) {
  try {
    console.log("user id from token===>", req.user_id);
    const user_row_id = req.user_id;
    const { row_id, firstname, lastname, email, phone, gender, photo_path } =
      req.data;

    // Check user authority
    const checkAuthorityColumn = ["user_type"];
    const checkAuthorityClause = `row_id = '${user_row_id}'`;
    const checkAuthorityResp = await queries.selectQuery(
      usersTable,
      checkAuthorityColumn,
      checkAuthorityClause
    );
    console.log("checkAuthorityResp-----", checkAuthorityResp);
    if (checkAuthorityResp.length > 0) {
      if (checkAuthorityResp[0].user_type === 2) {
        await connect_db.query("BEGIN TRANSACTION");
        const userTableColumns = {
          user_contact_number: phone,
          user_email: email,
        };
        const usersTableClaue = `row_id = '${user_row_id}'`;
        const userTableResp = await queries.updateQuery(
          usersTable,
          userTableColumns,
          usersTableClaue
        );
        console.log(userTableResp);
        if (userTableResp > 0) {
          const columns = {
            patient_firstname: firstname,
            patient_lastname: lastname,
            patient_gender: gender,
            patient_email: email,
            photo_path: photo_path,
          };

          const clause = `user_row_id = '${user_row_id}'`;
          const resp = await queries.updateQuery(
            patientsTable,
            columns,
            clause
          );
          console.log("resp-->", resp);
          if (resp > 0) {
            await connect_db.query("COMMIT");
            res.status(201).send(
              encodeRespData({
                msg: "Participant details updated",
                status: 0,
              })
            );
          } else {
            await connect_db.query("ROLLBACK");
            res
              .status(500)
              .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
          }
        } else {
          await connect_db.query("ROLLBACK");
          res
            .status(500)
            .send(encodeRespData({ msg: "Something went wrong", status: 1 }));
        }
      } else {
        await connect_db.query("ROLLBACK");
        res.status(403).send(
          encodeRespData({
            msg: "You don't have access for this request",
            status: 1,
          })
        );
      }
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}

async function fetchSepesficparticipate(req, res) {
  try {
    const user_row_id = req.data.row_id;
    const {
      row_id = null,
      doc_name = null,
      limit = 30,
      page = 1,
      showDeleted = 0,
    } = req.data;

    console.log("req data", req.data);
    const columns = [
      `${usersTable}.row_id AS user_row_id`,
      `${usersTable}.user_contact_number`,
      `${usersTable}.user_password`,
      `${patientsTable}.patient_firstname`,
      `${patientsTable}.patient_lastname`,
      `${patientsTable}.photo_path`,
      "patient_email",
      "patient_gender",
      `${patientsTable}.cr_on`,
      `${patientsTable}.row_id`,
    ];

    let active = 0;
    // let clause = `config.t_users.active = ${active}`;
    let clause = `config.t_users.deleted = 0 And config.t_users.active =0`;

    if (user_row_id) {
      clause = `${usersTable}.row_id = '${user_row_id}'`;
    }

    const joins = [
      {
        join_type: "right",
        table1: usersTable,
        table2: patientsTable,
        table1_col: "row_id",
        table2_col: "user_row_id",
      },
    ];

    const offset = (page - 1) * limit;

    const orderBy = "cr_on";

    const resp = await queries.selectQuery(
      usersTable,
      columns,
      clause,
      joins,
      orderBy,
      offset,
      // null,
      limit
    );
    console.log("Doctors===>", resp);
    if (resp.length > 0) {
      res.status(200).send(
        encodeRespData({
          msg: "participate details Fetched",
          data: resp,
          status: 0,
        })
      );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no participate.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch Doctors Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}
