create trigger history_insert
after insert on sotrudnik
    for each row
execute procedure fc_History_insert();

create trigger history_update
after update on sotrudnik
    for each row
execute procedure fc_History_update();

create trigger history_delete
before delete on sotrudnik
    for each row
execute procedure fc_History_delete();