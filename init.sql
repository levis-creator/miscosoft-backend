 -- Create a new database called ''
CREATE DATABASE  micosoftbulksms;

CREATE TABLE users(
	userId TEXT PRIMARY KEY,
	userName VARCHAR(100),
);
CREATE TABLE sentmessages(
	msgId TEXT PRIMARY KEY,
	receiver TEXT,
	message VARCHAR(255),
	sender TEXT,
	status TEXT
	);
CREATE TABLE unsentmessages(
	msgId SERIAL PRIMARY KEY,
	receiver TEXT,
	message VARCHAR(255),
	sender TEXT,
	status TEXT
	);