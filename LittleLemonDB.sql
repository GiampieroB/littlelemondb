-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `littlelemondb` ;

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`staffs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`staffs` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`staffs` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(150) NOT NULL,
  `Role` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(250) NOT NULL,
  `AnnualSalary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`bookings` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `Bookings_Staffs_fk` ON `littlelemondb`.`bookings` (`StaffID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`customers` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(150) NOT NULL,
  `ContactNumber` VARCHAR(20) NOT NULL,
  `CustomerEmail` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`menuitems` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `ItemName` VARCHAR(200) NOT NULL,
  `Type` VARCHAR(100) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`menus` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `Menus_MenuItems_fk` ON `littlelemondb`.`menus` (`ItemID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`orders` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `Quantity` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `Orders_Menus_fk` ON `littlelemondb`.`orders` (`MenuID` ASC) VISIBLE;

CREATE INDEX `Orders_Bookings_fk` ON `littlelemondb`.`orders` (`BookingID` ASC) VISIBLE;

CREATE INDEX `Orders_Customers_fk` ON `littlelemondb`.`orders` (`CustomerID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orderdeliverystatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`orderdeliverystatus` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderdeliverystatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `OrderDeliveryStatus_Orders_fk` ON `littlelemondb`.`orderdeliverystatus` (`OrderID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
