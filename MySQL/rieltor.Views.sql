CREATE OR REPLACE VIEW workingbook_view -- новое представление
AS
    SELECT --выбор
     CONCAT(last_name, ' ', SUBSTRING(first_name, 1, 1), '.', SUBSTRING(otchestwo, 1, 1), '. ', -- однострочное отображение этих параметров
            'Passport: ', passport_serija, '-', passport_number, '.') AS "Passport data", -- паспортные данные
    CONCAT('Phone number: ', telephone_number, 
            'Life address: ', life_address, '.') AS "Contact information" -- строчное отображение данных
    FROM sotrudnik_position -- из это йтаблицы
    INNER JOIN  sotrudnik ON sotrudnic_id = id_sotrudnik -- подключение к ключам
    INNER JOIN  position_s ON position_id = id_position;

    CREATE OR REPLACE VIEW staff_rasp_view -- новое представление
AS
    SELECT
    CONCAT('Name of position', position_name, 'Service type name', type_uslug_name, -- однострочное отображение этих параметров
            'department name', otdel_name)
    FROM sotrudnik_position
    INNER JOIN position_s ON position_id = id_position
    INNER JOIN otdel ON otdel_id = id_otdel -- подключение к ключам
    INNER JOIN type_uslug ON type_uslug_id = id_type_uslug;