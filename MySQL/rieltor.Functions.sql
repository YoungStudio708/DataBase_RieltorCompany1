DELIMITER //
create or replace function SalariesForHoursWorked(p_id_sotrudnik_position int,
										          p_WorkedHours decimal(38, 2)) -- создаем функция
returns decimal(38, 2) -- возвращаем тип
BEGIN -- начало
	declare CountMoney decimal(38, 2); -- создаем переменную
    	select sum(Salary * 0.87 * (p_WorkedHours / 160)) -- формула из таблицы
    	into CountMoney from sotrudnik_position -- подключаемсся к другой таблице бд
        where id_sotrudnik_position = p_id_sotrudnik_position; -- сравнение ключей
    	return CountMoney; -- возвращаем
end;


DELIMITER //
create or replace function Premiya()
returns int
begin
    declare prem int;
        select SUM(salary*2.00) into prem
        from sotrudnik
        inner join position_s on position_id = id_position;
        return prem;
end;
