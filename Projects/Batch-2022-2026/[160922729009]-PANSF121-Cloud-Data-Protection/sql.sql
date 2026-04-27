/*
SQLyog Ultimate v9.20 
MySQL - 5.0.22-community-nt : Database - erasurecode
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erasurecode` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `erasurecode`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(30) default NULL,
  `password` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('deva','deva'),('admin','admin');

/*Table structure for table `gender` */

DROP TABLE IF EXISTS `gender`;

CREATE TABLE `gender` (
  `Gender` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gender` */

insert  into `gender`(`Gender`) values ('Male'),('Female');

/*Table structure for table `ownerprofile` */

DROP TABLE IF EXISTS `ownerprofile`;

CREATE TABLE `ownerprofile` (
  `UserName` varchar(35) default NULL,
  `groupname` varchar(35) default NULL,
  `filename` varchar(700) NOT NULL,
  `server1` varchar(100) default NULL,
  `server2` varchar(100) default NULL,
  `server3` varchar(100) default NULL,
  `server4` varchar(100) default NULL,
  PRIMARY KEY  (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ownerprofile` */

insert  into `ownerprofile`(`UserName`,`groupname`,`filename`,`server1`,`server2`,`server3`,`server4`) values ('suriya','suriya','Activity.jpg','440cb9d54ede8e664b77d16c2777ee8760004eaa','440cb9d54ede8e664b77d16c2777ee8760004eaakey1','440cb9d54ede8e664b77d16c2777ee8760004eaakey2','440cb9d54ede8e664b77d16c2777ee8760004eaakey3'),('ram','ram','pic4.jpg','8d9cc5547f18f77677fd601fc0751b9ed94db5cf','8d9cc5547f18f77677fd601fc0751b9ed94db5cfkey1','8d9cc5547f18f77677fd601fc0751b9ed94db5cfkey2','8d9cc5547f18f77677fd601fc0751b9ed94db5cfkey3');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `username` varchar(30) default NULL,
  `password` varchar(30) default NULL,
  `gender` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `phoneno` varchar(50) default NULL,
  `userproductkey` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`username`,`password`,`gender`,`email`,`phoneno`,`userproductkey`) values ('ram','ram','male','chennai.java@pantechmail.com','1234222222','asdfasdfasdfasdf'),('tambi','t','male','tambi@gmail.com','9789403430','1234567812345678'),('suriya','s','male','us@gmail.com','9789403430','thebestsecretkey');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
