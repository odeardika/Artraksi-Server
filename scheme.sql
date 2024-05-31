CREATE DATABASE Artraksi;

USE Artraksi;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    profile_img VARCHAR(255),
    is_admin BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id)
);

INSERT INTO users (id, username, email, password, profile_img, is_admin)
VALUES 
(1, 'admin', 'admin@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/default.png', TRUE);

INSERT INTO users (id, username, email, password, profile_img)
VALUES 
(2,'user', 'user@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/default.png'),
(3,'Nicholas Sullivan', 'nicholas.sullivan@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/3.png');

CREATE TABLE articles (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE,
    thumbnail_img VARCHAR(255),
    creator_id INT NOT NULL,
    upload_date DATETIME DEFAULT NOW(),
    likes INT DEFAULT 0,
    views INT DEFAULT 0,
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
    likes INT DEFAULT 0,
    views INT DEFAULT 0,
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

CREATE TABLE articles_contents (
    id INT NOT NULL AUTO_INCREMENT,
    text_order INT NOT NULL,
    text TEXT,
    text_type ENUM('paragraph','heading'),
    article_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (article_id) REFERENCES articles(id)
);

INSERT INTO articles_contents (text_order, text, text_type, article_id)
VALUES
(0, "Tari Bedhaya adalah salah satu bentuk tarian klasik Jawa yang berasal dari Keraton Yogyakarta. Tarian ini tidak hanya dikenal karena keindahan gerakannya, tetapi juga karena nilai-nilai spiritual dan filosofis yang terkandung di dalamnya. Tari Bedhaya adalah representasi sempurna dari harmoni, kesucian, dan keanggunan yang menjadi bagian integral dari budaya Jawa.", "paragraph", 1),
(0, "Tari Srimpi adalah salah satu tarian klasik Jawa yang berasal dari lingkungan keraton Yogyakarta dan Surakarta. Tarian ini dikenal karena gerakannya yang lemah gemulai dan penuh makna filosofis. Sebagai salah satu tarian sakral, Tari Srimpi memiliki peran penting dalam upacara adat dan kehidupan keraton, mencerminkan keanggunan, kesucian, dan harmoni.", "paragraph", 2),
(0, "Tari Gambyong adalah salah satu tarian tradisional yang berasal dari Jawa Tengah, khususnya Surakarta, namun juga populer di Yogyakarta. Tarian ini dikenal karena gerakannya yang anggun dan dinamis, serta sering kali digunakan untuk menyambut tamu atau sebagai bagian dari upacara adat. Tari Gambyong mencerminkan keindahan dan keramahan budaya Jawa, dengan gerakan yang menggambarkan kelembutan dan kehalusan budi pekerti.", "paragraph", 3),
(0, "Tari Incling adalah salah satu tarian tradisional yang berasal dari Yogyakarta, dikenal karena keunikannya yang mencerminkan dinamika dan keindahan budaya Jawa. Tarian ini merupakan bagian integral dari kekayaan seni pertunjukan Yogyakarta, memperlihatkan harmoni antara gerakan yang energik dan irama musik gamelan yang dinamis. Tari Incling tidak hanya menawarkan keindahan visual, tetapi juga mengandung makna filosofis yang mendalam.", "paragraph", 4),
(0, "Tari Incling Kulon Progo adalah salah satu bentuk seni pertunjukan tradisional yang berasal dari daerah Kulon Progo, Yogyakarta. Tarian ini menjadi salah satu representasi budaya lokal yang kaya akan nilai-nilai sejarah dan filosofi. Dengan gerakan yang penuh makna dan diiringi musik gamelan yang khas, Tari Incling Kulon Progo menawarkan keindahan dan kebijaksanaan yang diwariskan dari generasi ke generasi.", "paragraph", 5),
(0, "Wayang Orang, sebuah bentuk seni pertunjukan tradisional dari Jawa, adalah manifestasi hidup dari kisah-kisah epik yang diwariskan dari generasi ke generasi. Seni ini menggabungkan teater, tari, musik, dan drama dalam sebuah pementasan yang memukau, menggambarkan cerita-cerita dari Ramayana, Mahabharata, serta legenda-legenda lokal lainnya. Wayang Orang tidak hanya menawarkan hiburan, tetapi juga sarana pendidikan moral dan spiritual yang mendalam.", "paragraph", 6);

INSERT INTO articles_contents (text_order, text, text_type, article_id)
VALUES
(1, "Asal-Usul dan Sejarah", "heading", 1),
(2, "Tari Bedhaya pertama kali dipentaskan di Keraton Yogyakarta pada abad ke-17. Tarian ini dianggap sakral dan biasanya hanya dipersembahkan di dalam lingkungan keraton untuk acara-acara khusus seperti penobatan raja, peringatan hari besar, atau upacara adat penting. Bedhaya sering kali dikaitkan dengan cerita mitologi, spiritualitas, dan hubungan antara manusia dengan alam dan Tuhan", "paragraph", 1),
(3, "Karakteristik dan Gerakan", "heading", 1),
(4, "Salah satu ciri khas dari Tari Bedhaya adalah gerakannya yang lemah gemulai dan penuh dengan makna simbolis. Tarian ini biasanya dibawakan oleh sembilan penari wanita yang bergerak dengan sangat sinkron, mencerminkan keselarasan dan kesatuan. Setiap gerakan dalam Tari Bedhaya memiliki arti tersendiri dan sering kali dihubungkan dengan nilai-nilai filosofis dan spiritualitas.", "paragraph", 1),
(5, "Penari Bedhaya mengenakan kostum tradisional yang elegan dengan kain batik, sanggul, dan perhiasan yang indah. Musik pengiringnya adalah gamelan Jawa yang memainkan nada-nada halus dan meditatif, menambah atmosfer khusyuk dan sakral pada tarian ini.", "paragraph", 1),
(6, "Makna dan Filosofi", "heading", 1),
(7, "Tari Bedhaya bukan hanya sebuah pertunjukan seni, tetapi juga sebuah media untuk menyampaikan pesan-pesan moral dan filosofis. Tarian ini sering kali mengandung cerita tentang kehidupan manusia, hubungan dengan Tuhan, dan harmoni dengan alam. Gerakan yang lemah lembut dan penuh konsentrasi mencerminkan ketenangan batin dan kedalaman spiritualitas.", "paragraph", 1),
(8, "Menurut tradisi, sembilan penari dalam Tari Bedhaya melambangkan sembilan arah mata angin dan kesempurnaan. Tarian ini juga sering kali dianggap sebagai bentuk persembahan kepada dewa-dewa atau roh leluhur, yang diharapkan membawa berkah dan perlindungan bagi keraton dan masyarakat.", "paragraph", 1),
(9, "Pementasan di Era Modern", "heading", 1),
(10, "Meskipun pada awalnya Tari Bedhaya hanya dipentaskan di dalam keraton, seiring berjalannya waktu, tarian ini mulai diperkenalkan kepada publik yang lebih luas. Pertunjukan Tari Bedhaya kini dapat disaksikan dalam berbagai festival budaya, acara kenegaraan, dan pertunjukan seni di Yogyakarta maupun di luar daerah.", "paragraph", 1),
(11, "Namun, meskipun telah lebih terbuka untuk umum, pementasan Tari Bedhaya tetap mempertahankan unsur-unsur kesakralannya. Setiap pementasan dilakukan dengan penuh penghormatan terhadap tradisi dan nilai-nilai yang terkandung di dalamnya.", "paragraph", 1),
(12, "Kesimpulan", "heading", 1),
(13, "Tari Bedhaya adalah salah satu warisan budaya yang paling berharga dari Yogyakarta. Keindahan gerakannya, kedalaman filosofinya, dan nilai-nilai spiritual yang dikandungnya menjadikan tarian ini sebagai simbol keanggunan dan kesucian budaya Jawa. Melalui Tari Bedhaya, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, spiritualitas, dan harmoni dengan alam semesta.", "paragraph", 1);

CREATE TABLE communities (
    id INT NOT NULL AUTO_INCREMENT,
    comunity_name VARCHAR(255) UNIQUE,
    comunity_description TEXT,
    thumbnail_img VARCHAR(255),
    logo_img VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO communities (comunity_name, comunity_description, logo_img, thumbnail_img)
VALUES
("UKJGS UGM", "Unit kesenian Jawa Gaya Surakarta Universitas Gadjah Mada", "assets/communities/logo/1.png", "assets/communities/thumbnail/1.png"),
("SWAGAYUGAMA UGM", "Unit Kesenian Gaya Yogyakarta Universitas Gadjah Mada", "assets/communities/logo/2.png", "assets/communities/thumbnail/2.png"),
("KAMASETRA UNY", "Keluarga Mahasiswa Senin Tradisi Universitas Negri Yogyakarta", "assets/communities/logo/3.png", "assets/communities/thumbnail/3.png");
