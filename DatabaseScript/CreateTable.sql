CREATE TABLE `default`.Car
(
  CarId INT NOT NULL AUTO_INCREMENT,
  Model VARCHAR(45) NOT NULL,
  Year INT NULL,
  Manufacturer VARCHAR(45) NULL,
  PRIMARY KEY (`CarId`)
);

INSERT INTO `default`.`Car` (`Model`, `Year`, `Manufacturer`) VALUES ('370Z', '2012', 'Nissan');
INSERT INTO `default`.`Car` (`Model`, `Year`, `Manufacturer`) VALUES ('Mustang', '2013', 'Ford');
INSERT INTO `default`.`Car` (`Model`, `Year`, `Manufacturer`) VALUES ('Camaro', '2012', 'Chevrolet');
INSERT INTO `default`.`Car` (`Model`, `Year`, `Manufacturer`) VALUES ('Charger', '2013', 'Dodge');