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
('Wayang Orang: Kehidupan dalam Gerak dan Lakon', 'assets/articles/6.png', 1),
('Tari Gambyong Yogyakarta: Harmoni Lembut dari Keraton', 'assets/articles/7.png', 1);



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

INSERT INTO articles_contents (text_order, text, text_type, article_id)
VALUES
(1, "Sejarah dan Asal Usul", "heading", 2),
(2, 'Tari Srimpi telah ada sejak zaman Mataram Islam pada abad ke-18. Tarian ini awalnya diciptakan untuk menghibur dan menghormati para raja serta tamu-tamu penting di keraton. Nama "Srimpi" sendiri berasal dari kata "impi" atau mimpi, yang mengandung makna kedamaian dan ketenangan. Seiring berjalannya waktu, Tari Srimpi menjadi salah satu tarian yang paling dihormati dan diwariskan dari generasi ke generasi di keraton.', "paragraph", 2),
(3, "Karakteristik dan Gerakan", "heading", 2),
(4, "Karakteristik dan GerakanSalah satu ciri khas dari Tari Srimpi adalah gerakannya yang lambat dan teratur, menciptakan kesan yang anggun dan penuh perasaan. Tarian ini biasanya dibawakan oleh empat penari wanita, yang mewakili empat elemen kehidupan: tanah, air, api, dan udara. Gerakan dalam Tari Srimpi sangat teratur dan simetris, dengan penekanan pada keindahan dan keselarasan.", "paragraph", 2),
(5, "Para penari Srimpi mengenakan kostum tradisional yang indah, termasuk kain batik, kebaya, dan selendang. Aksesori seperti sanggul dan perhiasan juga digunakan untuk menambah keanggunan penampilan. Musik pengiringnya adalah gamelan Jawa, yang memainkan nada-nada halus dan mengalun, menambah suasana magis dan sakral pada tarian ini.", "paragraph", 2),
(6, "Makna dan Filosofi", "heading", 2),
(7, "Tari Srimpi tidak hanya sekadar tarian, tetapi juga sebuah media untuk menyampaikan pesan-pesan moral dan filosofis. Gerakan yang lambat dan penuh konsentrasi melambangkan kedamaian, kesucian, dan keseimbangan. Setiap gerakan memiliki makna simbolis yang mendalam, menggambarkan harmoni antara manusia dengan alam dan hubungan spiritual dengan Tuhan.", "paragraph", 2),
(8, "Selain itu, Tari Srimpi sering kali menceritakan kisah-kisah epik dari mitologi Jawa, seperti Ramayana dan Mahabharata, atau cerita-cerita tentang ksatria dan dewi. Kisah-kisah ini tidak hanya menghibur tetapi juga mengajarkan nilai-nilai moral dan kebijaksanaan.", "paragraph", 2),
(9, "Pementasan di Era Modern", "heading", 2),
(10, "Meskipun awalnya hanya dipentaskan di dalam lingkungan keraton, Tari Srimpi kini sering dipertunjukkan dalam berbagai acara budaya, festival, dan upacara resmi. Pementasan Tari Srimpi di luar keraton tetap mempertahankan kesakralan dan keanggunannya, dengan tetap mengikuti tata cara dan aturan yang berlaku.", "paragraph", 2),
(11, "Banyak sekolah tari dan sanggar seni di Yogyakarta dan Surakarta yang mengajarkan Tari Srimpi kepada generasi muda, memastikan bahwa tarian ini terus dilestarikan dan dihargai. Pertunjukan Tari Srimpi juga menjadi daya tarik wisata budaya, menarik minat pengunjung untuk menyaksikan keindahan dan kedalaman budaya Jawa.", "paragraph", 2),
(12, "Kesimpulan", "heading", 2),
(13, "Tari Srimpi adalah salah satu warisan budaya yang paling berharga dari Jawa. Keanggunan gerakannya, kedalaman filosofinya, dan nilai-nilai spiritual yang terkandung di dalamnya menjadikan tarian ini sebagai simbol keindahan dan kesucian budaya Jawa. Melalui Tari Srimpi, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, spiritualitas, dan harmoni dengan alam semesta.", "paragraph", 2),
(14, "Menjaga dan melestarikan Tari Srimpi adalah tanggung jawab kita bersama, agar keindahan dan kebijaksanaan yang terkandung di dalamnya dapat terus dinikmati oleh generasi mendatang. Tarian ini bukan hanya warisan budaya, tetapi juga cerminan dari identitas dan jiwa masyarakat Jawa.", "paragraph", 2),

(1, "Sejarah dan Asal Usul", "heading", 3),
(2, 'Tari Gambyong awalnya adalah bagian dari tari tayub, sebuah bentuk tarian rakyat yang digunakan dalam acara-acara perayaan dan upacara panen padi. Pada abad ke-19, tari tayub diadaptasi dan dimodifikasi oleh Keraton Surakarta menjadi Tari Gambyong, dengan gerakan yang lebih halus dan berirama. Nama "Gambyong" diambil dari nama seorang penari legendaris, Sri Gambyong, yang terkenal karena kecantikannya dan keahliannya menari.', "paragraph", 3),
(3, "Karakteristik dan Gerakan", "heading", 3),
(4, 'Salah satu ciri khas dari Tari Gambyong adalah gerakannya yang lembut dan mengalir, dengan penekanan pada gerakan tangan, kepala, dan tubuh bagian atas. Tarian ini biasanya dibawakan oleh seorang atau beberapa penari wanita, yang mengenakan kostum tradisional seperti kain batik, kemben, dan selendang. Musik pengiringnya adalah gamelan Jawa, yang memainkan komposisi khusus yang disebut "Ladrang Gambyong".', "paragraph", 3),
(5, 'Gerakan dalam Tari Gambyong mencerminkan rasa syukur dan kebahagiaan. Penari sering kali menghadap ke arah tamu atau penonton, memberikan kesan menyambut dan menghormati. Setiap gerakan tangan, kaki, dan kepala dirancang untuk menunjukkan keanggunan dan keseimbangan, menciptakan harmoni yang menenangkan.', "paragraph", 3),
(6, "Makna dan Filosofi", "heading", 3),
(7, "Tari Gambyong tidak hanya sekadar pertunjukan seni, tetapi juga mengandung makna dan filosofi yang mendalam. Gerakan yang lembut dan teratur mencerminkan nilai-nilai kehalusan budi, keramahan, dan rasa hormat. Tari ini juga melambangkan kesuburan dan kemakmuran, yang awalnya dihubungkan dengan ritual panen padi." , "paragraph", 3),
(8, "Dalam budaya Jawa, tarian ini juga merupakan bentuk penghormatan dan ucapan terima kasih kepada tamu atau penonton. Melalui Tari Gambyong, penari menyampaikan pesan kebahagiaan, kedamaian, dan rasa syukur, serta memperkuat ikatan sosial dan budaya.", "paragraph", 3),
(9, "Pementasan di Era Modern", "heading", 3),
(10, "Tari Gambyong telah mengalami banyak perubahan dan adaptasi sejak pertama kali diciptakan. Meskipun begitu, tarian ini tetap mempertahankan esensi dan keindahan aslinya. Di era modern, Tari Gambyong sering dipentaskan dalam berbagai acara, mulai dari upacara adat, pernikahan, festival budaya, hingga pertunjukan seni di panggung nasional dan internasional.", "paragraph", 3),
(11, "Banyak sanggar tari dan sekolah seni di Yogyakarta dan Surakarta yang mengajarkan Tari Gambyong kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai. Pementasan Tari Gambyong juga sering kali menjadi daya tarik wisata, menarik minat pengunjung untuk menikmati dan mempelajari budaya Jawa.", "paragraph", 3),
(12, "Kesimpulan", "heading", 3),
(13, "Tari Gambyong adalah salah satu warisan budaya yang paling berharga dari Jawa Tengah dan Yogyakarta. Keanggunan gerakannya, kedalaman filosofinya, dan nilai-nilai sosial yang terkandung di dalamnya menjadikan tarian ini sebagai simbol keindahan dan keramahan budaya Jawa. Melalui Tari Gambyong, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, kebahagiaan, dan hubungan manusia dengan alam.", "paragraph", 3),
(14, "Melestarikan Tari Gambyong adalah tanggung jawab kita bersama, agar keindahan dan kebijaksanaan yang terkandung di dalamnya dapat terus dinikmati oleh generasi mendatang. Tarian ini bukan hanya warisan budaya, tetapi juga cerminan dari identitas dan jiwa masyarakat Jawa.", "paragraph", 3),

(1, "Sejarah dan Asal Usul", "heading", 4),
(2, 'Tari Incling berasal dari lingkungan keraton Yogyakarta dan telah ada sejak zaman kerajaan Mataram. Tarian ini awalnya digunakan dalam upacara adat dan ritual keraton, sebagai bentuk penghormatan dan persembahan kepada para dewa serta leluhur. Nama "Incling" diambil dari kata dalam bahasa Jawa yang berarti "mendengarkan" atau "memahami," mencerminkan makna mendalam dan kebijaksanaan yang terkandung dalam gerakan tarian ini.', "paragraph", 4),
(3, "Karakteristik dan Gerakan", "heading", 4),
(4, 'Salah satu ciri khas dari Tari Incling adalah gerakannya yang energik dan dinamis, dengan penekanan pada kelincahan kaki dan tangan. Tarian ini biasanya dibawakan oleh sekelompok penari pria dan wanita, yang mengenakan kostum tradisional yang cerah dan berwarna-warni. Kostum ini biasanya terdiri dari kain batik, ikat kepala, dan aksesoris lain yang menambah keindahan penampilan.', "paragraph", 4),
(5, 'Gerakan dalam Tari Incling sangat bervariasi, mulai dari gerakan cepat dan bersemangat hingga gerakan lambat dan anggun. Setiap gerakan memiliki makna simbolis yang mendalam, menggambarkan berbagai aspek kehidupan dan nilai-nilai moral. Musik pengiringnya adalah gamelan Jawa, yang memainkan irama yang dinamis dan meriah, menambah semangat pada pertunjukan.', "paragraph", 4),
(6, "Makna dan Filosofi", "heading", 4),
(7, "Tari Incling tidak hanya sekadar hiburan, tetapi juga mengandung pesan-pesan moral dan filosofis. Gerakan yang dinamis mencerminkan semangat hidup, keberanian, dan kebijaksanaan. Tarian ini juga sering kali digunakan untuk menggambarkan cerita-cerita epik dari mitologi Jawa, seperti kisah-kisah Ramayana dan Mahabharata, atau legenda-legenda lokal yang mengajarkan nilai-nilai luhur.","paragraph", 4),
(8, "Melalui gerakannya, Tari Incling mengajarkan pentingnya keseimbangan antara kekuatan dan kelembutan, serta harmoni antara manusia dengan alam dan Tuhan. Tarian ini juga mencerminkan semangat gotong royong dan kebersamaan, yang merupakan nilai-nilai penting dalam budaya Jawa.", "paragraph", 4),
(9, "Pementasan di Era Modern", "heading", 4),
(10, "Di era modern, Tari Incling tetap dipertahankan dan dipentaskan dalam berbagai acara budaya, baik di lingkungan keraton maupun di luar keraton. Tarian ini sering kali menjadi bagian dari festival budaya, upacara adat, dan pertunjukan seni, menarik minat penonton lokal maupun internasional. Banyak sanggar tari dan sekolah seni di Yogyakarta yang mengajarkan Tari Incling kepada generasi muda, memastikan bahwa warisan budaya ini terus hidup dan berkembang.", "paragraph", 4),
(11, "Kesimpulan", "heading", 4),
(12, "Tari Incling adalah salah satu warisan budaya yang paling berharga dari Yogyakarta. Keunikan gerakannya, kedalaman filosofinya, dan keindahan visual yang ditawarkannya menjadikan tarian ini sebagai simbol dinamika dan keindahan budaya Jawa. Melalui Tari Incling, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, nilai-nilai moral, dan hubungan manusia dengan alam semesta.", "paragraph", 4),

(1, "Sejarah dan Asal Usul", "heading", 5),
(2, 'Tari Incling Kulon Progo memiliki akar yang mendalam dalam tradisi masyarakat Kulon Progo. Tarian ini konon telah ada sejak zaman kerajaan Mataram dan digunakan dalam berbagai upacara adat serta ritual keagamaan. Nama "Incling" berasal dari kata dalam bahasa Jawa yang berarti "mendengarkan" atau "memahami", yang mencerminkan tujuan tarian ini sebagai sarana untuk menyampaikan pesan-pesan moral dan spiritual kepada masyarakat.', "paragraph", 5),
(3, "Karakteristik dan Gerakan", "heading", 5),
(4, 'Tari Incling Kulon Progo dikenal dengan gerakannya yang dinamis dan ekspresif, menggambarkan semangat dan kehidupan masyarakat setempat. Penari biasanya mengenakan kostum tradisional yang terbuat dari kain batik dengan warna-warna cerah, dilengkapi dengan ikat kepala dan aksesoris lainnya. Gerakan tarian ini sering kali melibatkan permainan tangan dan kaki yang lincah, serta perubahan posisi yang cepat namun tetap harmonis.', "paragraph", 5),
(5, 'Musik pengiring Tari Incling Kulon Progo adalah gamelan Jawa, yang memainkan irama yang dinamis dan meriah. Instrumen gamelan seperti saron, kendang, dan gong memberikan nuansa yang khas, menambah semangat dan keindahan pada pertunjukan.', "paragraph", 5),
(6, "Makna dan Filosofi", "heading", 5),
(7, "Tari Incling Kulon Progo bukan hanya sekedar pertunjukan seni, tetapi juga mengandung pesan-pesan filosofis yang mendalam. Setiap gerakan memiliki makna simbolis, menggambarkan nilai-nilai kehidupan seperti kebijaksanaan, keberanian, dan kebersamaan. Tari Incling juga sering kali digunakan untuk menceritakan legenda dan mitos lokal, yang mengajarkan pentingnya menjaga harmoni antara manusia dengan alam dan Tuhan.", "paragraph", 5),
(8, "Tarian ini juga mencerminkan nilai-nilai sosial masyarakat Kulon Progo, seperti gotong royong, rasa hormat, dan ketaatan kepada tradisi. Melalui Tari Incling, penari berusaha menyampaikan pesan moral dan spiritual kepada penonton, mengajak mereka untuk merenungkan dan mengapresiasi nilai-nilai luhur yang diwariskan oleh leluhur.", "paragraph", 5),
(9, "Pementasan di Era Modern", "heading", 5),
(10, "Di era modern, Tari Incling Kulon Progo terus dipertahankan dan dikembangkan oleh masyarakat setempat. Tarian ini sering dipentaskan dalam berbagai acara budaya, festival, dan upacara adat, baik di tingkat lokal maupun nasional. Banyak sanggar tari dan komunitas seni di Kulon Progo yang aktif mengajarkan Tari Incling kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai.", "paragraph", 5),
(11, "Pementasan Tari Incling Kulon Progo juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin mengenal lebih dekat budaya lokal Yogyakarta. Pertunjukan ini tidak hanya menghibur, tetapi juga memberikan wawasan tentang sejarah dan tradisi masyarakat Kulon Progo.", "paragraph", 5),
(12, "Kesimpulan", "heading", 5),
(13, "Tari Incling Kulon Progo adalah salah satu permata budaya dari Yogyakarta yang kaya akan keindahan dan makna. Dengan gerakannya yang dinamis dan penuh ekspresi, serta filosofi yang mendalam, tarian ini menjadi simbol dari semangat dan kebijaksanaan masyarakat Kulon Progo. Melalui Tari Incling, kita dapat menyaksikan dan memahami nilai-nilai luhur yang diwariskan oleh leluhur, serta menghargai keindahan tradisi yang terus hidup di tengah modernisasi.", "paragraph", 5),

(1, "Sejarah dan Asal Usul", "heading", 6),
(2, 'Wayang Orang, atau sering disebut Wayang Wong, berasal dari Jawa dan berkembang pada masa kerajaan Mataram sekitar abad ke-18. Pertunjukan ini merupakan adaptasi dari wayang kulit, yang awalnya hanya menggunakan boneka kulit sebagai media penceritaan. Pada masa pemerintahan Sultan Agung dari Mataram, seni pertunjukan ini berkembang menjadi bentuk yang lebih hidup dengan melibatkan aktor manusia yang menari dan berdialog, sehingga dinamakan Wayang Orang.', "paragraph", 6),
(3, "Karakteristik dan Gerakan", "heading", 6),
(4, 'Wayang Orang merupakan perpaduan dari berbagai seni, termasuk tari, drama, musik, dan kostum. Setiap pertunjukan biasanya melibatkan banyak pemain, baik pria maupun wanita, yang mengenakan kostum yang rumit dan penuh warna. Kostum ini dirancang sedemikian rupa untuk mencerminkan karakter yang diperankan, mulai dari ksatria, raja, hingga dewa dan raksasa.', "paragraph", 6),
(5, 'Gerakan tari dalam Wayang Orang sangat khas, dengan penekanan pada gerakan tangan, kaki, dan ekspresi wajah. Setiap gerakan memiliki makna simbolis yang mendalam, menggambarkan sifat dan perasaan karakter yang diperankan. Dialog dalam Wayang Orang biasanya menggunakan bahasa Jawa kawi atau krama inggil, bahasa yang memiliki tingkat kesopanan tinggi dan penuh nuansa.', "paragraph", 6),
(6, 'Musik gamelan mengiringi seluruh pertunjukan, dengan komposisi yang disesuaikan dengan adegan dan suasana cerita. Instrumen gamelan seperti saron, kendang, gong, dan rebab memberikan irama yang kaya dan dinamis, menambah keindahan dan keagungan pada pementasan.', "paragraph", 6),
(7, "Cerita dan Lakon", "heading", 6),
(8, 'Wayang Orang mengangkat cerita-cerita epik dari Ramayana dan Mahabharata, serta berbagai legenda dan mitologi Jawa. Setiap cerita atau lakon memiliki pesan moral dan spiritual yang mendalam, mengajarkan nilai-nilai kehidupan seperti keberanian, keadilan, cinta, dan kesetiaan. Beberapa lakon terkenal dalam Wayang Orang antara lain adalah "Ramayana", "Baratayuda", dan "Pandawa Lima".', "paragraph", 6),
(9, "Makna dan Filosofi", "heading", 6),
(10, "Wayang Orang bukan sekadar hiburan, tetapi juga sarana pendidikan dan pembelajaran. Pertunjukan ini mengandung nilai-nilai luhur dan ajaran moral yang disampaikan melalui cerita dan karakter yang diperankan. Nilai-nilai seperti kebijaksanaan, keberanian, keadilan, dan ketulusan hati menjadi pesan yang selalu dihadirkan dalam setiap pementasan." , "paragraph", 6),
(11, "Wayang Orang juga mencerminkan kehidupan dan budaya masyarakat Jawa. Melalui gerak, dialog, dan musik, Wayang Orang menggambarkan dinamika sosial, spiritual, dan budaya yang kaya dan kompleks. Tarian dan gerakan dalam Wayang Orang mengajarkan keseimbangan dan harmoni, baik dalam diri manusia maupun dalam hubungannya dengan alam dan Tuhan.", "paragraph", 6),
(12, "Pementasan di Era Modern", "heading", 6),
(13, "Di era modern, Wayang Orang terus dipertahankan dan dikembangkan oleh berbagai kelompok seni dan komunitas budaya. Pertunjukan ini sering kali ditampilkan dalam berbagai acara budaya, festival, dan upacara adat, baik di tingkat lokal maupun nasional. Banyak sekolah seni dan sanggar tari yang mengajarkan Wayang Orang kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai.", "paragraph", 6),
(14, "Wayang Orang juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin mengenal lebih dekat budaya Jawa. Pementasan Wayang Orang tidak hanya memberikan hiburan, tetapi juga memberikan wawasan tentang sejarah, nilai-nilai, dan kebijaksanaan masyarakat Jawa.", "paragraph", 6),
(15, "Kesimpulan", "heading", 6),
(16, "Wayang Orang adalah salah satu warisan budaya yang paling berharga dari Jawa, yang menggabungkan seni, sejarah, dan filosofi dalam sebuah pertunjukan yang memukau. Melalui gerakan tari, dialog, dan musik gamelan, Wayang Orang menghidupkan kembali kisah-kisah epik dan ajaran moral yang relevan sepanjang masa.", "paragraph", 6),

(0, "Tari Gambyong Yogyakarta adalah salah satu tarian tradisional yang memukau dengan gerakan lembut dan anggun. Sebagai bagian dari kekayaan budaya Yogyakarta, tarian ini tidak hanya menawarkan keindahan estetika, tetapi juga mencerminkan nilai-nilai filosofis masyarakat Jawa. Dengan diiringi alunan musik gamelan yang syahdu, Tari Gambyong Yogyakarta menghadirkan harmoni yang sempurna antara gerakan, musik, dan ekspresi, menjadi representasi dari keagungan budaya Keraton Yogyakarta.", "paragraph", 7 ),
(1, "Sejarah dan Asal Usul", "heading", 7 ),
(2, 'Tari Gambyong memiliki akar yang dalam di Jawa, namun versi Yogyakarta memiliki ciri khas yang mencerminkan kekayaan budaya keraton. Tarian ini awalnya dipentaskan dalam upacara adat untuk memohon kesuburan dan keberkahan. Seiring waktu, Tari Gambyong Yogyakarta berkembang menjadi pertunjukan seni yang populer di kalangan bangsawan dan masyarakat luas. Nama "Gambyong" sendiri konon berasal dari nama seorang penari terkenal pada abad ke-19 yang sangat mahir dalam seni tari ini.', "paragraph", 7 ),
(3, "Karakteristik dan Gerakan", "heading", 7 ),
(4, 'Ciri khas dari Tari Gambyong Yogyakarta adalah gerakannya yang lembut, penuh ritme, dan harmonis. Penari Gambyong biasanya mengenakan kostum tradisional yang indah, termasuk kain batik khas Yogyakarta, kebaya, dan selendang yang melambai-lambai mengikuti gerakan tubuh. Kostum ini tidak hanya menambah keanggunan penari, tetapi juga memperkuat karakteristik tarian yang lembut dan mempesona.', "paragraph", 7 ),
(5, 'Gerakan dalam Tari Gambyong Yogyakarta mengikuti irama gamelan dengan tempo yang bervariasi, dari lambat hingga sedang. Musik pengiring terdiri dari instrumen gamelan seperti kendang, saron, bonang, dan gong, yang memainkan melodi yang indah dan harmonis. Penari Gambyong Yogyakarta menunjukkan kelincahan dan kelembutan dalam setiap gerakannya, menciptakan pemandangan yang menenangkan dan memikat hati.', "paragraph", 7 ),
(6, 'Makna dan Filosofi', "heading", 7 ),
(7, "Tari Gambyong Yogyakarta bukan hanya sekadar pertunjukan seni, tetapi juga sarat dengan makna dan filosofi yang mendalam. Gerakan yang lembut dan penuh keharmonisan dalam tarian ini melambangkan kehidupan yang seimbang dan harmonis, sesuai dengan ajaran filosofi Jawa yang menekankan pentingnya keseimbangan antara manusia, alam, dan Tuhan.", "paragraph", 7 ),
(8, 'Setiap gerakan dalam Tari Gambyong Yogyakarta memiliki simbolisme tertentu, seperti gerakan tangan yang melambangkan doa dan harapan, serta gerakan kaki yang mencerminkan langkah kehidupan yang penuh kehati-hatian dan keindahan. Tarian ini juga menggambarkan rasa syukur dan penghormatan kepada leluhur dan alam semesta, sebagai wujud dari rasa hormat dan cinta kasih.', "paragraph", 7 ),
(9, "Pementasan dan Perkembangan Modern", "heading", 7 ),
(10, "Di era modern, Tari Gambyong Yogyakarta tetap menjadi salah satu tarian tradisional yang paling populer dan sering dipentaskan dalam berbagai acara budaya, festival, dan upacara adat. Tarian ini tidak hanya dipelajari dan dipentaskan di lingkungan keraton, tetapi juga diajarkan di berbagai sekolah seni dan sanggar tari di seluruh Yogyakarta.", "paragraph", 7 ),
(11, "Banyak seniman dan penari muda yang terus mempelajari dan mengembangkan Tari Gambyong Yogyakarta, menambahkan elemen-elemen kreatif yang tetap menghormati tradisi. Pertunjukan Tari Gambyong Yogyakarta juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin menyaksikan keindahan budaya Jawa secara langsung.", "paragraph", 7 ),
(12, "Pementasan di Era Modern", "heading", 7 ),
(13, "Di era modern, Wayang Orang terus dipertahankan dan dikembangkan oleh berbagai kelompok seni dan komunitas budaya. Pertunjukan ini sering kali ditampilkan dalam berbagai acara budaya, festival, dan upacara adat, baik di tingkat lokal maupun nasional. Banyak sekolah seni dan sanggar tari yang mengajarkan Wayang Orang kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai.", "paragraph", 7 ),
(12, "Wayang Orang juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin mengenal lebih dekat budaya Jawa. Pementasan Wayang Orang tidak hanya memberikan hiburan, tetapi juga memberikan wawasan tentang sejarah, nilai-nilai, dan kebijaksanaan masyarakat Jawa.", "paragraph", 7 ),
(13, "Kesimpulan", "heading", 7 ),
(14, "Tari Gambyong Yogyakarta adalah salah satu permata budaya dari Yogyakarta yang menawarkan keindahan, keanggunan, dan makna mendalam. Melalui gerakan yang lembut dan harmonis, tarian ini mengajak penonton untuk merenungkan dan menghargai nilai-nilai kehidupan yang luhur. Tari Gambyong Yogyakarta bukan hanya sebuah pertunjukan seni, tetapi juga cerminan dari kekayaan budaya dan filosofi masyarakat Jawa yang patut kita lestarikan dan apresiasi.", "paragraph", 7 );





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
(1,"UKJGS UGM atau Unit Kesenian Jawa Gaya Surakarta Universitas Gadjah Mada lahir pada 19 Desember 1968 sebagai salah satu unit kegiatan mahasiswa yang menjadi wadah bagi mahasiswa Universitas Gadjah Mada yang ingin mengembangkan potensi diri dalam bidang seni tari, karawitan, dan pedhalangan.","Rossi Firmansyah","assets/communities/leaders/1.png","Dia adalah ketua UKJGS UGM (Unit Kesenian Jawa Gaya Surakarta Universitas Gadjah Mada) yang berdedikasi tinggi dalam melestarikan dan memperkenalkan budaya Yogyakarta. Dengan pengalaman bertahun-tahun dalam seni tradisional, Rossi memimpin komunitas ini dengan semangat dan visi yang kuat untuk menginspirasi generasi muda agar mencintai dan menjaga warisan dan budaya."),
(2,"UKM Swagayugama (Unit Kegiatan Mahasiswa Seni Jawa Gaya Yogyakarta Universitas Gadjah Mada) ini berdiri pada 6 Maret 1968 yang merupakan organisasi kemahasiswaan intra-universitas yang berperan sebagai wadah para penggiat kesenian Jawa Klasik Gaya Yogyakarta bagi civitas akademika Universitas Gadjah Mada, baik yang masih berstatus mahasiswa maupun alumni yang sungguh-sungguh dalam menekuni bidang yang dilestarikan oleh UKM ini, yaitu tari klasik dan karawitan dengan gendhing-gendhing klasik Karaton Ngayogyakarta Hadiningrat.","Theafila Natalia","assets/communities/leaders/2.png","menjadi bagian swagayaguma di periode pengurusan 2024 adalah fase hidup yang luar biasa, mengetuai suatu UKM yang umurnya lebih dari 60 tahun ialah suatau kebganggan sendiri, mengembanngkan SDM sekaligus “menguri nguri” budaya adalah visi utama UKM kami"),
(3,"Unit Kegiatan Mahasiswa (UKM) Keluarga Mahasiswa Seni Tradisi (KAMASETRA) Universitas Negeri Yogyakarta adalah salah satu UKM di UNY yang bergerak dalam bidang seni tradisi khususnya seni tradisional Jawa. UKM ini terdiri dari empat bidang seni, yakni Bidang Tari, Bidang Karawitan, Bidang Pedhalangan, serta Bidang Teater Tradisi. Adapun bidang non seni di UKM KAMASETRA ada Bidang Litbang (Penelitian dan Pengembangan), Bidang Sarpras (Sarana dan Prasarana), Bidang Kesra (Kesejahteraan Warga)","Dhimas Sadam Saputro","assets/communities/leaders/3.png","Dia adalah ketua KAMASETRA UNY yang berdedikasi tinggi dalam melestarikan dan memperkenalkan budaya Yogyakarta. Dengan pengalaman bertahun-tahun dalam seni tradisional, Rossi memimpin komunitas ini dengan semangat dan visi yang kuat untuk menginspirasi generasi muda agar mencintai dan menjaga warisan dan budaya.");

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
(1,"Workshop","assets/communities/activities/3.png","Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM"),

(2,"Penilaian Kompetensi","assets/communities/activities/4.png","Pementasan skala besar  yang diadakan berkala setiap tahunnya, dalam satu periode terdapat 3 pentas utama yaitu Gladhi Madya, Ramayana Prambanan dan Ambal Warsa"),
(2,"Pelatihan","assets/communities/activities/5.png","Pelatihan rutin sebanyak dua kali seminggu untuk divisi tari dan karawitan pedhalangan (tari setiap selasa dan kamis dan karawitan pedhalangan setiap senin dan rabu)"),
(2,"Seminar Karawitan","assets/communities/activities/6.png","Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM"),

(3,"Pementasan","assets/communities/activities/7.png","Pementasan skala besar  yang diadakan berkala setiap tahunnya, dalam satu periode terdapat 3 pentas utama yaitu Gladhi Madya, Ramayana Prambanan dan Ambal Warsa"),
(3,"Pelatihan","assets/communities/activities/8.png","Pelatihan rutin sebanyak dua kali seminggu untuk divisi tari dan karawitan pedhalangan (tari setiap selasa dan kamis dan karawitan pedhalangan setiap senin dan rabu)"),
(3,"Penerimaan Anggota ","assets/communities/activities/9.png","Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM");


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
(1,"assets/communities/gallery/performance/2.jpg"),
(1,"assets/communities/gallery/performance/3.JPG"),
(2,"assets/communities/gallery/performance/4.JPG"),
(2,"assets/communities/gallery/performance/5.JPG"),
(2,"assets/communities/gallery/performance/6.JPG"),
(3,"assets/communities/gallery/performance/7.jpg"),
(3,"assets/communities/gallery/performance/8.jpg");

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
(1,"assets/communities/gallery/behind_the_scene/3.jpg"),
(2,"assets/communities/gallery/behind_the_scene/4.JPG"),
(2,"assets/communities/gallery/behind_the_scene/5.JPG"),
(2,"assets/communities/gallery/behind_the_scene/6.JPG"),
(3,"assets/communities/gallery/behind_the_scene/7.jpg"),
(3,"assets/communities/gallery/behind_the_scene/8.jpg");

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

