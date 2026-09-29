-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema student_achievement_passport
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_achievement_passport
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_achievement_passport` ;
USE `student_achievement_passport` ;

-- -----------------------------------------------------
-- Table `student_achievement_passport`.`school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`school` (
  `SchoolID` INT NOT NULL AUTO_INCREMENT,
  `SchoolName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SchoolID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`programme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`programme` (
  `ProgrammeID` INT NOT NULL,
  `ProgrammeName` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`ProgrammeID`),
  CONSTRAINT `SchoolID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`school` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`student` (
  `StudentID` INT NOT NULL,
  `EnrolmentNumber` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(150) NOT NULL,
  `ICNumber` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(150) NOT NULL,
  `YearStudy` INT NOT NULL,
  `YearCompletion` INT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE INDEX `EnrolmentNumber_UNIQUE` (`EnrolmentNumber` ASC) VISIBLE,
  UNIQUE INDEX `ICNumber_UNIQUE` (`ICNumber` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) INVISIBLE,
  CONSTRAINT `ProgrammeID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`programme` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`event_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`event_category` (
  `CategoryID` INT NOT NULL,
  `CategoryName` VARCHAR(100) NOT NULL,
  `event_categorycol` VARCHAR(45) NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE INDEX `CategoryName_UNIQUE` (`CategoryName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`event` (
  `EventID` INT NOT NULL,
  `EventName` VARCHAR(150) NOT NULL,
  `EventDate` DATE NOT NULL,
  `EventActivities` VARCHAR(255) NULL,
  PRIMARY KEY (`EventID`),
  CONSTRAINT `CategoryID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`event_category` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`role` (
  `RoleID` INT NOT NULL,
  `RoleName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`RoleID`),
  UNIQUE INDEX `RoleName_UNIQUE` (`RoleName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`participation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`participation` (
  `ParticipationID` INT NOT NULL,
  `Hours` DECIMAL(4,1) NOT NULL,
  PRIMARY KEY (`ParticipationID`),
  CONSTRAINT `StudentID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`student` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EventID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RoleID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`role` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`club` (
  `ClubID` INT NOT NULL,
  `ClubName` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`ClubID`),
  UNIQUE INDEX `ClubName_UNIQUE` (`ClubName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_achievement_passport`.`club_membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_achievement_passport`.`club_membership` (
  `MembershipID` INT NOT NULL,
  `Position` VARCHAR(100) NOT NULL,
  `StartYear` INT NOT NULL,
  `EndYear` INT NULL,
  PRIMARY KEY (`MembershipID`),
  CONSTRAINT `StudentID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`student` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ClubID`
    FOREIGN KEY ()
    REFERENCES `student_achievement_passport`.`club` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
