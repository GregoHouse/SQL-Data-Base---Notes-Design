drop database  if exists notes_microDesafio; 
create database notes_microDesafio;
use notes_microDesafio;

--
-- Table structure for table `users`
--

drop table if exists `users`; 
create table `users` (
`id` int(10) unsigned not null auto_increment,
`user_fullName` varchar(50) collate utf8_unicode_ci not null,
`user_email` varchar(255) collate utf8_unicode_ci unique not null,
primary key (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `actors`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Gregorio Romero','gromero@gmail.com'),(2,'Homero Simpson','hsimpson@gmail.com'),(3,'Batman Aron','baron@gmail.com'),(4,'Robin Hood','rhood@gmail.com'),(5,'Pinguino Beer','pbeer@gmail.com'),(6,'Acertijo Ya','aya@gmail.com'),(7,'Wason Verde','wverde@gmail.com'),(8,'Bati Chica','bchica@gmail.com'),(9,'Flash man','fman@gmail.com'),(10,'Iron man','iman@gmail.com');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

drop table if exists `notes`;
create table `notes` (
`id` int(10) unsigned not null auto_increment,
`note_title`varchar(100) collate utf8_unicode_ci not null,
`note_create_date` date null default null,
`note_update_date` date null default null,
`note_description` text not null,
`note_delete_option` bit,
`user_id` int(10) unsigned not null,
primary key (`id`),
key `notes_user_id_foreign` (`user_id`),
constraint `notes_user_id_foreign` FOREIGN key (`user_id`) references `users` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Recordatorio Comercial','2011-01-01', '2012-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',1,5),(2,'Recordatorio Administracion','2012-01-01', '2013-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',0,1),(3,'Recordatorio Marketing','2013-01-01', '2014-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',0,2),(4,'Recordatorio Gerencia','2014-01-01', '2015-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',1,3),(5,'Recordatorio Operaciones','2015-01-01', '2016-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',0,4),(6,'Recordatorio Atencion al cliente','2016-01-01', '2017-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',0,6),(7,'Recordatorio Logísitica','2018-01-01', '2019-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',1,7),(8,'Recordatorio Sistemas','2019-01-01', '2020-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',1,8),(9,'Recordatorio Deposito','2020-01-01', '2021-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',0,9),(10,'Recordatorio Programacion','2021-01-01', '2022-01-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum corporis, ullam reiciendis nisi error aut ab beatae',0,10);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_category`
--

drop table if exists `note_category`;
create table `note_category` (
`id` int(10) unsigned not null auto_increment,
`category_id` int(10) unsigned not null,
`note_id` int(10) unsigned not null,
primary key (`id`),
key `note_category_category_id_foreign` (`category_id`),
key `note_category_note_id_foreign` (`note_id`),
constraint `note_category_category_id_foreign` foreign key (`category_id`) references `categories` (`id`),
constraint `note_category_note_id_foreign` foreign key (`note_id`) references `notes` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `note_category`
--

LOCK TABLES `note_category` WRITE;
/*!40000 ALTER TABLE `note_category` DISABLE KEYS */;
INSERT INTO `note_category` VALUES (1,7,4),(2,3,1),(3,2,9),(4,1,3),(5,9,10),(6,5,4),(7,8,6),(8,4,10),(9,6,1),(10,7,1);
/*!40000 ALTER TABLE `note_category` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `categories`
--

drop table if exists `categories`;
create table `categories` (
`id` int(10) unsigned not null auto_increment,
`category_title` varchar(100) collate utf8_unicode_ci not null,
primary key (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Aviso'),(2,'Tarea'),(3,'Alerta'),(4,'Notificacion'),(5,'Urgente'),(6,'Prioritario'),(7,'Sin Asignar'),(8,'Pendiente'),(9,'Aprobado'),(10,'Rechazado');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;