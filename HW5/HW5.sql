use hw5;

Create table cars (
idcar int PRIMARY KEY AUTO_INCREMENT, 
namecar varchar(50) not null,
cost int not null
);

insert into cars values (1, 'Audi', 52642),(2, 'Mercedes', 57127),(3, 'Skoda', 9000),(4, 'Volvo',29000),
(5,'Bentley', 350000),(6,'Citroen',21000),(7,'Hummer',41400),(8, 'Volkswagen', 21600);

-- 1 Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;
create view low as select namecar from cars where cost<25000;

-- 2 Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
-- (используя оператор ALTER VIEW) ALTER VIEW CheapCars AS SELECT Name FROM CarsWHERE Cost<30000;
alter view low as select namecar from cars where cost<30000;

-- 3 Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
create view onlys as select * from cars where namecar in ('Skoda', 'Audi');
select * from onlys;

-- 4 Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
select an_name, an_price, ord_datetime from Analysis join Orders on Analysis.an_id = Orders.ord_id
and Orders.ord_datetime >= '2020-02-05' and Orders.ord_datetime <= '2020-02-12';

-- 5 Добавьте новый столбец под названием «время до следующей станции».
select train_id, station, station_time SUBTIME(lead(station_time) over(partition by train_id order by train_id), station_time)
as time_to_next_station from Trains;