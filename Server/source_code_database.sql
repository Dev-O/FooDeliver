-- Create Database --
CREATE DATABASE FooDeliver;

USE FooDeliver

DROP TABLE IF EXISTS ORDERITEM;
DROP TABLE IF EXISTS ORDERTABLE;
DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS RESTAURANT;
DROP TABLE IF EXISTS CONSUMER;

--Create Table--
CREATE TABLE RESTAURANT (
Email VARCHAR(100) NOT NULL,
Name VARCHAR(100) NOT NULL,
Phone VARCHAR(100) NOT NULL,
Password VARCHAR(100) NOT NULL,
CardNumber VARCHAR(100) NOT NULL,
Address VARCHAR(500) NOT NULL,
Category VARCHAR(100) NOT NULL,
Location VARCHAR(500) NOT NULL,
Picture VARCHAR(500) NOT NULL,
PRIMARY KEY(Email)
);

CREATE TABLE CONSUMER (
Email VARCHAR(100) NOT NULL,
Phone VARCHAR(50) NOT NULL,
Password VARCHAR(100) NOT NULL,
CardNumber VARCHAR(100) NOT NULL,
Address VARCHAR(500) NOT NULL,
PRIMARY KEY(Email)
);

CREATE TABLE ORDERTABLE (
OrderId VARCHAR(100) NOT NULL,
CustomerEmail VARCHAR(100) NOT NULL,
RestaurantEmail VARCHAR(100) NOT NULL,
OrderTime VARCHAR(100) NOT NULL,
CustomerPhone VARCHAR(100) NOT NULL,
DeliverAddress VARCHAR(100) NOT NULL,
Payment VARCHAR(100) NOT NULL,
TotalPrice VARCHAR(100) NOT NULL,
OrderState VARCHAR(100) NOT NULL,
PRIMARY KEY (OrderId),
FOREIGN KEY(CustomerEmail) REFERENCES CONSUMER(Email),
FOREIGN KEY(RestaurantEmail) REFERENCES RESTAURANT(Email)
);

CREATE TABLE MENU (
FoodId VARCHAR(100) NOT NULL,
RestaurantEmail VARCHAR(100) NOT NULL,
FoodName VARCHAR(100) NOT NULL,
FoodPrice VARCHAR(100) NOT NULL,
FoodPicture VARCHAR(500) NOT NULL,
PRIMARY KEY (FoodId),
FOREIGN KEY(RestaurantEmail) REFERENCES RESTAURANT(Email)
);

CREATE TABLE ORDERITEM (
OrderId VARCHAR(100) NOT NULL,
FoodId VARCHAR(100) NOT NULL,
Quantity VARCHAR(100) NOT NULL,
PRIMARY KEY(OrderId, FoodId),
FOREIGN KEY(OrderId) REFERENCES ORDERTABLE(OrderId),
FOREIGN KEY(FoodId) REFERENCES MENU(FoodId)
);
