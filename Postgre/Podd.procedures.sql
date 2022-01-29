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

CREATE OR REPLACE PROCEDURE client_insert
    (p_id_client INT, p_last_name VARCHAR(30), p_first_name VARCHAR(30),
    p_otchestwo VARCHAR(30), p_passport_serija VARCHAR(4), p_passport_number VARCHAR(6),
    p_telephone_number VARCHAR(16))
LANGUAGE plpgsql
AS $$

    DECLARE have_record INT;
    BEGIN
    
    
        have_record := COUNT(*) from client
        WHERE last_name = p_last_name AND 
            first_name = p_first_name AND
            otchestwo = p_otchestwo AND
            passport_serija = p_passport_serija AND
            passport_number = p_passport_number AND
            telephone_number = p_telephone_number;

        IF have_record > 0 THEN
                raise exception'Already exists in table!';
            ELSE
                UPDATE client SET
                    last_name = p_last_name ,
            first_name = p_first_name ,
            otchestwo = p_otchestwo ,
            passport_serija = p_passport_serija ,
            passport_number = p_passport_number ,
            telephone_number = p_telephone_number
                WHERE id_client = p_id_client;
                END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE type_sdelki_insert
    (p_id_type_sdelki INT , 
    p_type_sdelki_opisanie VARCHAR (30), 
    p_type_sdelki_name VARCHAR (30))
LANGUAGE plpgsql
AS $$
    DECLARE have_record INT ;

    BEGIN

        have_record := COUNT(*) FROM  type_sdelki
        WHERE  type_sdelki_opisanie = p_type_sdelki_opisanie AND 
        type_sdelki_name = p_type_sdelki_name;
    if have_record > 0 THEN
        raise exception 'Already exists in table!';
        ELSE
            UPDATE type_sdelki SET 
            type_sdelki_opisanie = p_type_sdelki_opisanie,  
            type_sdelki_name = p_type_sdelki_name
            WHERE id_type_sdelki = p_id_type_sdelki;
            END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE sotrudnik_insert
    (p_id_sotrudnik INT, p_last_name VARCHAR(30), p_first_name VARCHAR (30),
    p_otchestwo VARCHAR (30), p_telephone_number VARCHAR (18), p_life_address VARCHAR (200),
    p_birthday DATE , p_passport_serija VARCHAR(4), p_passport_number VARCHAR(6))
LANGUAGE plpgsql
AS $$
    DECLARE have_record INT ;

    BEGIN

        have_record := COUNT(*) FROM  sotrudnik
        WHERE  last_name = p_last_name AND
        first_name = p_first_name AND
        otchestwo = p_otchestwo AND
        telephone_number = p_telephone_number AND
        life_address =p_life_address AND
        birthday = p_birthday AND
        passport_serija = p_passport_serija AND
        passport_number = p_passport_number;
        
    if have_record > 0 THEN
        raise exception 'Already exists in table!';
        ELSE
            UPDATE sotrudnik SET 
            last_name = p_last_name ,
        first_name = p_first_name ,
        otchestwo = p_otchestwo ,
        telephone_number = p_telephone_number ,
        life_address =p_life_address ,
        birthday = p_birthday ,
        passport_serija = p_passport_serija ,
        passport_number = p_passport_number
            WHERE id_sotrudnik = p_id_sotrudnik;
            END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE sdelka_insert
    (p_id_sdelka INT, p_nazvanie VARCHAR(60), p_data_sdelki DATE ,
    p_opisanie_sdilki VARCHAR (100), p_summa_sdelki DECIMAL (38,2), p_nedvijimost_id INT,
    p_sotrudnic_id INT , p_client_id INT, p_type_sdelki_id INT)
LANGUAGE plpgsql
AS $$
    DECLARE have_record INT ;

    BEGIN

        have_record := COUNT(*) FROM  sdelka
        WHERE  nazvanie = p_nazvanie AND
        data_sdelki = p_data_sdelki AND
        opisanie_sdilki = p_opisanie_sdilki AND
        summa_sdelki =p_summa_sdelki AND
        nedvijimost_id = p_nedvijimost_id AND
        sotrudnic_id = p_sotrudnic_id AND
        client_id = p_client_id AND 
        type_sdelki_id = p_type_sdelki_id;
        
    if have_record > 0 THEN
        raise exception 'Already exists in table!';
        ELSE
            UPDATE sdelka SET 
            nazvanie = p_nazvanie ,
        data_sdelki = p_data_sdelki ,
        opisanie_sdilki = p_opisanie_sdilki ,
        summa_sdelki =p_summa_sdelki ,
        nedvijimost_id = p_nedvijimost_id ,
        sotrudnic_id = p_sotrudnic_id ,
        client_id = p_client_id , 
        type_sdelki_id = p_type_sdelki_id
            WHERE id_sdelka = p_id_sdelka;
            END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE position_s_insert
    (p_id_position INT, p_position_name VARCHAR(30), p_salary DECIMAL (38,2),
    p_otdel_id INT, p_type_uslug_id INT)
LANGUAGE plpgsql
AS $$
    DECLARE have_record INT ;

    BEGIN

        have_record := COUNT(*) FROM  position_s
        WHERE  position_name = p_position_name AND
        salary = p_salary AND
        otdel_id = p_otdel_id AND
        type_uslug_id = p_type_uslug_id ;
                
    if have_record > 0 THEN
        raise exception 'Already exists in table!';
        ELSE
            UPDATE position_s SET 
            position_name = p_position_name ,
        salary = p_salary ,
        otdel_id = p_otdel_id ,
        type_uslug_id = p_type_uslug_id
            WHERE id_position = p_id_position;
            END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE sotrudnik_position_insert
    (p_id_sotrudnik_position INT, p_sotrudnik_id INT, p_position_id INT)
LANGUAGE plpgsql
AS $$
    DECLARE have_record INT ;

    BEGIN

        have_record := COUNT(*) FROM  sotrudnik_position
        WHERE  sotrudnik_id = p_sotrudnik_id AND
        position_id = p_position_id ;
                
    if have_record > 0 THEN
        raise exception 'Already exists in table!';
        ELSE
            UPDATE sotrudnik_position SET 
            sotrudnik_id = p_sotrudnik_id ,
            position_id = p_position_id
            WHERE id_sotrudnik_position = p_id_sotrudnik_position;
            END if;
    END;
$$;

CREATE OR REPLACE PROCEDURE sotrudnik_otdel_insert
    (p_id_sotrudnik_otdel INT, p_sotrudnik_id INT, p_otdel_id INT)
LANGUAGE plpgsql
AS $$
    DECLARE have_record INT ;

    BEGIN

        have_record := COUNT(*) FROM  sotrudnik_otdel
        WHERE  sotrudnik_id = p_sotrudnik_id AND
        otdel_id = p_otdel_id ;
                
    if have_record > 0 THEN
        raise exception 'Already exists in table!';
        ELSE
            UPDATE sotrudnik_otdel SET 
            sotrudnik_id = p_sotrudnik_id ,
            otdel_id = p_otdel_id
            WHERE id_sotrudnik_otdel = p_id_sotrudnik_otdel;
            END if;
    END;
$$;