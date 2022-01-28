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
                raice exception('Already exists in table!');
            ELSE
                UPDATE nedvijimost SET
                    addresss = p_address,
                    opisanie = p_opisanie,
                    data_postrojki = p_data_postrojki ,
                    kollichestvo_komnat = p_kollichestwo_komnat,
                    razmer_uchastka = p_razmer_uchastka ,
                    razmer_jilogo_pomeschenija = p_razmer_jilogo_pomeschenija,
                    cell = p_cell;
                WHERE id_nedvijimost = p_id_nedvijimost;
                END if;
    END;
$$;
