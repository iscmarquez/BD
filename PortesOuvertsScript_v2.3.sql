-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema instit43_jpo_test_1.0
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema instit43_jpo_test_1.0
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `instit43_jpo_test_1.0` DEFAULT CHARACTER SET utf8 ;
USE `instit43_jpo_test_1.0` ;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`User` (
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Event` (
  `idEvent` INT NOT NULL AUTO_INCREMENT,
  `startDate` DATETIME NOT NULL,
  `nomEvent` VARCHAR(255) NULL,
  `idUser` VARCHAR(255) NULL,
  PRIMARY KEY (`idEvent`),
  CONSTRAINT `User_Event`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Program` (
  `idProgram` INT NOT NULL AUTO_INCREMENT,
  `programDescription` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idProgram`),
  CONSTRAINT `User_Program`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Downloadable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Downloadable` (
  `idDownloadable` INT NOT NULL AUTO_INCREMENT,
  `fileImage` VARCHAR(255) NULL,
  `fileLink` VARCHAR(255) NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idDownloadable`),
  CONSTRAINT `User_Dowloadable`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION
 )
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Configuration` (
  `linkVirtualVisit` VARCHAR(255) NOT NULL,
  `linkFAQ` VARCHAR(255) NOT NULL,
  `endMessage` VARCHAR(255) NOT NULL,
  `noEvent` VARCHAR(255) NOT NULL,
   `video1` VARCHAR(255) NOT NULL,
    `video2` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  CONSTRAINT `User_Configuration`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Inscription` (
  `mail` VARCHAR(255) NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NULL,
  `phone` VARCHAR(100) NOT NULL,
  `moyenCommunication` VARCHAR(45) NOT NULL,
  `consentMessage` TINYINT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`mail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Speaker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Speaker` (
  `idSpeaker` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `chat` bool,
  `photoLink` VARCHAR(255) NOT NULL,
  `idUser` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`idSpeaker`),
  CONSTRAINT `Speaker_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Conference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Conference` (
  `idConference` INT NOT NULL AUTO_INCREMENT,
  `nameConference` VARCHAR(255) NOT NULL,
  `idEvent` INT NOT NULL,
  `idSpeaker` INT NOT NULL,
  `start` VARCHAR(5) NOT NULL,
  `end` VARCHAR(5) NOT NULL,
  `linkConference` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idConference`),
  CONSTRAINT `Event_Conference`
    FOREIGN KEY (`idEvent`)
    REFERENCES `instit43_jpo_test_1.0`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Speaker_Conference`
    FOREIGN KEY (`idSpeaker`)
    REFERENCES `instit43_jpo_test_1.0`.`Speaker` (`idSpeaker`)
    ON DELETE NO ACTION,
  CONSTRAINT `User_Conference`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Chat` (
  `idChat` INT NOT NULL AUTO_INCREMENT,
  `idEvent` INT NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idChat`),
  CONSTRAINT `Chat_Event`
    FOREIGN KEY (`idEvent`)
    REFERENCES `instit43_jpo_test_1.0`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Chat_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `instit43_jpo_test_1.0`.`User` (`email`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`Conversations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`Conversations` (
  `idChat` INT NOT NULL,
  `idInscription` VARCHAR(255) NOT NULL,
  `Date` DATETIME NOT NULL,
  `conversations` LONGTEXT NOT NULL,
  PRIMARY KEY (`idChat`),
  CONSTRAINT `idChat`
    FOREIGN KEY (`idChat`)
    REFERENCES `instit43_jpo_test_1.0`.`Chat` (`idChat`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`InterestingProgrammes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instit43_jpo_test_1.0`.`InterestingProgrammes` (
  `mail` VARCHAR(255) NOT NULL,
  `idProgram` INT NOT NULL,
  PRIMARY KEY (`mail`, `idProgram`),
  CONSTRAINT `Inscription_Interesting`
    FOREIGN KEY (`mail`)
    REFERENCES `instit43_jpo_test_1.0`.`Inscription` (`mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Inscription_Programmes`
    FOREIGN KEY (`idProgram`)
    REFERENCES `instit43_jpo_test_1.0`.`Program` (`idProgram`)
    ON DELETE NO ACTION)
ENGINE = InnoDB;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
