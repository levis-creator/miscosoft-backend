const express = require("express");
const {
  create_contact,
  get_contacts,
  update_contact,
  delete_contact,
} = require("../controller/contacts.controller");
const router = express.Router();

router.post("/", create_contact);
router.get("/", get_contacts);
router.put("/:id", update_contact);
router.delete("/:id", delete_contact);

module.exports = router;
