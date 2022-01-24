/*
============================
	Создание таблиц
============================
*/
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

create table nedvijimost -- таблица для недвижимости
( -- начало
	--creating primary key for nedvijimost table
	id_nedvijimost serial not null constraint pk_nedvijimost primary key,
	addresss varchar(200) not null constraint ui_address unique, -- создание строки для уникалььного адреса.
	opisanie varchar(150) not null, -- создание строки для описания
	data_postrojki date not null, -- создание строки для указания даты постройки ссоружения
	kollichestvo_komnat int not null check (kollichestvo_komnat > 0),--строка для указания количества комнат в выбранном жилом помещении с проверко, 
	--чтоб камнат было больше нуля
	razmer_uchastka decimal(38,2) not null check (razmer_uchastka > 0.0) default (0.0), -- строка для указания размера участка
	razmer_jilogo_pomeschenija decimal(38,2) not null check(razmer_jilogo_pomeschenija > 0.0) default(0.0),
	cell VARCHAR(10) not null
	-- строка для указания размера жилого помещения.
	-- строка для цены
); -- конец


create table type_uslug -- таблица для типов услуг
(
	id_type_uslug	serial not null constraint pk_type_uslug primary key, -- первичный ключ таблицы
	type_uslug_name	varchar(30)	not null constraint ui_type_uslug_name unique, -- строка для типа услуг
	type_uslug_opisanie	varchar(30)	not null -- строка для описания
);


create  table otdel
(
	id_otdel serial not null constraint pk_otdel primary key, -- создание первичного ключа для отделов
	otdel_name	Varchar(60) not null constraint ui_otdel_name unique, -- создание строки для имени отдела
	otdel_opisanie	VARCHAR(200) not null -- создание строки для описания отдела
);

create table client
(
	id_client serial not null constraint pk_cleint primary key, -- первичный ключ
	last_name	Varchar(30) not null, -- строка для фамилии
	first_name	Varchar(30) not null, -- строка для имени
	otchestwo	Varchar(30) null default ('-'), -- строка для отчества
	passport_serija	Varchar(4) not null, -- строка для серии паспорта
		Check(passport_serija similar to '[0-9][0-9][0-9][0-9]' ), -- проверка для строки с серией паспорта
	passport_number	Varchar(6) not null, --- строка для номера паспорта
		Check(passport_number similar to '[0-9][0-9][0-9][0-9][0-9][0-9]' ), -- проверка для строки с номером паспорта
	telephone_number	Varchar(16) not null -- строка для номера телефона
);

create table type_sdelki -- таблица для типа сделки
(
	id_type_sdelki serial not null constraint pk_type_sdelki primary key, -- первичный ключ
	type_sdelki_opisanie varchar(30) not null, -- строка для описания типа сделки
	type_sdelki_name varchar(30) not null -- строка для имени типа сделки
);

create table sotrudnik -- таблица для сотрудников
(
	id_sotrudnik serial not null constraint pk_sotrudnik primary key, -- первичный ключ
	last_name varchar(30) not null, -- строка для фамилии
	first_name varchar(30) not null, -- строка для имени
	otchestwo varchar(30) null default('-'), -- строка для отчества, заполнять не обязательно
	telephone_number varchar(16) not null constraint ui_telephone_number unique, -- уникальная строка для уникального номера телефона
		check (telephone_number similar to '\+7\([0-9][0-9][0-9]\) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'), -- симуляция или маска
	life_address varchar(200) not null, -- строка для адреса проживания сотрудника
	birthday date not null, -- строка для указания дня рождения
	passport_serija varchar(4) not null, -- строка для серии паспорта
		check(passport_serija similar to '[0-9][0-9][0-9][0-9]'), -- маска
	passport_number varchar(6) not null, -- строка для номера паспорта
		check (passport_number similar to '[0-9][0-9][0-9][0-9][0-9][0-9]') -- маска
);

create table sdelka -- таблица для сделок
(
	id_sdelka serial not null constraint pk_sdelka primary key, -- первичный ключ
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
	id_position serial not null constraint pk_position primary key, -- строка для первичного ключа
	position_name varchar(30), -- строка для имени должности
	salary decimal(38, 2), -- строка для зарплаты
	otdel_id int not null references "otdel"("id_otdel"), -- строка для внешнего ключа на таблицу с отделами
	type_uslug_id int not null references "type_uslug"("id_type_uslug") -- внешний ключ на таблицу с типами услуг
);

create table sotrudnik_position -- таблица для общей таблицы сотрудника и должности
(
	id_sotrudnik_position serial not null constraint pk_sotrudnik_position primary key, -- первичный ключ
	sotrudnik_id int not null references "sotrudnik"("id_sotrudnik"), -- внешний ключ на сотрудника
	position_id int not null references "position_s"("id_position") -- внешний ключ на должности
);

create table sotrudnik_otdel -- таблица для работников отдела
(
	id_sotrudnik_otdel serial not null constraint pk_sotrudnik_otdel primary key, -- первичный ключ
	sotrudnik_id int not null references "sotrudnik"("id_sotrudnik"), -- внешний ключ на сотрудника
	otdel_id int not null references "otdel"("id_otdel") -- внешний ключ на отделы
);



