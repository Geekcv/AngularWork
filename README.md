async function bulkTaskImport(req, res) {
    var userid = req.data.userId;
    var organizationid = req.data.orgId;
    var importedTasks = req.data.importedTasks;

    if (importedTasks.length === 0) {
        return libFunc.sendResponse(res, { status: 1, msg: "No tasks to import" });
    }

    const { validTasks, firstInvalidTask } = await validateUsers(importedTasks);

    // If any invalid task found (invalid format OR not in DB), return immediately
    if (firstInvalidTask) {
        return libFunc.sendResponse(res, {
            status: 1,
            msg: firstInvalidTask.reason,   // ✅ use specific reason here
            invalidTask: firstInvalidTask
        });
    }

    await bulkImportPreperation(validTasks, organizationid);

    return libFunc.sendResponse(res, {
        status: 0,
        msg: "Bulk import successful"
    });
}

async function validateUsers(importedTasks) {
    const allNumbers = new Set();

    for (const task of importedTasks) {
        if (task.assignedby) allNumbers.add(task.assignedby.trim());
        if (Array.isArray(task.assigned_to)) {
            task.assigned_to.forEach(num => {
                if (num) allNumbers.add(num.trim());
            });
        }
    }

    // Query DB
    let existingNumbers = [];
    if (allNumbers.size > 0) {
        const numberList = [...allNumbers].map(n => `'${n}'`).join(",");
        const query = `SELECT mobilenumber FROM ${schema}.users WHERE mobilenumber IN (${numberList})`;
        const result = await connect_db.query(query);
        existingNumbers = result.rows.map(r => r.mobilenumber);
    }

    const validTasks = [];
    let firstInvalidTask = null;

    // Helper validation
    const isValidNumber = (num) => {
        if (!num) return false;                // null/undefined/empty
        const trimmed = num.trim();
        return /^\d{10}$/.test(trimmed);       // must be exactly 10 digits
    };

    for (const task of importedTasks) {
        const invalidFormat = [];
        const missing = [];
        let assignedByValid = true;

        // Validate assigned_by
        if (task.assignedby) {
            const ab = task.assignedby.trim();
            if (!isValidNumber(ab)) {
                invalidFormat.push(task.assignedby);
                assignedByValid = false;
            } else if (!existingNumbers.includes(ab)) {
                missing.push(task.assignedby);
                assignedByValid = false;   // 🚨 stop if not in DB
            }
        }

        // Validate assigned_to
        const validAssignedTo = [];
        const invalidAssignedTo = [];
        if (Array.isArray(task.assigned_to)) {
            for (const num of task.assigned_to) {
                const tnum = num ? num.trim() : "";
                if (!isValidNumber(tnum)) {
                    invalidFormat.push(num);
                    invalidAssignedTo.push(num);
                } else if (!existingNumbers.includes(tnum)) {
                    missing.push(num);
                    invalidAssignedTo.push(num); // 🚨 stop if not in DB
                } else {
                    validAssignedTo.push(tnum);
                }
            }
        }

        // 🚨 If assigned_by invalid OR no valid assigned_to, stop here
        if (!assignedByValid) {
            firstInvalidTask = {
                title: task.title,
                description: task.description,
                assignedby: task.assignedby,
                assigned_to: task.assigned_to,
                reason: missing.length > 0 
                    ? "User(s) not found in database"    // ✅ DB specific
                    : "Invalid assigned_by format",
                invalidFormat,
                missingNumbers: missing
            };
            break;
        } else if (validAssignedTo.length === 0) {
            firstInvalidTask = {
                title: task.title,
                description: task.description,
                assignedby: task.assignedby,
                assigned_to: task.assigned_to,
                reason: missing.length > 0 
                    ? "Assigned_to users not found in database"   // ✅ DB specific
                    : "No valid assigned_to users",
                invalidAssignedTo,
                invalidFormat,
                missingNumbers: missing
            };
            break;
        } else {
            validTasks.push({
                ...task,
                assigned_to: validAssignedTo
            });
        }
    }

    return { validTasks, firstInvalidTask };
}
