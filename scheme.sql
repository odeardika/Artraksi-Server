CREATE DATABASE Artraksi;

USE Artraksi;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    profile_img VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO users (username, email, password, profile_img)
VALUES 
('admin', 'admin@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/default.png'),
('user', 'user@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/default.png'),
('Nicholas Sullivan', 'nicholas.sullivan@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/3.png');

CREATE TABLE communities (
    id INT NOT NULL AUTO_INCREMENT,
    comunity_name VARCHAR(255) UNIQUE,
    logo_img VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE articles (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE,
    thumbnail_img VARCHAR(255),
    creator_id INT NOT NULL,
    upload_date DATETIME DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

INSERT INTO articles (title, thumbnail_img, creator_id)
VALUES 
('Tari Bedhaya: Keanggunan Sakral dari Keraton Yogyakarta', 'assets/articles/1.png', 1),
('Tari Srimpi: Tarian Klasik yang Memikat Hati dari Keraton Yogyakarta', 'assets/articles/2.png', 1),
('Pesona Tari Gambyong: Keindahan Tarian Klasik Yogyakarta', 'assets/articles/3.png', 1),
('Tari Incling: Gemerlap Tradisi dan Dinamika Budaya Yogyakarta', 'assets/articles/4.png', 1),
('Tari Incling Kulon Progo: Memori Sejarah dan Keindahan Tradisi', 'assets/articles/5.png', 1),
('Wayang Orang: Kehidupan dalam Gerak dan Lakon', 'assets/articles/6.png', 1);



CREATE TABLE blogs (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE,
    thumbnail_img VARCHAR(255),
    creator_id INT NOT NULL,
    upload_date DATETIME DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

INSERT INTO blogs (title, thumbnail_img, creator_id)
VALUES 
('Pengalaman Memukau di Pameran Seni "Manifestasi Kreativitas" di Galeri Seni Murni Yogyakarta', 'assets/blogs/1.png', 3),
('Menyaksikan Keajaiban Seni di Pertunjukan Wayang Kulit "Serat Menak" di Pendopo Keraton Yogyakarta', 'assets/blogs/2.png', 3),
('Menyelami Keindahan Musik Gamelan di Konser "Melodi Budaya" di Pendopo Desa Kasongan, Yogyakarta', 'assets/blogs/3.png', 3),
('Menyaksikan Keajaiban Pertunjukan Teater Tradisional "Legenda Rama Shinta" di Taman Budaya Yogyakarta', 'assets/blogs/4.png', 3),
('Pengalaman Magis di Pentas Tari Klasik Jawa "Srimpi Pandhelori" di Keraton Yogyakarta', 'assets/blogs/5.png', 3),
('Pengalaman Menonton Pertunjukan Wayang Kulit di Yogyakarta', 'assets/blogs/6.png', 3);
