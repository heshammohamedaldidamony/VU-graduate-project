-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vu1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vu1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vu1` DEFAULT CHARACTER SET utf8 ;
USE `vu1` ;

-- -----------------------------------------------------
-- Table `vu1`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`doctor` (
  `id_doctor` CHAR(14) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `specialize` VARCHAR(100) NULL,
  `street` VARCHAR(100) NULL,
  `zone` VARCHAR(45) NULL,
  `picture` BLOB NULL,
  PRIMARY KEY (`id_doctor`),
  UNIQUE INDEX `id_doctor_UNIQUE` (`id_doctor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`icu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`icu` (
  `id_icu` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `id_doctor` CHAR(14) NOT NULL,
  PRIMARY KEY (`id_icu`),
  INDEX `id_doctor_idx` (`id_doctor` ASC) VISIBLE,
  CONSTRAINT `FK_id_doctor`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `vu1`.`doctor` (`id_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`patient` (
  `id_patient` CHAR(14) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `birth` DATE NOT NULL,
  `gender` ENUM('Male', 'Female') NOT NULL,
  `weight` DOUBLE NULL,
  `height` DOUBLE NULL,
  `street` VARCHAR(100) NULL,
  `zone` VARCHAR(45) NULL,
  `companion_name` VARCHAR(100) NULL,
  `companion_phone` CHAR(11) NULL,
  `patient_phone` CHAR(11) NULL,
  `id_icu` INT NULL,
  `date_in` DATE NULL,
  `date_out` DATE NULL,
  `reason_out` VARCHAR(45) NULL,
  PRIMARY KEY (`id_patient`),
  UNIQUE INDEX `id_patient_UNIQUE` (`id_patient` ASC) VISIBLE,
  INDEX `id_icu_idx` (`id_icu` ASC) VISIBLE,
  CONSTRAINT `id_icu`
    FOREIGN KEY (`id_icu`)
    REFERENCES `vu1`.`icu` (`id_icu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`unit` (
  `id_unit` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `id_icu` INT NOT NULL,
  PRIMARY KEY (`id_unit`),
  INDEX `id_icu_idx` (`id_icu` ASC) VISIBLE,
  CONSTRAINT `FK_id_icu`
    FOREIGN KEY (`id_icu`)
    REFERENCES `vu1`.`icu` (`id_icu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`device` (
  `id_device` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `id_patient` INT NULL,
  `id_unit` INT NOT NULL,
  PRIMARY KEY (`id_device`),
  INDEX `id_patient_idx` (`id_patient` ASC) VISIBLE,
  INDEX `id_unit_idx` (`id_unit` ASC) VISIBLE,
  UNIQUE INDEX `id_device_UNIQUE` (`id_device` ASC) VISIBLE,
  CONSTRAINT `FK_iid_patient`
    FOREIGN KEY (`id_patient`)
    REFERENCES `vu1`.`patient` (`id_patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_iid_unit`
    FOREIGN KEY (`id_unit`)
    REFERENCES `vu1`.`unit` (`id_unit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`sign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`sign` (
  `id_sign` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sign`),
  UNIQUE INDEX `id_sign_UNIQUE` (`id_sign` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`coordinate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`coordinate` (
  `id_coordinate` INT NOT NULL AUTO_INCREMENT,
  `x1` DOUBLE NOT NULL,
  `y1` DOUBLE NOT NULL,
  `x2` DOUBLE NOT NULL,
  `y2` DOUBLE NOT NULL,
  `id_sign` INT NOT NULL,
  `id_device` INT NOT NULL,
  PRIMARY KEY (`id_coordinate`),
  INDEX `id_sign_idx` (`id_sign` ASC) VISIBLE,
  UNIQUE INDEX `id_coordinate_UNIQUE` (`id_coordinate` ASC) VISIBLE,
  INDEX `id_device_idx` (`id_device` ASC) VISIBLE,
  CONSTRAINT `FK_id_sign`
    FOREIGN KEY (`id_sign`)
    REFERENCES `vu1`.`sign` (`id_sign`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_device`
    FOREIGN KEY (`id_device`)
    REFERENCES `vu1`.`device` (`id_device`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`doctor_shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`doctor_shift` (
  `id_shiftdoctor` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  PRIMARY KEY (`id_shiftdoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`medicine` (
  `id_medicine` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`id_medicine`),
  UNIQUE INDEX `id_medicine_UNIQUE` (`id_medicine` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`nurse` (
  `id_nurse` CHAR(14) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `street` VARCHAR(100) NULL,
  `zone` VARCHAR(45) NULL,
  `picture` BLOB NULL,
  PRIMARY KEY (`id_nurse`),
  UNIQUE INDEX `id_nurse_UNIQUE` (`id_nurse` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`task` (
  `id_task` INT NOT NULL AUTO_INCREMENT,
  `discription` VARCHAR(500) NULL,
  `status` ENUM('done', 'not done') NOT NULL,
  `donedate` TIMESTAMP NULL,
  `duedate` DATETIME NULL,
  `id_doctor` CHAR(14) NOT NULL,
  `id_patient` CHAR(14) NOT NULL,
  `id_medicine` INT NULL,
  `id_nurse` CHAR(14) NULL,
  PRIMARY KEY (`id_task`),
  INDEX `id_doctor_idx` (`id_doctor` ASC) VISIBLE,
  INDEX `id_patient_idx` (`id_patient` ASC) VISIBLE,
  INDEX `id_medicine_idx` (`id_medicine` ASC) VISIBLE,
  INDEX `id_nurse_idx` (`id_nurse` ASC) VISIBLE,
  UNIQUE INDEX `id_task_UNIQUE` (`id_task` ASC) VISIBLE,
  CONSTRAINT `FK_id_doctor`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `vu1`.`doctor` (`id_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_patient`
    FOREIGN KEY (`id_patient`)
    REFERENCES `vu1`.`patient` (`id_patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_medicine`
    FOREIGN KEY (`id_medicine`)
    REFERENCES `vu1`.`medicine` (`id_medicine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_nurse`
    FOREIGN KEY (`id_nurse`)
    REFERENCES `vu1`.`nurse` (`id_nurse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`image` (
  `id_image` INT NOT NULL AUTO_INCREMENT,
  `path` BLOB NOT NULL,
  `id_task` INT NULL,
  PRIMARY KEY (`id_image`),
  INDEX `id_task_idx` (`id_task` ASC) VISIBLE,
  UNIQUE INDEX `id_image_UNIQUE` (`id_image` ASC) VISIBLE,
  CONSTRAINT `FK_id_task`
    FOREIGN KEY (`id_task`)
    REFERENCES `vu1`.`task` (`id_task`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`nurse_shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`nurse_shift` (
  `id_shiftnurse` INT NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  UNIQUE INDEX `id_shiftnurse_UNIQUE` (`id_shiftnurse` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`vital signs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`vital signs` (
  `id_record` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL DEFAULT CURRENT_DATE,
  `id_patient` CHAR(14) NOT NULL,
  PRIMARY KEY (`id_record`),
  INDEX `id_patient_idx` (`id_patient` ASC) VISIBLE,
  UNIQUE INDEX `id_record_UNIQUE` (`id_record` ASC) VISIBLE,
  CONSTRAINT `FK_id_patient`
    FOREIGN KEY (`id_patient`)
    REFERENCES `vu1`.`patient` (`id_patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`device_sign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`device_sign` (
  `id_device` INT NOT NULL,
  `id_sign` INT NOT NULL,
  PRIMARY KEY (`id_device`, `id_sign`),
  INDEX `id_sign_idx` (`id_sign` ASC) VISIBLE,
  CONSTRAINT `FK_id_device`
    FOREIGN KEY (`id_device`)
    REFERENCES `vu1`.`device` (`id_device`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_sign`
    FOREIGN KEY (`id_sign`)
    REFERENCES `vu1`.`sign` (`id_sign`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`doctor_shift_unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`doctor_shift_unit` (
  `id_doctor` CHAR(11) NOT NULL,
  `id_unit` INT NOT NULL,
  `id_shiftdoctor` INT NOT NULL,
  PRIMARY KEY (`id_doctor`, `id_unit`, `id_shiftdoctor`),
  INDEX `id_unit_idx` (`id_unit` ASC) VISIBLE,
  INDEX `id_shiftdoctor_idx` (`id_shiftdoctor` ASC) VISIBLE,
  CONSTRAINT `FK_id_doctor`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `vu1`.`doctor` (`id_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_unit`
    FOREIGN KEY (`id_unit`)
    REFERENCES `vu1`.`unit` (`id_unit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_shiftdoctor`
    FOREIGN KEY (`id_shiftdoctor`)
    REFERENCES `vu1`.`doctor_shift` (`id_shiftdoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`doctor_phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`doctor_phone` (
  `id_doctor` CHAR(14) NOT NULL,
  `phone` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_doctor`, `phone`),
  CONSTRAINT `FK_id_doctor`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `vu1`.`doctor` (`id_doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`nurse_phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`nurse_phone` (
  `id_nurse` CHAR(14) NOT NULL,
  `phone` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_nurse`, `phone`),
  CONSTRAINT `FK_id_nurse`
    FOREIGN KEY (`id_nurse`)
    REFERENCES `vu1`.`nurse` (`id_nurse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`nurse_shift_patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`nurse_shift_patient` (
  `id_nurse` CHAR(14) NOT NULL,
  `id_shiftnurse` INT NOT NULL,
  `id_patient` INT NOT NULL,
  PRIMARY KEY (`id_nurse`, `id_shiftnurse`, `id_patient`),
  INDEX `id_shiftnurse_idx` (`id_shiftnurse` ASC) VISIBLE,
  INDEX `id_patient_idx` (`id_patient` ASC) INVISIBLE,
  CONSTRAINT `FK_id_nurse`
    FOREIGN KEY (`id_nurse`)
    REFERENCES `vu1`.`nurse` (`id_nurse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_shiftnurse`
    FOREIGN KEY (`id_shiftnurse`)
    REFERENCES `vu1`.`nurse_shift` (`id_shiftnurse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_patient`
    FOREIGN KEY (`id_patient`)
    REFERENCES `vu1`.`patient` (`id_patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`hr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`hr` (
  `id_record` INT NOT NULL,
  `time` TIME NOT NULL DEFAULT CURRENT_TIME,
  `value` DOUBLE NOT NULL,
  PRIMARY KEY (`id_record`, `time`),
  CONSTRAINT `FK_id_record`
    FOREIGN KEY (`id_record`)
    REFERENCES `vu1`.`vital signs` (`id_record`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`temprature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`temprature` (
  `id_record` INT NOT NULL,
  `time` TIME NOT NULL DEFAULT CURRENT_TIME,
  `value` DOUBLE NOT NULL,
  PRIMARY KEY (`id_record`, `time`),
  CONSTRAINT `FK_id_record`
    FOREIGN KEY (`id_record`)
    REFERENCES `vu1`.`vital signs` (`id_record`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`spo2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`spo2` (
  `id_record` INT NOT NULL,
  `time` TIME NOT NULL DEFAULT CURRENT_TIME,
  `value` DOUBLE NOT NULL,
  PRIMARY KEY (`id_record`, `time`),
  CONSTRAINT `FK_id_record`
    FOREIGN KEY (`id_record`)
    REFERENCES `vu1`.`vital signs` (`id_record`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`etco2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`etco2` (
  `id_record` INT NOT NULL,
  `time` TIME NOT NULL DEFAULT CURRENT_TIME,
  `value` DOUBLE NOT NULL,
  PRIMARY KEY (`id_record`, `time`),
  CONSTRAINT `FK_id_record`
    FOREIGN KEY (`id_record`)
    REFERENCES `vu1`.`vital signs` (`id_record`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vu1`.`pulse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vu1`.`pulse` (
  `id_record` INT NOT NULL,
  `time` TIME NOT NULL DEFAULT CURRENT_TIME,
  `value` DOUBLE NOT NULL,
  PRIMARY KEY (`id_record`, `time`),
  CONSTRAINT `FK_id_record`
    FOREIGN KEY (`id_record`)
    REFERENCES `vu1`.`vital signs` (`id_record`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
