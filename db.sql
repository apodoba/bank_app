CREATE USER dataart@localhost identified BY '1234';
GRANT usage ON *.* TO dataart@localhost identified BY '1234';
CREATE DATABASE IF NOT EXISTS bank;
GRANT ALL privileges ON bank.* TO dataart@localhost;
USE bank;

CREATE TABLE `USERS` (
  `USER_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL,
  `PHONE` varchar(45) NOT NULL,
  `FULL_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE USER_ROLES ( 
USER_ROLE_ID INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
USER_ID INT(10) UNSIGNED NOT NULL, 
ROLE VARCHAR(45) NOT NULL, 
PRIMARY KEY (USER_ROLE_ID), KEY FK_user_roles (USER_ID), 
CONSTRAINT FK_user_roles FOREIGN KEY (USER_ID) REFERENCES users (USER_ID) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CURRENCY_TYPE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SERVICES` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ACCOUNTS ( 
`ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
`NAME` VARCHAR(45) NOT NULL, 
`USER_ID` INT(10) UNSIGNED NOT NULL, 
`BALANCE` DOUBLE, 
CURRENCY_TYPE_ID INT(10) UNSIGNED NOT NULL, 
PRIMARY KEY (`ID`), 
KEY FK_user (`USER_ID`), 
CONSTRAINT FK_user FOREIGN KEY (`USER_ID`) REFERENCES users (`USER_ID`),
KEY FK_currency_type (`CURRENCY_TYPE_ID`), 
CONSTRAINT FK_currency_type FOREIGN KEY (`CURRENCY_TYPE_ID`) REFERENCES CURRENCY_TYPE (`ID`) ) 
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TRANSACTION_TYPE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE TRANSACTIONS ( 
`ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, 
`ACCOUNT_ID` INT(10) UNSIGNED NOT NULL, 
`TRANSACTION_TYPE_ID` INT(10) UNSIGNED NOT NULL, 
`DATE` TIMESTAMP, 
`AMOUNT` DOUBLE, 
`DESCRIPTION` VARCHAR(45), 
PRIMARY KEY (`ID`), 
KEY FK_account (`ACCOUNT_ID`), 
CONSTRAINT FK_account FOREIGN KEY (`ACCOUNT_ID`) REFERENCES ACCOUNTS (`ID`),
KEY FK_transacton_type (`TRANSACTION_TYPE_ID`), 
CONSTRAINT FK_transacton_type FOREIGN KEY (`TRANSACTION_TYPE_ID`) REFERENCES TRANSACTION_TYPE (`ID`) ) 
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO users (USER_ID, USERNAME,PASSWORD, ENABLED, PHONE, FULL_NAME)
VALUES (100, 'admin', '123456', TRUE, '09377854235', 'петров');
 
INSERT INTO user_roles (USER_ROLE_ID, USER_ID,ROLE)
VALUES (1, 100, 'ROLE_ADMIN');