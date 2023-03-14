-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pokes_schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pokes_schema` ;

-- -----------------------------------------------------
-- Schema pokes_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pokes_schema` DEFAULT CHARACTER SET utf8 ;
USE `pokes_schema` ;

-- -----------------------------------------------------
-- Table `pokes_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokes_schema`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `alias` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(1024) NOT NULL,
  `dob` DATE NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokes_schema`.`pokes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokes_schema`.`pokes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `poked_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_pokes_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_pokes_users1_idx` (`poked_id` ASC) VISIBLE,
  CONSTRAINT `fk_pokes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `pokes_schema`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokes_users1`
    FOREIGN KEY (`poked_id`)
    REFERENCES `pokes_schema`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
