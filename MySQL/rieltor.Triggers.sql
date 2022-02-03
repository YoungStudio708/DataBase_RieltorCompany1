create table sotrudnik_history
(
id_sotrudnik_history INT not null auto_increment primary key,
status_rec varchar(20) not null,
sotrudnik_info varchar(20) not null,
post_info varchar(20) not null,
create_date date null default now()
);
delimiter //
create or replace trigger History_Insert /*создание триггера*/
after insert on sotrudnik /*после ввода в ...*/
for each row /*для каждой строки*/
begin /*начало*/
if NEW.Id_Sotrudnik then /*если NEW.ID_Employee тогда*/
insert into sotrudnik_history(status_rec, sotrudnik_info, post_info) /*ввод в Employee_History*/
VALUES('Новая запись', /*значения*/
(select concat(last_name,' ',first_name,' ',otchestwo) from sotrudnik where id_sotrudnik = NEW.ID_sotrudnik),
(select concat(position_name,', Оклад: ',cast(salary as varchar(30))) from position_s where id_position= NEW.dolzhnost_ID));
end if; /*конец если*/
end; /*конец*/
