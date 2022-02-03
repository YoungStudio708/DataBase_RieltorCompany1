DELIMITER //
create or replace function SalariesForHoursWorked(p_id_sotrudnik_position int,
										          p_WorkedHours decimal(38, 2))
returns decimal(38, 2)
BEGIN 
	declare CountMoney decimal(38, 2);
    	select sum(Salary * 0.87 * (p_WorkedHours / 160))
    	into CountMoney from sotrudnik_position
        where id_sotrudnik_position = p_id_sotrudnik_position;
    	return CountMoney;
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
