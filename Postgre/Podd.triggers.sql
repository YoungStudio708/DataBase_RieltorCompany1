
create table sotrudnik_history
(
id_sotrudnik_history SERIAL not null constraint pk_sotrudnik_history primary key,
status_rec varchar not null,
sotrudnik_info varchar not null,
post_info varchar not null,
create_date timestamp null default(now()::timestamp)
);

create or replace function history_insert_func()

returns trigger
LANGUAGE plpgsql
as $$
begin
insert into sotrudnik_history(status_rec, sotrudnik_info, post_info)
values ('Новая запись',
(select last_name||' '||first_name||' '||otchestwo from sotrudnik where id_sotrudnik = NEW.id_sotrudnik),
(select position_name||', Оклад: '||salary from position_s where id_position = NEW.position_id));
return new;
end;

$$;



create trigger history_insert
after insert on sotrudnik
    for each row
execute procedure history_insert_func();
