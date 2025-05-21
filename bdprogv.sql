-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema programacionv2024
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema programacionv2024
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `programacionv2024` DEFAULT CHARACTER SET utf8 ;
USE `programacionv2024` ;

-- -----------------------------------------------------
-- Table `programacionv2024`.`personales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`personales` (
  `idpersonales` INT(11) NOT NULL AUTO_INCREMENT,
  `per_nombre` VARCHAR(45) NOT NULL,
  `per_apellido` VARCHAR(45) NOT NULL,
  `per_ci` VARCHAR(45) NOT NULL,
  `per_telefono` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`idpersonales`))
ENGINE = InnoDB
AUTO_INCREMENT = 125
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`usuarios` (
  `idusuarios` INT(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre` VARCHAR(20) NOT NULL,
  `usu_clave` VARCHAR(20) NOT NULL,
  `usu_tipo` VARCHAR(20) NOT NULL,
  `usu_estado` VARCHAR(20) NOT NULL,
  `personales_idpersonales` INT(11) NOT NULL,
  PRIMARY KEY (`idusuarios`),
  INDEX `fk_usuarios_personales1_idx` (`personales_idpersonales` ASC) ,
  CONSTRAINT `fk_usuarios_personales1`
    FOREIGN KEY (`personales_idpersonales`)
    REFERENCES `programacionv2024`.`personales` (`idpersonales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1233
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`aperturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`aperturas` (
  `idaperturas` INT(11) NOT NULL AUTO_INCREMENT,
  `ape_fecha` DATE NOT NULL,
  `ape_monto` INT(11) NOT NULL,
  `ape_estado` VARCHAR(15) NOT NULL,
  `usuarios_idusuarios` INT(11) NOT NULL,
  PRIMARY KEY (`idaperturas`),
  INDEX `fk_aperturas_usuarios1_idx` (`usuarios_idusuarios` ASC) ,
  CONSTRAINT `fk_aperturas_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `programacionv2024`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`cierres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`cierres` (
  `idcierres` INT(11) NOT NULL AUTO_INCREMENT,
  `cie_fecha` DATE NOT NULL,
  `cie_monto` INT(11) NOT NULL,
  `aperturas_idaperturas` INT(11) NOT NULL,
  PRIMARY KEY (`idcierres`),
  INDEX `fk_cierres_aperturas1_idx` (`aperturas_idaperturas` ASC) ,
  CONSTRAINT `fk_cierres_aperturas1`
    FOREIGN KEY (`aperturas_idaperturas`)
    REFERENCES `programacionv2024`.`aperturas` (`idaperturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`ciudades` (
  `idciudades` INT(11) NOT NULL AUTO_INCREMENT,
  `ciu_nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idciudades`))
ENGINE = InnoDB
AUTO_INCREMENT = 124
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`clientes` (
  `idclientes` INT(11) NOT NULL AUTO_INCREMENT,
  `cli_nombre` VARCHAR(45) NOT NULL,
  `cli_apellido` VARCHAR(45) NOT NULL,
  `cli_ruc` VARCHAR(15) NOT NULL,
  `cli_telefono` VARCHAR(15) NULL DEFAULT NULL,
  `ciudades_idciudades` INT(11) NOT NULL,
  PRIMARY KEY (`idclientes`),
  INDEX `fk_clientes_ciudades1_idx` (`ciudades_idciudades` ASC) ,
  CONSTRAINT `fk_clientes_ciudades1`
    FOREIGN KEY (`ciudades_idciudades`)
    REFERENCES `programacionv2024`.`ciudades` (`idciudades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12316
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`cobros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`cobros` (
  `idcobros` INT(11) NOT NULL,
  `cob_fecha` DATE NOT NULL,
  `cob_estado` VARCHAR(10) NULL DEFAULT NULL,
  `clientes_idclientes` INT(11) NOT NULL,
  `aperturas_idaperturas` INT(11) NOT NULL,
  PRIMARY KEY (`idcobros`),
  INDEX `fk_cobros_clientes1_idx` (`clientes_idclientes` ASC) ,
  INDEX `fk_cobros_aperturas1_idx` (`aperturas_idaperturas` ASC) ,
  CONSTRAINT `fk_cobros_aperturas1`
    FOREIGN KEY (`aperturas_idaperturas`)
    REFERENCES `programacionv2024`.`aperturas` (`idaperturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobros_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `programacionv2024`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`proveedores` (
  `idproveedores` INT(11) NOT NULL AUTO_INCREMENT,
  `prov_nombre` VARCHAR(45) NOT NULL,
  `prov_ruc` VARCHAR(15) NOT NULL,
  `prov_telefono` VARCHAR(15) NULL DEFAULT NULL,
  `prov_correo` VARCHAR(150) NULL DEFAULT NULL,
  `ciudades_idciudades` INT(11) NOT NULL,
  PRIMARY KEY (`idproveedores`),
  INDEX `fk_proveedores_ciudades_idx` (`ciudades_idciudades` ASC) ,
  CONSTRAINT `fk_proveedores_ciudades`
    FOREIGN KEY (`ciudades_idciudades`)
    REFERENCES `programacionv2024`.`ciudades` (`idciudades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12313
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`compras` (
  `idcompras` INT(11) NOT NULL AUTO_INCREMENT,
  `com_fecha` DATE NOT NULL,
  `com_condicion` VARCHAR(8) NULL DEFAULT NULL,
  `com_estado` VARCHAR(10) NULL DEFAULT NULL,
  `usuarios_idusuarios` INT(11) NOT NULL,
  `proveedores_idproveedores` INT(11) NOT NULL,
  `aperturas_idaperturas` INT(11) NOT NULL,
  PRIMARY KEY (`idcompras`),
  INDEX `fk_compras_usuarios1_idx` (`usuarios_idusuarios` ASC) ,
  INDEX `fk_compras_proveedores1_idx` (`proveedores_idproveedores` ASC) ,
  INDEX `fk_compras_aperturas1_idx` (`aperturas_idaperturas` ASC) ,
  CONSTRAINT `fk_compras_aperturas1`
    FOREIGN KEY (`aperturas_idaperturas`)
    REFERENCES `programacionv2024`.`aperturas` (`idaperturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_proveedores1`
    FOREIGN KEY (`proveedores_idproveedores`)
    REFERENCES `programacionv2024`.`proveedores` (`idproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `programacionv2024`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9008
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`ventas` (
  `idventas` INT(11) NOT NULL AUTO_INCREMENT,
  `ven_fecha` DATE NOT NULL,
  `ven_condicion` VARCHAR(8) NOT NULL,
  `ven_estado` VARCHAR(10) NOT NULL,
  `usuarios_idusuarios` INT(11) NOT NULL,
  `clientes_idclientes` INT(11) NOT NULL,
  `aperturas_idaperturas` INT(11) NOT NULL,
  PRIMARY KEY (`idventas`),
  INDEX `fk_ventas_usuarios1_idx` (`usuarios_idusuarios` ASC) ,
  INDEX `fk_ventas_clientes1_idx` (`clientes_idclientes` ASC) ,
  INDEX `fk_ventas_aperturas1_idx` (`aperturas_idaperturas` ASC),
  CONSTRAINT `fk_ventas_aperturas1`
    FOREIGN KEY (`aperturas_idaperturas`)
    REFERENCES `programacionv2024`.`aperturas` (`idaperturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `programacionv2024`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `programacionv2024`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6324
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`detallecobros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`detallecobros` (
  `ventas_idventas` INT(11) NOT NULL,
  `cobros_idcobros` INT(11) NOT NULL,
  `monto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ventas_idventas`, `cobros_idcobros`),
  INDEX `fk_ventas_has_cobros_cobros1_idx` (`cobros_idcobros` ASC) ,
  INDEX `fk_ventas_has_cobros_ventas1_idx` (`ventas_idventas` ASC) ,
  CONSTRAINT `fk_ventas_has_cobros_cobros1`
    FOREIGN KEY (`cobros_idcobros`)
    REFERENCES `programacionv2024`.`cobros` (`idcobros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_has_cobros_ventas1`
    FOREIGN KEY (`ventas_idventas`)
    REFERENCES `programacionv2024`.`ventas` (`idventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`productos` (
  `idproductos` INT(11) NOT NULL AUTO_INCREMENT,
  `pro_nombre` VARCHAR(45) NOT NULL,
  `pro_costo` INT(11) NOT NULL,
  `pro_precio` INT(11) NOT NULL,
  `pro_stock` INT(11) NOT NULL,
  `pro_min` INT(11) NOT NULL,
  `proveedores_idproveedores` INT(11) NOT NULL,
  `pro_iva` VARCHAR(45) NOT NULL,
  `pro_categoria` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `fk_productos_proveedores1_idx` (`proveedores_idproveedores` ASC) ,
  CONSTRAINT `fk_productos_proveedores1`
    FOREIGN KEY (`proveedores_idproveedores`)
    REFERENCES `programacionv2024`.`proveedores` (`idproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12332
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`detallecompras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`detallecompras` (
  `compras_idcompras` INT(11) NOT NULL,
  `productos_idproductos` INT(11) NOT NULL,
  `det_precio` INT(11) NOT NULL,
  `det_cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`compras_idcompras`, `productos_idproductos`),
  INDEX `fk_compras_has_productos_productos1_idx` (`productos_idproductos` ASC),
  INDEX `fk_compras_has_productos_compras1_idx` (`compras_idcompras` ASC) ,
  CONSTRAINT `fk_compras_has_productos_compras1`
    FOREIGN KEY (`compras_idcompras`)
    REFERENCES `programacionv2024`.`compras` (`idcompras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `programacionv2024`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`pagos` (
  `idpagos` INT(11) NOT NULL AUTO_INCREMENT,
  `pag_fecha` DATE NOT NULL,
  `pag_estado` VARCHAR(10) NOT NULL,
  `prov_idproveedores` INT(11) NOT NULL,
  `aper_idaperturas` INT(11) NOT NULL,
  PRIMARY KEY (`idpagos`),
  INDEX `prov_idproveedores` (`prov_idproveedores` ASC) ,
  INDEX `aper_idaperturas` (`aper_idaperturas` ASC) ,
  CONSTRAINT `pagos_ibfk_1`
    FOREIGN KEY (`prov_idproveedores`)
    REFERENCES `programacionv2024`.`proveedores` (`idproveedores`),
  CONSTRAINT `pagos_ibfk_2`
    FOREIGN KEY (`aper_idaperturas`)
    REFERENCES `programacionv2024`.`aperturas` (`idaperturas`))
ENGINE = InnoDB
AUTO_INCREMENT = 234
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`detallepagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`detallepagos` (
  `compras_idcompras` INT(11) NOT NULL,
  `pagos_idpagos` INT(11) NOT NULL,
  `monto` INT(11) NOT NULL,
  PRIMARY KEY (`compras_idcompras`, `pagos_idpagos`),
  INDEX `fk_compras_has_pagos_pagos1_idx` (`pagos_idpagos` ASC) ,
  INDEX `fk_compras_has_pagos_compras1_idx` (`compras_idcompras` ASC) ,
  CONSTRAINT `fk_compras_has_pagos_compras1`
    FOREIGN KEY (`compras_idcompras`)
    REFERENCES `programacionv2024`.`compras` (`idcompras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_has_pagos_pagos1`
    FOREIGN KEY (`pagos_idpagos`)
    REFERENCES `programacionv2024`.`pagos` (`idpagos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `programacionv2024`.`detalleventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `programacionv2024`.`detalleventas` (
  `ventas_idventas` INT(11) NOT NULL,
  `productos_idproductos` INT(11) NOT NULL,
  `det_precio` INT(11) NOT NULL,
  `det_cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`ventas_idventas`, `productos_idproductos`),
  INDEX `fk_ventas_has_productos_productos1_idx` (`productos_idproductos` ASC),
  INDEX `fk_ventas_has_productos_ventas1_idx` (`ventas_idventas` ASC) ,
  CONSTRAINT `fk_ventas_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `programacionv2024`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_has_productos_ventas1`
    FOREIGN KEY (`ventas_idventas`)
    REFERENCES `programacionv2024`.`ventas` (`idventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `programacionv2024`;

DELIMITER $$
USE `programacionv2024`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `programacionv2024`.`actualizar_estado_venta`
AFTER INSERT ON `programacionv2024`.`detallecobros`
FOR EACH ROW
BEGIN
    UPDATE ventas
    SET ven_estado = 'COBRADO'
    WHERE idventas = NEW.ventas_idventas; 
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
