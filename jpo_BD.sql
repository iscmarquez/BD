
CREATE DATABASE IF NOT EXISTS `instit43_jpo_test` DEFAULT CHARACTER SET utf8 ;

Use  instit43_jpo_test;
-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event` (
  `idEvent` INT(11) NOT NULL AUTO_INCREMENT,
  `startDate` DATETIME NOT NULL,
  `nomEvent` VARCHAR(255) NULL DEFAULT NULL,
  `idUser` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idEvent`),
  CONSTRAINT `User_Event`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chat` (
  `idChat` INT(11) NOT NULL AUTO_INCREMENT,
  `idEvent` INT(11) NOT NULL,
  `idUser` VARCHAR(255) NULL,
  PRIMARY KEY (`idChat`),
  CONSTRAINT `Chat_Event`
    FOREIGN KEY (`idEvent`)
    REFERENCES `event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Chat_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`speaker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speaker` (
  `idSpeaker` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `photoLink` VARCHAR(255) NOT NULL,
  `chat` TINYINT(1) NOT NULL,
  `linkchat` VARCHAR(255) NOT NULL,
  `idUser` VARCHAR(225)  NULL,
  PRIMARY KEY (`idSpeaker`),
  CONSTRAINT `Speaker_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`conference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conference` (
  `idConference` INT(11) NOT NULL AUTO_INCREMENT,
  `nameConference` VARCHAR(255) NOT NULL,
  `idEvent` INT(11) NOT NULL,
  `idSpeaker` INT(11) NOT NULL,
  `start` VARCHAR(5) NOT NULL,
  `end` VARCHAR(5) NOT NULL,
  `linkConference` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255)  NULL,
  PRIMARY KEY (`idConference`),
  CONSTRAINT `Event_Conference`
    FOREIGN KEY (`idEvent`)
    REFERENCES `event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Speaker_Conference`
    FOREIGN KEY (`idSpeaker`)
    REFERENCES `speaker` (`idSpeaker`)
    ON DELETE NO ACTION,
  CONSTRAINT `User_Conference`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration` (
  `linkVirtualVisit` VARCHAR(255) NOT NULL,
  `linkFAQ` VARCHAR(255) NOT NULL,
  `endMessage` VARCHAR(255) NOT NULL,
  `welcomeTitle` VARCHAR(100) NOT NULL,
  `welcomeSubTitle` VARCHAR(100) NOT NULL,
  `welcomeText` VARCHAR(500) NOT NULL,
  `noEvent` VARCHAR(255) NOT NULL,
  `video1` VARCHAR(255) NOT NULL,
  `video2` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  CONSTRAINT `User_Configuration`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`conversations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conversations` (
  `idChat` INT(11) NOT NULL,
  `idInscription` VARCHAR(255) NOT NULL,
  `Date` DATETIME NOT NULL,
  `conversations` LONGTEXT NOT NULL,
  PRIMARY KEY (`idChat`),
  CONSTRAINT `idChat`
    FOREIGN KEY (`idChat`)
    REFERENCES `chat` (`idChat`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`downloadable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `downloadable` (
  `idDownloadable` INT(11) NOT NULL AUTO_INCREMENT,
  `fileImage` VARCHAR(255) NULL DEFAULT NULL,
  `fileLink` VARCHAR(255) NULL DEFAULT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idDownloadable`),
  CONSTRAINT `User_Dowloadable`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inscription` (
  `mail` VARCHAR(255) NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `moyenCommunication` VARCHAR(45) NOT NULL,
  `consentMessage` TINYINT(4) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`mail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `program` (
  `idProgram` INT(11) NOT NULL AUTO_INCREMENT,
  `programDescription` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255)  NULL,
  PRIMARY KEY (`idProgram`),
  CONSTRAINT `User_Program`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`interestingprogrammes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interestingprogrammes` (
  `mail` VARCHAR(255) NOT NULL,
  `idProgram` INT(11) NOT NULL,
  PRIMARY KEY (`mail`, `idProgram`),
  CONSTRAINT `Inscription_Interesting`
    FOREIGN KEY (`mail`)
    REFERENCES `inscription` (`mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Inscription_Programmes`
    FOREIGN KEY (`idProgram`)
    REFERENCES `program` (`idProgram`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`guests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guests` (
 `idguests` INT(11) NOT NULL AUTO_INCREMENT,
  `dateAdmission` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idguests`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;