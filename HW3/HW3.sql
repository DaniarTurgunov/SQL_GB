use hw3;

CREATE TABLE salespeople (
snum int primary key,
sname varchar (50) not null,
city varchar(100) not null,
comm float not null
);

INSERT INTO salespeople values (1001, 'Peel', 'London', 0.12), (1002, 'Serres', 'San Jose', 0.13), 
(1004, 'Motika', 'London', 0.11), (1007, 'Rifkin', 'Barcelona', 0.15), (1003, 'Axelrod', 'New York', 0.10);

CREATE TABLE customers (
cnum int primary key,
cname varchar (50) not null,
city varchar(100) not null,
rating int not null,
snum int not null
);

INSERT INTO customers values (2001, 'Noffman', 'London', 100, 1001), (2002, 'Glovanni', 'Rome', 200, 1003), 
(2003, 'Liu', 'SanJose', 200, 1002), (2004, 'Grass', 'Berlin', 300, 1002), (2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007), (2007, 'Pereira', 'Rome', 100, 1004);

CREATE TABLE orders (
onum int primary key,
amt float not null,
odate date not null,
cnum int not null,
snum int not null
);

INSERT INTO orders values (3001, 18.69, '1990-03-10' , 2008, 1007), (3003, 767.19, '1990-03-10', 2001, 1001), 
(3002, 1900.10, '1990-03-10', 2007, 1004), (3005, 5160.45, '1990-03-10', 2003, 1002), (3006, 1098.16, '1990-03-10', 2008, 1007), 
(3009, 1713.23, '1990-04-10', 2002, 1003), (3007, 75.75, '1990-04-10', 2004, 1002), (3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002), (3011, 9891.88, '1990-06-10', 2006, 1001);

-- 1 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
Select city, sname, snum, comm from salespeople;

-- 2 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
Select rating, cname from customers where city ='SanJose';

-- 3 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
Select distink snum FROM orders;

-- 4 Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”)
Select * from customers where cname like 'G%';

-- 5 Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt” - сумма)
Select * from orders where amt > 1000 ;

-- 6 Напишите запрос который выбрал бы наименьшую сумму заказа.
Select min(amt) from orders;

-- 7 Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
Select * from customers where rating > 100 and city != 'Rome';


CREATE TABLE cw (
id int primary key auto_increment,
cwname varchar (60) not null,
surname varchar (100) not null,
specialty varchar (60) not null,
seniority int not null,
salary int not null,
age int not null
);

INSERT INTO cw values (1,'Вася', 'Васькин', 'начальник' , 40, 100000, 60), (2,'Петя', 'Петькин', 'начальник' , 8, 70000, 30),(3,'Катя', 'Каткина', 'инженер' , 2, 70000, 25),
(4,'Саша', 'Сашкин', 'инженер' , 12, 50000, 35),(5,'Иван', 'Иванов', 'рабочий' , 40, 30000, 59),(6,'Петр', 'Петров', 'рабочий' , 20, 25000, 40),(7,'Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
(8,'Антон', 'Антонов', 'рабочий' , 8, 19000, 28),(9,'Юра', 'Юркин', 'рабочий' , 5, 15000, 25),(10,'Максим', 'Воронин', 'рабочий', 2, 11000, 22),(11,'Юра', 'Галкин', 'рабочий', 3, 12000, 24),
(12, 'Люся', 'Люськина', 'уборщик' , 10, 10000, 49);

-- 1 Отсортируйте поле “зарплата” в порядке убывания и возрастания
Select * from cw order by salary desc / Select * from cw order by salary asc

-- 2 Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
Select * from cw order by salary desc limit 5

-- 3 Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
Select specialty , sum(salary) from cw
group by specialty 
having sum(salary) > 100000
