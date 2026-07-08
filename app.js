const express = require("express");
const favicon = require("serve-favicon");
const path = require("path");

const dotenv = require("dotenv");

const { router: dbRouter } = require("./db.js");

require("dotenv").config();

const app = express();

const CustomError = require("./utils/CustomError");
const errorHandler = require("./middleware/errorHandler");

const corsMiddleWare = require("./middleware/cors.js");
const loggerMWModule = require("./middleware/logger");
const helmetMWModule = require("./middleware/helmet.js");

const authLimiter = require("./middleware/authRateLimit.js");
const apiLimiter = require("./middleware/apiRateLimit.js");

const signupmodule = require("./auth/signup.js");

const loginmodule = require("./auth/login.js");

const passport = require("passport");
const oauthmodule = require("./auth/OAuth/googleoauth.js");
require("./auth/OAuth/passport.js");

require("./auth/authorisation.js");

const registerPatient = require("./apis/patient/patientReg.js");

const doctorInformation = require("./apis/doctors/doctorInformation");

const appointmentModule = require("./apis/appointment/appointment.js");

const deptModule = require("./apis/dept.js");

const billingModule = require("./apis/billing/billing.js");

const billInfoModule = require("./apis/billing/billInfo.js");

const medicineInfoModule = require("./apis/medicine/medicineInfo.js");

const eServiceInfoModule = require("./apis/emergencyService/eServiceInfo.js");

const contactInfoModule = require("./apis/contact/contactInfo.js");

app.use(helmetMWModule);
app.use(corsMiddleWare);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(loggerMWModule);

app.use(express.static("public"));
/* app.use(
  favicon(path.join(__dirname, "public", "jobBoardPlatformFavicon.ico"), {
    maxAge: 7 * 24 * 60 * 60 * 1000,
  }),
); */

app.use("/db", dbRouter);

app.use("/signup", authLimiter, signupmodule);

app.use("/login", authLimiter, loginmodule);

app.use("/oauth", authLimiter, oauthmodule);
app.use(passport.initialize());

app.use("/patient", apiLimiter, registerPatient);

app.use("/doctors", doctorInformation);

app.use("/appointment", appointmentModule);

app.use("/departments", deptModule);

app.use("/billing", billingModule);

app.use("/billInfo", billInfoModule);

app.use("/medicines", medicineInfoModule);

app.use("/eServiceInfo", eServiceInfoModule);

app.use("/contactInfo", contactInfoModule);

app.get(/^\/home(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "home.html"));
});

app.get(/^\/patientRegistration(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "patientReg.html"));
});

app.get(/^\/doctors(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "doctors.html"));
});

app.get(/^\/appointment(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "appointment.html"));
});

app.get(/^\/departments(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "dept.html"));
});

app.get(/^\/billing(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "billing.html"));
});

app.get(/^\/billInfo(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "billInfo.html"));
});

app.get(/^\/medicineInfo(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "medicineInfo.html"));
});

app.get(/^\/eServiceInfo(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "eServiceInfo.html"));
});

app.get(/^\/contactInfo(?:\.html)?$/, (req, res) => {
  res.sendFile(path.join(__dirname, "views", "contactInfo.html"));
});

app.use((req, res) => {
  res.status(404).sendFile(path.join(__dirname, "views", "404.html"));
});

//CENTRALIZED ERROR HANDLER
app.use(errorHandler);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
