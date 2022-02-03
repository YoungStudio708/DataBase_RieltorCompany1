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

DELIMITER //
create procedure type_uslug_insert (p_type_uslug_name varchar(60),
    p_type_uslug_opisanie VARCHAR(60))
begin
	declare have_record int;
    select count(*) into have_record from type_uslug
	where type_uslug_name = p_type_uslug_name
		and type_uslug_opisanie = p_type_uslug_opisanie;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into type_uslug (type_uslug_name, type_uslug_opisanie)
		values (p_type_uslug_name, p_type_uslug_opisanie);
	end if;
end;

DELIMITER //
create procedure otdel_insert (p_otdel_name	Varchar(60),
    p_otdel_opisanie VARCHAR(200))
begin
	declare have_record int;
    select count(*) into have_record from otdel
	where otdel_name = p_otdel_name
		and otdel_opisanie = p_otdel_opisanie;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into otdel (otdel_name, otdel_opisanie)
		values (p_otdel_name, p_otdel_opisanie);
	end if;
end;

DELIMITER //
create procedure client_insert (p_last_name	Varchar(30), p_first_name	Varchar(30),
p_otchestwo	Varchar(30), p_passport_serija	Varchar(4), p_passport_number	Varchar(6),
p_telephone_number Varchar(16))
begin
	declare have_record int;
    select count(*) into have_record from client
	where last_name = p_last_name AND 
            first_name = p_first_name AND
            otchestwo = p_otchestwo AND
            passport_serija = p_passport_serija AND
            passport_number = p_passport_number AND
            telephone_number = p_telephone_number;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into client (last_name, first_name, otchestwo, passport_serija, passport_number, telephone_number)
		values (p_last_name, p_first_name, p_otchestwo, p_passport_serija, p_passport_number, p_telephone_number);
	end if;
end;

DELIMITER //
create procedure type_sdelki_insert (p_type_sdelki_opisanie VARCHAR (30), 
    p_type_sdelki_name VARCHAR (30))
begin
	declare have_record int;
    select count(*) into have_record from type_sdelki
	where type_sdelki_opisanie = p_type_sdelki_opisanie AND 
        type_sdelki_name = p_type_sdelki_name;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into type_sdelki (type_sdelki_opisanie, type_sdelki_name)
		values (p_type_sdelki_opisanie, p_type_sdelki_name);
	end if;
end;

DELIMITER //
create procedure sotrudnik_insert (p_last_name VARCHAR(30), p_first_name VARCHAR (30),
    p_otchestwo VARCHAR (30), p_telephone_number VARCHAR (18), p_life_address VARCHAR (200),
    p_birthday DATE , p_passport_serija VARCHAR(4), p_passport_number VARCHAR(6))
begin
	declare have_record int;
    select count(*) into have_record from sotrudnik
	where last_name = p_last_name AND
        first_name = p_first_name AND
        otchestwo = p_otchestwo AND
        telephone_number = p_telephone_number AND
        life_address =p_life_address AND
        birthday = p_birthday AND
        passport_serija = p_passport_serija AND
        passport_number = p_passport_number;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into sotrudnik (last_name, first_name, otchestwo,
		telephone_number, life_address, birthday,
		passport_serija, passport_number)
		values (p_last_name, p_first_name, p_otchestwo,
		p_telephone_number, p_life_address, p_birthday,
		p_passport_serija, p_passport_number);
	end if;
end;