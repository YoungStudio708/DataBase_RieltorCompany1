CREATE OR REPLACE VIEW workingbook_view
AS
SELECT 
    CONCAT(last_name, ' ', SUBSTRING(first_name, 1, 1), '.', SUBSTRING(otchestwo, 1, 1), '. ',
            'Passport: ', passport_serija, '-', passport_number, '.') AS "Passport data",
    CONCAT('Phone number: ', telephone_number, 
            'Life address: ', life_address, '.') AS "Contact information"
    FROM sotrudnik_position
    INNER JOIN  sotrudnik ON sotrudnik_id = id_sotrudnik
    INNER JOIN  position_s ON position_id = id_position;