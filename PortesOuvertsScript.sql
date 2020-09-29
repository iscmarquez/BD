-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PortesOuvertsGrasset
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PortesOuvertsGrasset
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PortesOuvertsGrasset` DEFAULT CHARACTER SET utf8 ;
USE `PortesOuvertsGrasset` ;

-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`User` (
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Event` (
  `idEvent` INT NOT NULL,
  `startDate` DATETIME NOT NULL,
  `endDate` DATETIME NULL,
  `idUser` VARCHAR(45) NULL,
  PRIMARY KEY (`idEvent`),
 
  CONSTRAINT `User_Event`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Program` (
  `idProgram` INT NOT NULL,
  `programDescription` VARCHAR(100) NOT NULL,
  `imageLink` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProgram`),
  
  CONSTRAINT `User_Program`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Video` (
  `idVideo` INT NOT NULL,
  `idProgram` INT NOT NULL,
  `videoLink` VARCHAR(255) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idVideo`),
  
  CONSTRAINT `User_Video`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_Program_Video`
    FOREIGN KEY (`idProgram`)
    REFERENCES `PortesOuvertsGrasset`.`Program` (`idProgram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Downloadable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Downloadable` (
  `idDownloadable` INT NOT NULL,
  `idProgram` INT NOT NULL,
  `fileLink` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDownloadable`),
  
  CONSTRAINT `Program_Downloadable`
    FOREIGN KEY (`idProgram`)
    REFERENCES `PortesOuvertsGrasset`.`Program` (`idProgram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_Dowloadable`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Configuration` (
  `linkVirtualVisit` VARCHAR(255) NOT NULL,
  `linkFAQ` VARCHAR(255) NOT NULL,
  `endMessage` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
 
  CONSTRAINT `User_Configuration`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Inscription` (
  `mail` VARCHAR(255) NOT NULL,
  `idEvent` INT NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NULL,
  `phone` VARCHAR(100) NOT NULL,
  `moyenCommunication` VARCHAR(45) NOT NULL,
  `consentMessage` TINYINT NOT NULL,
  `idProgram` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`mail`),
  
  CONSTRAINT `Event_Inscription`
    FOREIGN KEY (`idEvent`)
    REFERENCES `PortesOuvertsGrasset`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Inscription_Program`
    FOREIGN KEY (`idProgram`)
    REFERENCES `PortesOuvertsGrasset`.`Program` (`idProgram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Speaker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Speaker` (
  `idSpeaker` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `photoLink` VARCHAR(255) NOT NULL,
  `idUser` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`idSpeaker`),
 
  CONSTRAINT `Speaker_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Conference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Conference` (
  `idConference` INT NOT NULL,
  `idEvent` INT NOT NULL,
  `idSpeaker` INT NOT NULL,
  `linkConference` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`idConference`),
 
  CONSTRAINT `Event_Conference`
    FOREIGN KEY (`idEvent`)
    REFERENCES `PortesOuvertsGrasset`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Speaker_Conference`
    FOREIGN KEY (`idSpeaker`)
    REFERENCES `PortesOuvertsGrasset`.`Speaker` (`idSpeaker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Attendants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Attendants` (
  `idConference` INT NOT NULL,
  `idInscription` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idConference`, `idInscription`),
  CONSTRAINT `Attendant_Conference`
    FOREIGN KEY (`idConference`)
    REFERENCES `PortesOuvertsGrasset`.`Conference` (`idConference`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Attendant_Inscription`
    FOREIGN KEY (`idConference` , `idInscription`)
    REFERENCES `PortesOuvertsGrasset`.`Inscription` (`idEvent` , `mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Chat` (
  `idChat` INT NOT NULL,
  `idEvent` INT NOT NULL,
  `idUser` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idChat`),
 
  CONSTRAINT `Chat_Event`
    FOREIGN KEY (`idEvent`)
    REFERENCES `PortesOuvertsGrasset`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Chat_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `PortesOuvertsGrasset`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortesOuvertsGrasset`.`Conversations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortesOuvertsGrasset`.`Conversations` (
  `idChat` INT NOT NULL,
  `idInscription` VARCHAR(255) NOT NULL,
  `Date` DATETIME NOT NULL,
  `conversations` LONGTEXT NOT NULL,
  PRIMARY KEY (`idChat`),
  CONSTRAINT `idChat`
    FOREIGN KEY (`idChat`)
    REFERENCES `PortesOuvertsGrasset`.`Chat` (`idChat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
