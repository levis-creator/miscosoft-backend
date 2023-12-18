-- Create a new database called ''
CREATE DATABASE micosoftbulksms;
CREATE TABLE users(
	userId VARCHAR(100) PRIMARY KEY,
	userName VARCHAR(100),
);
CREATE TABLE sentmessages(
	msgId VARCHAR(100) PRIMARY KEY,
	receiver VARCHAR(100),
	message VARCHAR(255),
	sender VARCHAR(100),
	status VARCHAR(100),
	userId VARCHAR(100) references users("userid")
	timeSent TIMESTAMP
);
//TODO: add appropriate referencees
//TODO: add appropriate constraints
CREATE TABLE unsentmessages(
	msgId SERIAL PRIMARY KEY,
	receiver VARCHAR(100),
	message VARCHAR(255),
	sender VARCHAR(100),
	status VARCHAR(100),
	userId VARCHAR(100),
	timeSent TIMESTAMP
);
CREATE TABLE contacts(
	Id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	phonenumber VARCHAR(100) NOT NULL,
	group INT [],
	email VARCHAR(100),
	userId VARCHAR(100)
);
CREATE TABLE group_address(
	Id SERIAL PRIMARY KEY,
	group_name VARCHAR(100),
	user_id VARCHAR(100)
);