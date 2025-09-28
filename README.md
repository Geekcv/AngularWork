  fe_sc_class: fetchOwnClass,
  fe_sb: fetchclassSubject,
  fe_chap: fetchchapterOfSubject,
  fe_all_sch: fetchallSchool,
  fe_all_cls_of_school: fetchallClassofschool,



// rbacConfig.js
module.exports = {
    roles: {
      1: ["fe_all_sch", "fe_all_cls_of_school"], // SuperAdmin
      2: ["cr_sh", "fe_all_sch", "fe_all_cls_of_school"], // Admin
      3: ["fe_sc_class", "fe_sb", "fe_chap"], // Teacher
      4: ["fe_chap"], // Student
    },
    errorResponse: {
      msg: "You are not authorized to perform this action",
      status: 403,
    },
  };
  


router.post("/", verifyToken, function (req, res, next) {
  // console.log("requesting----66",req)
  let data = JSON.parse(decodeURIComponent(atob(req.body.payload)));

  data["user_id"] = req.token.data.row_id;

  // console.log("data====>", data)
  let fn = "common_fn";
  let se = data.se;

  // RBAC CHECK START
  const userRole = req.token.data.user_type; // 0, 1, 2, 3
  const allowedPermissions = rbacConfig.roles[userRole] || [];

  if (!allowedPermissions.includes(se)) {
    console.log(`RBAC Blocked: Role ${userRole} tried to call ${se}`);
    return res.status(403).send(encodeReqData(rbacConfig.errorResponse));
  }

  eval(fn + "." + se)(data, res);
});
