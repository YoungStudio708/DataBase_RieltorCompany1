/*
-----------------------------
Заполнение таблиц данными
-----------------------------
*/
 -- NEDVIJIMOST -- 
INSERT INTO "nedvijimost"("addresss", "opisanie", "data_postrojki", "kollichestvo_komnat", "razmer_uchastka", "razmer_jilogo_pomeschenija", "cell")

VALUES  ('Moscow, Russian-river street, д.1, USA', '-', '17.10.2017', 2, 300, 300, 1000000),
        ('Санкт-Петербург, Московский проспект, д.11, RUS', '-', '12.12.2012', 2, 1, 600, 2000000),
        ('Новосибирск, ул.Карла Маркса, д.123, RUS', '-', '16.12.1990', 1, 1,300, 1500000),
        ('Учкудук, ул.Алма-Атинская, д.12, RUS', 'Участок без построек', '11.01.1986', 3, 1, 500, 500000),
        ('Костомукша, ул.Ленинградская, д.45, кв.54, RUS', 'Квартира в центре города с ремонтом', '11.09.1947', 2, 1, 200, 100000),
        ('Berlin, Moscau str, 12, GE', 'Аппартаменты возле метро Moskau-str', '15.03.2000', 6, 600, 300, 700000),
        ('Paris, Kommuna-French street, 12, FR', 'Дом имеющий историческую ценность', '21.06.1897', 3, 1, 300, 1500000),
        ('Киев, ул.Незалежности, д.1, UA', 'Дом на берегу реки Днепр', '10.03.1975', 2, 1, 300, 3000000),
        ('Praha, Seifertova, 32/3, CZ', 'Аппартаменты в центре города, рядом есть центральный вокзал', '11.03.1100', 2, 1, 400, 3000000),
        ('Москва, ул.Воздвиженка д.123, RUS', 'Дом на Воздвиженке', '20.01.1735', 3, 1, 300, 3000000);


-- OPISANIE --
INSERT INTO "otdel"("otdel_name", "otdel_opisanie")
VALUES  ('Отдел продаж', 'Здесь клиент может купить жилье'),
        ('Рекламный отдел', 'Здесь клиент может разместить рекламу, а также отдел занимается распространением влияния компании'),
        ('Отдел аренды', 'Здесь клиент может оформит аренду жилья'),
        ('Отдел информационной безопасности', 'Отдел, который занимается сохранением целостности данных и их защитой'),
        ('Отдел работы с клиентом', 'Здесь сотрудники выясняют, чего хочет клиент, проводят консультации'),
        ('Отдел купли', 'Здесь клиент может продать свое жилье как вторичное и сдать в аренду'),
        ('Бухгалтерия', 'Отдел, занимающийся подсчетом прибыли и убыли, высчитывает зарплату'),
        ('Администрация', 'Административный отдел, совет директоров'),
        ('Отдел безопасности', 'Отвечает за безопасность сотрудников и клиентов'),
        ('Отдел психологической помощи сотрудникам', 'Психологические консультации для сотрудников компании');

INSERT INTO "client"("last_name", "first_name", "otchestwo",  "passport_serija", "passport_number", "telephone_number")
VALUES ('Абдул','Шарат','Георгиевич', '2341','654786','7(917)-231-23-43'),
        ('Гурубабамамаджи','Рашид',' ', '3452','768978','7(908)-987-67-65'),
        ('Оуэн','Кристоф',' ', '4523','456756','7(977)-363-97-64'),
        ('Жильцов','Алексей','Андреевич', '1234','345678','7(342)-675-65-67'),
        ('Шайтан','Хейхэ','Тарасович', '7865','887645','7(342)-235-56-56'),
        ('Питич','Джозев',' ', '7685','908768',''),
        ('Мен','Казначей','', '1235','123456','8(908)-987-89-85'),
        ('Мен У','Я','', '0987','654321','7(908)-908-90-80'),
        ('Тосиюки','Джампей','', '8769','564897','7(987)-342-90-80'),
        ('Лао-Джи','Ляо','', '2345','654358','7(903)-963-80-97');

INSERT INTO "type_sdelki"("type_sdelki_opisanie", "type_sdelki_name")
VALUES  ('', 'Продажа'),
        ('', 'Сдача в аренду'),
        ('', 'Залог'),
        ('', 'Договор о сотрудничестве'),
        ('', 'Продажа рекламы'),
        ('', 'Аренда билборда'),
        ('', 'Консультация'),
        ('', 'Поиск жилья'),
        ('', 'Осмотр жилья'),
        ('', 'Страховка');

INSERT INTO "sotrudnik"("last_name", "first_name", "otchestwo", "telephone_number", "life_address", "birthday", "passport_serija", "passport_number")
VALUES ('Питич', 'Грга', '', '+7(908) 908-90-09', 'Москва, Новосибирский проспект, д2', '18.03.2003', '4523', '456765'),
        ('Питич', 'Даден', '', '+7(908) 907-90-09', 'Москва, Ленинградская ул, д.12, кв.123', '19.09.2001', '3453', '231768'),
        ('Малмуд', 'Шайтан', 'Диаблович', '+7(666) 666-16-66', 'Детроид, Эдсель Форд Хайгвей, д.123', '12.12.1989', '6754', '897634'),
        ('Кай', 'Ян', 'Сяо', '+7(342) 980-88-99', 'Париж, ул.Коммуны, д.12', '13.12.1999', '1598', '357896'),
        ('Сяо', 'Нин', '', '+7(632) 658-65-45', 'Волоколамск, ул.Ленина, д.23, кв.4', '12.02.2003', '1325', '132564'),
        ('Махмуд', 'Абдул', 'Былашир', '+7(987) 365-23-15', 'Люберцы, ул.Московская, д.12, кв.45', '11.09.1998', '3698', '332566'),
        ('Чайников', 'Гриша', 'Гаррикович', '+7(903) 263-90-90', 'Санкт-Петербург, Московский проспект, д.2, кв.6', '16.02.1980', '3256', '963214'),
        ('Горлопан', 'Марта', '', '+7(908) 897-43-45', 'Санкт-Петербург, ул.Екатерины, д.12', '10.09.1979', '6548', '963256'),
        ('Никогда', 'Мария', '', '+7(967) 987-65-66', 'Санкт-Петербург, Исаакиевская ул., д.2, кв.56', '16.05.1979', '6548', '326547'),
        ('Никогда', 'Бадя', 'Хрюнделевич', '+7(342) 325-69-89', 'Санкт-Петербург, Исаакиевская ул., д.2, кв.56', '12.12.1999', '6589', '325687');

INSERT INTO "sdelka"("nazvanie", "data_sdelki", "opisanie_sdilki", "summa_sdelki", "nedvijimost_id", "sotrudnic_id", "client_id", "type_sdelki_id")
VALUES  ('Продажа дома', '11.11.2022', '', 3000000, 5, 10, 2, 1),
        ('Аренда дома', '10.10.2020', 'Взятие в аренду дома', 2000000, 3, 7, 3, 2),
        ('Аренда дома1', '12.12.2021', 'Аренда дома в Париже', 2000000, 7, 1, 7, 2),
        ('Осмотр жилья', '26.01.2022', '', 20000, 1, 8, 1, 9),
        ('Продажа дома1', '27.08.2012', '', 3500000, 10, 2, 5, 1),
        ('Аренда жилья', '25.12.2019', '', 750000, 5, 3, 3, 2),
        ('Залог за жилье', '25.12.2019', '', 30000, 5, 3, 3, 3),
        ('Страховка1', '28.01.2022', '', 5000, 1, 8, 1, 10),
        ('Покупка жилья', '29.01.2022', '', 1000000, 1, 8, 1, 1),
        ('Аренда жилья1', '11.11.2011', '', 700000,6, 7,7,2);

INSERT INTO "type_uslug"("type_uslug_name", "type_uslug_opisanie")
VALUES ('оформление доверенности',''),
        ('Формировка договора о продаже',''),
        ('Формировка договора о купле',''),
        ('Формирование договора об аренде',''),
        ('Формирование договора о страховке',''),
        ('Консультация клиента',''),
        ('Психологические услуги',''),
        ('Договор об установке камер наблюдения в квартире',''),
        ('Услуги бариста',''),
        ('Услуги личного риелтора','');       
INSERT INTO "position_s"("position_name","salary","otdel_id","type_uslug_id")
VALUES ('Консультант', 50000, 5, 6),
        ('Бариста', 45000, 1, 9),
        ('Риелтор', 60000, 5, 10),
        ('Страховщик', 55000, 9, 5),
        ('Психолог штатный', 50000, 10, 7),
        ('Специалист по продажам', 60000, 8, 2),
        ('Адвокат', 60000, 5, 1),
        ('Специалист по аренде', 50000, 3, 4),
        ('Менеджер', 70000, 8, 6),
        ('Специалист по безопасности', 60000, 9, 8);

INSERT INTO "sotrudnik_position"("sotrudnik_id", "position_id")
 VALUES (10),
        (8),
        (9),
        (5),
        (3),
        (4),
        (2),
        (1),
        (6),
        (7);

        INSERT INTO "sotrudnik_otdel"("sotrudnik_id", "otdel_id")
 VALUES (),
        (),
        (),
        (),
        (),
        (),
        (),
        (),
        (),
        ();

--создать таблицу position_s - type_uslug