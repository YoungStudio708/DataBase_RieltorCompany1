create or replace function SalariesForHoursWorked(p_id_sotrudnik_position int,
										          p_WorkedHours decimal(38, 2))
returns decimal(38, 2)
language plpgsql
as $$
	declare CountMoney decimal(38, 2);
	begin
    	select sum(Salary * 0.87 * (p_WorkedHours / 160))
    	into CountMoney from sotrudnik_position
        where id_sotrudnik_position = p_id_sotrudnik_position;
    	return CountMoney;
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