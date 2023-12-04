const express = require("express");
// controllers import
const  { create_user, all_users, get_user, delete_user, update_user }=require("../controller/user.controller.js")

const router = express.Router();

router.get("/", all_users);
router.get("/:id", get_user);
router.post("/", create_user);
router.delete("/:id", delete_user);
router.put("/:id", update_user)

module.exports = router;


