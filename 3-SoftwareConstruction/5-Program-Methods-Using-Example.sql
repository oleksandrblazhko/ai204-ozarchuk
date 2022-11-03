/* Приклади роботи з класом Laboratory_equipment */
DECLARE
    le1 Laboratory_equipment;
BEGIN 
    le1:= NEW Laboratory_equipment(TO_CHANGES('18, 25, 10','N%, N%, N%'));
	    dbms_output.put_line('get id_labEquip: ' || le1.get_id_labEquip);
	    dbms_output.put_line('get changes_in_indicators: ' || le1.changes_in_indicators);
    le1.display();
END;
/

/* Приклад роботи з класами Laboratory_equipment, Equipment_indicators */
DECLARE 
    le1 Laboratory_equipment;
    ei1 Equipment_indicators;
BEGIN 
    le1:= NEW Laboratory_equipment(TO_CHANGES('18, 25, 10','N%, N%, N%'));
    ei1:= Equipment_indicators(15, 'air humidity', 'air temperature', 'pressure', le1);
    ei1.display();
END;
/

/* Приклад роботи з класами Laboratory_equipment, Equipment_indicators, Air_humidity */
DECLARE 
   le1 Laboratory_equipment;
   ei1 Equipment_indicators;
   ah1 Air_humidity;
BEGIN
    le1:= NEW Laboratory_equipment(TO_CHANGES('18, 25, 10','N%, N%, N%'));
    ei1:= Equipment_indicators(15, 'air humidity', 'air temperature', 'pressure', le1);
    ah1 := Air_humidity(20, 15.2, ei1);
    ah1.display(); 
END;
/

/* Приклад роботи з класами Laboratory_equipment, Equipment_indicators, Air_humidity, User */
DECLARE 
    le1 Laboratory_equipment;
    ei1 Equipment_indicators;
    ah1 Air_humidity;
    us1 User;
    us2 User;
BEGIN 
    le1:= NEW Laboratory_equipment(TO_CHANGES('18, 25, 10','N%, N%, N%'));
    ei1:= Equipment_indicators(15, 'air humidity', 'air temperature', 'pressure', le1);
    ah1 := Air_humidity(20, 15.2, ei1);
    us1 := User(54, 'Ozarchuk', 'Anna', 'Sergiivna', 'anya.ozarchuk@gmail.com', '098 546 65 12', NULL, ei1, ah1);
    us2 := User(65, 'Kyrylchuk', 'Daryna', 'Mykhailyvna', 'daryna.kyrylchuk@gmail.com', '097 123 25 87', NULL, ei2, ah2);
    us1.display(); 
    us2.display(); 
END;
/
