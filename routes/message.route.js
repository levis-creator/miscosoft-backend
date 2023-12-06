const express = require('express');

const { send_message, get_sent, get_unsent } = require("../controller/message.controller");

const router = express.Router();
router.post("/", send_message);
router.get("/sent", get_sent);
router.get("/unsent", get_unsent);



module.exports = router;