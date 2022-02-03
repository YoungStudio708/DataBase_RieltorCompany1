create or replace function SalariesForHoursWorked(p_id_sotrudnik_position int,
										          p_WorkedHours decimal(38, 2)) -- создание функции
returns decimal(38, 2) -- возврящаем этот тип
language plpgsql -- язык
as $$ -- начало
	declare CountMoney decimal(38, 2); -- объявляем переменную
	begin -- начало
    	select sum(Salary * 0.87 * (p_WorkedHours / 160)) -- следуем формуле из таблицы
    	into CountMoney from sotrudnik_position -- получаем данные из таблицы
        where id_sotrudnik_position = p_id_sotrudnik_position; -- сравниваем ключи
    	return CountMoney; -- возвращаем
	end;
$$;

create or replace function Premiya()
returns int
language plpgsql

as $$
    declare premia int;
    begin
        premia = sum(salary*2.00)
        from sotrudnik
        inner join position_s on position_id = id_position;
return premia;
end;
$$;