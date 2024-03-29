const sms = require("../config/africalets.config");
const db = require("../config/db.config");
const _ = require("lodash");
// internal function
// Creating a timestamp
function getPostgreSQLTimestamp() {
  const now = new Date();
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, "0");
  const day = String(now.getDate()).padStart(2, "0");
  const hours = String(now.getHours()).padStart(2, "0");
  const minutes = String(now.getMinutes()).padStart(2, "0");
  const seconds = String(now.getSeconds()).padStart(2, "0");

  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

// this sorts the sent and unsent
const messageSorter = async (response, sentMessage) => {
  _.map(response.SMSMessageData.Recipients, (delivery) => {
    // iterating the temporary
    _.forEach(sentMessage, (message) => {
      if (delivery.number == message.receiver) {
        message.status = delivery.status;
        message.msgId = delivery.messageId;
        // TODO: remove this function it is 
        if (
          message.status == "Success" ||
          message.status == "Submitted" ||
          message.status == "AbsentSubscriber"
        ) {
          try {
            db.query(
              "INSERT INTO sentmessages(msgId, receiver, message, sender, status, timesent) VALUES($1,$2,$3,$4,$5,$6)",
              [
                message.msgId,
                message.receiver,
                message.message,
                message.sender,
                message.status,
                message.timesent

              ]
            );
          } catch (error) {
            console.log(error);
          }
          
        } else if (
          message.status == "Failed" ||
          message.status == "Expired" ||
          message.status == "Rejected" ||
          message.status == "InsufficientBalance"
        ) {
          try {
            console.log(message);
            db.query(
              "INSERT INTO unsentmessages(receiver, message, sender, status, timesent )VALUES($1,$2,$3,$4,$5)",
              [
                message.receiver,
                message.message,
                message.sender,
                message.status,
                message.timesent
              ]
            );
          } catch (error) {
            console.log(error);
          }
        }
      }
    });
  });
};
// sendiing message controller
const send_message = async (req, res) => {
  const { from, message, receiver } = req.body;
  try {
    // this is isolating message in order to check status
    console.log(`${from}+${message}+${receiver}`);
    const sentMessage = [];
    _.forEach(receiver, (recipient) =>
      sentMessage.push({
        msgId: "",
        receiver: recipient,
        message: message,
        sender: "",
        status: "pending",
        timesent: getPostgreSQLTimestamp(),
      })
    );
    const sending = await sms
      .send({
        to: receiver,
        message: message,
        from: undefined,
      })
      .then((response) => {
        messageSorter(response, sentMessage);
        res.json(response);
        res.json("success");
        res.status(200);
      })
      .catch((err) => {
        console.log(err.message);
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
