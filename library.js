const connect_db = require("./connect_db/db_connect.js");
const libFunc = require("./functions.js");
const queries = require("./connect_db/queries.js");
const jwt = require("./authentication/auth_config");

module.exports = function () {
  this.common_fn = common_fn;
};

let common_fn = {
  // Registration

  lo_us: loginUser,

  // ------------

  cr_sh: createSchool,
  re_sh:createSchoolSignUp,
  // fe_sc_data:fetchSchoolOwnClass,

  fe_sc_class:fetchOwnClass,
  fe_sb:fetchclassSubject,
  fe_chap:fetchchapterOfSubject,
  fe_all_sch:fetchallSchool,
  fe_all_cls_of_school:fetchallClassofschool,
  
  cr_stu:CreateStudent,


  // master database
  add_bod:addboard,
  add_class:addclass,
  fe_bod:fetchallboard,
  fe_cls_bod:fetchallClassofboard,
  add_sub:addsubject,
  fe_sub_cl:fetchallsubjectofclass,
  cr_chap:addchapter

};

// DB TABLES
const master_schema = "master_schema"
const school_schema = "school_schema";

const master_boardTable = master_schema +  ".master_board"
const master_classesTable = master_schema +  ".master_classes"
const master_subjectsTable = master_schema +  ".master_subjects"
const master_chaptersTable = master_schema +  ".master_chapters"

const SuperUsersTable = school_schema + ".super_admin";
const usersTable = school_schema + ".users";
const schoolsTable = school_schema + ".schools";
const classTable = school_schema + ".class";
const subjectsTable = school_schema + ".subjects";
const chaptersTable = school_schema + ".chapters";
const studentTable = school_schema + ".students";




function encodeRespData(data) {
  return btoa(encodeURIComponent(JSON.stringify(data)));
}

async function createSchool(req, res) {
  try {
    const user_row_id = req.user_id;
    const { name, email, phone, address, board_id, password } = req.data;

    const checkAuthority = await queries.selectQuery(
      SuperUsersTable,
      ["user_type"],
      `row_id = '${user_row_id}'`
    );

    if (checkAuthority.length === 0 || checkAuthority[0].user_type !== 1) {
      return res
        .status(403)
        .send(
          encodeRespData({
            msg: "You are not authorized to create schools",
            status: 1,
          })
        );
    }

    const existing = await queries.customQuery(`
      SELECT email, phone FROM  ${schoolsTable}
      WHERE email = '${email.trim()}' OR phone = '${phone.trim()}'
    `);

    if (existing.length > 0) {
      const match = existing[0];
      if (match.email === email.trim()) {
        return res.send(
          encodeRespData({ msg: "Email already exists", status: 1 })
        );
      }
      if (match.phone === phone.trim()) {
        return res.send(
          encodeRespData({ msg: "Phone already exists", status: 1 })
        );
      }
    }

    const school_id = libFunc.randomid();
    const user_id = libFunc.randomid();

    await connect_db.query("BEGIN");

    // Insert school
    const schoolInsert = [
      {
        row_id: school_id,
        name,
        email,
        phone,
        address,
        board_id,
        created_by: user_row_id,
      },
    ];
    const insertSchool = await queries.insertQuery(
      schoolsTable,
      schoolInsert,
      "row_id"
    );

    // Insert school admin
    const userInsert = [
      {
        row_id: user_id,
        school_id: school_id,
        name,
        email,
        password,
        role: 2,
      },
    ];
    const insertUser = await queries.insertQuery(
      usersTable,
      userInsert,
      "row_id"
    );

    // START COPYING MASTER DATA
    const masterClasses = await queries.customQuery(`
      SELECT * FROM  ${master_classesTable}
      WHERE board_row_id = '${board_id}'
    `);

    for (const cls of masterClasses) {
      const new_class_id = libFunc.randomid();
      await queries.insertQuery(classTable, [
        {
          row_id: new_class_id,
          school_id: school_id,
          teacher_id: null,
          name: cls.name,
        },
      ]);

      const masterSubjects = await queries.customQuery(`
        SELECT * FROM  ${master_subjectsTable}
        WHERE class_row_id = '${cls.row_id}'
      `);

      for (const sub of masterSubjects) {
        const new_subject_id = libFunc.randomid();
        await queries.insertQuery(subjectsTable, [
          {
            row_id: new_subject_id,
            class_id: new_class_id,
            school_id: school_id,
            name: sub.name,
            description: "",
          },
        ]);

        const masterChapters = await queries.customQuery(`
          SELECT * FROM  ${master_chaptersTable}
          WHERE subject_row_id = '${sub.row_id}'
        `);

        for (const chap of masterChapters) {
          await queries.insertQuery(chaptersTable, [
            {
              row_id: libFunc.randomid(),
              subject_id: new_subject_id,
              school_id: school_id,
              name: chap.name,
              description: "",
            },
          ]);
        }
      }
    }

    // END COPYING MASTER DATA

    if (insertSchool.length > 0 && insertUser.length > 0) {
      await connect_db.query("COMMIT");
      return res.status(201).send(
        encodeRespData({
          msg: "School and admin user created successfully with class, subject, chapter data",
          status: 0,
          school_row_id: insertSchool[0].row_id,
          user_row_id: insertUser[0].row_id,
        })
      );
    } else {
      await connect_db.query("ROLLBACK");
      return res
        .status(500)
        .send(encodeRespData({ msg: "Failed to create", status: 1 }));
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");
    console.error("createSchool error:", error);
    return res
      .status(500)
      .send(encodeRespData({ msg: "Internal server error", status: 2 }));
  }
}

async function createSchoolSignUp(req, res) {
  try {
    const { name, email, phone, address, board_id, password } = req.data;

    

    

    const existing = await queries.customQuery(`
      SELECT email, phone FROM ${schoolsTable}
      WHERE email = '${email.trim()}' OR phone = '${phone.trim()}'
    `);

    if (existing.length > 0) {
      const match = existing[0];
      if (match.email === email.trim()) {
        return res.send(
          encodeRespData({ msg: "Email already exists", status: 1 })
        );
      }
      if (match.phone === phone.trim()) {
        return res.send(
          encodeRespData({ msg: "Phone already exists", status: 1 })
        );
      }
    }

    const school_id = libFunc.randomid();
    const user_id = libFunc.randomid();

    await connect_db.query("BEGIN");

    // Insert school
    const schoolInsert = [
      {
        row_id: school_id,
        name,
        email,
        phone,
        address,
        board_id,
      },
    ];
    const insertSchool = await queries.insertQuery(
      schoolsTable,
      schoolInsert,
      "row_id"
    );

    // Insert school admin
    const userInsert = [
      {
        row_id: user_id,
        school_id: school_id,
        name,
        email,
        password,
        role: 2,
      },
    ];
    const insertUser = await queries.insertQuery(
      usersTable,
      userInsert,
      "row_id"
    );

    // START COPYING MASTER DATA
    const masterClasses = await queries.customQuery(`
      SELECT * FROM ${master_classesTable}
      WHERE board_row_id = '${board_id}'
    `);

    for (const cls of masterClasses) {
      const new_class_id = libFunc.randomid();
      await queries.insertQuery(classTable, [
        {
          row_id: new_class_id,
          school_id: school_id,
          teacher_id: null,
          name: cls.name,
        },
      ]);

      const masterSubjects = await queries.customQuery(`
        SELECT * FROM ${master_subjectsTable}
        WHERE class_row_id = '${cls.row_id}'
      `);

      for (const sub of masterSubjects) {
        const new_subject_id = libFunc.randomid();
        await queries.insertQuery(subjectsTable, [
          {
            row_id: new_subject_id,
            class_id: new_class_id,
            school_id: school_id,
            name: sub.name,
            description: "",
          },
        ]);

        const masterChapters = await queries.customQuery(`
          SELECT * FROM ${master_chaptersTable}
          WHERE subject_row_id = '${sub.row_id}'
        `);

        for (const chap of masterChapters) {
          await queries.insertQuery(chaptersTable, [
            {
              row_id: libFunc.randomid(),
              subject_id: new_subject_id,
              school_id: school_id,
              name: chap.name,
              description: "",
            },
          ]);
        }
      }
    }

    // END COPYING MASTER DATA

    if (insertSchool.length > 0 && insertUser.length > 0) {
      await connect_db.query("COMMIT");
      return res.status(201).send(
        encodeRespData({
          msg: "School and admin user created successfully with class, subject, chapter data",
          status: 0,
          school_row_id: insertSchool[0].row_id,
          user_row_id: insertUser[0].row_id,
        })
      );
    } else {
      await connect_db.query("ROLLBACK");
      return res
        .status(500)
        .send(encodeRespData({ msg: "Failed to create", status: 1 }));
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");
    console.error("createSchool error:", error);
    return res
      .status(500)
      .send(encodeRespData({ msg: "Internal server error", status: 2 }));
  }
}


async function loginUser(req, res) {
  try {
    const { phone, email, password } = req.data;
    const identifier = (phone || email || "").trim();

    if (!identifier || !password) {
      return res.send(
        encodeRespData({
          msg: "Please fill all the required fields",
          status: 1,
        })
      );
    }

    // Check if identifier is email
    const isEmail = identifier.includes("@");
    let clause = "";
    if (isEmail) {
      clause = `email = '${identifier}'`;
    } else {
      clause = `phone = '${identifier}'`;
    }

    // Try login as super_admin first
    const superAdminCols = ["row_id", "email", "password", "user_type", "name"];
    const superAdmin = await queries.selectQuery(
       SuperUsersTable,
      superAdminCols,
      clause
    );

    if (superAdmin.length > 0) {
      const user = superAdmin[0];

      if (password === user.password) {
        const token = jwt.generateToken(
          { row_id: user.row_id, user_type: user.user_type },
          "5d"
        );

        return res.status(200).send(
          encodeRespData({
            msg: "Login successful as Super Admin!",
            token,
            user_type: user.user_type,
            user_details: user,
            status: 0,
          })
        );
      } else {
        return res.send(
          encodeRespData({
            msg: "Incorrect password",
            status: 1,
          })
        );
      }
    }

    // If not found in super_admin, try in users table
    const userCols = [
      "row_id",
      "email",
      "password",
      "role",
      "school_id",
      "name",
    ];
    const user = await queries.selectQuery(
      usersTable,
      userCols,
      clause
    );

    if (user.length > 0) {
      const usr = user[0];

      if (password === usr.password) {
        const token = jwt.generateToken(
          { row_id: usr.row_id, user_type: usr.role },
          "5d"
        );

        return res.status(200).send(
          encodeRespData({
            msg: "Login successful!",
            token,
            user_type: usr.role,
            user_details: usr,
            status: 0,
          })
        );
      } else {
        return res.send(
          encodeRespData({
            msg: "Incorrect password",
            status: 1,
          })
        );
      }
    }

    return res.send(
      encodeRespData({
        msg: "User not found with given credentials",
        status: 1,
      })
    );
  } catch (err) {
    console.error("Login error:", err);
    return res.send(
      encodeRespData({
        msg: "Something went wrong during login",
        status: 2,
      })
    );
  }
}


async function fetchSchoolOwnClass(req,res) {
   try {
    const { row_id = null, doc_name = null, limit = 30, page = 1,showDeleted = 0 } = req.data;

    console.log("req data",req.data)
    const columns = [
      `${classTable}.row_id AS class_row_id`,`${classTable}.name as class_name`,
      `${subjectsTable}.row_id as subject_row_id`,`${subjectsTable}.name as subject_name`,
      `${chaptersTable}.name as chapter_name`
    ];

   
    let clause = `${classTable}.school_id`;   
  

    const joins = [
      {
        join_type: "left",
        table1: subjectsTable,
        table2: classTable,
        table1_col: "row_id",
        table2_col: "class_id",
      },
       {
        join_type: "left",
        table1: subjectsTable,
        table2: chaptersTable,
        table1_col: "row_id",
        table2_col: "subject_id",
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
          encodeRespData({ msg: "All data Fetched", data: resp, status: 0 })
        );
    } else {
      res
        .status(203)
        .send(encodeRespData({ msg: "There are no data.", status: 0 }));
    }
  } catch (error) {
    console.log("Fetch data Error===>", error);
    res
      .status(500)
      .send(encodeRespData({ msg: "Something went wrong", status: 2 }));
  }
}


async function fetchOwnClass(req, res) {
  try {
    const schoolId = req.data;

    if (!schoolId) {
      return res.status(400).send(
        encodeRespData({
          msg: "School ID is required",
          status: 1,
        })
      );
    }

    const columns = [
      `${classTable}.row_id`,
      `${classTable}.name`,
    ];

    const clause = `school_id = '${schoolId}'`;
    const join = null;
    const orderBy = `${classTable}.cr_on`;

    const resp = await queries.selectQuery(classTable, columns, clause, join, orderBy);

    console.log("Fetched classes for school:", schoolId, "→", resp);
    libFunc.sendResponse(res, resp);
  } catch (error) {
    console.error("Error in fetchOwnClass:", error);
    return res.status(500).send(
      encodeRespData({
        msg: "Internal server error while fetching class list",
        status: 2,
      })
    );
  }
}


async function fetchclassSubject(req, res) {
  try {
    const classId = req.data;

    if (!classId) {
      return res.status(400).send(
        encodeRespData({
          msg: "Class ID is required",
          status: 1,
        })
      );
    }

    const columns = [
      `${subjectsTable}.row_id`,
      `${subjectsTable}.name`,
    ];

    const clause = `class_id = '${classId}'`;
    const join = null;
    const orderBy = `${subjectsTable}.cr_on`;

    const resp = await queries.selectQuery(subjectsTable, columns, clause, join, orderBy);

    console.log("Fetched subjects for class:", classId, "→", resp);
    libFunc.sendResponse(res, resp);
  } catch (error) {
    console.error("Error in fetchclassSubject:", error);
    return res.status(500).send(
      encodeRespData({
        msg: "Internal server error while fetching subjects",
        status: 2,
      })
    );
  }
}



async function fetchchapterOfSubject(req, res) {
  try {
    const subjectId = req.data;

    if (!subjectId) {
      return res.status(400).send(
        encodeRespData({
          msg: "Subject ID is required",
          status: 1,
        })
      );
    }

    const columns = [
      `${chaptersTable}.row_id`,
      `${chaptersTable}.name`,
    ];

    const clause = `subject_id = '${subjectId}'`;
    const join = null;
    const orderBy = `${chaptersTable}.cr_on`;

    const resp = await queries.selectQuery(chaptersTable, columns, clause, join, orderBy);

    console.log("Chapter fetch response:", resp);
    libFunc.sendResponse(res, resp);
  } catch (error) {
    console.error("Error in fetchchapterOfSubject:", error);
    return res.status(500).send(
      encodeRespData({
        msg: "Internal server error while fetching chapters",
        status: 2,
      })
    );
  }
}


async function fetchallSchool(req, res) {
  try {
    const resp = await queries.fetchData(schoolsTable);

    //  Success response
    return libFunc.sendResponse(res, resp);
  } catch (error) {
    console.error("Error in fetchallSchool:", error);

    //  Failure response
    return res.status(500).send(
      encodeRespData({
        msg: "Internal server error while fetching schools",
        status: 2,
      })
    );
  }
}


async function fetchallClassofschool(req, res) {
  try {
    const { school_id } = req.data;

    // Validate input
    if (!school_id) {
      return res.status(400).send(
        encodeRespData({
          msg: "school_id is required",
          status: 1,
        })
      );
    }

    //  Fetch classes by school_id
    const condition = { school_id };
    const classList = await queries.fetchData(classTable, condition);

    return libFunc.sendResponse(res, classList);
  } catch (error) {
    console.error("Error in fetchallClassofschool:", error);
    return res.status(500).send(
      encodeRespData({
        msg: "Internal server error",
        status: 2,
      })
    );
  }
}


async function CreateStudent(req, res) {
  try {
    const user_row_id = req.user_id;
    const { name, email, phone, password, school_row_id, class_id } = req.data;

    //  Validate required fields
    if (!name || !email || !phone || !password || !school_row_id || !class_id) {
      return res.status(400).send(
        encodeRespData({
          msg: "Missing required fields",
          status: 1,
        })
      );
    }

    // Check if current user is a school admin (role 2)
    const checkAuthority = await queries.selectQuery(
      usersTable,
      ["role"],
      `row_id = '${user_row_id}'`
    );

    if (checkAuthority.length === 0 || checkAuthority[0].role !== 2) {
      return res.status(403).send(
        encodeRespData({
          msg: "You are not authorized to create students",
          status: 1,
        })
      );
    }

    //  Check for duplicate email or phone
    const existing = await queries.customQuery(`
      SELECT email, phone FROM ${studentTable}
      WHERE email = '${email.trim()}' OR phone = '${phone.trim()}'
    `);

    if (existing.length > 0) {
      const match = existing[0];
      if (match.email === email.trim()) {
        return res.send(encodeRespData({ msg: "Email already exists", status: 1 }));
      }
      if (match.phone === phone.trim()) {
        return res.send(encodeRespData({ msg: "Phone already exists", status: 1 }));
      }
    }

    // Generate IDs
    const student_id = libFunc.randomid();
    const user_id = libFunc.randomid();

    //  Optional: Hash password (recommended)
    // const hashedPassword = await bcrypt.hash(password, 10);

    await connect_db.query("BEGIN");

    // Insert into students table
    const studentInsert = [
      {
        row_id: student_id,
        name: name.trim(),
        email: email.trim(),
        phone: phone.trim(),
        password, // replace with hashedPassword if using bcrypt
        school_id: school_row_id,
        class_id,
      },
    ];
    const insertStudent = await queries.insertQuery(studentTable, studentInsert, "row_id");

    //  Insert into users table
    const userInsert = [
      {
        row_id: user_id,
        school_id: school_row_id,
        name: name.trim(),
        email: email.trim(),
        password, // replace with hashedPassword if using bcrypt
        role: 4, // student role
      },
    ];
    const insertUser = await queries.insertQuery(usersTable, userInsert, "row_id");

    if (insertStudent.length > 0 && insertUser.length > 0) {
      await connect_db.query("COMMIT");
      return res.status(201).send(
        encodeRespData({
          msg: "Student created successfully",
          status: 0,
          student_row_id: insertStudent[0].row_id,
          user_row_id: insertUser[0].row_id,
        })
      );
    } else {
      await connect_db.query("ROLLBACK");
      return res.status(500).send(
        encodeRespData({
          msg: "Failed to create student",
          status: 1,
        })
      );
    }
  } catch (error) {
    await connect_db.query("ROLLBACK");
    console.error("CreateStudent error:", error);
    return res.status(500).send(
      encodeRespData({
        msg: "Internal server error",
        status: 2,
      })
    );
  }
}



async function addboard(req, res) {
  try {
      const { board } = req.data || {};

      // Validate input
      if (!board || typeof board !== 'string' || board.trim() === '') {
          return libFunc.sendResponse(res, {
              status: 1,
              msg: "Missing or invalid field: 'board'",
          });
      }

      //  Generate unique ID
      const row_id = libFunc.randomid();

      // Prepare DB insert object
      const column = {
          row_id,
          name: board.trim(),
      };

      //  Insert into DB
      const result = await queries.insertData(master_boardTable, column);

      //  Success response
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Board created successfully",
          data: {
              board_id: row_id,
              board_name: board.trim(),
          },
      });

  } catch (error) {
      console.error("Error in addboard:", error);

      //  Failure response
      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to create board. Internal server error.",
          error: error.message || error,
      });
  }
}

async function createOrEditBoard(req, res) {
  try {
    const { board_id, board } = req.data || {};

    // Validate input
    if (!board || typeof board !== 'string' || board.trim() === '') {
      return libFunc.sendResponse(res, {
        status: 1,
        msg: "Missing or invalid field: 'board'",
      });
    }

    const boardName = board.trim();

    if (board_id) {
      // ---- Update existing board ----
      const updateFields = {
        name: boardName,
      };
      const clause = `row_id = '${board_id}'`;

      const result = await queries.updateQuery(master_boardTable, updateFields, clause);

      if (result.rowCount > 0) {
        return libFunc.sendResponse(res, {
          status: 0,
          msg: "Board updated successfully",
          data: {
            board_id,
            board_name: boardName,
          },
        });
      } else {
        return libFunc.sendResponse(res, {
          status: 1,
          msg: "No board found with the provided ID",
        });
      }
    } else {
      // ---- Create new board ----
      const row_id = libFunc.randomid();

      const insertData = {
        row_id,
        name: boardName,
      };

      await queries.insertData(master_boardTable, insertData);

      return libFunc.sendResponse(res, {
        status: 0,
        msg: "Board created successfully",
        data: {
          board_id: row_id,
          board_name: boardName,
        },
      });
    }

  } catch (error) {
    console.error("Error in createOrEditBoard:", error);

    return libFunc.sendResponse(res, {
      status: 1,
      msg: "Failed to create or update board. Internal server error.",
      error: error.message || error,
    });
  }
}



async function addclass(req, res) {
  try {
      const { classname, board_id } = req.data || {};

      // Input validation
      if (!classname || !board_id) {
          return libFunc.sendResponse(res, {
              status: 1,
              msg: "Missing required fields: 'classname' or 'board_id'",
          });
      }

      // Generate unique row ID
      const row_id = libFunc.randomid();

      //  Prepare insert object
      const column = {
          row_id,
          board_row_id: board_id,
          name: classname,
      };

      //  Insert class into database
      const result = await queries.insertData(master_classesTable, column);

      //  Success response
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Class created successfully",
          data: {
              class_id: row_id,
              classname,
              board_id,
          },
      });

  } catch (error) {
      console.error("Error in addclass:", error);

      //  Failure response
      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to create class. Internal server error.",
          error: error.message || error,
      });
  }
}

async function createOrEditClass(req, res) {
  try {
    const { class_id, classname, board_id } = req.data || {};

    // Validation
    if (!classname || (!class_id && !board_id)) {
      return libFunc.sendResponse(res, {
        status: 1,
        msg: "Missing required fields: 'classname' and either 'class_id' or 'board_id'",
      });
    }

    if (class_id) {
      // ---- Update Class ----
      const updateFields = {
        name: classname,
      };
      const clause = `row_id = '${class_id}'`;

      const result = await queries.updateQuery(master_classesTable, updateFields, clause);

      if (result.rowCount > 0) {
        return libFunc.sendResponse(res, {
          status: 0,
          msg: "Class updated successfully",
          class_id,
          classname,
        });
      } else {
        return libFunc.sendResponse(res, {
          status: 1,
          msg: "No class found with the provided ID",
        });
      }

    } else {
      // ---- Create Class ----
      const row_id = libFunc.randomid();

      const insertData = {
        row_id,
        board_row_id: board_id,
        name: classname,
      };

      await queries.insertData(master_classesTable, insertData);

      return libFunc.sendResponse(res, {
        status: 0,
        msg: "Class created successfully",
        data: {
          class_id: row_id,
          classname,
          board_id,
        },
      });
    }

  } catch (error) {
    console.error("Error in createOrEditClass:", error);

    return libFunc.sendResponse(res, {
      status: 1,
      msg: "Failed to create or update class. Internal server error.",
      error: error.message || error,
    });
  }
}




async function fetchallboard(req, res) {
  try {
      //  Fetch all board records
      const boards = await queries.fetchData(master_boardTable);

      // Return success response
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Boards fetched successfully",
          data: boards,
      });

  } catch (error) {
      console.error("Error in fetchallboard:", error);

      //  Return error response
      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to fetch boards. Internal server error.",
          error: error.message || error,
      });
  }
}


async function fetchallClassofboard(req, res) {
  try {
      const board_row_id = req.data;

      console.log("Request data ->", board_row_id);

      // Input validation
      if (!board_row_id) {
          return libFunc.sendResponse(res, {
              status: 1,
              msg: "Missing required field: board_row_id",
          });
      }

      // Query condition
      const cond = {
          board_row_id,
      };

      //  Fetch data from DB
      const classList = await queries.fetchData(master_classesTable, cond);

      // Success response
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Classes fetched successfully",
          data: classList,
      });

  } catch (error) {
      console.error("Error in fetchallClassofboard:", error);

      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to fetch classes. Internal server error.",
          error: error.message || error,
      });
  }
}


async function addsubject(req, res) {
  try {
      const { subjectname, class_id } = req.data || {};

      // Validate required fields
      if (!subjectname || !class_id) {
          return libFunc.sendResponse(res, {
              status: 1,
              msg: "Missing required fields: 'subjectname' or 'class_id'",
          });
      }

      //  Generate unique ID
      const row_id = libFunc.randomid();

      //  Prepare insert data
      const column = {
          row_id,
          class_row_id: class_id,
          name: subjectname,
      };

      // Insert subject into DB
      const result = await queries.insertData(master_subjectsTable, column);

      // Success response
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Subject created successfully",
          data: {
              subject_id: row_id,
              subjectname,
              class_id,
          },
      });

  } catch (error) {
      console.error("Error in addsubject:", error);

      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to create subject. Internal server error.",
          error: error.message || error,
      });
  }
}

async function createOrEditSubject(req, res) {
  try {
    const { subject_id, subjectname, class_id } = req.data || {};

    // Validate input
    if (!subjectname || (!subject_id && !class_id)) {
      return libFunc.sendResponse(res, {
        status: 1,
        msg: "Missing required fields: 'subjectname' and either 'subject_id' or 'class_id'",
      });
    }

    if (subject_id) {
      // ---- Update Subject ----
      const updateFields = {
        name: subjectname,
      };
      const clause = `row_id = '${subject_id}'`;

      const result = await queries.updateQuery(master_subjectsTable, updateFields, clause);

      if (result.rowCount > 0) {
        return libFunc.sendResponse(res, {
          status: 0,
          msg: "Subject updated successfully",
          subject_id,
          subjectname,
        });
      } else {
        return libFunc.sendResponse(res, {
          status: 1,
          msg: "No subject found with the provided ID",
        });
      }

    } else {
      // ---- Create Subject ----
      const row_id = libFunc.randomid();

      const insertData = {
        row_id,
        class_row_id: class_id,
        name: subjectname,
      };

      await queries.insertData(master_subjectsTable, insertData);

      return libFunc.sendResponse(res, {
        status: 0,
        msg: "Subject created successfully",
        data: {
          subject_id: row_id,
          subjectname,
          class_id,
        },
      });
    }

  } catch (error) {
    console.error("Error in createOrEditSubject:", error);

    return libFunc.sendResponse(res, {
      status: 1,
      msg: "Failed to create or update subject. Internal server error.",
      error: error.message || error,
    });
  }
}



async function fetchallsubjectofclass(req, res) {
  try {
      const class_row_id = req.data;

      console.log("Request data ->", class_row_id);

      // Validation
      if (!class_row_id) {
          return libFunc.sendResponse(res, {
              status: 1,
              msg: "Missing required field: class_row_id",
          });
      }

      // Condition to match class
      const cond = {
          class_row_id,
      };

      // Fetch data
      const subjects = await queries.fetchData(master_subjectsTable, cond);

      // Return response
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Subjects fetched successfully",
          data: subjects,
      });

  } catch (error) {
      console.error("Error in fetchallsubjectofclass:", error);

      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to fetch subjects. Internal server error.",
          error: error.message || error,
      });
  }
}


async function addchapter(req, res) {
  try {
      // Validate request body
      const { chaptername, subject_id } = req.data || {};

      if (!chaptername || !subject_id) {
          return libFunc.sendResponse(res, {
              status: 1,
              msg: "Missing required fields: 'chaptername' or 'subject_id'",
          });
      }

      // Generate unique row_id
      const row_id = libFunc.randomid();

      // Prepare insert data
      const column = {
          row_id,
          subject_row_id: subject_id,
          name: chaptername,
      };

      // Insert into DB
      const data = await queries.insertData(master_chaptersTable, column);

      // Return success
      return libFunc.sendResponse(res, {
          status: 0,
          msg: "Chapter created successfully",
          data: {
              chapter_id: row_id,
              chaptername,
              subject_id,
          },
      });
  } catch (error) {
      console.error("Error in addchapter:", error);

      return libFunc.sendResponse(res, {
          status: 1,
          msg: "Failed to create chapter. Internal server error.",
          error: error.message || error,
      });
  }
}

async function createOrEditChapter(req, res) {
  try {
    const { chapter_id, chaptername, subject_id } = req.data || {};

    // Validate required fields for both operations
    if (!chaptername || (!chapter_id && !subject_id)) {
      return libFunc.sendResponse(res, {
        status: 1,
        msg: "Missing required fields: 'chaptername' and either 'chapter_id' or 'subject_id'",
      });
    }

    if (chapter_id) {
      // ---- Update Chapter ----
      const updateFields = {
        name: chaptername,
      };
      const clause = `row_id = '${chapter_id}'`;

      const result = await queries.updateQuery(master_chaptersTable, updateFields, clause);

      if (result.rowCount > 0) {
        return libFunc.sendResponse(res, {
          status: 0,
          msg: "Chapter updated successfully",
          chapter_id,
          chaptername,
        });
      } else {
        return libFunc.sendResponse(res, {
          status: 1,
          msg: "No chapter found with the provided ID",
        });
      }

    } else {
      // ---- Create Chapter ----
      const row_id = libFunc.randomid();

      const insertData = {
        row_id,
        subject_row_id: subject_id,
        name: chaptername,
      };

      await queries.insertData(master_chaptersTable, insertData);

      return libFunc.sendResponse(res, {
        status: 0,
        msg: "Chapter created successfully",
        chapter_id: row_id,
        chaptername,
        subject_id,
      });
    }

  } catch (error) {
    console.error("Error in createOrEditChapter:", error);

    return libFunc.sendResponse(res, {
      status: 1,
      msg: "Failed to create or update chapter. Internal server error.",
      error: error.message || error,
    });
  }
}


