CREATE DATABASE 'Domicilios'

CREATE TABLE `Domicilios`.`Bicis` 
    ( `ID` INT(10) NOT NULL , 
    `Marca` VARCHAR(20) NOT NULL , 
    `Modelo` INT(4) NOT NULL , 
    `Color` VARCHAR(10) NOT NULL , 
    `Tipo` VARCHAR(10) NOT NULL ,
    PRIMARY KEY (`ID`))

CREATE TABLE `Domicilios`.`Motos`
    ( `ID` INT(6) NOT NULL , 
    `Marca` VARCHAR(15) NOT NULL ,
    `Modelo` INT(4) NOT NULL ,
    `Color` VARCHAR(10) NOT NULL ,
    `Transito` INT NOT NULL ,
    `Vencimiento` DATE NOT NULL ,
    `Avaluo` INT(8) NOT NULL ,
    `Cilindraje` INT(3) NOT NULL ,
    PRIMARY KEY (`ID`))

CREATE TABLE `Domicilios`.`Restaurantes` 
    ( `ID` INT(100) NOT NULL , 
    `Nombre` VARCHAR(20) NOT NULL , 
    `Direccion` VARCHAR(40) NOT NULL , 
    `Telefono` INT(10) NOT NULL,
    PRIMARY KEY (`ID`))

CREATE TABLE `Domicilios`.`Clientes` 
    ( `ID` INT(10) NOT NULL , 
    `Nombre` VARCHAR(25) NOT NULL , 
    `Direccion` VARCHAR(40) NOT NULL , 
    PRIMARY KEY (`ID`))

CREATE TABLE `Domicilios`.`Domiciliaros-bici` 
    ( `ID` INT(10) NOT NULL , 
    `Tipo_doc` TEXT NOT NULL , 
    `Nombre` VARCHAR(30) NOT NULL , 
    `Telefono` INT(10) NOT NULL , 
    `Direccion` VARCHAR(60) NOT NULL , 
    `Salario` INT(7) NOT NULL , 
    `Vehiculo` INT NOT NULL , 
    PRIMARY KEY (`ID`))

CREATE TABLE `Domicilios`.`Domiciliaros-moto` 
    ( `ID` INT(10) NOT NULL , 
    `Tipo_doc` TEXT NOT NULL , 
    `Nombre` VARCHAR(30) NOT NULL , 
    `Telefono` INT(10) NOT NULL , 
    `Direccion` VARCHAR(40) NOT NULL , 
    `Salario` INT(7) NOT NULL , 
    `Vehiculo` INT NOT NULL , 
    `Licencia` INT(15) NOT NULL , 
    `Vencimiento` DATE NOT NULL , 
    PRIMARY KEY (`ID`))

CREATE TABLE `Domicilios`.`Pedido`
    ( `ID` INT(10) NOT NULL , 
    `Bici o Moto` BOOLEAN BINARY , 
    `Domiciliario` INT NOT NULL , 
    `Cliente` INT NOT NULL , 
    `Restaurante` INT NOT NULL , 
    `Descripcion` VARCHAR(200) NOT NULL , 
    `Precio` INT(7) NOT NULL,
    PRIMARY KEY (`ID`))

ALTER TABLE `domiciliarios-moto` 
    ADD FOREIGN KEY (`Vehiculo`) REFERENCES `moto`(`ID`) 
        ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `domiciliaro-bici` 
    ADD FOREIGN KEY (`Vehiculo`) REFERENCES `bici`(`ID`) 
        ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pedido` 
    ADD FOREIGN KEY (`Cliente`) REFERENCES `cliente`(`ID`) 
        ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `pedido` 
    ADD FOREIGN KEY (`Domiciliario`) REFERENCES `domiciliarios-moto`(`ID`) 
        ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `pedido` 
    ADD FOREIGN KEY (`Domiciliario`) REFERENCES `domiciliaro-bici`(`ID`) 
        ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `pedido` 
    ADD FOREIGN KEY (`Restaurante`) REFERENCES `restaurante`(`ID`) 
        ON DELETE RESTRICT ON UPDATE RESTRICT;