-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aluguel_veiculo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aluguel_veiculo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aluguel_veiculo` DEFAULT CHARACTER SET utf8 ;
USE `aluguel_veiculo` ;

-- -----------------------------------------------------
-- Table `aluguel_veiculo`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aluguel_veiculo`.`cliente` ;

CREATE TABLE IF NOT EXISTS `aluguel_veiculo`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `nascimento` DATE NOT NULL,
  `cpf` BIGINT(20) NOT NULL,
  `cnh` BIGINT(20) NOT NULL,
  `cep` BIGINT(20) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `nmr_residencia` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aluguel_veiculo`.`cnh`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aluguel_veiculo`.`cnh` ;

CREATE TABLE IF NOT EXISTS `aluguel_veiculo`.`cnh` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nmr_cnh` BIGINT(20) NOT NULL,
  `categoria` CHAR(2) NOT NULL,
  `validade` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cnh_cliente_idx` (`id_cliente` ASC) ,
  CONSTRAINT `fk_cnh_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `aluguel_veiculo`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aluguel_veiculo`.`veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aluguel_veiculo`.`veiculo` ;

CREATE TABLE IF NOT EXISTS `aluguel_veiculo`.`veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(100) NOT NULL,
  `placa` VARCHAR(20) NOT NULL,
  `ano` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aluguel_veiculo`.`aluguel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aluguel_veiculo`.`aluguel` ;

CREATE TABLE IF NOT EXISTS `aluguel_veiculo`.`aluguel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE NOT NULL,
  `data_termino` DATE NOT NULL,
  `vl_total` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_aluguel_idx` (`id_cliente` ASC),
  INDEX `fk_veiculo_aluguel_idx` (`id_veiculo` ASC),
  CONSTRAINT `fk_cliente_aluguel`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `aluguel_veiculo`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_aluguel`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `aluguel_veiculo`.`veiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
