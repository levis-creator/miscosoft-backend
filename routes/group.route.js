const express = require("express");
const {
  create_group,
  get_group,
  update_group,
  delete_group,
  get_groups,
} = require("../controller/group.controller");
const router = express.Router();

router.post("/", create_group);
router.get("/", get_groups);
router.get("/:id", get_group);
router.put("/:id", update_group);
router.delete("/:id", delete_group);

module.exports = router;
