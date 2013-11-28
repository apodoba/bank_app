dataart
=======
run script 

CREATE USER dataart@localhost identified BY '1234';
GRANT usage ON *.* TO dataart@localhost identified BY '1234';
CREATE DATABASE IF NOT EXISTS bank;
GRANT ALL privileges ON bank.* TO dataart@localhost;
USE bank;
CREATE TABLE `USERS` (
  `USER_ID` INT(10) UNSIGNED NOT NULL,
  `USERNAME` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(45) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `USER_ROLES` (
  `USER_ROLE_ID` INT(10) UNSIGNED NOT NULL,
  `USER_ID` INT(10) UNSIGNED NOT NULL,
  `ROLE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `FK_user_roles` (`USER_ID`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO USERS (USER_ID, USERNAME,PASSWORD, ENABLED)
VALUES (100, 'admin', '123456', TRUE);
 
INSERT INTO USER_ROLES (USER_ROLE_ID, USER_ID,ROLE)
VALUES (1, 100, 'ROLE_ADMIN');