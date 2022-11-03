/* Методи класу Laboratory_equipment */
-- DROP TYPE Laboratory_equipment FORCE;
CREATE OR REPLACE TYPE BODY Laboratory_equipment AS 
    /* конструктор екземплярів об'єктів класів.
    	Вхідні параметри:
	   1) p_changes_in_indicators - список змін показників обладнання
	   умова 1) якщо в таблиці Laboratory_equipment вже існує вказаний список,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Laboratory_equipment створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    CONSTRUCTOR FUNCTION Laboratory_equipment(p_changes_in_indicators NUMBER) 
        RETURN SELF AS RESULT
    IS
        v_id_labEquip Laboratory_equipment.id_labEquip%TYPE;
    BEGIN
        SELECT id_labEquip INTO v_id_labEquip
        FROM Laboratory_equipment
        WHERE 
            changes_in_indicators = p_changes_in_indicators;
        SELF.id_labEquip := v_id_labEquip;
        SELF.changes_in_indicators := p_changes_in_indicators;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Laboratory_equipment (changes_in_indicators)
            VALUES (p_changes_in_indicators)
        RETURNING id_labEquip INTO v_id_labEquip;
        SELF.id_labEquip := v_id_labEquip;
        SELF.changes_in_indicators := p_changes_in_indicators;
        RETURN;
    END Laboratory_equipment;
    
    /* Процедура зміни значень атрибутів */
	      MEMBER PROCEDURE regulateLaboratoryEquipment(p_id_labEquip INT, p_changes_in_indicators DATE, p_wf_time TIME)
	      IS
	      BEGIN
        UPDATE Weather_forecast SET wf_date = p_wf_date, wf_time = p_wf_time
		      WHERE weather_forecast_id = p_weather_forecast_id;
		      SELF.wf_date := p_wf_date, SELF.wf_time := p_wf_time;;
	      END formWeatherForecast;
   
   
   
   
   
   
	id_labEquip INT, -- айді
	changes_in_indicators NUMBER(20), -- зміни показників обладнання
	id_equipIndic INT, -- айді показників обладнання
  /* конструктор екземплярів об'єктів класів.
       
    	CONSTRUCTOR FUNCTION Laboratory_equipment(p_changes_in_indicators NUMBER)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_changes_in_indicators(p_id_labEquip NUMBER, p_changes_in_indicators NUMBER),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_id_labEquip RETURN INT,
		MEMBER FUNCTION get_changes_in_indicators RETURN NUMBER,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);
