-- 1 Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
use hw2;
CREATE table sales(
id INT NOT NULL,
order_date VARCHAR(100) NOT NULL,
bucket VARCHAR(150) NOT NULL
);

INSERT INTO `hw2`.`sales` (`id`,`order_date`, `bucket`) VALUES ('1','2021-01-01', '250');
INSERT INTO `hw2`.`sales` (`id`,`order_date`, `bucket`) VALUES ('1','2021-01-02', '157');
INSERT INTO `hw2`.`sales` (`id`,`order_date`, `bucket`) VALUES ('1','2021-01-03', '62');
INSERT INTO `hw2`.`sales` (`id`,`order_date`, `bucket`) VALUES ('1','2021-01-04', '108');
INSERT INTO `hw2`.`sales` (`id`,`order_date`, `bucket`) VALUES ('1','2021-01-05', '600');

-- 2 Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

ALTER TABLE sales ADD sizes VARCHAR(100) NOT NULL;

SELECT id, order_date, bucket,
CASE TRUE
    WHEN bucket < 100 THEN 'меньше 100'
    WHEN bucket >= 100 AND bucket <= 300 THEN '100-300'
    ELSE 'больше 300'
END AS sizes
FROM sales;

-- 3 Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders(
ordersid INT PRIMARY KEY auto_increment,
employeeid VARCHAR(50) NOT NULL, 
amount INT NOT NULL,
orderstatus VARCHAR(100) NOT NULL
);

INSERT INTO `hw2`.`orders` (`employeeid`, `amount`, `orderstatus`) VALUES ('e03','15.00','OPEN');
INSERT INTO `hw2`.`orders` (`employeeid`, `amount`, `orderstatus`) VALUES ('e01','25.00','OPEN');
INSERT INTO `hw2`.`orders` (`employeeid`, `amount`, `orderstatus`) VALUES ('e05','100.70','CLOSED');
INSERT INTO `hw2`.`orders` (`employeeid`, `amount`, `orderstatus`) VALUES ('e02','22.18','OPEN');
INSERT INTO `hw2`.`orders` (`employeeid`, `amount`, `orderstatus`) VALUES ('e04','9.50','CANCELLED');
INSERT INTO `hw2`.`orders` (`employeeid`, `amount`, `orderstatus`) VALUES ('e04','99.99','OPEN');

SELECT * FROM hw2.orders;

SELECT ordersid, orderstatus, 
CASE
	WHEN orderstatus = 'OPEN' THEN 'Order is open state.'
	WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
	WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled.'
END AS order_summary
FROM orders;

-- 4 Чем NULL отличается от 0?
-- 'NULL' - пустое поле, не содержащее никакого значени, а '0'- числовое значение
