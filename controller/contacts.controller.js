const { response } = require("express");
const db = require("../config/db.config");

const create_contact = async (req, res) => {
  const { firstname, lastname, phonenumber, email, group_address, userId, address, city, county, company_name } =
    req.body;
  try {
    await db.query(
      "INSERT INTO contacts (firstname, lastname, phonenumber, email, group_address, userId, address, city, county, company_name  ) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)",
      [firstname, lastname, phonenumber, email, group_address, userId, address, city, county, company_name]
    );
    res.status(200);
    res.json("Success");
  } catch (error) {
    console.error(error);
  }
};
const get_contacts = async (req, res) => {
  try {
    await db
      .query("SELECT* FROM contacts")
      .then((response) => res.json(response.rows));
  } catch (error) {
    throw Error(error);
  }
};
const update_contact = async (req, res) => {
  const { id } = req.params;
  const { firstname, lastname, phonenumber, email, group_address, userId } =
    req.body;
  try {
    await db
      .query(
        "UPDATE contacts SET firstname = $2, lastname = $3, phonenumber = $4, email = $5, group_address = $6, userId = $7 WHERE id = $1",
        [id, firstname, lastname, phonenumber, email, group_address, userId]
      )
      .then((result) => {
        res.json("success");
      });
  } catch (error) {
    console.error(error);
  }
};

const delete_contact = async (req, res) => {
  const { id } = req.params;
  try {
    await db
      .query("DELETE FROM contacts where id = $1", [id])
      .then(() => res.json("success"));
  } catch (error) {
    console.error(error);
  }
};
module.exports = { create_contact, get_contacts, update_contact, delete_contact };
