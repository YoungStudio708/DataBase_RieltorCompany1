DELIMITER //
create procedure nedvijimost_insert (p_addresss varchar(200),
    p_opisanie VARCHAR(150), p_data_postrojki date, 
	p_kollichestvo_komnat int, p_razmer_uchastka decimal(38,2),
	p_razmer_jilogo_pomeschenija decimal(38,2), p_cell VARCHAR(10))
begin
	declare have_record int;
    select count(*) into have_record from nedvijimost
	where addresss = p_addresss
		and opisanie = p_opisanie
		and data_postrojki = p_data_postrojki
		and kollichestvo_komnat = p_kollichestvo_komnat
		AND razmer_uchastka = p_razmer_uchastka
		AND razmer_jilogo_pomeschenija = p_razmer_jilogo_pomeschenija
		AND cell = p_cell;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into nedvijimost (addresss, opisanie, data_postrojki,
			kollichestvo_komnat, razmer_uchastka, razmer_jilogo_pomeschenija,
			cell)
		values (p_addresss, p_opisanie, p_data_postrojki,
			p_kollichestvo_komnat, p_razmer_uchastka, p_razmer_jilogo_pomeschenija,
			p_cell);
	end if;
end;