CREATE OR REPLACE PROCEDURE nedvijimost_insert 
        (p_id_nedvijimost INT ,p_address VARCHAR(200), p_opisanie VARCHAR(150),
        p_data_postrojki DATE, p_kollichestwo_komnat INT,
        p_razmer_uchastka DECIMAL(38,2), p_razmer_jilogo_pomeschenija decimal(38,2),
        p_cell VARCHAR(10))
LANGUAGE plpgsql
AS $$

    DECLARE have_record INT;
    BEGIN
    
        have_record := COUNT(*) from nedvijimost
            WHERE addresss = p_address 
                AND opisanie = p_opisanie
                AND data_postrojki = p_data_postrojki 
                AND kollichestvo_komnat = p_kollichestwo_komnat
                AND razmer_uchastka = p_razmer_uchastka 
                AND razmer_jilogo_pomeschenija = p_razmer_jilogo_pomeschenija
                AND cell = p_cell;

            IF have_record > 0 THEN
                raise exception'Already exists in table!';
            ELSE
                UPDATE nedvijimost SET
                    addresss = p_address,
                    opisanie = p_opisanie,
                    data_postrojki = p_data_postrojki ,
                    kollichestvo_komnat = p_kollichestwo_komnat,
                    razmer_uchastka = p_razmer_uchastka ,
                    razmer_jilogo_pomeschenija = p_razmer_jilogo_pomeschenija,
                    cell = p_cell
                WHERE id_nedvijimost = p_id_nedvijimost;
                END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE type_uslug_insert
    (p_id_type_uslug INT, p_type_uslug_name VARCHAR(60), p_type_uslug_opisanie VARCHAR(60))
LANGUAGE plpgsql
AS $$

    DECLARE have_record INT;
    BEGIN
        have_record := COUNT(*) from type_uslug
        WHERE type_uslug_name = p_type_uslug_name AND type_uslug_opisanie = p_type_uslug_opisanie;
        IF have_record > 0 THEN
                raise exception'Already exists in table!';
            ELSE
                UPDATE nedvijimost SET
                    type_uslug_name = p_type_uslug_name,
                    type_uslug_opisanie = p_type_uslug_opisanie
                WHERE id_type_uslug = p_id_type_uslug;
                END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE otdel_insert
(p_id_otdel INT, p_otdel_name VARCHAR(60), p_otdel_opisanie VARCHAR(200))
LANGUAGE plpgsql
AS $$

    DECLARE have_record INT;
    BEGIN
        have_record := COUNT(*) from otdel
        WHERE otdel_name = p_otdel_name AND otdel_opisanie = p_otdel_opisanie;
        IF have_record > 0 THEN
                raise exception'Already exists in table!';
            ELSE
                UPDATE otdel SET
                    otdel_name = p_otdel_name,
                    otdel_opisanie = p_otdel_opisanie
                WHERE id_otdel = p_id_otdel;
                END if;
    END;
$$;
/*
CREATE OR REPLACE PROCEDURE client_insert
()
LANGUAGE plpgsql
AS $$

    DECLARE have_record INT;
    BEGIN
        have_record := COUNT(*) from client
        WHERE otdel_name = p_otdel_name AND otdel_opisanie = p_otdel_opisanie;
        IF have_record > 0 THEN
                raise exception'Already exists in table!';
            ELSE
                UPDATE client SET
                    
                WHERE id_otdel = p_id_otdel;
                END if;
    END;
$$;