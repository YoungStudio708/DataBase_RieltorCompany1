create table sotrudnik_history
(
id_sotrudnik_history INT not null auto_increment primary key,
status_rec varchar(20) not null,
sotrudnik_info varchar(20) not null,
post_info varchar(20) not null,
create_date date null default now()
);

DELIMITER $$
create TRIGGER history_insert
    AFTER INSERT 
    ON sotrudnik_position
    for each row
BEGIN 
    INSERT INTO sotrudnik_history(status_rec, sotrudnik_info, post_info)
    values ('insert', ((select concat('Insert new staff. ',
    'Last name: ', cast(NEW.last_name as varchar(30)), ';',
    'Name: ', cast(NEW.first_name as varchar(30)), ';',
    'Patronymic: ', cast(NEW.otchestwo as varchar(30)), ';',
    ) from sotrudnik
    WHERE id_sotrudnik = NEW.sotrudnik_id),
    (SELECT CONCAT('Position name: ',
        cast(position_name as varchar(30)), ';')
        FROM position_s WHERE id_position = NEW.position_id);
END $$
DELIMITER ;