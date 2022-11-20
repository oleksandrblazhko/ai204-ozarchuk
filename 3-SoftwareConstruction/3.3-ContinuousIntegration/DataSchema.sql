CREATE TABLE air_humidity ( -- вологість повітря
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

	
CREATE TABLE laboratory_equipment ( -- лабораторне обладнання
	id_labEquip INT PRIMARY KEY, -- айді
	changes_in_indicators NUMBER(20), -- зміни показників обладнання
	id_equipIndic INT REFERENCES equipment_indicators (id_equipIndic) -- айді показників обладнання
);

	
CREATE TABLE online_message ( -- онлайн повідомлення
	id_onlineMessage INT PRIMARY KEY, -- айді
	email VARCHAR, -- email 
	text VARCHAR -- поле для тексту
);

	
CREATE TABLE elect_tech_docum ( -- електронна технічна документація
	id_docum INT PRIMARY KEY, -- айді
	document VARCHAR -- документ з інформацією
);

	
CREATE TABLE searching_system ( -- пошукова система
	id_system INT PRIMARY KEY, -- айді
	online_request VARCHAR -- онлайн запит
);


CREATE TABLE office_worker ( -- робітник команди
	id_officeWorker INT PRIMARY KEY, -- айді
	id_system INT REFERENCES searching_system (id_system), -- айді пошукової системи
	id_docum INT REFERENCES elect_tech_docum (id_docum) -- айді електронної технічної документації
);


CREATE TABLE user ( -- користувач
	id_user INT PRIMARY KEY, -- айді
	surname VARCHAR, -- прізвище
	name VARCHAR, -- імʼя
	patronymic VARCHAR, -- по батькові
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), -- пошта
	phone_number VARCHAR, -- мобільний номер
	id_airHum INT REFERENCES air_humidity(id_airHum), -- айді вологості повітря
	id_onlineMessage INT REFERENCES online_message (id_onlineMessage), -- айді онлайн повідомлень
	id_equipIndic INT REFERENCES equipmentIndicators (id_ equipIndic) -- айді зміни показників
);


CREATE TABLE employee ( -- робітник
	id_employee INT PRIMARY KEY, -- айді
	surname VARCHAR, -- прізвище
	name VARCHAR, -- імʼя
	patronymic VARCHAR, -- по батькові
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), -- пошта
	phone_number VARCHAR, -- мобільний номер
	work_experience NUMBER(5), -- досвід роботи
	salary NUMBER(20), -- заробітня плата
	id_airHum INT REFERENCES air_humidity(id_airHum), -- айді вологості повітря
	id_onlineMessage INT REFERENCES online_message (id_onlineMessage), -- айді онлайн повідомлень
	id_officeWorker INT REFERENCES office_worker (id_office_worker) -- айді робітника команди
);
