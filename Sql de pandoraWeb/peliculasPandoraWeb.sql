-- MySQL Script generated by MySQL Workbench
-- Thu Oct  6 19:20:31 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pandoraWeb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pandoraWeb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pandoraWeb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pandoraWeb` ;

-- -----------------------------------------------------
-- Table `PaisEstreno`
-- -----------------------------------------------------
CREATE TABLE `PaisEstreno` (
  `IDPais` INT NOT NULL AUTO_INCREMENT,
  `codigoIso` VARCHAR(5) NOT NULL,
  `nombrePais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDPais`),
  UNIQUE INDEX `idPais_UNIQUE` (`IDPais` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClasificacionEdades`
-- -----------------------------------------------------
CREATE TABLE `ClasificacionEdades` (
  `IDClasificacionEdades` INT NOT NULL,
  `Caracteristica` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IDClasificacionEdades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Peliculas`
-- -----------------------------------------------------
CREATE TABLE `Peliculas` (
  `IDPelicula` INT NOT NULL AUTO_INCREMENT,
  `nombrePelicula` VARCHAR(50) NOT NULL,
  `anoEstreno` DATE NOT NULL,
  `sinopsis` TEXT(255) NOT NULL,
  `duracion` TIME NOT NULL,
  `ClasificacionEdadesId` INT NOT NULL,
  `paisId` INT NOT NULL,
  PRIMARY KEY (`IDPelicula`),
  UNIQUE INDEX `idPelicula_UNIQUE` (`IDPelicula` ASC) VISIBLE,
  INDEX `PaisId_idx` (`paisId` ASC) VISIBLE,
  INDEX `clasificacionEdadesId_idx` (`ClasificacionEdadesId` ASC) VISIBLE,
  CONSTRAINT `PaisId`
    FOREIGN KEY (`paisId`)
    REFERENCES `pandora_web`.`PaisEstreno` (`IDPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `clasificacionEdadesId`
    FOREIGN KEY (`ClasificacionEdadesId`)
    REFERENCES `pandora_web`.`ClasificacionEdades` (`IDClasificacionEdades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Actores`
-- -----------------------------------------------------
CREATE TABLE `Actores` (
  `IDActores` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `PeliculaId` INT NOT NULL,
  PRIMARY KEY (`IDActores`),
  INDEX `peliculaId_idx` (`PeliculaId` ASC) VISIBLE,
  CONSTRAINT `peliculaId`
    FOREIGN KEY (`PeliculaId`)
    REFERENCES `pandora_web`.`Peliculas` (`IDPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CalidadPelicula`
-- -----------------------------------------------------
CREATE TABLE `CalidadPelicula` (
  `IDCalidadPelicula` INT NOT NULL AUTO_INCREMENT,
  `nombreCalidad` VARCHAR(20) NOT NULL,
  `descipcion` VARCHAR(80) NOT NULL,
  `peliculaId` INT NOT NULL,
  PRIMARY KEY (`IDCalidadPelicula`),
  UNIQUE INDEX `idCalidad_UNIQUE` (`IDCalidadPelicula` ASC) VISIBLE,
  INDEX `PeliculaId_idx` (`peliculaId` ASC) VISIBLE,
  CONSTRAINT `PeliculaId`
    FOREIGN KEY (`peliculaId`)
    REFERENCES `pandora_web`.`Peliculas` (`IDPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `GeneroPelicula`
-- -----------------------------------------------------
CREATE TABLE `GeneroPelicula` (
  `IDGeneroPelicula` INT NOT NULL AUTO_INCREMENT,
  `nombreGenero` VARCHAR(20) NOT NULL,
  `PeliculaId` INT NOT NULL,
  PRIMARY KEY (`IDGeneroPelicula`),
  UNIQUE INDEX `idGeneroPelicula_UNIQUE` (`IDGeneroPelicula` ASC) VISIBLE,
  INDEX `PeliculaId_idx` (`PeliculaId` ASC) VISIBLE,
  CONSTRAINT `PeliculaId`
    FOREIGN KEY (`PeliculaId`)
    REFERENCES `pandora_web`.`Peliculas` (`IDPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Plataformas`
-- -----------------------------------------------------
CREATE TABLE `Plataformas` (
  `IDPlataforma` INT NOT NULL AUTO_INCREMENT,
  `nombrePlataforma` VARCHAR(30) NOT NULL,
  `PeliculaId` INT NOT NULL,
  PRIMARY KEY (`IDPlataforma`),
  UNIQUE INDEX `idPlataforma_UNIQUE` (`IDPlataforma` ASC) VISIBLE,
  INDEX `peliculaId_idx` (`PeliculaId` ASC) VISIBLE,
  CONSTRAINT `peliculaId`
    FOREIGN KEY (`PeliculaId`)
    REFERENCES `pandora_web`.`Peliculas` (`IDPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;