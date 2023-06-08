use hw6;

-- 1 Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER //
create procedure datatime(sec int)
begin 
	DECLARE days int default 0;
    DECLARE hours int default 0;
    DECLARE mins int default 0;
    
	while sec >= 86400 do
    set days = sec / 86400;
    set sec = sec % 86400;
    end while;

    while sec >= 3600 do
    set hours = sec / 3600;
    set sec = sec % 3600;
    end while;

    while sec >= 60 do
    set mins = sec / 60;
    set sec = sec % 60;
    end while;

	select days, hours, mins, sec;
end//
DELIMITER ;

call datatime(123456);

-- 2 Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10.
DELIMITER //
create procedure evennums(nums int)
begin
	declare res int default 1;
    drop table result;
    create table result (res int);
    
    while res <= nums do
		if res % 2 = 0 then 
			insert into result values(res);
		end if;
		set res = res +1; 
	end while;
    
	select * from result;
end//;
DELIMITER ;

call evennums(13);
