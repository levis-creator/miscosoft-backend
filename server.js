require("dotenv").config();
// imports
const express = require("express");
const cors = require("cors");
// routes imports
const users = require("./routes/user.route");
const messages=require("./routes/message.route")



// Express initialization
const app = express();
// middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use((req, res, next) => {
  console.log(req.url, req.method);
  next();
});
app.use(cors());

// routes
app.use("/api/users", users);
app.use("/api/messages",messages)
// intial stater
const port = process.env.PORT || 3001;
app.listen(port, () => console.log(`Server Running on Port ${port}`));