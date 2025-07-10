const express = require("express");
const router = express.Router();
const libFunc = require("./functions.js");
const queries = require("./connect_db/queries.js");
const path = require("path");
const Busboy = require("busboy"); // 👈 FIXED

const auth = require("./authentication/connect.js");
const auth_config = require("./authentication/config.js");
const jwt = require("jsonwebtoken");
var atob = require("atob");
var fs = require("fs");
const multer = require("multer");
require("./library.js")();
const nodemailer = require("nodemailer");

const auth1 = require('./google_auth/connect.js');
const jwttoken = require("./authentication/auth_config");



router.post("/", verifyToken, function (req, res, next) {
  // console.log("requesting----66",req)
  let data = JSON.parse(decodeURIComponent(atob(req.body.payload)));
  data["user_id"] = req.token.data.row_id;
  data["reqdata"] = req;

  // console.log("data====>", data)
  let fn = "common_fn";
  let se = data.se;
  eval(fn + "." + se)(data, res);
});

async function verifyToken(req, res, next) {
  try {
    // console.log("authorization 21====>", req.headers.authorization);
    const token = req.headers.authorization.split(" ")[1];
    const secret = process.env.JWT_SECRET;
    // console.log(secret);
    const tokenData = jwt.verify(token, secret);
    // req.userId = tokenData.userId;
    // console.log(tokenData);
    req.token = tokenData;
    next();
  } catch (error) {
    var errr = { msg: "Invalid Token", status: "2" };
    var enErr = encodeReqData(errr);
    console.log("error===>", error);
    res.status(403).send(enErr);
  }
}

function encodeReqData(data) {
  return btoa(encodeURIComponent(JSON.stringify(data)));
}

router.post("/registration", function (req, res) {
  let data = JSON.parse(decodeURIComponent(atob(req.body.payload)));
  let fn = "common_fn";
  let se = data.se;
  eval(fn + "." + se)(data, res);
});


const passport = require("passport");
var gAuth = auth1.googleAuthentication();
passport.use(gAuth);

var magicLinkAuth = auth1.magicLinkAuthentication();
passport.use(magicLinkAuth);


var gAuthScope = auth1.googleAuthenticationScope; // NO () here
var gAuthCallbacks = auth1.googleAuthenticationCallbacks; // NO () here

router.get("/auth/google", gAuthScope);

router.get("/gauth", (req, res, next) => {
  passport.authenticate(
    "google",
    { failureRedirect: "/", session: false },
    async (error, user, info) => {
      if (error) {
        return res.send({ message: error.message });
      }
      if (user) {
        try {
          const profile = user.profile;
          const email = profile.emails?.[0]?.value

          console.log("email-->",email)

          const stateRaw = decodeURIComponent(req.query.state || "{}");
          const state = JSON.parse(stateRaw);

          const userType = state.user_type === "doctor" ? 1 : 2;
          const doctorId = state.doctor_id || null;
          const google_user=1;
          console.log("req.query.state--------------", state);

           const userdata = await queries.customQuery(
    `SELECT * FROM config.t_users WHERE user_email = '${email}'`
    );

  console.log("user--->",userdata)

if (userdata.length !=0) {
  console.log("inside if ",userdata[0].user_type)
    req.body.user = {
            google_id: profile.id,
            name: profile.displayName,
            email: profile.emails?.[0]?.value || "",
            user_type: userdata[0].user_type,
            doctorId: doctorId,
          };


          const verifyResult = await common_fn.verifyuser(req);

          if (verifyResult === true) {
            const payload = {
              data: {
                row_id: userdata[0].row_id,
                email: req.body.user.email,
                user_type: userdata[0].user_type,
              },
            };

            console.log("payload---------------", payload);

            const token = jwt.sign(payload, process.env.JWT_SECRET, {
              expiresIn: "5d",
            });

            let userDetails;

            if (userdata[0].user_type === 1) {
              userDetails = {
                doctor_email: req.body.user.email,
                row_id: userdata[0].row_id,
                doctor_name: profile.displayName,

              };
            } else {
              userDetails = {
                patient_email: req.body.user.email,
                row_id: userdata[0].row_id,
                patient_name: profile.displayName,

              };
            }
          // return  res.redirect(
          //     `http://localhost:4200/sign-in?token=${token}&role=${userdata[0].user_type}&userDeatials=${JSON.stringify(
          //       userDetails
          //     )}&google_user=${google_user}`
          //   );

            res.redirect(
              `https://research.ftisindia.com/sign-in?token=${token}&role=${userdata[0].user_type}&userDeatials=${JSON.stringify(
                userDetails
              )}&google_user=${google_user}`
            );
          } else {
          // return  res.redirect(`http://localhost:4200/sign-in?pending=${userdata[0].user_type}`);

            res.redirect(`https://research.ftisindia.com/sign-in?pending=${userdata[0].user_type}`);

          }

}
  console.log("req.query.state",state.user_type)

  if (state.user_type) {
    
   req.body.user = {
            google_id: profile.id,
            name: profile.displayName,
            email: profile.emails?.[0]?.value || "",
            user_type: userType,
            doctorId: doctorId,
          };

          console.log("User with user_type:", req.body.user);

          const saveResult = await common_fn.saveuser(req);
          const verifyResult = await common_fn.verifyuser(req);

          if (verifyResult === true) {
            const payload = {
              data: {
                row_id: saveResult.userRowId,
                email: req.body.user.email,
                user_type: userType,
              },
            };

            console.log("payload---------------", payload);

            const token = jwt.sign(payload, process.env.JWT_SECRET, {
              expiresIn: "5d",
            });

            let userDetails;

            if (userType === 1) {
              userDetails = {
                doctor_email: req.body.user.email,
                row_id: saveResult.userRowId,
                doctor_name: profile.displayName,

              };
            } else {
              userDetails = {
                patient_email: req.body.user.email,
                row_id: saveResult.userRowId,
                patient_name: profile.displayName,

              };
            }
          //  return res.redirect(
          //     `http://localhost:4200/sign-in?token=${token}&role=${userType}&userDeatials=${JSON.stringify(
          //       userDetails
          //     )}&google_user=${google_user}`
          //   );

            res.redirect(
              `https://research.ftisindia.com/sign-in?token=${token}&role=${userType}&userDeatials=${JSON.stringify(
                userDetails
              )}&google_user=${google_user}`
            );
          } else {
          //  return res.redirect(`http://localhost:4200/sign-in?pending=${userType}`);

            res.redirect(`https://research.ftisindia.com/sign-in?pending=${userType}`);

          }
        }else{
          console.log("else part")
            // res.redirect(`http://localhost:4200/sign-in?pending=3`);

            res.redirect(`https://research.ftisindia.com/sign-in?pending=3`);

        }
         
        } catch (error) {
          return res.send({ message: error.message });
        }
      } else {
        res.redirect("/");
      }
    }
  )(req, res, next);
});



/**
 *Magic link Authentication 
 */

router.post("/auth/forgot-password", async (req, res) => {
  // console.log("req-------", req);
  const { email } = req.body;
  if (!email) return res.status(400).json({ message: "Email required" });

  // 1. Check if user exists
  const user = await queries.customQuery(
    `SELECT * FROM config.t_users WHERE user_email = '${email}'`
  );
  console.log("user",user.length === 0)
  if (user.length === 0){
    return res.json({ message: "The email address you entered is not registered with us" });
  }
  // 2. Generate OTP
  const otp = Math.floor(100000 + Math.random() * 900000).toString();
const expiresat = new Date(Date.now() + 10 * 60 * 1000).toISOString(); // 10 mins in ISO format



  // 3. Save OTP to DB
  // const row_id = libFunc.randomid()
  await queries.customQuery(
    `INSERT INTO config.t_password_reset_otp (email,otp,expires_at) VALUES('${email}','${otp}','${expiresat}')`
  );

  // 4. Send OTP
  await auth1.sendOtpToEmail(email, otp);

  res.json({ message: "OTP has been sent to your email address. Please check your inbox" });
});




router.post("/auth/reset-password", async (req, res) => {
  const { email, otp, new_password } = req.body;
  console.log("req.body", req.body);
  if (!email || !otp || !new_password)
    return res.json({ message: "All fields are required" });

  // 1. Get OTP record
  const otpResult = await queries.customQuery(
    `SELECT * FROM config.t_password_reset_otp WHERE email = '${email}' AND otp = '${otp}'`
  );
  
  console.log("otpResult", otpResult.length === 0,otpResult);
  if (otpResult.length === 0)
    return res.json({ message: "Invalid OTP or email address" });

  const otpRecord = otpResult.expires_at;
  if (new Date(otpRecord) < new Date())
    return res.json({ message: "OTP has expired. Please request a new one" });

  // 3. Update user password
  await queries.customQuery(
    `UPDATE config.t_users SET user_password = '${new_password}', up_on = now() WHERE user_email = '${email}'`
  );

  // 4. Mark OTP as used
  // await queries.customQuery(
  //   `UPDATE config.t_password_reset_otp SET is_used = true WHERE id ='${otpRecord.id}'`
  // );

  res.json({ message: "Your password has been successfully reset. You can now log in with your new password" });
});





// router.post("/email/login", auth1.magicLinkAuthenticationToken(), (req, res) => {
//   res.send("Magic link sent to your email.");
// });

// // Verify token
// router.get("/email/verify",
//   passport.authenticate("magiclink", {
//     successRedirect: "/dashboard",
//     failureRedirect: "/login",
//   }),
//   (req, res) => {
//     console.log(" User logged in:-------->", req.user);
//   }
// );

const schema = "config";
const usersTable = schema + ".t_users";
const doctorsTable = schema + ".t_doctors";
const patientsTable = schema + ".t_patients";

function encodeRespData(data) {
  return btoa(encodeURIComponent(JSON.stringify(data)));
}

var magicAuthToken = auth1.magicLinkAuthenticationToken();

router.post('/auth/email', magicAuthToken, function (req, res, next) {
  res.redirect('/common/auth/email/check');
});
router.get('/auth/email/check', function (req, res, next) {
  res.send({ "msg": 'check email' });
});
router.get('/auth/email/verify', (req, res, next) => {
  // gAuthCallbacks()(req,res,next);
  passport.authenticate('magiclink', { failureRedirect: '/login', successRedirect: '/dashboard' }, async (error, user, info) => {
    if (error) {
      return res.send({ message: error.message });
    }
    if (user) {
      console.log("user------------------");
      console.log(user);
      try {
        // const Result = await common_fn.log_with_email(user);
        // console.log("result",Result)


     const  email  = user.email;
    const identifier = email;

    console.log("email ---///",email)
   
      
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

      // if (resp.length > 0) {
        let userDetails = "";

        if (resp[0].user_type == "1" || resp[0].user_type == "0") {
          const doc_columns = [
            `${usersTable}.row_id`,
            "firstname",
            "lastname",
            "doctor_email",
            "user_contact_number",
            "doctor_gender",
            "photo_path"
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
          userDetails = doc_resp[0];
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
          userDetails = pat_resp[0];
        }

        
          const token = jwttoken.generateToken(
            { row_id: resp[0].row_id, user_type: resp[0].user_type },
            "5d"
          );


          console.log("token",token,resp[0].user_type,userDetails)

       if (token) {
        console.log("inside token ///")
         return res.redirect(`https://research.ftisindia.com/sign-in?token=${token}&role=${resp[0].user_type}&userDeatials=${JSON.stringify(userDetails)}`);

       
        //  return res.redirect(`http://localhost:4200/sign-in?token=${token}&role=${resp[0].user_type}&userDeatials=${JSON.stringify(userDetails)}`);

       }


       
      // } 
        
      } catch (error) {
        // error msg 
        // return res.send({ message: error.message });
      }
    }
  })(req, res, next);

});


/**
 *
 *File Uploading
 */
//-------------------------------------------------------------------///
// Define upload folders
// const fpathAudio = path.join(__dirname, "../public/assets/uploads/audios");
// const fpathVideo = path.join(__dirname, "../public/assets/uploads/videos");
// const fpathImages = path.join(__dirname, "../public/assets/uploads/images");

// // Ensure all directories exist
// [fpathAudio, fpathVideo, fpathImages].forEach((dir) => {
//   if (!fs.existsSync(dir)) {
//     fs.mkdirSync(dir, { recursive: true });
//   }
// });

// // Multer storage configuration
// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     let destinationPath = "";

//     console.log("File mime type ===>", file.mimetype);

//     if (
//       file.mimetype === "application/octet-stream" ||
//       file.mimetype === "audio/mp3" ||
//       file.mimetype === "audio/mpeg"
//     ) {
//       destinationPath = fpathAudio;
//     } else if (file.mimetype === "video/mp4") {
//       destinationPath = fpathVideo;
//     } else if (
//       file.mimetype === "image/png" ||
//       file.mimetype === "image/jpg" ||
//       file.mimetype === "image/jpeg"
//     ) {
//       destinationPath = fpathImages;
//     } else {
//       return cb(new Error("Unsupported file type"), null);
//     }

//     cb(null, destinationPath);
//   },
//   filename: function (req, file, cb) {
//     cb(null, Date.now() + "_" + file.originalname);
//   },
// });

// // Multer upload instance
// const upload = multer({
//   storage: storage,
//   limits: { fileSize: 2000000000 }, // 2GB
// });

// // File size formatter
// const formatFileSize = (bytes) => {
//   if (bytes >= 1024 * 1024) return (bytes / (1024 * 1024)).toFixed(2) + " MB";
//   if (bytes >= 1024) return (bytes / 1024).toFixed(2) + " KB";
//   return bytes + " bytes";
// };

// // Upload endpoint
// router.post("/upload", upload.single("file"), async (req, res) => {
//   try {
//     const file = req.file;
//     let foPa = "";

//     if (
//       file.mimetype === "application/octet-stream" ||
//       file.mimetype === "audio/mp3" ||
//       file.mimetype === "audio/mpeg"
//     ) {
//       foPa = "/uploads/audios/" + file.filename;
//     } else if (file.mimetype === "video/mp4") {
//       foPa = "/uploads/videos/" + file.filename;
//     } else if (
//       file.mimetype === "image/png" ||
//       file.mimetype === "image/jpg" ||
//       file.mimetype === "image/jpeg"
//     ) {
//       foPa = "/uploads/images/" + file.filename;
//     }

//     const resp = {
//       status: true,
//       message: "File uploaded successfully.",
//       data: {
//         name: file.filename,
//         originalname: file.originalname,
//         foPa,
//         mimetype: file.mimetype,
//         size: formatFileSize(file.size),
//       },
//     };

//     console.log("Upload Response:", resp);
//     res.send(resp);
//   } catch (err) {
//     console.error("Upload error:", err);
//     res.status(500).send({ status: false, message: "Upload failed", error: err });
//   }
// });


// Define base directories
const basePath = path.join(__dirname, "public/assets/uploads");
const imageDir = path.join(basePath, "images");
const videoDir = path.join(basePath, "videos");
const audioDir = path.join(basePath, "audios");

// Ensure directories exist
[imageDir, videoDir, audioDir].forEach((dir) => {
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
});

// Format file size
const formatFileSize = (bytes) => {
    if (bytes >= 1024 * 1024) return (bytes / (1024 * 1024)).toFixed(2) + " MB";
    if (bytes >= 1024) return (bytes / 1024).toFixed(2) + " KB";
    return bytes + " bytes";
};

router.post("/upload", (req, res) => {
  const bb = Busboy({ headers: req.headers }); // 👈 FIXED

    let fileInfo = {};

    bb.on("file", (name, file, info) => {
        const { filename, mimeType } = info;
        const timestamp = Date.now();
        const safeFilename = `${timestamp}_${filename.replace(/\s+/g, "_")}`;
        let uploadPath = "";
        let relativePath = "";

        if (mimeType.startsWith("image/")) {
            uploadPath = path.join(imageDir, safeFilename);
            relativePath = `/uploads/images/${safeFilename}`;
        } else if (mimeType.startsWith("video/")) {
            uploadPath = path.join(videoDir, safeFilename);
            relativePath = `/uploads/videos/${safeFilename}`;
        } else if (mimeType.startsWith("audio/") || mimeType === "application/octet-stream") {
            uploadPath = path.join(audioDir, safeFilename);
            relativePath = `/uploads/audios/${safeFilename}`;
        } else {
            uploadPath = path.join(basePath, safeFilename);
            relativePath = `/uploads/${safeFilename}`;
        }

        fileInfo = {
            name: safeFilename,
            originalname: filename,
            foPa: relativePath,
            mimetype: mimeType,
            size: 0,
        };

        const writeStream = fs.createWriteStream(uploadPath);

        file.on("data", (chunk) => {
            fileInfo.size += chunk.length;
        });

        file.pipe(writeStream);
    });

    bb.on("close", () => {
        fileInfo.size = formatFileSize(fileInfo.size);
        res.status(200).json({
            status: true,
            message: "File uploaded successfully",
            data: fileInfo,
        });
    });

    bb.on("error", (err) => {
        console.error("Busboy error:", err);
        res.status(500).json({ status: false, message: "Upload failed", error: err.message });
    });

    req.pipe(bb);
});



// router.post("/importproducts", upload.single("file"), async (req, res) => {
//   const file = req.file;
//   // console.log(file);
//   if (
//     file.mimetype ==
//     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
//   ) {
//     const workbook = XLSX.readFile(`public/assets/uploads/${file.filename}`, {
//       encoding: "utf8",
//     });
//     var sheet_name_list = workbook.SheetNames;
//     // sheet_name_list.map((item) => {
//     var xlData = XLSX.utils.sheet_to_json(workbook.Sheets[sheet_name_list[0]]);
//     // console.log("xlData====>", xlData[0]);

//     let fn = "common_fn";
//     let se = "im_pr";
//     // let fn = data.fn, se = data.se;
//     eval(fn + "." + se)(xlData, res);
//     // });
//   }
// });

// router.post("/uploads", upload.any(), async (req, res) => {
//   // console.log("file uploading=======================");
//   console.log(req);
//   try {
//     const files = req.files;
//     console.log("file uploading");
//     console.log(files);
//     var respFiles = [];
//     for (let i = 0; i < files.length; i++) {
//       const file = files[i];
//       respFiles.push({
//         name: file.filename,
//         originalname: file.originalname,
//         foPa: "uploads/" + file.filename,
//         mimetype: file.mimetype,
//         size: file.size,
//       });
//     }
//     var resp = {
//       status: true,
//       message: "File is uploaded.",
//       data: respFiles,
//     };
//     res.send(resp);
//   } catch (err) {
//     res.status(500).send(err);
//   }
// });

//===========================================//

router.post("/create-user", function (req, res, next) {
  // console.log(req);
  let data = JSON.parse(decodeURIComponent(escape(atob(req.body.payload))));
  // console.log("data========createuser====");
  // console.log(data);
  // data.data.userId = req.userId;
  // data.data.token = req.token;
  let fn = "common_fn",
    se = data.se;
  // let fn = data.fn, se = data.se;
  eval(fn + "." + se)(data, res);
});

// Endpoint to redirect to the original URL
router.get("/:shortCode", (req, res) => {
  const { shortCode } = req.params;
  fs.readFile(
    "./public/uploads/short-url-db.json",
    "utf8",
    function (err, data) {
      if (err) {
        console.log(err);
      } else {
        console.log("shortCode========");
        console.log(shortCode);
        obj = JSON.parse(data);
        console.log("obj", obj);
        const longUrl = obj[shortCode];
        console.log("longUrl", longUrl);
        if (!longUrl) {
          return res.status(404).json({ error: "Short URL not found" });
        }

        // Redirect to the original URL
        res.redirect(longUrl);
      }
    }
  );
});

/**
 * Social Media Authentication
 */

// var gAuth = auth.googleAuthentication();
// passport.use(gAuth);
// var magicLinkAuth = auth.magicLinkAuthentication();
// passport.use(magicLinkAuth);
// var fbAuth = auth.facebookAuthentication();
// passport.use(fbAuth);

/**
 * Facebook Authentication
//  */
// var fbAuthScope = auth.facebookAuthenticationScope();
// router.get("/auth/fb", fbAuthScope);
// router.get("/fbauth", (req, res, next) => {
//   // gAuthCallbacks()(req,res,next);
//   passport.authenticate(
//     "facebook",
//     { failureRedirect: "/", successRedirect: "/" },
//     async (error, user, info) => {
//       if (error) {
//         return res.send({ message: error.message });
//       }
//       if (user) {
//         console.log("user------------------");
//         console.log(user);
//         try {
//           // res.redirect('/');
//           req.body.user = JSON.parse(user);
//           common_fn.saveuser(req, res);
//         } catch (error) {
//           // error msg
//           return res.send({ message: error.message });
//         }
//       }
//     }
//   )(req, res, next);
// });

// //----------------------------------------------//
// /**
//  * Google Authentication
//  */
// var gAuthScope = auth.googleAuthenticationScope();
// var gAuthCallbacks = auth.googleAuthenticationCallbacks();
// router.get("/auth/google", gAuthScope);
// router.get("/gauth", (req, res, next) => {
//   // gAuthCallbacks()(req,res,next);
//   passport.authenticate(
//     "google",
//     { failureRedirect: "/", successRedirect: "/" },
//     async (error, user, info) => {
//       if (error) {
//         return res.send({ message: error.message });
//       }
//       if (user) {
//         console.log("user------------------");
//         console.log(user);
//         try {
//           // res.redirect('/');
//           req.body.user = JSON.parse(user);
//           common_fn.saveuser(req, res);
//         } catch (error) {
//           // error msg
//           return res.send({ message: error.message });
//         }
//       }
//     }
//   )(req, res, next);
// });

//----------------------------------------------//

module.exports = router;
