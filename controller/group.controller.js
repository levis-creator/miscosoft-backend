const db = require("../config/db.config");

const create_group = async (req, res) => {
  const { group_name } = req.body;
  try {
    await db.query("INSERT INTO group_address (group_name)VALUES($1)", [
      group_name,
    ]);
    res.json("success");
  } catch (error) {
    console.error(error);
  }
};
const get_groups = async (req, res) => {
  try {
    await db.query("SELECT* FROM group_address").then((response) => {
      res.json(response.rows);
    });
  } catch (error) {
    console.error(error);
  }
};
const get_group = async (req, res) => {
  const { id } = req.params;
  try {
    await db
      .query("SELECT* FROM group_address WHERE id=$1", [id])
      .then((response) => {
        res.json(response.rows[0]);
      });
  } catch (error) {
    console.error(error);
  }
};
const update_group = async (req, res) => {
  const { id } = req.params;
  const { group_name } = req.body;
  try {
    await db
      .query("UPDATE group_address SET group_name=$1 WHERE id=$2", [
        group_name,
        id,
      ])
      .then(() => {
        res.json("updated successfully");
        res.status(200);
      });
  } catch (error) {
    console.error(error);
  }
};
const delete_group = async (req, res) => {
  const { id } = req.params;
  console.log(id);
  try {
    await db.query("DELETE FROM group_address WHERE id=$1", [id]).then(() => {
      res.json("deleted successfully");
      res.status(200);
    });
  } catch (error) {
    console.error(error);
  }
};

module.exports = {
  create_group,
  get_group,
  update_group,
  delete_group,
  get_groups,
};
