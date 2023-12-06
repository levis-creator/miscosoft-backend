const africastalking = require("africastalking");

const login = africastalking({
    username: process.env.AFRICATALKING_USERNAME,
    apiKey: process.env.AFRICATALKING_API_KEY
});

const sms = login.SMS;

module.exports = sms;