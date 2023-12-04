const db = require("../config/db.config");
const uuid = require("uuid");

create_user = async (req, res) => {
  try {
    const userId = uuid.v4();
    const { userName } = req.body;
    const newUser = await db.query(
      `INSERT INTO users (userId, userName)VALUES($1, $2) RETURNING *`,
      [userId, userName]
    );
    res.json(newUser);
  } catch (error) {
    console.error(error.message);
  }
};
all_users = async (req, res) => {
  try {
    const allUser = await db.query("SELECT* FROM users");
    res.json(allUser.rows);
  } catch (error) {
    console.error(error.message);
  }
};
get_user = async (req, res) => {
  try {
    const { id } = req.params;
    const user = await db.query("SELECT * FROM users WHERE userId=$1", [id]);
    res.json(user.rows[0]);
  } catch (error) {
    console.error(error.message);
  }
};
update_user = async (req, res) => {
  try {
    const { id } = req.params;
    const { userName } = req.body;
    const update = await db
      .query("UPDATE users SET userName=$1 WHERE userId=$2", [userName, id])
      .then(res.json("updated successfully"));
    return update;
  } catch (error) {
    console.error(error);
  }
};
delete_user = async (req, res) => {
  try {
    const { id } = req.params;
    const deleteData = (
      await db.query("DELETE FROM users WHERE userId=$1", [id])
    ).then(res.json("Deleted successfully"));
    return deleteData
  } catch (error) {
    console.error(error.message)
  }
};

module.exports = { create_user, all_users, get_user, delete_user, update_user };
