/* Створення об'єктного типу (класу) user */
CREATE TABLE user ( -- користувач
	id_user INT, -- айді
	surname VARCHAR, -- прізвище
	name VARCHAR, -- імʼя
	patronymic VARCHAR, -- по батькові
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), -- пошта
	phone_number VARCHAR, -- мобільний номер
	id_airHum INT, -- айді вологості повітря
	id_onlineMessage INT, -- айді онлайн повідомлень
	id_equipIndic INT -- айді зміни показників
  /* перевизначення методу-процедури класу Employee */
    	OVERRIDING MEMBER PROCEDURE display 
)
/

/* Cтворення об'єктного типу (класу) employee, що успадковує об'єктний тип user */
CREATE TABLE employee ( -- робітник
	id_employee INT, -- айді
	surname VARCHAR, -- прізвище
	name VARCHAR, -- імʼя
	patronymic VARCHAR, -- по батькові
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), -- пошта
	phone_number VARCHAR, -- мобільний номер
	work_experience NUMBER(5), -- досвід роботи
	salary NUMBER(20), -- заробітня плата
	id_airHum INT, -- айді вологості повітря
	id_onlineMessage INT, -- айді онлайн повідомлень
	id_officeWorker INT -- айді робітника команди
  /* перевизначення методу-процедури класу user */
    	OVERRIDING MEMBER PROCEDURE display 
)
/

/* Створення типу для зберігання списку співробітників - "Колекція екземплярів об`єктів класу Employee */
CREATE TYPE Employee_List IS TABLE OF Employee;
/

/* Cтворення об'єктного типу (класу) office_worker, що успадковує об'єктний тип user */
CREATE TABLE office_worker ( -- робітник команди
	id_officeWorker INT, -- айді
	id_system INT, -- айді пошукової системи
	id_docum INT -- айді електронної технічної документації
  /* перевизначення методу-процедури класу user */
    	OVERRIDING MEMBER PROCEDURE display 
);
/


CREATE OR REPLACE TYPE air_humidity AS OBJECT ( -- вологість повітря
	id_airHum INT PRIMARY KEY, -- айді
	water_vapon NUMBER(20) -- водяна пара
);


CREATE TABLE equipment_indicators ( -- показники обладнання
	id_equipIndic INT PRIMARY KEY, -- айді
	air_humidity NUMBER(20), -- показник вологості повітря
	air_temperature NUMBER(20), -- показник температури повітря
	pressure NUMBER(20), -- показник тиску
	id_airHum INT REFERENCES air_humidity (id_airHum) -- айді вологості повітря
);

	
/* Створення об'єктного типу (класу) Laboratory_equipment */
CREATE OR REPLACE TYPE Laboratory_equipment AS OBJECT ( -- лабораторне обладнання
	id_labEquip INT, -- айді
	changes_in_indicators NUMBER(20), -- зміни показників обладнання
	id_equipIndic INT -- айді показників обладнання
  /* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_changes_in_indicators - список змін показників обладнання
	   умова 1) якщо в таблиці Laboratory_equipment вже існує вказаний список,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Laboratory_equipment створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Laboratory_equipment(p_changes_in_indicators VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_changes_in_indicators(p_id_labEquip NUMBER, p_changes_in_indicators VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_id_labEquip RETURN NUMBER,
		MEMBER FUNCTION get_changes_in_indicators RETURN VARCHAR,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);
/


/* Створення об'єктного типу (класу) Elect_tech_docum */  
CREATE TABLE elect_tech_docum ( -- електронна технічна документація
	id_docum INT, -- айді
	document VARCHAR -- документ з інформацією
  /* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);
/

	
/* Створення об'єктного типу (класу) Searching_system */  
CREATE OR REPLACE TYPE Searching_system AS OBJECT ( -- пошукова система
	id_system INT, -- айді
	online_request VARCHAR -- онлайн запит
  /* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);
/


/* Створення об'єктного типу (класу) Online_message */
CREATE OR REPLACE TYPE Online_message AS OBJECT ( -- онлайн повідомлення
	id_onlineMessage INT, -- айді
	email VARCHAR, -- email 
	text VARCHAR -- поле для тексту
  /* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);
/






