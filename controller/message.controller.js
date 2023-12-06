const { response } = require("express");
const sms = require("../config/africalets.config");
const db = require("../config/db.config");
const _ = require("lodash");
// internal function
// this sorts the sent and unsent
const messageSorter = async(response, sentMessage) => {
  _.map(response.SMSMessageData.Recipients, (delivery) => {
    // iterating the temporary
    _.forEach(sentMessage, (message) => {
      if (delivery.number == message.receiver) {
        message.status = delivery.status;
        message.msgId = delivery.messageId;
        if (
          message.status == "Success" ||
          message.status == "Submitted" ||
          message.status == "AbsentSubscriber"
        ) {
          db.query(
            "INSERT INTO sentmessages (msgId, receiver, message, sender, status) VALUES($1,$2,$3,$4,$5)",
            [
              message.msgId,
              message.receiver,
              message.message,
              message.sender,
              message.status,
            ]
          );
        } else if (
          message.status == "Failed" ||
          message.status == "Expired" ||
          message.status == "Rejected" ||
          message.status == "InsufficientBalance"
        ) {
          db.query(
            "INSERT INTO unsentmessages (msgId, receiver, message, sender, status) VALUES($1,$2,$3,$4,$5)",
            [
              message.msgId,
              message.receiver,
              message.message,
              message.sender,
              message.status,
            ]
          );
        }
      }
    });
  });
}
// sendiing message controller
const send_message = async (req, res, next) => {
  const { from, message, receiver } = req.body;
  try {
    // this is isolating message in order to check status
    const sentMessage = [];
    _.forEach(receiver, (recipient) =>
      sentMessage.push({
        msgId: "",
        receiver: recipient,
        message: message,
        sender: from,
        status: "pending",
      })
    );
    const sending = await sms
      .send({
        to: receiver,
        message: message,
        from: undefined,
      })
      .then((response) => {
        // delivery receipt iteration
        messageSorter(response, sentMessage);
        res.json("success")
        res.status(200);
      })
      .catch((err) => {
        console.log(err.message)
        res.status(400);
        });
    return sending;
  } catch (error) {
    console.error(error.message);
    
  }
};

const get_sent = async (req, res) => {
  try {
    const messages = await db.query("SELECT* FROM sentmessages");
    res.json(messages.rows);
  } catch (error) {
    console.error(error.message);
  }
};
const get_unsent = async (req, res) => {
  try {
    const messages = await db.query("SELECT* FROM unsentmessages");
    res.json(messages.rows);
  } catch (error) {
    console.error(error.message);
  }
};

module.exports = { send_message, get_sent, get_unsent };
