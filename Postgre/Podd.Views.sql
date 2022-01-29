CREATE VIEW client_view
AS
SELECT 
    id_client, last_name, first_name, 
    otchestwo, passport_serija, passport_number, 
    telephone_number
  FROM client;
  SELECT * FROM client_view;