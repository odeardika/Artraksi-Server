CREATE DATABASE Artraksi;

USE Artraksi;

CREATE TABLE Users (
    id INT NOT NULL,
    username VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (ID)
);