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
(3,'Nicholas Sullivan', 'nicholas.sullivan@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/3.jpg'),
(4,'Harold Gomez', 'harold.gomez@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/4.png'),
(5,'Raymond White', 'raymond.white@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/5.png'),
(6,'Ken Larson', 'ken.larson@gmail.com', '$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y', 'assets/users/6.png');

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

CREATE TABLE blog_contents (
    id INT NOT NULL AUTO_INCREMENT,
    text_order INT NOT NULL,
    text TEXT,
    text_type ENUM('paragraph','heading'),
    blog_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_id) REFERENCES blogs(id)
);

CREATE TABLE blogs_favorite_list (
    id INT NOT NULL AUTO_INCREMENT,
    blog_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_id) REFERENCES blogs(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

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

CREATE TABLE article_favorite_list (
    id INT NOT NULL AUTO_INCREMENT,
    article_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (article_id) REFERENCES articles(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

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

CREATE TABLE communities_detail (
    id INT NOT NULL AUTO_INCREMENT,
    community_id INT NOT NULL,
    comunity_detail TEXT,
    leader_name VARCHAR(255),
    leader_img VARCHAR(255),
    leader_desc TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);

INSERT INTO communities_detail (community_id, comunity_detail, leader_name, leader_img, leader_desc)
VALUES
(1,"UKJGS UGM atau Unit Kesenian Jawa Gaya Surakarta Universitas Gadjah Mada lahir pada 19 Desember 1968 sebagai salah satu unit kegiatan mahasiswa yang menjadi wadah bagi mahasiswa Universitas Gadjah Mada yang ingin mengembangkan potensi diri dalam bidang seni tari, karawitan, dan pedhalangan.","Rossi Firmansyah","assets/communities/leaders/1.png","Dia adalah ketua UKJGS UGM (Unit Kesenian Jawa Gaya Surakarta Universitas Gadjah Mada) yang berdedikasi tinggi dalam melestarikan dan memperkenalkan budaya Yogyakarta. Dengan pengalaman bertahun-tahun dalam seni tradisional, Rossi memimpin komunitas ini dengan semangat dan visi yang kuat untuk menginspirasi generasi muda agar mencintai dan menjaga warisan dan budaya.");

CREATE TABLE communities_activity (
    id INT NOT NULL AUTO_INCREMENT,
    community_id INT NOT NULL,
    activity_name VARCHAR(255),
    activity_img VARCHAR(255),
    activity_description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);

INSERT INTO communities_activity (community_id, activity_name, activity_img, activity_description)
VALUES
(1,"Pementasan","assets/communities/activities/1.png","Pementasan skala besar yang diadakan berkala setiap tahunnya, dalam satu periode terdapat 3 pentas utama yaitu Gladhi Madya, Ramayana Prambanan dan Ambal Warsa"),
(1,"Pelatihan","assets/communities/activities/2.png","Pelatihan rutin sebanyak dua kali seminggu untuk divisi tari dan karawitan pedhalangan (tari setiap selasa dan kamis dan karawitan pedhalangan setiap senin dan rabu)"),
(1,"Workshop","assets/communities/activities/3.png","Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM");

CREATE TABLE communities_performance_gallery (
    id INT NOT NULL AUTO_INCREMENT,
    community_id INT NOT NULL,
    img_url VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);

INSERT INTO communities_performance_gallery (community_id, img_url)
VALUES
(1,"assets/communities/gallery/performance/1.png"),
(1,"assets/communities/gallery/performance/2.jpg");

CREATE TABLE communities_behind_gallery (
    id INT NOT NULL AUTO_INCREMENT,
    community_id INT NOT NULL,
    img_url VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);

INSERT INTO communities_behind_gallery (community_id, img_url)
VALUES
(1,"assets/communities/gallery/behind_the_scene/1.png"),
(1,"assets/communities/gallery/behind_the_scene/2.jpg"),
(1,"assets/communities/gallery/behind_the_scene/3.jpg");

CREATE TABLE events (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    event_date DATETIME,
    event_description TEXT,
    event_location VARCHAR(255),
    event_location_detail VARCHAR(255),
    event_thumbnail VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO events (title, event_date, event_description, event_location, event_location_detail, event_thumbnail)
VALUES
("Gladhi Madya 2024", "2024-7-6 19:00:00", "Dalam acara Gladhi Madya disajikan beberapa tarian yaitu Tari Putri Gambyong Pareanom, Tari Putri Golek Manis, Tari Putri Dombanini dan Tari Putra Gunung Sari yang dikemas dalam bentuk repertoar drama. Dalam acara Gladhi Madya disajikan beberapa tarian yaitu Tari Putri Gambyong Pareanom, Tari Putri Golek Manis, Tari Putri Dombanini dan Tari Putra Gunung Sari yang dikemas dalam bentuk repertoar drama.", "DIY", "Pendapa Taman Siswa", "assets/events/thumbnail/1.webp"),
("Pertunjukan Wayang Kulit oleh Ki Dalang Cermo Taksoko", "2024-7-22 19:00:00", "Kisah epik Mahabharata kembali hadir dalam pertunjukan wayang kulit yang memukau oleh Ki Dalang Cermo Taksoko. Kali ini, pertunjukan akan mengangkat kisah Pandawa Lima dalam pencarian mereka untuk mendapatkan pusaka-pusaka dewa.", "Yogyakarta", "Pendopo Agung Keraton", "assets/events/thumbnail/2.webp"),
("Pertunjukan Uyon-Uyon dan Tari Tradisional oleh Paguyuban Puspito Laras","2024-7-24 19:00:00", "Paguyuban Puspito Laras kembali menghadirkan pertunjukan seni Uyon-Uyon dan Tari Tradisional Nusantara yang memukau. Uyon-Uyon, seni tradisional Jawa Timur yang memadukan musik, tari, dan lawak, akan dibawakan dengan penuh semangat dan humor oleh para penari dan pemain musik Paguyuban Puspito Laras.", "Yogyakarta", "Aula Gedung Kesenian", "assets/events/thumbnail/3.webp"),
("Pertunjukan Wayang Golek oleh Ki. M.Ry. Cermo Kandhawijaya","2024-7-16 19:00:00","Ki. M.Ry. Cermo Kandhawijaya, dalang wayang golek ternama dari Jawa Tengah, akan kembali menghibur masyarakat Surabaya dengan pertunjukannya yang memukau. Kali ini, pertunjukan akan mengangkat kisah Setyo Wati, seorang putri cantik yang mencari cinta sejati.", "Kraton Yogyakarta", "Pendopo Agung", "assets/events/thumbnail/4.webp"),
("Fragmen Wayang Wong oleh Paguyuban Kesenian Suryo Kencono","2024-8-5 19:00:00", 'Fragmen Bedhah Alengka menceritakan kisah klimaks dalam pewayangan Jawa, yaitu pertempuran antara Rama dan pasukannya melawan Rahwana dan pasukan raksasa di Alengka. Pertunjukan ini akan menampilkan adegan-adegan penuh aksi dan heroik, seperti pertarungan antara Rama dan Rahwana, jatuhnya Kumbakarna, dan akhirnya terbebasnya Dewi Shinta dari cengkeraman Rahwana.', "Keraton Yogyakarta", "Bangsal Srimanganti", "assets/events/thumbnail/5.webp");


CREATE TABLE event_gallery (
    id INT NOT NULL AUTO_INCREMENT,
    event_id INT NOT NULL,
    img_url VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

INSERT INTO event_gallery (event_id, img_url)
VALUES
(1,"assets/events/gallery/1.png"),
(1,"assets/events/gallery/2.png"),
(1,"assets/events/gallery/3.png"),  
(1,"assets/events/gallery/4.png"),  
(1,"assets/events/gallery/5.png"),  
(1,"assets/events/gallery/6.png"),  
(2,"assets/events/gallery/1.png"),
(2,"assets/events/gallery/2.png"),
(2,"assets/events/gallery/3.png"),  
(2,"assets/events/gallery/4.png"),  
(2,"assets/events/gallery/5.png"),  
(2,"assets/events/gallery/6.png"), 
(4,"assets/events/gallery/1.png"),
(4,"assets/events/gallery/2.png"),
(4,"assets/events/gallery/3.png"),  
(4,"assets/events/gallery/4.png"),  
(4,"assets/events/gallery/5.png"),  
(4,"assets/events/gallery/6.png"), 
(5,"assets/events/gallery/1.png"),
(5,"assets/events/gallery/2.png"),
(5,"assets/events/gallery/3.png"),  
(5,"assets/events/gallery/4.png"),  
(5,"assets/events/gallery/5.png"),  
(5,"assets/events/gallery/6.png"), 
(3,"assets/events/gallery/1.png"),
(3,"assets/events/gallery/2.png"),
(3,"assets/events/gallery/3.png"),  
(3,"assets/events/gallery/4.png"),  
(3,"assets/events/gallery/5.png"),  
(3,"assets/events/gallery/6.png"); 


CREATE TABLE event_schedules (
    id INT NOT NULL AUTO_INCREMENT,
    event_id INT NOT NULL,
    event_detail VARCHAR(255),
    time_start TIME,
    time_end TIME,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

INSERT INTO event_schedules (event_id, event_detail, time_start, time_end)
VALUES
(1,"Sambutan dan pengenalan pertunjukan", "19:00:00", "19:30:00"),
(1,"Pertunjukan wayang kulit", "19:30:00", "21:30:00"),
(1,"Pertunjukan penutup acara", "21:30:00", "22:00:00"),
(2,"Sambutan dan pengenalan pertunjukan", "19:00:00", "19:30:00"),
(2,"Pertunjukan wayang kulit", "19:30:00", "21:30:00"),
(2,"Pertunjukan penutup acara", "21:30:00", "22:00:00"),
(3,"Sambutan dan pengenalan pertunjukan", "19:00:00", "19:30:00"),
(3,"Penampilan tari tradisional", "19:30:00", "20:00:00"),
(3,'Pertunjukan Uyon-uyon oleh Paguyuban Puspito Laras', "20:00:00", "22:30:00"),
(3,"Pertunjukan penutup acara", "22:30:00", "23:00:00"),
(4,"Pembukaan acara oleh MC dan Sambutan dari panitia", "19:00:00", "19:30:00"),
(4,"Penampilan tari tradisional", "19:30:00", "20:00:00"),
(4,'Pertunjukan wayang golek "Semar Gugur" oleh Ki. M. Ry. Cermo Kandhawijaya', "20:00:00", "22:30:00"),
(4,"Pertunjukan penutup acara", "22:30:00", "23:00:00"),
(5,"Pembukaan acara oleh MC dan Sambutan dari panitia", "19:00:00", "19:30:00"),
(5,"Penambilan tari pembukaan", "19:30:00", "20:00:00"),
(5,'Pertunjukan Fragmen Wayang Wong "Bedhah Alengka" oleh Paguyuban Kesenian Suryo Kencono', "20:00:00", "22:30:00"),
(5,"Pertunjukan penutup acara", "22:30:00", "23:00:00");

CREATE TABLE reminder_lists (
    id INT NOT NULL AUTO_INCREMENT,
    event_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES events(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

