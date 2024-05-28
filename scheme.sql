CREATE DATABASE Artraksi;

USE Artraksi;

CREATE TABLE Users (
    id INT NOT NULL,
    username VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (ID)
);

INSERT INTO users (username, email, password, profile_img)
VALUES 
('admin', 'admin@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/default.png'),
('user', 'user@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/default.png');