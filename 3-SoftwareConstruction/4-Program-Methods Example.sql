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
	      MEMBER PROCEDURE regulateLaboratoryEquipment(p_id_labEquip INT, p_changes_in_indicators NUMBER)
	      IS
	      BEGIN
        UPDATE Laboratory_equipment SET changes_in_indicators = p_changes_in_indicators
		      WHERE id_labEquip = p_id_labEquip;
		      SELF.changes_in_indicators := p_changes_in_indicators;
	      END regulateLaboratoryEquipment;
	      
	/* Функції отримання значень атрибутів */
	      /* get_id_labEquip */
        MEMBER FUNCTION get_id_labEquip
	        RETURN INT 
	      IS
        BEGIN
          RETURN SELF.id_labEquip;
        END get_id_labEquip;
        
        /* get_changes_in_indicators */
        MEMBER FUNCTION get_changes_in_indicators
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.changes_in_indicators;
        END get_changes_in_indicators;

        /* Процедура виводу на екран значень атрибутів */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('id_labEquip: ' || id_labEquip);
          dbms_output.put_line('changes_in_indicators: ' || changes_in_indicators);
        END display;
END; 
/	      
