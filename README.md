if (from_date && to_date) {
    baseConditions.push(`cr_on BETWEEN '${from_date} 00:00:00' AND '${to_date} 23:59:59'`);
}


if (from_date && to_date) {
    baseConditions.push(`cr_on::date BETWEEN '${from_date}' AND '${to_date}'`);
}


async function fetchReportsofwhatapps(req, res) {
    try {
        const { organizationid, from_date, to_date } = req.data; 
        console.log("request---------", req.data);

        let baseConditions = [`organizationid = '${organizationid}'`];

        // ✅ Handle all date range combinations
        if (from_date && to_date) {
            // Full day range → include all times of the day
            baseConditions.push(`cr_on BETWEEN '${from_date} 00:00:00' AND '${to_date} 23:59:59'`);
        } else if (from_date) {
            baseConditions.push(`cr_on >= '${from_date} 00:00:00'`);
        } else if (to_date) {
            baseConditions.push(`cr_on <= '${to_date} 23:59:59'`);
        }

        // ✅ For records → add filter for only failed
        let failedConditions = [...baseConditions, `response_data->>'result' = 'false'`];

        // Fetch only failed logs (records)
        const logsQuery = `
            SELECT row_id, mobilenumber, receiver_user, template_name,
                   request_data, response_data, cr_on, others_details, organizationid
            FROM prosys.whatsapp_log
            WHERE ${failedConditions.join(" AND ")}
            ORDER BY cr_on DESC
        `;
        const logs = await db_query.customQuery(logsQuery, "Failed WhatsApp report data fetch");

        // Fetch success & failed counts
        const countQuery = `
            SELECT 
                SUM(CASE WHEN response_data->>'result' = 'true' THEN 1 ELSE 0 END) AS success_count,
                SUM(CASE WHEN response_data->>'result' = 'false' THEN 1 ELSE 0 END) AS failed_count
            FROM prosys.whatsapp_log
            WHERE ${baseConditions.join(" AND ")}
        `;
        const counts = await db_query.customQuery(countQuery, "WhatsApp response count");
        
        // Final response structure
        const response = {
            status: logs.status,
            msg: logs.msg,
            data: {
                counts: {
                    success_count: counts.data[0]?.success_count || 0,
                    failed_count: counts.data[0]?.failed_count || 0
                },
                records: logs.data || [] // ✅ Only failed records
            }
        };

        console.log("final data----", response);
        libFunc.sendResponse(res, response);

    } catch (error) {
        console.error("Error fetching WhatsApp logs:", error);
        res.status(500).json({ success: false, message: "Server Error" });
    }
}
