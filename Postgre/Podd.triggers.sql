
create table sotrudnik_history -- табличка для триггера
(
id_sotrudnik_history SERIAL not null constraint pk_sotrudnik_history primary key, -- ключ
status_rec varchar(20) not null,
sotrudnik_info varchar(20) not null,
post_info varchar(20) not null,
create_date timestamp null default(now()::timestamp)
);

create or replace function history_insert_func() -- новая функция

returns trigger -- с возвращением триггера
LANGUAGE plpgsql
as $$
begin
insert into sotrudnik_history(status_rec, sotrudnik_info, post_info)
values ('Новая запись',
(select last_name||' '||first_name||' '||otchestwo from sotrudnik where id_sotrudnik = NEW.id_sotrudnik), -- черпаем информацию
(select position_name||', Оклад: '||salary from position_s where id_position = NEW.position_id)); -- черпаем информацию
return new;
end;

$$;



create trigger history_insert -- сам триггер
after insert on sotrudnik
    for each row
execute procedure history_insert_func(); -- ссылается на функцию выше
