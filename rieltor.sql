DROP DATABASE rieltor;
CREATE DATABASE rieltor;
USE rieltor;

CREATE TABLE nedvijimost
(
    id_nedvijimost INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	addresss VARCHAR(200) NOT NULL unique, -- создание строки для уникалььного адреса.
	opisanie VARCHAR(150) NOT NULL, -- создание строки для описания
	data_postrojki date NOT NULL, -- создание строки для указания даты постройки ссоружения
	kollichestvo_komnat int NOT NULL check (kollichestvo_komnat > 0),--строка для указания количества комнат в выбранном жилом помещении с проверко, 
	--чтоб камнат было больше нуля
	razmer_uchastka decimal(38,2) NOT NULL check (razmer_uchastka > 0.0) default (0.0), -- строка для указания размера участка
	razmer_jilogo_pomeschenija decimal(38,2) NOT NULL check(razmer_jilogo_pomeschenija > 0.0) default(0.0),
	cell VARCHAR(10) NOT NULL
);

create table type_uslug -- таблица для типов услуг
(
	id_type_uslug	INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- первичный ключ таблицы
	type_uslug_name	varchar(60)	not null unique, -- строка для типа услуг
	type_uslug_opisanie	varchar(60)	not null -- строка для описания
);


create  table otdel
(
	id_otdel INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- создание первичного ключа для отделов
	otdel_name	Varchar(60) not null unique, -- создание строки для имени отдела
	otdel_opisanie	VARCHAR(200) not null -- создание строки для описания отдела
);

create table client
(
	id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- первичный ключ
	last_name	Varchar(30) not null, -- строка для фамилии
	first_name	Varchar(30) not null, -- строка для имени
	otchestwo	Varchar(30) null default ('-'), -- строка для отчества
	passport_serija	Varchar(4) not null constraint ch_passport_serija -- строка для серии паспорта
		Check (passport_serija REGEXP '^[0-9]+$'), -- проверка для строки с серией паспорта
	passport_number	Varchar(6) not null constraint ch_passport_number --- строка для номера паспорта
		Check (passport_number REGEXP '^[0-9]+$'), -- проверка для строки с номером паспорта
	telephone_number	Varchar(16) not null check (telephone_number like '+7(___)-___-__-__'),

    constraint ch_last_name
        check (last_name REGEXP '^[a-zA-Z]+$'),
    constraint ch_first_name
        check (first_name REGEXP '^[a-zA-Z]+$'),
    constraint ch_otchestwo
        check (otchestwo REGEXP '^[a-zA-Z]+$')
);

create table type_sdelki -- таблица для типа сделки
(
	id_type_sdelki INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- первичный ключ
	type_sdelki_opisanie varchar(30), -- строка для описания типа сделки
	type_sdelki_name varchar(30) not null constraint ch_type_sdelki_name
        check (type_sdelki_name REGEXP '^[a-zA-Z]+$') -- строка для имени типа сделки
);

create table sotrudnik -- таблица для сотрудников
(
	id_sotrudnik INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- первичный ключ
	last_name varchar(30) not null constraint ch_last_name_one
        check (last_name REGEXP '^[a-zA-Z]+$'), -- строка для фамилии
	first_name varchar(30) not null constraint ch_first_name_one
        check (first_name REGEXP '^[a-zA-Z]+$'), -- строка для имени
	otchestwo varchar(30) null default('-') constraint ch_otchestwo_one
        check (otchestwo REGEXP '^[a-zA-Z]+$'), -- строка для отчества, заполнять не обязательно
	telephone_number varchar(18) not null unique -- уникальная строка для уникального номера телефона
		check (telephone_number like '+7(___)-___-__-__'), -- симуляция или маска
	life_address varchar(200) not null, -- строка для адреса проживания сотрудника
	birthday date not null, -- строка для указания дня рождения
	passport_serija	Varchar(4) not null constraint ch_passport_serija_one -- строка для серии паспорта
		Check (passport_serija REGEXP '^[0-9]+$'), -- проверка для строки с серией паспорта
	passport_number	Varchar(6) not null constraint ch_passport_number_one --- строка для номера паспорта
		Check (passport_number REGEXP '^[0-9]+$') -- маска
);

create table sdelka -- таблица для сделок
(
	id_sdelka INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- первичный ключ
	nazvanie varchar(60) not null, -- строка для имени сделки
	data_sdelki date not null, -- строка для указания даты сделки
	opisanie_sdilki varchar(100) not null, -- строка для описания сделки
	summa_sdelki decimal(38,2) not null,-- строка для указания суммы сделки
		check (summa_sdelki >= 0.0), -- проверка, чтобы сумма была не меньше нуля
	nedvijimost_id int not null references "nedvijimost"("id_nedvijimost"), -- внешний ключ на таблицу для недвижимости
	sotrudnic_id int not null references "sotrudnik"("id_sotrudnik"), -- внешний ключ на таблицу с сотрудниками
	client_id int not null references "client"("id_client"), -- внешний ключ на таблицу с клиентами
	type_sdelki_id int not null references "type_sdelki"("id_type_sdelki") -- внешний ключ на таблицу с видом сделки
);

create table position_s -- таблица для должностей
(
	id_position INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- строка для первичного ключа
	position_name varchar(30), -- строка для имени должности
	salary decimal(38, 2), -- строка для зарплаты
	otdel_id int not null references "otdel"("id_otdel"), -- строка для внешнего ключа на таблицу с отделами
	type_uslug_id int not null references "type_uslug"("id_type_uslug"),
    constraint ch_position_name
        check (position_name REGEXP '^[a-zA-Z]+$') -- внешний ключ на таблицу с типами услуг
);
/*
create table sotrudnik_position -- таблица для общей таблицы сотрудника и должности
(
	id_sotrudnik_position serial not null constraint pk_sotrudnik_position primary key, -- первичный ключ
	sotrudnik_id int not null references "sotrudnik"("id_sotrudnik"), -- внешний ключ на сотрудника
	position_id int not null references "position_s"("id_position") -- внешний ключ на должности
);
/*
create table sotrudnik_otdel -- таблица для работников отдела
(
	id_sotrudnik_otdel serial not null constraint pk_sotrudnik_otdel primary key, -- первичный ключ
	sotrudnik_id int not null references "sotrudnik"("id_sotrudnik"), -- внешний ключ на сотрудника
	otdel_id int not null references "otdel"("id_otdel") -- внешний ключ на отделы
);
/*
CREATE TABLE position_otdel_type_uslug
(
	id_position_otdel_type_uslug serial not null constraint pk_position_otdel_type_uslug primary key,
	position_id int not null REFERENCES "position_s"("id_position"),
	otdel_id int not null REFERENCES "otdel"("id_otdel")
	type_uslug_id int not null REFERENCES "type_uslug"("id_type_uslug")
)