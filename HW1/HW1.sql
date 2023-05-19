-- 1 Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными.
CREATE TABLE `hw1`.`phone` (
  `idPhone` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(100) NOT NULL,
  `brand` VARCHAR(80) NOT NULL,
  `count` VARCHAR(100) NULL,
  `price` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPhone`));

INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (1,'IPhone 14','Apple inc.','20','105000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (2,'Galaxy S23+','Samsung','50','115000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (3,'Galaxy A13 4G','Samsung','1','45000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (4,'Galaxy M23 5G','Samsung','35','21700');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (5,'IPhone 13 Pro Max','Apple inc.','12','115000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (6,'Huawei P50','Huawei','79','48700');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (7,'Honor Magic4 Lite','Honor','100','20000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (8,'OnePlus Ace Pro','OnePlus','55','42100');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (9,'iPhone X ','Apple inc.','1','22000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (10,'iPhone 11','Apple inc.','76','50000');
INSERT INTO `` (`idPhone`,`model`,`brand`,`count`,`price`) VALUES (11,'IPhone 12 mini','Apple inc.','5','65000');

-- 2 Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT model,brand,price FROM hw1.phone
where count > 2

-- 3 Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM hw1.phone
where brand ='Samsung'

-- 4 Найти: 
-- товары, в наименовании которых есть упоминание "Iphone",
-- Товары, в наименовании которых есть упоминание "Samsung"
SELECT * FROM hw1.phone
where model like 'IPhone%' or model like 'Galaxy%' 

-- Товары, в наименовании которых есть ЦИФРЫ
SELECT * FROM hw1.phone
where model regexp '[0-9]'

-- Товары, в наименовании которых есть ЦИФРА "8"
SELECT * FROM hw1.phone
where model regexp '8'