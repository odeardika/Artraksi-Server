-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: artraksi
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article_favorite_list`
--

DROP TABLE IF EXISTS `article_favorite_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_favorite_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `article_favorite_list_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `article_favorite_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_favorite_list`
--

LOCK TABLES `article_favorite_list` WRITE;
/*!40000 ALTER TABLE `article_favorite_list` DISABLE KEYS */;
INSERT INTO `article_favorite_list` VALUES (1,1,1);
/*!40000 ALTER TABLE `article_favorite_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumbnail_img` varchar(255) DEFAULT NULL,
  `creator_id` int NOT NULL,
  `upload_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `likes` int DEFAULT '0',
  `views` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Tari Bedhaya: Keanggunan Sakral dari Keraton Yogyakarta','assets/articles/1.png',1,'2024-06-22 22:25:18',1,0),(2,'Tari Srimpi: Tarian Klasik yang Memikat Hati dari Keraton Yogyakarta','assets/articles/2.png',1,'2024-06-22 22:25:18',0,0),(3,'Pesona Tari Gambyong: Keindahan Tarian Klasik Yogyakarta','assets/articles/3.png',1,'2024-06-22 22:25:18',0,0),(4,'Tari Incling: Gemerlap Tradisi dan Dinamika Budaya Yogyakarta','assets/articles/4.png',1,'2024-06-22 22:25:18',0,0),(5,'Tari Incling Kulon Progo: Memori Sejarah dan Keindahan Tradisi','assets/articles/5.png',1,'2024-06-22 22:25:18',0,0),(6,'Wayang Orang: Kehidupan dalam Gerak dan Lakon','assets/articles/6.png',1,'2024-06-22 22:25:18',0,0),(7,'Tari Gambyong Yogyakarta: Harmoni Lembut dari Keraton','assets/articles/7.png',1,'2024-06-22 22:25:18',0,0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_contents`
--

DROP TABLE IF EXISTS `articles_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text_order` int NOT NULL,
  `text` text,
  `text_type` enum('paragraph','heading') DEFAULT NULL,
  `article_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `articles_contents_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_contents`
--

LOCK TABLES `articles_contents` WRITE;
/*!40000 ALTER TABLE `articles_contents` DISABLE KEYS */;
INSERT INTO `articles_contents` VALUES (1,0,'Tari Bedhaya adalah salah satu bentuk tarian klasik Jawa yang berasal dari Keraton Yogyakarta. Tarian ini tidak hanya dikenal karena keindahan gerakannya, tetapi juga karena nilai-nilai spiritual dan filosofis yang terkandung di dalamnya. Tari Bedhaya adalah representasi sempurna dari harmoni, kesucian, dan keanggunan yang menjadi bagian integral dari budaya Jawa.','paragraph',1),(2,0,'Tari Srimpi adalah salah satu tarian klasik Jawa yang berasal dari lingkungan keraton Yogyakarta dan Surakarta. Tarian ini dikenal karena gerakannya yang lemah gemulai dan penuh makna filosofis. Sebagai salah satu tarian sakral, Tari Srimpi memiliki peran penting dalam upacara adat dan kehidupan keraton, mencerminkan keanggunan, kesucian, dan harmoni.','paragraph',2),(3,0,'Tari Gambyong adalah salah satu tarian tradisional yang berasal dari Jawa Tengah, khususnya Surakarta, namun juga populer di Yogyakarta. Tarian ini dikenal karena gerakannya yang anggun dan dinamis, serta sering kali digunakan untuk menyambut tamu atau sebagai bagian dari upacara adat. Tari Gambyong mencerminkan keindahan dan keramahan budaya Jawa, dengan gerakan yang menggambarkan kelembutan dan kehalusan budi pekerti.','paragraph',3),(4,0,'Tari Incling adalah salah satu tarian tradisional yang berasal dari Yogyakarta, dikenal karena keunikannya yang mencerminkan dinamika dan keindahan budaya Jawa. Tarian ini merupakan bagian integral dari kekayaan seni pertunjukan Yogyakarta, memperlihatkan harmoni antara gerakan yang energik dan irama musik gamelan yang dinamis. Tari Incling tidak hanya menawarkan keindahan visual, tetapi juga mengandung makna filosofis yang mendalam.','paragraph',4),(5,0,'Tari Incling Kulon Progo adalah salah satu bentuk seni pertunjukan tradisional yang berasal dari daerah Kulon Progo, Yogyakarta. Tarian ini menjadi salah satu representasi budaya lokal yang kaya akan nilai-nilai sejarah dan filosofi. Dengan gerakan yang penuh makna dan diiringi musik gamelan yang khas, Tari Incling Kulon Progo menawarkan keindahan dan kebijaksanaan yang diwariskan dari generasi ke generasi.','paragraph',5),(6,0,'Wayang Orang, sebuah bentuk seni pertunjukan tradisional dari Jawa, adalah manifestasi hidup dari kisah-kisah epik yang diwariskan dari generasi ke generasi. Seni ini menggabungkan teater, tari, musik, dan drama dalam sebuah pementasan yang memukau, menggambarkan cerita-cerita dari Ramayana, Mahabharata, serta legenda-legenda lokal lainnya. Wayang Orang tidak hanya menawarkan hiburan, tetapi juga sarana pendidikan moral dan spiritual yang mendalam.','paragraph',6),(7,1,'Asal-Usul dan Sejarah','heading',1),(8,2,'Tari Bedhaya pertama kali dipentaskan di Keraton Yogyakarta pada abad ke-17. Tarian ini dianggap sakral dan biasanya hanya dipersembahkan di dalam lingkungan keraton untuk acara-acara khusus seperti penobatan raja, peringatan hari besar, atau upacara adat penting. Bedhaya sering kali dikaitkan dengan cerita mitologi, spiritualitas, dan hubungan antara manusia dengan alam dan Tuhan','paragraph',1),(9,3,'Karakteristik dan Gerakan','heading',1),(10,4,'Salah satu ciri khas dari Tari Bedhaya adalah gerakannya yang lemah gemulai dan penuh dengan makna simbolis. Tarian ini biasanya dibawakan oleh sembilan penari wanita yang bergerak dengan sangat sinkron, mencerminkan keselarasan dan kesatuan. Setiap gerakan dalam Tari Bedhaya memiliki arti tersendiri dan sering kali dihubungkan dengan nilai-nilai filosofis dan spiritualitas.','paragraph',1),(11,5,'Penari Bedhaya mengenakan kostum tradisional yang elegan dengan kain batik, sanggul, dan perhiasan yang indah. Musik pengiringnya adalah gamelan Jawa yang memainkan nada-nada halus dan meditatif, menambah atmosfer khusyuk dan sakral pada tarian ini.','paragraph',1),(12,6,'Makna dan Filosofi','heading',1),(13,7,'Tari Bedhaya bukan hanya sebuah pertunjukan seni, tetapi juga sebuah media untuk menyampaikan pesan-pesan moral dan filosofis. Tarian ini sering kali mengandung cerita tentang kehidupan manusia, hubungan dengan Tuhan, dan harmoni dengan alam. Gerakan yang lemah lembut dan penuh konsentrasi mencerminkan ketenangan batin dan kedalaman spiritualitas.','paragraph',1),(14,8,'Menurut tradisi, sembilan penari dalam Tari Bedhaya melambangkan sembilan arah mata angin dan kesempurnaan. Tarian ini juga sering kali dianggap sebagai bentuk persembahan kepada dewa-dewa atau roh leluhur, yang diharapkan membawa berkah dan perlindungan bagi keraton dan masyarakat.','paragraph',1),(15,9,'Pementasan di Era Modern','heading',1),(16,10,'Meskipun pada awalnya Tari Bedhaya hanya dipentaskan di dalam keraton, seiring berjalannya waktu, tarian ini mulai diperkenalkan kepada publik yang lebih luas. Pertunjukan Tari Bedhaya kini dapat disaksikan dalam berbagai festival budaya, acara kenegaraan, dan pertunjukan seni di Yogyakarta maupun di luar daerah.','paragraph',1),(17,11,'Namun, meskipun telah lebih terbuka untuk umum, pementasan Tari Bedhaya tetap mempertahankan unsur-unsur kesakralannya. Setiap pementasan dilakukan dengan penuh penghormatan terhadap tradisi dan nilai-nilai yang terkandung di dalamnya.','paragraph',1),(18,12,'Kesimpulan','heading',1),(19,13,'Tari Bedhaya adalah salah satu warisan budaya yang paling berharga dari Yogyakarta. Keindahan gerakannya, kedalaman filosofinya, dan nilai-nilai spiritual yang dikandungnya menjadikan tarian ini sebagai simbol keanggunan dan kesucian budaya Jawa. Melalui Tari Bedhaya, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, spiritualitas, dan harmoni dengan alam semesta.','paragraph',1),(20,1,'Sejarah dan Asal Usul','heading',2),(21,2,'Tari Srimpi telah ada sejak zaman Mataram Islam pada abad ke-18. Tarian ini awalnya diciptakan untuk menghibur dan menghormati para raja serta tamu-tamu penting di keraton. Nama \"Srimpi\" sendiri berasal dari kata \"impi\" atau mimpi, yang mengandung makna kedamaian dan ketenangan. Seiring berjalannya waktu, Tari Srimpi menjadi salah satu tarian yang paling dihormati dan diwariskan dari generasi ke generasi di keraton.','paragraph',2),(22,3,'Karakteristik dan Gerakan','heading',2),(23,4,'Karakteristik dan GerakanSalah satu ciri khas dari Tari Srimpi adalah gerakannya yang lambat dan teratur, menciptakan kesan yang anggun dan penuh perasaan. Tarian ini biasanya dibawakan oleh empat penari wanita, yang mewakili empat elemen kehidupan: tanah, air, api, dan udara. Gerakan dalam Tari Srimpi sangat teratur dan simetris, dengan penekanan pada keindahan dan keselarasan.','paragraph',2),(24,5,'Para penari Srimpi mengenakan kostum tradisional yang indah, termasuk kain batik, kebaya, dan selendang. Aksesori seperti sanggul dan perhiasan juga digunakan untuk menambah keanggunan penampilan. Musik pengiringnya adalah gamelan Jawa, yang memainkan nada-nada halus dan mengalun, menambah suasana magis dan sakral pada tarian ini.','paragraph',2),(25,6,'Makna dan Filosofi','heading',2),(26,7,'Tari Srimpi tidak hanya sekadar tarian, tetapi juga sebuah media untuk menyampaikan pesan-pesan moral dan filosofis. Gerakan yang lambat dan penuh konsentrasi melambangkan kedamaian, kesucian, dan keseimbangan. Setiap gerakan memiliki makna simbolis yang mendalam, menggambarkan harmoni antara manusia dengan alam dan hubungan spiritual dengan Tuhan.','paragraph',2),(27,8,'Selain itu, Tari Srimpi sering kali menceritakan kisah-kisah epik dari mitologi Jawa, seperti Ramayana dan Mahabharata, atau cerita-cerita tentang ksatria dan dewi. Kisah-kisah ini tidak hanya menghibur tetapi juga mengajarkan nilai-nilai moral dan kebijaksanaan.','paragraph',2),(28,9,'Pementasan di Era Modern','heading',2),(29,10,'Meskipun awalnya hanya dipentaskan di dalam lingkungan keraton, Tari Srimpi kini sering dipertunjukkan dalam berbagai acara budaya, festival, dan upacara resmi. Pementasan Tari Srimpi di luar keraton tetap mempertahankan kesakralan dan keanggunannya, dengan tetap mengikuti tata cara dan aturan yang berlaku.','paragraph',2),(30,11,'Banyak sekolah tari dan sanggar seni di Yogyakarta dan Surakarta yang mengajarkan Tari Srimpi kepada generasi muda, memastikan bahwa tarian ini terus dilestarikan dan dihargai. Pertunjukan Tari Srimpi juga menjadi daya tarik wisata budaya, menarik minat pengunjung untuk menyaksikan keindahan dan kedalaman budaya Jawa.','paragraph',2),(31,12,'Kesimpulan','heading',2),(32,13,'Tari Srimpi adalah salah satu warisan budaya yang paling berharga dari Jawa. Keanggunan gerakannya, kedalaman filosofinya, dan nilai-nilai spiritual yang terkandung di dalamnya menjadikan tarian ini sebagai simbol keindahan dan kesucian budaya Jawa. Melalui Tari Srimpi, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, spiritualitas, dan harmoni dengan alam semesta.','paragraph',2),(33,14,'Menjaga dan melestarikan Tari Srimpi adalah tanggung jawab kita bersama, agar keindahan dan kebijaksanaan yang terkandung di dalamnya dapat terus dinikmati oleh generasi mendatang. Tarian ini bukan hanya warisan budaya, tetapi juga cerminan dari identitas dan jiwa masyarakat Jawa.','paragraph',2),(34,1,'Sejarah dan Asal Usul','heading',3),(35,2,'Tari Gambyong awalnya adalah bagian dari tari tayub, sebuah bentuk tarian rakyat yang digunakan dalam acara-acara perayaan dan upacara panen padi. Pada abad ke-19, tari tayub diadaptasi dan dimodifikasi oleh Keraton Surakarta menjadi Tari Gambyong, dengan gerakan yang lebih halus dan berirama. Nama \"Gambyong\" diambil dari nama seorang penari legendaris, Sri Gambyong, yang terkenal karena kecantikannya dan keahliannya menari.','paragraph',3),(36,3,'Karakteristik dan Gerakan','heading',3),(37,4,'Salah satu ciri khas dari Tari Gambyong adalah gerakannya yang lembut dan mengalir, dengan penekanan pada gerakan tangan, kepala, dan tubuh bagian atas. Tarian ini biasanya dibawakan oleh seorang atau beberapa penari wanita, yang mengenakan kostum tradisional seperti kain batik, kemben, dan selendang. Musik pengiringnya adalah gamelan Jawa, yang memainkan komposisi khusus yang disebut \"Ladrang Gambyong\".','paragraph',3),(38,5,'Gerakan dalam Tari Gambyong mencerminkan rasa syukur dan kebahagiaan. Penari sering kali menghadap ke arah tamu atau penonton, memberikan kesan menyambut dan menghormati. Setiap gerakan tangan, kaki, dan kepala dirancang untuk menunjukkan keanggunan dan keseimbangan, menciptakan harmoni yang menenangkan.','paragraph',3),(39,6,'Makna dan Filosofi','heading',3),(40,7,'Tari Gambyong tidak hanya sekadar pertunjukan seni, tetapi juga mengandung makna dan filosofi yang mendalam. Gerakan yang lembut dan teratur mencerminkan nilai-nilai kehalusan budi, keramahan, dan rasa hormat. Tari ini juga melambangkan kesuburan dan kemakmuran, yang awalnya dihubungkan dengan ritual panen padi.','paragraph',3),(41,8,'Dalam budaya Jawa, tarian ini juga merupakan bentuk penghormatan dan ucapan terima kasih kepada tamu atau penonton. Melalui Tari Gambyong, penari menyampaikan pesan kebahagiaan, kedamaian, dan rasa syukur, serta memperkuat ikatan sosial dan budaya.','paragraph',3),(42,9,'Pementasan di Era Modern','heading',3),(43,10,'Tari Gambyong telah mengalami banyak perubahan dan adaptasi sejak pertama kali diciptakan. Meskipun begitu, tarian ini tetap mempertahankan esensi dan keindahan aslinya. Di era modern, Tari Gambyong sering dipentaskan dalam berbagai acara, mulai dari upacara adat, pernikahan, festival budaya, hingga pertunjukan seni di panggung nasional dan internasional.','paragraph',3),(44,11,'Banyak sanggar tari dan sekolah seni di Yogyakarta dan Surakarta yang mengajarkan Tari Gambyong kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai. Pementasan Tari Gambyong juga sering kali menjadi daya tarik wisata, menarik minat pengunjung untuk menikmati dan mempelajari budaya Jawa.','paragraph',3),(45,12,'Kesimpulan','heading',3),(46,13,'Tari Gambyong adalah salah satu warisan budaya yang paling berharga dari Jawa Tengah dan Yogyakarta. Keanggunan gerakannya, kedalaman filosofinya, dan nilai-nilai sosial yang terkandung di dalamnya menjadikan tarian ini sebagai simbol keindahan dan keramahan budaya Jawa. Melalui Tari Gambyong, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, kebahagiaan, dan hubungan manusia dengan alam.','paragraph',3),(47,14,'Melestarikan Tari Gambyong adalah tanggung jawab kita bersama, agar keindahan dan kebijaksanaan yang terkandung di dalamnya dapat terus dinikmati oleh generasi mendatang. Tarian ini bukan hanya warisan budaya, tetapi juga cerminan dari identitas dan jiwa masyarakat Jawa.','paragraph',3),(48,1,'Sejarah dan Asal Usul','heading',4),(49,2,'Tari Incling berasal dari lingkungan keraton Yogyakarta dan telah ada sejak zaman kerajaan Mataram. Tarian ini awalnya digunakan dalam upacara adat dan ritual keraton, sebagai bentuk penghormatan dan persembahan kepada para dewa serta leluhur. Nama \"Incling\" diambil dari kata dalam bahasa Jawa yang berarti \"mendengarkan\" atau \"memahami,\" mencerminkan makna mendalam dan kebijaksanaan yang terkandung dalam gerakan tarian ini.','paragraph',4),(50,3,'Karakteristik dan Gerakan','heading',4),(51,4,'Salah satu ciri khas dari Tari Incling adalah gerakannya yang energik dan dinamis, dengan penekanan pada kelincahan kaki dan tangan. Tarian ini biasanya dibawakan oleh sekelompok penari pria dan wanita, yang mengenakan kostum tradisional yang cerah dan berwarna-warni. Kostum ini biasanya terdiri dari kain batik, ikat kepala, dan aksesoris lain yang menambah keindahan penampilan.','paragraph',4),(52,5,'Gerakan dalam Tari Incling sangat bervariasi, mulai dari gerakan cepat dan bersemangat hingga gerakan lambat dan anggun. Setiap gerakan memiliki makna simbolis yang mendalam, menggambarkan berbagai aspek kehidupan dan nilai-nilai moral. Musik pengiringnya adalah gamelan Jawa, yang memainkan irama yang dinamis dan meriah, menambah semangat pada pertunjukan.','paragraph',4),(53,6,'Makna dan Filosofi','heading',4),(54,7,'Tari Incling tidak hanya sekadar hiburan, tetapi juga mengandung pesan-pesan moral dan filosofis. Gerakan yang dinamis mencerminkan semangat hidup, keberanian, dan kebijaksanaan. Tarian ini juga sering kali digunakan untuk menggambarkan cerita-cerita epik dari mitologi Jawa, seperti kisah-kisah Ramayana dan Mahabharata, atau legenda-legenda lokal yang mengajarkan nilai-nilai luhur.','paragraph',4),(55,8,'Melalui gerakannya, Tari Incling mengajarkan pentingnya keseimbangan antara kekuatan dan kelembutan, serta harmoni antara manusia dengan alam dan Tuhan. Tarian ini juga mencerminkan semangat gotong royong dan kebersamaan, yang merupakan nilai-nilai penting dalam budaya Jawa.','paragraph',4),(56,9,'Pementasan di Era Modern','heading',4),(57,10,'Di era modern, Tari Incling tetap dipertahankan dan dipentaskan dalam berbagai acara budaya, baik di lingkungan keraton maupun di luar keraton. Tarian ini sering kali menjadi bagian dari festival budaya, upacara adat, dan pertunjukan seni, menarik minat penonton lokal maupun internasional. Banyak sanggar tari dan sekolah seni di Yogyakarta yang mengajarkan Tari Incling kepada generasi muda, memastikan bahwa warisan budaya ini terus hidup dan berkembang.','paragraph',4),(58,11,'Kesimpulan','heading',4),(59,12,'Tari Incling adalah salah satu warisan budaya yang paling berharga dari Yogyakarta. Keunikan gerakannya, kedalaman filosofinya, dan keindahan visual yang ditawarkannya menjadikan tarian ini sebagai simbol dinamika dan keindahan budaya Jawa. Melalui Tari Incling, kita tidak hanya menikmati sebuah pertunjukan seni, tetapi juga memahami makna yang lebih dalam tentang kehidupan, nilai-nilai moral, dan hubungan manusia dengan alam semesta.','paragraph',4),(60,1,'Sejarah dan Asal Usul','heading',5),(61,2,'Tari Incling Kulon Progo memiliki akar yang mendalam dalam tradisi masyarakat Kulon Progo. Tarian ini konon telah ada sejak zaman kerajaan Mataram dan digunakan dalam berbagai upacara adat serta ritual keagamaan. Nama \"Incling\" berasal dari kata dalam bahasa Jawa yang berarti \"mendengarkan\" atau \"memahami\", yang mencerminkan tujuan tarian ini sebagai sarana untuk menyampaikan pesan-pesan moral dan spiritual kepada masyarakat.','paragraph',5),(62,3,'Karakteristik dan Gerakan','heading',5),(63,4,'Tari Incling Kulon Progo dikenal dengan gerakannya yang dinamis dan ekspresif, menggambarkan semangat dan kehidupan masyarakat setempat. Penari biasanya mengenakan kostum tradisional yang terbuat dari kain batik dengan warna-warna cerah, dilengkapi dengan ikat kepala dan aksesoris lainnya. Gerakan tarian ini sering kali melibatkan permainan tangan dan kaki yang lincah, serta perubahan posisi yang cepat namun tetap harmonis.','paragraph',5),(64,5,'Musik pengiring Tari Incling Kulon Progo adalah gamelan Jawa, yang memainkan irama yang dinamis dan meriah. Instrumen gamelan seperti saron, kendang, dan gong memberikan nuansa yang khas, menambah semangat dan keindahan pada pertunjukan.','paragraph',5),(65,6,'Makna dan Filosofi','heading',5),(66,7,'Tari Incling Kulon Progo bukan hanya sekedar pertunjukan seni, tetapi juga mengandung pesan-pesan filosofis yang mendalam. Setiap gerakan memiliki makna simbolis, menggambarkan nilai-nilai kehidupan seperti kebijaksanaan, keberanian, dan kebersamaan. Tari Incling juga sering kali digunakan untuk menceritakan legenda dan mitos lokal, yang mengajarkan pentingnya menjaga harmoni antara manusia dengan alam dan Tuhan.','paragraph',5),(67,8,'Tarian ini juga mencerminkan nilai-nilai sosial masyarakat Kulon Progo, seperti gotong royong, rasa hormat, dan ketaatan kepada tradisi. Melalui Tari Incling, penari berusaha menyampaikan pesan moral dan spiritual kepada penonton, mengajak mereka untuk merenungkan dan mengapresiasi nilai-nilai luhur yang diwariskan oleh leluhur.','paragraph',5),(68,9,'Pementasan di Era Modern','heading',5),(69,10,'Di era modern, Tari Incling Kulon Progo terus dipertahankan dan dikembangkan oleh masyarakat setempat. Tarian ini sering dipentaskan dalam berbagai acara budaya, festival, dan upacara adat, baik di tingkat lokal maupun nasional. Banyak sanggar tari dan komunitas seni di Kulon Progo yang aktif mengajarkan Tari Incling kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai.','paragraph',5),(70,11,'Pementasan Tari Incling Kulon Progo juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin mengenal lebih dekat budaya lokal Yogyakarta. Pertunjukan ini tidak hanya menghibur, tetapi juga memberikan wawasan tentang sejarah dan tradisi masyarakat Kulon Progo.','paragraph',5),(71,12,'Kesimpulan','heading',5),(72,13,'Tari Incling Kulon Progo adalah salah satu permata budaya dari Yogyakarta yang kaya akan keindahan dan makna. Dengan gerakannya yang dinamis dan penuh ekspresi, serta filosofi yang mendalam, tarian ini menjadi simbol dari semangat dan kebijaksanaan masyarakat Kulon Progo. Melalui Tari Incling, kita dapat menyaksikan dan memahami nilai-nilai luhur yang diwariskan oleh leluhur, serta menghargai keindahan tradisi yang terus hidup di tengah modernisasi.','paragraph',5),(73,1,'Sejarah dan Asal Usul','heading',6),(74,2,'Wayang Orang, atau sering disebut Wayang Wong, berasal dari Jawa dan berkembang pada masa kerajaan Mataram sekitar abad ke-18. Pertunjukan ini merupakan adaptasi dari wayang kulit, yang awalnya hanya menggunakan boneka kulit sebagai media penceritaan. Pada masa pemerintahan Sultan Agung dari Mataram, seni pertunjukan ini berkembang menjadi bentuk yang lebih hidup dengan melibatkan aktor manusia yang menari dan berdialog, sehingga dinamakan Wayang Orang.','paragraph',6),(75,3,'Karakteristik dan Gerakan','heading',6),(76,4,'Wayang Orang merupakan perpaduan dari berbagai seni, termasuk tari, drama, musik, dan kostum. Setiap pertunjukan biasanya melibatkan banyak pemain, baik pria maupun wanita, yang mengenakan kostum yang rumit dan penuh warna. Kostum ini dirancang sedemikian rupa untuk mencerminkan karakter yang diperankan, mulai dari ksatria, raja, hingga dewa dan raksasa.','paragraph',6),(77,5,'Gerakan tari dalam Wayang Orang sangat khas, dengan penekanan pada gerakan tangan, kaki, dan ekspresi wajah. Setiap gerakan memiliki makna simbolis yang mendalam, menggambarkan sifat dan perasaan karakter yang diperankan. Dialog dalam Wayang Orang biasanya menggunakan bahasa Jawa kawi atau krama inggil, bahasa yang memiliki tingkat kesopanan tinggi dan penuh nuansa.','paragraph',6),(78,6,'Musik gamelan mengiringi seluruh pertunjukan, dengan komposisi yang disesuaikan dengan adegan dan suasana cerita. Instrumen gamelan seperti saron, kendang, gong, dan rebab memberikan irama yang kaya dan dinamis, menambah keindahan dan keagungan pada pementasan.','paragraph',6),(79,7,'Cerita dan Lakon','heading',6),(80,8,'Wayang Orang mengangkat cerita-cerita epik dari Ramayana dan Mahabharata, serta berbagai legenda dan mitologi Jawa. Setiap cerita atau lakon memiliki pesan moral dan spiritual yang mendalam, mengajarkan nilai-nilai kehidupan seperti keberanian, keadilan, cinta, dan kesetiaan. Beberapa lakon terkenal dalam Wayang Orang antara lain adalah \"Ramayana\", \"Baratayuda\", dan \"Pandawa Lima\".','paragraph',6),(81,9,'Makna dan Filosofi','heading',6),(82,10,'Wayang Orang bukan sekadar hiburan, tetapi juga sarana pendidikan dan pembelajaran. Pertunjukan ini mengandung nilai-nilai luhur dan ajaran moral yang disampaikan melalui cerita dan karakter yang diperankan. Nilai-nilai seperti kebijaksanaan, keberanian, keadilan, dan ketulusan hati menjadi pesan yang selalu dihadirkan dalam setiap pementasan.','paragraph',6),(83,11,'Wayang Orang juga mencerminkan kehidupan dan budaya masyarakat Jawa. Melalui gerak, dialog, dan musik, Wayang Orang menggambarkan dinamika sosial, spiritual, dan budaya yang kaya dan kompleks. Tarian dan gerakan dalam Wayang Orang mengajarkan keseimbangan dan harmoni, baik dalam diri manusia maupun dalam hubungannya dengan alam dan Tuhan.','paragraph',6),(84,12,'Pementasan di Era Modern','heading',6),(85,13,'Di era modern, Wayang Orang terus dipertahankan dan dikembangkan oleh berbagai kelompok seni dan komunitas budaya. Pertunjukan ini sering kali ditampilkan dalam berbagai acara budaya, festival, dan upacara adat, baik di tingkat lokal maupun nasional. Banyak sekolah seni dan sanggar tari yang mengajarkan Wayang Orang kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai.','paragraph',6),(86,14,'Wayang Orang juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin mengenal lebih dekat budaya Jawa. Pementasan Wayang Orang tidak hanya memberikan hiburan, tetapi juga memberikan wawasan tentang sejarah, nilai-nilai, dan kebijaksanaan masyarakat Jawa.','paragraph',6),(87,15,'Kesimpulan','heading',6),(88,16,'Wayang Orang adalah salah satu warisan budaya yang paling berharga dari Jawa, yang menggabungkan seni, sejarah, dan filosofi dalam sebuah pertunjukan yang memukau. Melalui gerakan tari, dialog, dan musik gamelan, Wayang Orang menghidupkan kembali kisah-kisah epik dan ajaran moral yang relevan sepanjang masa.','paragraph',6),(89,0,'Tari Gambyong Yogyakarta adalah salah satu tarian tradisional yang memukau dengan gerakan lembut dan anggun. Sebagai bagian dari kekayaan budaya Yogyakarta, tarian ini tidak hanya menawarkan keindahan estetika, tetapi juga mencerminkan nilai-nilai filosofis masyarakat Jawa. Dengan diiringi alunan musik gamelan yang syahdu, Tari Gambyong Yogyakarta menghadirkan harmoni yang sempurna antara gerakan, musik, dan ekspresi, menjadi representasi dari keagungan budaya Keraton Yogyakarta.','paragraph',7),(90,1,'Sejarah dan Asal Usul','heading',7),(91,2,'Tari Gambyong memiliki akar yang dalam di Jawa, namun versi Yogyakarta memiliki ciri khas yang mencerminkan kekayaan budaya keraton. Tarian ini awalnya dipentaskan dalam upacara adat untuk memohon kesuburan dan keberkahan. Seiring waktu, Tari Gambyong Yogyakarta berkembang menjadi pertunjukan seni yang populer di kalangan bangsawan dan masyarakat luas. Nama \"Gambyong\" sendiri konon berasal dari nama seorang penari terkenal pada abad ke-19 yang sangat mahir dalam seni tari ini.','paragraph',7),(92,3,'Karakteristik dan Gerakan','heading',7),(93,4,'Ciri khas dari Tari Gambyong Yogyakarta adalah gerakannya yang lembut, penuh ritme, dan harmonis. Penari Gambyong biasanya mengenakan kostum tradisional yang indah, termasuk kain batik khas Yogyakarta, kebaya, dan selendang yang melambai-lambai mengikuti gerakan tubuh. Kostum ini tidak hanya menambah keanggunan penari, tetapi juga memperkuat karakteristik tarian yang lembut dan mempesona.','paragraph',7),(94,5,'Gerakan dalam Tari Gambyong Yogyakarta mengikuti irama gamelan dengan tempo yang bervariasi, dari lambat hingga sedang. Musik pengiring terdiri dari instrumen gamelan seperti kendang, saron, bonang, dan gong, yang memainkan melodi yang indah dan harmonis. Penari Gambyong Yogyakarta menunjukkan kelincahan dan kelembutan dalam setiap gerakannya, menciptakan pemandangan yang menenangkan dan memikat hati.','paragraph',7),(95,6,'Makna dan Filosofi','heading',7),(96,7,'Tari Gambyong Yogyakarta bukan hanya sekadar pertunjukan seni, tetapi juga sarat dengan makna dan filosofi yang mendalam. Gerakan yang lembut dan penuh keharmonisan dalam tarian ini melambangkan kehidupan yang seimbang dan harmonis, sesuai dengan ajaran filosofi Jawa yang menekankan pentingnya keseimbangan antara manusia, alam, dan Tuhan.','paragraph',7),(97,8,'Setiap gerakan dalam Tari Gambyong Yogyakarta memiliki simbolisme tertentu, seperti gerakan tangan yang melambangkan doa dan harapan, serta gerakan kaki yang mencerminkan langkah kehidupan yang penuh kehati-hatian dan keindahan. Tarian ini juga menggambarkan rasa syukur dan penghormatan kepada leluhur dan alam semesta, sebagai wujud dari rasa hormat dan cinta kasih.','paragraph',7),(98,9,'Pementasan dan Perkembangan Modern','heading',7),(99,10,'Di era modern, Tari Gambyong Yogyakarta tetap menjadi salah satu tarian tradisional yang paling populer dan sering dipentaskan dalam berbagai acara budaya, festival, dan upacara adat. Tarian ini tidak hanya dipelajari dan dipentaskan di lingkungan keraton, tetapi juga diajarkan di berbagai sekolah seni dan sanggar tari di seluruh Yogyakarta.','paragraph',7),(100,11,'Banyak seniman dan penari muda yang terus mempelajari dan mengembangkan Tari Gambyong Yogyakarta, menambahkan elemen-elemen kreatif yang tetap menghormati tradisi. Pertunjukan Tari Gambyong Yogyakarta juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin menyaksikan keindahan budaya Jawa secara langsung.','paragraph',7),(101,12,'Pementasan di Era Modern','heading',7),(102,13,'Di era modern, Wayang Orang terus dipertahankan dan dikembangkan oleh berbagai kelompok seni dan komunitas budaya. Pertunjukan ini sering kali ditampilkan dalam berbagai acara budaya, festival, dan upacara adat, baik di tingkat lokal maupun nasional. Banyak sekolah seni dan sanggar tari yang mengajarkan Wayang Orang kepada generasi muda, memastikan bahwa warisan budaya ini tetap hidup dan dihargai.','paragraph',7),(103,12,'Wayang Orang juga menarik minat wisatawan, baik domestik maupun internasional, yang ingin mengenal lebih dekat budaya Jawa. Pementasan Wayang Orang tidak hanya memberikan hiburan, tetapi juga memberikan wawasan tentang sejarah, nilai-nilai, dan kebijaksanaan masyarakat Jawa.','paragraph',7),(104,13,'Kesimpulan','heading',7),(105,14,'Tari Gambyong Yogyakarta adalah salah satu permata budaya dari Yogyakarta yang menawarkan keindahan, keanggunan, dan makna mendalam. Melalui gerakan yang lembut dan harmonis, tarian ini mengajak penonton untuk merenungkan dan menghargai nilai-nilai kehidupan yang luhur. Tari Gambyong Yogyakarta bukan hanya sebuah pertunjukan seni, tetapi juga cerminan dari kekayaan budaya dan filosofi masyarakat Jawa yang patut kita lestarikan dan apresiasi.','paragraph',7);
/*!40000 ALTER TABLE `articles_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_contents`
--

DROP TABLE IF EXISTS `blog_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text_order` int NOT NULL,
  `text` text,
  `text_type` enum('paragraph','heading') DEFAULT NULL,
  `blog_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_contents_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_contents`
--

LOCK TABLES `blog_contents` WRITE;
/*!40000 ALTER TABLE `blog_contents` DISABLE KEYS */;
INSERT INTO `blog_contents` VALUES (1,0,'Hari ini saya memiliki kesempatan luar biasa untuk mengunjungi pameran seni yang menginspirasi di Galeri Seni Murni Yogyakarta. Acara ini, yang diberi nama \"Manifestasi Kreativitas,\" menampilkan karya-karya seniman lokal yang begitu memukau dan menginspirasi.\r','paragraph',1),(2,1,'Saat saya tiba di galeri, saya segera disambut oleh atmosfer yang penuh dengan energi kreatif. Ruangan yang dihiasi dengan indah memamerkan berbagai karya seni, mulai dari lukisan yang memikat hingga instalasi seni yang unik.\r','paragraph',1),(3,2,'Salah satu karya yang benar-benar mencuri perhatian saya adalah lukisan abstrak berjudul \"Perjalanan Jiwa\" karya seniman lokal, Andi Susanto. Lukisan ini memukau saya dengan penggunaan warna yang hidup dan gerakan yang dinamis, serta berhasil menyampaikan pesan yang mendalam tentang perjalanan spiritual manusia.\r','paragraph',1),(4,3,'Selain itu, saya juga terpesona dengan karya patung yang dipamerkan di galeri. Patung-patung tersebut menampilkan keahlian dan imajinasi yang luar biasa dari seniman-seniman lokal, dan saya sangat terkesan dengan detail-detail halus yang terukir di setiap patung.\r','paragraph',1),(5,4,'Selama saya menjelajahi pameran, saya juga berkesempatan untuk bertemu dan berbicara dengan beberapa seniman yang memamerkan karya mereka. Mendengarkan cerita mereka tentang inspirasi dan proses kreatif mereka sangat menginspirasi saya, dan saya merasa beruntung bisa berbagi momen tersebut dengan mereka.\r','paragraph',1),(6,5,'Secara keseluruhan, pengalaman saya di pameran seni \"Manifestasi Kreativitas\" ini sungguh memukau dan menginspirasi. \r','paragraph',1),(7,6,'Saya merasa terhubung dengan keindahan dan kekayaan budaya Yogyakarta melalui karya-karya seni yang dipamerkan, dan saya sangat berharap bisa kembali untuk mengalami momen yang luar biasa ini lagi di masa mendatang.','paragraph',1),(8,0,'Saya baru saja kembali dari sebuah petualangan budaya yang mengagumkan di Yogyakarta, di mana saya menyaksikan salah satu pertunjukan seni paling ikonik, yaitu pertunjukan wayang kulit \"Serat Menak\" di Pendopo Keraton Yogyakarta. Pengalaman ini tidak hanya mempesona, tetapi juga memberikan wawasan mendalam tentang warisan budaya yang kaya di Jawa.\r','paragraph',2),(9,1,'Ketika saya tiba di Pendopo Keraton, saya segera merasakan atmosfer yang sarat dengan sejarah dan tradisi. Pendopo yang megah dipenuhi oleh penonton dari berbagai kalangan, dari wisatawan hingga warga lokal, yang semua hadir untuk menyaksikan pertunjukan yang ditunggu-tunggu.\r','paragraph',2),(10,2,'Pertunjukan dimulai dengan ritual pembukaan yang disertai dengan penghormatan kepada leluhur dan dewa-dewa. Kemudian, dalang Ki Manteb Sudharsono muncul di balik layar wayang, siap untuk memulai pertunjukan dengan cerita \"Serat Menak\".\r','paragraph',2),(11,3,'Saya benar-benar terpesona oleh keterampilan dan bakat Ki Manteb dalam menghidupkan karakter-karakter dalam cerita. Dengan suara yang khas dan gerakan yang lincah, dia membawakan kisah epik tentang petualangan pahlawan Jawa, yang dipenuhi dengan konflik, cinta, dan keberanian.\r','paragraph',2),(12,4,'Selama pertunjukan, saya juga terpesona oleh keindahan gambaran wayang yang diproyeksikan di layar, serta musik gamelan yang mengiringi cerita. Suasana yang diciptakan oleh pertunjukan ini sungguh magis dan menghipnotis, membuat saya terbuai dan terpesona sepanjang malam.\r','paragraph',2),(13,5,'Setelah pertunjukan selesai, saya merasa terinspirasi dan terpenuhi secara spiritual. Pengalaman ini tidak hanya memberi saya kesempatan untuk menikmati seni tradisional Jawa yang luar biasa, tetapi juga mengingatkan saya akan pentingnya melestarikan warisan budaya yang berharga ini untuk generasi mendatang.\r','paragraph',2),(14,6,'Saya sangat bersyukur telah memiliki kesempatan untuk menghadiri pertunjukan wayang kulit \"Serat Menak\" ini, dan saya berharap bisa kembali lagi untuk merasakan keajaiban seni yang sama di masa mendatang.','paragraph',2),(15,0,'Saya baru saja kembali dari pengalaman yang memukau di sebuah konser musik gamelan di Pendopo Desa Kasongan, Yogyakarta. Konser ini bukan hanya tentang mendengarkan musik, tetapi juga tentang menjelajahi kekayaan budaya Jawa yang luar biasa.\r','paragraph',3),(16,1,'Ketika tiba di Pendopo Desa Kasongan, saya disambut oleh suasana yang hangat dan penuh semangat. Pendopo yang indah dihiasi dengan lampu-lampu kuning lembut, menciptakan atmosfer yang cocok untuk pengalaman musik yang mendalam.\r','paragraph',3),(17,2,'Pertunjukan dimulai dengan pengantar dari pemimpin ansambel gamelan, yang memberikan konteks dan sejarah tentang musik gamelan. Penjelasan ini membantu saya memahami lebih dalam tentang musik yang akan saya dengarkan.\r','paragraph',3),(18,3,'Kemudian, musisi mulai memainkan alat-alat gamelan dengan mahir dan semangat. Suara yang dihasilkan memenuhi ruangan dengan harmoni yang kaya dan irama yang menawan. Saya merasakan getaran musik yang kuat di setiap serat keberadaan saya.\r','paragraph',3),(19,4,'Selama pertunjukan, saya disuguhkan dengan berbagai komposisi musik yang mencakup berbagai nuansa emosi dan mood. Dari yang riang gembira hingga yang penuh dengan keheningan dan introspeksi, setiap lagu membawa saya dalam perjalanan yang mendalam melalui kekayaan budaya Jawa.\r','paragraph',3),(20,5,'Saat konser berakhir, saya merasa terinspirasi dan terpenuhi secara spiritual oleh keindahan musik gamelan yang saya alami. Pengalaman ini tidak hanya meninggalkan kesan yang mendalam dalam diri saya, tetapi juga memberi saya apresiasi yang lebih besar terhadap kekayaan seni dan budaya Yogyakarta. Saya bersyukur telah memiliki kesempatan untuk menyelami keindahan musik gamelan melalui konser \"Melodi Budaya\" ini, dan saya berharap bisa kembali lagi untuk menikmati keajaiban seni yang sama di masa mendatang.','paragraph',3),(21,0,'Saya baru saja kembali dari sebuah pengalaman seni yang luar biasa di Yogyakarta, di mana saya menyaksikan sebuah pertunjukan teater tradisional yang memukau di Taman Budaya. Pengalaman ini tidak hanya memberikan hiburan yang mempesona, tetapi juga mengangkat keindahan dan kekayaan budaya Jawa.\r','paragraph',4),(22,1,'Ketika saya tiba di Taman Budaya, saya disambut oleh atmosfer yang penuh antusiasme dan kegembiraan. Tempat duduk di ruang terbuka telah diatur rapi, siap untuk menampung penonton yang datang untuk menyaksikan pertunjukan yang ditunggu-tunggu.\r','paragraph',4),(23,2,'Pertunjukan dimulai dengan musik pengantar yang membangkitkan semangat, diikuti oleh munculnya para pemain dengan kostum tradisional yang memukau. Mereka memainkan peran-peran mereka dengan penuh dedikasi dan keahlian, membawakan kisah legenda Rama dan Shinta dengan penuh emosi dan keindahan.\r','paragraph',4),(24,3,'Saya terpesona oleh gerakan-gerakan yang anggun dan dramatis, serta dialog yang mengalir lancar dari mulut para aktor. Mereka mampu menangkap esensi dan nuansa karakter-karakter legendaris tersebut dengan sangat baik, membuat penonton terbawa dalam alur cerita yang menegangkan.\r','paragraph',4),(25,4,'Selama pertunjukan, saya juga terkesan oleh produksi panggung yang spektakuler, dengan set yang indah dan pencahayaan yang dramatis. Semuanya bekerja sama untuk menciptakan atmosfer yang magis dan memukau, membuat pengalaman menonton menjadi tak terlupakan.\r','paragraph',4),(26,5,'Ketika pertunjukan berakhir, saya merasa terinspirasi dan terpenuhi secara spiritual oleh keindahan seni tradisional yang saya saksikan. Pengalaman ini tidak hanya memberi saya kesempatan untuk menikmati pertunjukan yang luar biasa, tetapi juga meninggalkan kesan yang mendalam dalam diri saya tentang kekayaan budaya Yogyakarta.\r','paragraph',4),(27,6,'Saya sangat bersyukur telah memiliki kesempatan untuk menyaksikan pertunjukan \"Legenda Rama Shinta\" ini, dan saya berharap bisa kembali lagi untuk menikmati keajaiban seni yang sama di masa mendatang.','paragraph',4),(28,0,'Baru-baru ini, saya memiliki kesempatan luar biasa untuk menyaksikan pentas tari klasik Jawa \"Srimpi Pandhelori\" di Keraton Yogyakarta. Pengalaman ini membawa saya menyelami keindahan budaya tradisional yang penuh dengan nilai-nilai luhur dan keanggunan.\r','paragraph',5),(29,1,'Setibanya di Keraton, suasana yang tenang dan sakral menyambut saya. Pendopo Keraton dipenuhi oleh penonton yang antusias, siap untuk menikmati pertunjukan tari yang legendaris ini. Dengan latar belakang arsitektur tradisional yang megah, suasana semakin membuat saya merasa kembali ke masa lalu.\r','paragraph',5),(30,2,'Pertunjukan dimulai dengan gamelan yang memainkan nada-nada halus, menciptakan suasana yang khidmat. Para penari muncul dengan kostum tradisional yang berkilauan, gerakan mereka sangat anggun dan penuh dengan makna. Tari Srimpi Pandhelori, yang sering dipersembahkan untuk raja-raja di masa lampau, menggambarkan keindahan, ketenangan, dan keanggunan yang sempurna.\r','paragraph',5),(31,3,'Saya sangat terkesan dengan sinkronisasi gerakan para penari. Setiap gerakan tangan, langkah kaki, dan ekspresi wajah mereka seolah memiliki cerita tersendiri yang terjalin dalam alur tari yang indah. Tari ini bukan sekadar hiburan, tetapi juga media untuk menyampaikan filosofi dan nilai-nilai kehidupan masyarakat Jawa.\r','paragraph',5),(32,4,'Di tengah pertunjukan, ada bagian di mana penari melakukan gerakan yang lebih dinamis dan penuh semangat. Ini memberikan kontras yang menarik dan menunjukkan keragaman emosi yang bisa diekspresikan melalui tarian tradisional Jawa. Musik gamelan yang mengiringi juga menambah kedalaman emosi dan atmosfir pertunjukan.\r','paragraph',5),(33,5,'Ketika pertunjukan berakhir, tepuk tangan meriah dari penonton menghiasi Pendopo Keraton. Saya merasa sangat beruntung bisa menyaksikan langsung keindahan tari klasik yang kaya akan budaya dan sejarah ini. Pengalaman ini memberikan wawasan baru bagi saya tentang pentingnya melestarikan seni tradisional sebagai bagian dari identitas budaya.\r','paragraph',5),(34,6,'Saya sangat bersyukur telah memiliki kesempatan untuk menghadiri pentas tari \"Srimpi Pandhelori\" di Keraton Yogyakarta. Ini adalah pengalaman yang sangat berharga dan saya berharap bisa kembali lagi untuk menikmati berbagai bentuk keindahan seni lainnya di masa mendatang.','paragraph',5),(35,0,'Halo pembaca setia! Kali ini saya ingin berbagi pengalaman yang tak terlupakan saat menonton pertunjukan wayang kulit di Yogyakarta. Sebagai penggemar budaya Jawa, kesempatan ini adalah mimpi yang menjadi kenyataan.\r','paragraph',6),(36,1,'Pada hari Sabtu malam, saya dan teman-teman memutuskan untuk menonton wayang kulit di Pura Pakualaman. Pertunjukan ini cukup populer, jadi kami memesan tiket seminggu sebelumnya. Kami berangkat dari hotel sekitar pukul 18.00, dengan harapan bisa menikmati suasana malam Yogyakarta sebelum pertunjukan dimulai.\r','paragraph',6),(37,2,'Setibanya di lokasi, suasana sudah sangat ramai. Banyak penonton, baik wisatawan lokal maupun asing, yang antusias menunggu pertunjukan dimulai. Kami duduk di tempat yang cukup strategis, dekat dengan layar besar yang akan memproyeksikan bayangan wayang.\r','paragraph',6),(38,3,'Pertunjukan dimulai dengan iringan gamelan yang magis, membawa kami masuk ke dunia lain. Dalang mulai bercerita dengan suara yang khas dan penuh penjiwaan. Malam itu, cerita yang dibawakan adalah bagian dari Mahabharata, yang menceritakan perjuangan Pandawa melawan Kurawa.\r','paragraph',6),(39,4,'\r','paragraph',6),(40,5,'Yang membuat saya terkesan adalah detail dan keindahan wayang kulit itu sendiri. Setiap karakter memiliki gerakan dan dialog yang unik. Dalang begitu piawai menggerakkan wayang, seakan-akan mereka hidup. Musik gamelan yang mengiringi menambah kesan mistis dan mendalam.\r','paragraph',6),(41,6,'Salah satu hal yang menarik adalah interaksi antara dalang dan penonton. Sesekali dalang menyisipkan humor dalam cerita, yang membuat penonton tertawa. Bahkan, ada momen di mana beberapa penonton diajak ke atas panggung untuk mencoba memainkan wayang, yang tentu saja menjadi pengalaman tak terlupakan bagi mereka.\r','paragraph',6),(42,7,'Malam itu benar-benar membuka mata saya akan kekayaan budaya Indonesia, khususnya Yogyakarta. Wayang kulit bukan hanya sebuah pertunjukan, tetapi juga warisan budaya yang harus terus dilestarikan. Bagi kalian yang belum pernah menonton, saya sangat merekomendasikan untuk merasakan sendiri magisnya wayang kulit di Yogyakarta.','paragraph',6),(43,0,'Kali ini saya ingin membagikan pengalaman luar biasa saat menonton Sendratari Ramayana di Candi Prambanan, Yogyakarta. Sebagai penggemar cerita epik Ramayana, kesempatan untuk melihat kisah ini dihidupkan dalam bentuk tari dan drama adalah sesuatu yang sangat saya nantikan.\r','paragraph',7),(44,1,'Saya dan teman-teman tiba di Candi Prambanan sekitar pukul 18.00. Matahari sudah mulai tenggelam, menciptakan suasana yang magis dengan latar belakang candi yang megah. Kami memutuskan untuk mengelilingi area candi terlebih dahulu, menikmati keindahan arsitektur dan merasakan aura sejarah yang kuat.\r','paragraph',7),(45,2,'Pertunjukan dimulai pukul 19.30. Kami duduk di tribun yang telah disediakan, dengan pandangan langsung ke panggung besar yang berlatar belakang Candi Prambanan. Lampu-lampu sorot mulai menyala, menyoroti detail candi dan menciptakan suasana yang sangat dramatis.\r','paragraph',7),(46,3,'Begitu gamelan mulai dimainkan, saya langsung terpukau. Musik tradisional Jawa ini memberikan nuansa yang mendalam, membawa penonton masuk ke dalam dunia Ramayana. Para penari mulai memasuki panggung dengan gerakan yang anggun dan penuh makna, menggambarkan karakter-karakter dari cerita Ramayana seperti Rama, Sinta, dan Rahwana.\r','paragraph',7),(47,4,'Salah satu momen yang paling berkesan adalah ketika Hanuman, sang kera putih, muncul di panggung. Dengan gerakan yang lincah dan penuh semangat, Hanuman berhasil menghidupkan suasana pertunjukan. Adegan pertempuran antara pasukan Rama dan Rahwana juga sangat memukau, dengan koreografi yang apik dan tata cahaya yang menambah dramatisasi cerita.\r','paragraph',7),(48,5,'Interaksi antara penari dan penonton juga cukup menarik. Sesekali, narator menjelaskan bagian-bagian penting dari cerita, membuat penonton yang tidak familiar dengan kisah Ramayana tetap bisa mengikuti alur cerita dengan baik.\r','paragraph',7),(49,6,'Malam itu terasa sangat cepat berlalu. Saya benar-benar terpesona oleh keindahan tarian, musik, dan cerita yang disajikan. Sendratari Ramayana bukan hanya sebuah pertunjukan, tetapi sebuah pengalaman budaya yang sangat mendalam. Saya merasa sangat beruntung bisa menyaksikan salah satu kekayaan budaya Indonesia ini di tempat asalnya.\r','paragraph',7),(50,7,'\r','paragraph',7),(51,8,'','paragraph',7);
/*!40000 ALTER TABLE `blog_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumbnail_img` varchar(255) DEFAULT NULL,
  `creator_id` int NOT NULL,
  `upload_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `likes` int DEFAULT '0',
  `views` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'Pengalaman Memukau di Pameran Seni \"Manifestasi Kreativitas\" di Galeri Seni Murni Yogyakarta','assets/blogs/1719070235169-20713699.jpg',3,'2024-06-22 23:30:35',1,4),(2,'Menyaksikan Keajaiban Seni di Pertunjukan Wayang Kulit \"Serat Menak\" di Pendopo Keraton Yogyakarta','assets/blogs/1719070503248-238613351.jpg',3,'2024-06-22 23:35:03',0,0),(3,'Menyelami Keindahan Musik Gamelan di Konser \"Melodi Budaya\" di Pendopo Desa Kasongan, Yogyakarta','assets/blogs/1719070563158-528162449.jpg',3,'2024-06-22 23:36:03',0,0),(4,'Menyaksikan Keajaiban Pertunjukan Teater Tradisional \"Legenda Rama Shinta\" di Taman Budaya Yogyakarta','assets/blogs/1719070612596-572876115.jpg',3,'2024-06-22 23:36:52',0,0),(5,'Pengalaman Magis di Pentas Tari Klasik Jawa \"Srimpi Pandhelori\" di Keraton Yogyakarta','assets/blogs/1719070726488-861940597.jpg',6,'2024-06-22 23:38:46',1,1),(6,'Pengalaman Menonton Pertunjukan Wayang Kulit di Yogyakarta','assets/blogs/1719070774630-496590160.jpg',6,'2024-06-22 23:39:34',0,2),(7,'Pengalaman Menyaksikan Sendratari Ramayana di Prambanan','assets/blogs/1719070840971-138227642.jpg',6,'2024-06-22 23:40:40',0,0);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_favorite_list`
--

DROP TABLE IF EXISTS `blogs_favorite_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_favorite_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blogs_favorite_list_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `blogs_favorite_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_favorite_list`
--

LOCK TABLES `blogs_favorite_list` WRITE;
/*!40000 ALTER TABLE `blogs_favorite_list` DISABLE KEYS */;
INSERT INTO `blogs_favorite_list` VALUES (1,5,6),(2,1,6);
/*!40000 ALTER TABLE `blogs_favorite_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comunity_name` varchar(255) DEFAULT NULL,
  `comunity_description` text,
  `thumbnail_img` varchar(255) DEFAULT NULL,
  `logo_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comunity_name` (`comunity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'UKJGS UGM','Unit kesenian Jawa Gaya Surakarta Universitas Gadjah Mada','assets/communities/thumbnail/1.png','assets/communities/logo/1.png'),(2,'SWAGAYUGAMA UGM','Unit Kesenian Gaya Yogyakarta Universitas Gadjah Mada','assets/communities/thumbnail/2.png','assets/communities/logo/2.png'),(3,'KAMASETRA UNY','Keluarga Mahasiswa Senin Tradisi Universitas Negri Yogyakarta','assets/communities/thumbnail/3.png','assets/communities/logo/3.png');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_activity`
--

DROP TABLE IF EXISTS `communities_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community_id` int NOT NULL,
  `activity_name` varchar(255) DEFAULT NULL,
  `activity_img` varchar(255) DEFAULT NULL,
  `activity_description` text,
  PRIMARY KEY (`id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `communities_activity_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_activity`
--

LOCK TABLES `communities_activity` WRITE;
/*!40000 ALTER TABLE `communities_activity` DISABLE KEYS */;
INSERT INTO `communities_activity` VALUES (1,1,'Pementasan','assets/communities/activities/1.png','Pementasan skala besar yang diadakan berkala setiap tahunnya, dalam satu periode terdapat 3 pentas utama yaitu Gladhi Madya, Ramayana Prambanan dan Ambal Warsa'),(2,1,'Pelatihan','assets/communities/activities/2.png','Pelatihan rutin sebanyak dua kali seminggu untuk divisi tari dan karawitan pedhalangan (tari setiap selasa dan kamis dan karawitan pedhalangan setiap senin dan rabu)'),(3,1,'Workshop','assets/communities/activities/3.png','Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM'),(4,2,'Penilaian Kompetensi','assets/communities/activities/4.png','Pementasan skala besar  yang diadakan berkala setiap tahunnya, dalam satu periode terdapat 3 pentas utama yaitu Gladhi Madya, Ramayana Prambanan dan Ambal Warsa'),(5,2,'Pelatihan','assets/communities/activities/5.png','Pelatihan rutin sebanyak dua kali seminggu untuk divisi tari dan karawitan pedhalangan (tari setiap selasa dan kamis dan karawitan pedhalangan setiap senin dan rabu)'),(6,2,'Seminar Karawitan','assets/communities/activities/6.png','Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM'),(7,3,'Pementasan','assets/communities/activities/7.png','Pementasan skala besar  yang diadakan berkala setiap tahunnya, dalam satu periode terdapat 3 pentas utama yaitu Gladhi Madya, Ramayana Prambanan dan Ambal Warsa'),(8,3,'Pelatihan','assets/communities/activities/8.png','Pelatihan rutin sebanyak dua kali seminggu untuk divisi tari dan karawitan pedhalangan (tari setiap selasa dan kamis dan karawitan pedhalangan setiap senin dan rabu)'),(9,3,'Penerimaan Anggota ','assets/communities/activities/9.png','Kegiatan pelatihan khusus yang diselenggarakan untuk meningkatkan pengetahuan dan keterampilan anggota UKM');
/*!40000 ALTER TABLE `communities_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_behind_gallery`
--

DROP TABLE IF EXISTS `communities_behind_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_behind_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community_id` int NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `communities_behind_gallery_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_behind_gallery`
--

LOCK TABLES `communities_behind_gallery` WRITE;
/*!40000 ALTER TABLE `communities_behind_gallery` DISABLE KEYS */;
INSERT INTO `communities_behind_gallery` VALUES (1,1,'assets/communities/gallery/behind_the_scene/1.png'),(2,1,'assets/communities/gallery/behind_the_scene/2.jpg'),(3,1,'assets/communities/gallery/behind_the_scene/3.jpg'),(4,2,'assets/communities/gallery/behind_the_scene/4.JPG'),(5,2,'assets/communities/gallery/behind_the_scene/5.JPG'),(6,2,'assets/communities/gallery/behind_the_scene/6.JPG'),(7,3,'assets/communities/gallery/behind_the_scene/7.jpg'),(8,3,'assets/communities/gallery/behind_the_scene/8.jpg');
/*!40000 ALTER TABLE `communities_behind_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_detail`
--

DROP TABLE IF EXISTS `communities_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community_id` int NOT NULL,
  `comunity_detail` text,
  `leader_name` varchar(255) DEFAULT NULL,
  `leader_img` varchar(255) DEFAULT NULL,
  `leader_desc` text,
  PRIMARY KEY (`id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `communities_detail_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_detail`
--

LOCK TABLES `communities_detail` WRITE;
/*!40000 ALTER TABLE `communities_detail` DISABLE KEYS */;
INSERT INTO `communities_detail` VALUES (1,1,'UKJGS UGM atau Unit Kesenian Jawa Gaya Surakarta Universitas Gadjah Mada lahir pada 19 Desember 1968 sebagai salah satu unit kegiatan mahasiswa yang menjadi wadah bagi mahasiswa Universitas Gadjah Mada yang ingin mengembangkan potensi diri dalam bidang seni tari, karawitan, dan pedhalangan.','Rossi Firmansyah','assets/communities/leaders/1.png','Dia adalah ketua UKJGS UGM (Unit Kesenian Jawa Gaya Surakarta Universitas Gadjah Mada) yang berdedikasi tinggi dalam melestarikan dan memperkenalkan budaya Yogyakarta. Dengan pengalaman bertahun-tahun dalam seni tradisional, Rossi memimpin komunitas ini dengan semangat dan visi yang kuat untuk menginspirasi generasi muda agar mencintai dan menjaga warisan dan budaya.'),(2,2,'UKM Swagayugama (Unit Kegiatan Mahasiswa Seni Jawa Gaya Yogyakarta Universitas Gadjah Mada) ini berdiri pada 6 Maret 1968 yang merupakan organisasi kemahasiswaan intra-universitas yang berperan sebagai wadah para penggiat kesenian Jawa Klasik Gaya Yogyakarta bagi civitas akademika Universitas Gadjah Mada, baik yang masih berstatus mahasiswa maupun alumni yang sungguh-sungguh dalam menekuni bidang yang dilestarikan oleh UKM ini, yaitu tari klasik dan karawitan dengan gendhing-gendhing klasik Karaton Ngayogyakarta Hadiningrat.','Theafila Natalia','assets/communities/leaders/2.png','menjadi bagian swagayaguma di periode pengurusan 2024 adalah fase hidup yang luar biasa, mengetuai suatu UKM yang umurnya lebih dari 60 tahun ialah suatau kebganggan sendiri, mengembanngkan SDM sekaligus “menguri nguri” budaya adalah visi utama UKM kami'),(3,3,'Unit Kegiatan Mahasiswa (UKM) Keluarga Mahasiswa Seni Tradisi (KAMASETRA) Universitas Negeri Yogyakarta adalah salah satu UKM di UNY yang bergerak dalam bidang seni tradisi khususnya seni tradisional Jawa. UKM ini terdiri dari empat bidang seni, yakni Bidang Tari, Bidang Karawitan, Bidang Pedhalangan, serta Bidang Teater Tradisi. Adapun bidang non seni di UKM KAMASETRA ada Bidang Litbang (Penelitian dan Pengembangan), Bidang Sarpras (Sarana dan Prasarana), Bidang Kesra (Kesejahteraan Warga)','Dhimas Sadam Saputro','assets/communities/leaders/3.png','Dia adalah ketua KAMASETRA UNY yang berdedikasi tinggi dalam melestarikan dan memperkenalkan budaya Yogyakarta. Dengan pengalaman bertahun-tahun dalam seni tradisional, Rossi memimpin komunitas ini dengan semangat dan visi yang kuat untuk menginspirasi generasi muda agar mencintai dan menjaga warisan dan budaya.');
/*!40000 ALTER TABLE `communities_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_performance_gallery`
--

DROP TABLE IF EXISTS `communities_performance_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_performance_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community_id` int NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `communities_performance_gallery_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_performance_gallery`
--

LOCK TABLES `communities_performance_gallery` WRITE;
/*!40000 ALTER TABLE `communities_performance_gallery` DISABLE KEYS */;
INSERT INTO `communities_performance_gallery` VALUES (1,1,'assets/communities/gallery/performance/1.png'),(2,1,'assets/communities/gallery/performance/2.jpg'),(3,1,'assets/communities/gallery/performance/3.JPG'),(4,2,'assets/communities/gallery/performance/4.JPG'),(5,2,'assets/communities/gallery/performance/5.JPG'),(6,2,'assets/communities/gallery/performance/6.JPG'),(7,3,'assets/communities/gallery/performance/7.jpg'),(8,3,'assets/communities/gallery/performance/8.jpg');
/*!40000 ALTER TABLE `communities_performance_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_gallery`
--

DROP TABLE IF EXISTS `event_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_gallery_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_gallery`
--

LOCK TABLES `event_gallery` WRITE;
/*!40000 ALTER TABLE `event_gallery` DISABLE KEYS */;
INSERT INTO `event_gallery` VALUES (1,1,'assets/events/gallery/1.png'),(2,1,'assets/events/gallery/2.png'),(3,1,'assets/events/gallery/3.png'),(4,1,'assets/events/gallery/4.png'),(5,1,'assets/events/gallery/5.png'),(6,1,'assets/events/gallery/6.png'),(7,2,'assets/events/gallery/1.png'),(8,2,'assets/events/gallery/2.png'),(9,2,'assets/events/gallery/3.png'),(10,2,'assets/events/gallery/4.png'),(11,2,'assets/events/gallery/5.png'),(12,2,'assets/events/gallery/6.png'),(13,4,'assets/events/gallery/1.png'),(14,4,'assets/events/gallery/2.png'),(15,4,'assets/events/gallery/3.png'),(16,4,'assets/events/gallery/4.png'),(17,4,'assets/events/gallery/5.png'),(18,4,'assets/events/gallery/6.png'),(19,5,'assets/events/gallery/1.png'),(20,5,'assets/events/gallery/2.png'),(21,5,'assets/events/gallery/3.png'),(22,5,'assets/events/gallery/4.png'),(23,5,'assets/events/gallery/5.png'),(24,5,'assets/events/gallery/6.png'),(25,3,'assets/events/gallery/1.png'),(26,3,'assets/events/gallery/2.png'),(27,3,'assets/events/gallery/3.png'),(28,3,'assets/events/gallery/4.png'),(29,3,'assets/events/gallery/5.png'),(30,3,'assets/events/gallery/6.png');
/*!40000 ALTER TABLE `event_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_schedules`
--

DROP TABLE IF EXISTS `event_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `event_detail` varchar(255) DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_schedules_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_schedules`
--

LOCK TABLES `event_schedules` WRITE;
/*!40000 ALTER TABLE `event_schedules` DISABLE KEYS */;
INSERT INTO `event_schedules` VALUES (1,1,'Sambutan dan pengenalan pertunjukan','19:00:00','19:30:00'),(2,1,'Pertunjukan wayang kulit','19:30:00','21:30:00'),(3,1,'Pertunjukan penutup acara','21:30:00','22:00:00'),(4,2,'Sambutan dan pengenalan pertunjukan','19:00:00','19:30:00'),(5,2,'Pertunjukan wayang kulit','19:30:00','21:30:00'),(6,2,'Pertunjukan penutup acara','21:30:00','22:00:00'),(7,3,'Sambutan dan pengenalan pertunjukan','19:00:00','19:30:00'),(8,3,'Penampilan tari tradisional','19:30:00','20:00:00'),(9,3,'Pertunjukan Uyon-uyon oleh Paguyuban Puspito Laras','20:00:00','22:30:00'),(10,3,'Pertunjukan penutup acara','22:30:00','23:00:00'),(11,4,'Pembukaan acara oleh MC dan Sambutan dari panitia','19:00:00','19:30:00'),(12,4,'Penampilan tari tradisional','19:30:00','20:00:00'),(13,4,'Pertunjukan wayang golek \"Semar Gugur\" oleh Ki. M. Ry. Cermo Kandhawijaya','20:00:00','22:30:00'),(14,4,'Pertunjukan penutup acara','22:30:00','23:00:00'),(15,5,'Pembukaan acara oleh MC dan Sambutan dari panitia','19:00:00','19:30:00'),(16,5,'Penambilan tari pembukaan','19:30:00','20:00:00'),(17,5,'Pertunjukan Fragmen Wayang Wong \"Bedhah Alengka\" oleh Paguyuban Kesenian Suryo Kencono','20:00:00','22:30:00'),(18,5,'Pertunjukan penutup acara','22:30:00','23:00:00');
/*!40000 ALTER TABLE `event_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `event_description` text,
  `event_location` varchar(255) DEFAULT NULL,
  `event_location_detail` varchar(255) DEFAULT NULL,
  `event_thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Gladhi Madya 2024','2024-07-06 19:00:00','Dalam acara Gladhi Madya disajikan beberapa tarian yaitu Tari Putri Gambyong Pareanom, Tari Putri Golek Manis, Tari Putri Dombanini dan Tari Putra Gunung Sari yang dikemas dalam bentuk repertoar drama. Dalam acara Gladhi Madya disajikan beberapa tarian yaitu Tari Putri Gambyong Pareanom, Tari Putri Golek Manis, Tari Putri Dombanini dan Tari Putra Gunung Sari yang dikemas dalam bentuk repertoar drama.','DIY','Pendapa Taman Siswa','assets/events/thumbnail/1.webp'),(2,'Pertunjukan Wayang Kulit oleh Ki Dalang Cermo Taksoko','2024-07-22 19:00:00','Kisah epik Mahabharata kembali hadir dalam pertunjukan wayang kulit yang memukau oleh Ki Dalang Cermo Taksoko. Kali ini, pertunjukan akan mengangkat kisah Pandawa Lima dalam pencarian mereka untuk mendapatkan pusaka-pusaka dewa.','Yogyakarta','Pendopo Agung Keraton','assets/events/thumbnail/2.webp'),(3,'Pertunjukan Uyon-Uyon dan Tari Tradisional oleh Paguyuban Puspito Laras','2024-07-24 19:00:00','Paguyuban Puspito Laras kembali menghadirkan pertunjukan seni Uyon-Uyon dan Tari Tradisional Nusantara yang memukau. Uyon-Uyon, seni tradisional Jawa Timur yang memadukan musik, tari, dan lawak, akan dibawakan dengan penuh semangat dan humor oleh para penari dan pemain musik Paguyuban Puspito Laras.','Yogyakarta','Aula Gedung Kesenian','assets/events/thumbnail/3.webp'),(4,'Pertunjukan Wayang Golek oleh Ki. M.Ry. Cermo Kandhawijaya','2024-07-16 19:00:00','Ki. M.Ry. Cermo Kandhawijaya, dalang wayang golek ternama dari Jawa Tengah, akan kembali menghibur masyarakat Surabaya dengan pertunjukannya yang memukau. Kali ini, pertunjukan akan mengangkat kisah Setyo Wati, seorang putri cantik yang mencari cinta sejati.','Kraton Yogyakarta','Pendopo Agung','assets/events/thumbnail/4.webp'),(5,'Fragmen Wayang Wong oleh Paguyuban Kesenian Suryo Kencono','2024-08-05 19:00:00','Fragmen Bedhah Alengka menceritakan kisah klimaks dalam pewayangan Jawa, yaitu pertempuran antara Rama dan pasukannya melawan Rahwana dan pasukan raksasa di Alengka. Pertunjukan ini akan menampilkan adegan-adegan penuh aksi dan heroik, seperti pertarungan antara Rama dan Rahwana, jatuhnya Kumbakarna, dan akhirnya terbebasnya Dewi Shinta dari cengkeraman Rahwana.','Keraton Yogyakarta','Bangsal Srimanganti','assets/events/thumbnail/5.webp');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder_lists`
--

DROP TABLE IF EXISTS `reminder_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminder_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reminder_lists_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `reminder_lists_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder_lists`
--

LOCK TABLES `reminder_lists` WRITE;
/*!40000 ALTER TABLE `reminder_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail.com','$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y','assets/users/default.png',1),(2,'user','user@gmail.com','$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y','assets/users/default.png',0),(3,'Nicholas Sullivan','nicholas.sullivan@gmail.com','$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y','assets/users/3.jpg',0),(4,'Harold Gomez','harold.gomez@gmail.com','$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y','assets/users/4.png',0),(5,'Raymond White','raymond.white@gmail.com','$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y','assets/users/5.png',0),(6,'Ken Larson','ken.larson@gmail.com','$2b$10$GWzxe91uLp2U7xEhVnpTfusaJgQFp5xTRo6MQBOkxmJ2gcxRIeG6y','assets/users/6.png',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 23:43:03
