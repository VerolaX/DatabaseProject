drop table if exists Bid;
drop table if exists Category;
drop table if exists Item;
drop table if exists User;
drop table if exists CurrentTime;

CREATE TABLE User(
	userID   VARCHAR(255)  NOT NULL,
	rating   INT           NOT NULL,
	location VARCHAR(255),
	country  VARCHAR(255),
	PRIMARY KEY(userID));

CREATE TABLE Item(
	itemID     	 VARCHAR(255)  	NOT NULL,
	name      	 VARCHAR(255)   NOT NULL,
	currently 	 DOUBLE(100, 2)  NOT NULL,
	buy_price 	 DOUBLE(100, 2),
	first_bid 	 DOUBLE(100, 2),
	started     	 DATETIME       NOT NULL,
	ends        	 DATETIME       NOT NULL,
	userID      	 VARCHAR(255),
	description 	 TEXT,
	PRIMARY KEY (itemID),
	FOREIGN KEY (userID) REFERENCES User(userID));

CREATE TABLE Bid(
	itemID		VARCHAR(255)	NOT NULL,
	userID		VARCHAR(255)	NOT NULL,
	time 		DATETIME,
	amount		DOUBLE(16, 2),
	PRIMARY KEY (itemID, userID, amount),
	FOREIGN KEY (itemID) REFERENCES Item(itemID),
	FOREIGN KEY (userID) REFERENCES User(userID));

CREATE TABLE Category(
	itemID 		VARCHAR(255)	NOT NULL,
	category	VARCHAR(255),
	PRIMARY KEY (itemID, category),
	FOREIGN KEY (itemID) REFERENCES Item(itemID));

CREATE TABLE CurrentTime (timeNow DATETIME NOT NULL) ;
INSERT INTO CurrentTime values ('2001-12-20 00:00:01') ;
SELECT timeNow FROM CurrentTime ;
