-- Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. (использование транзакции с выбором commit или rollback – обязательно).

use Homework;
CREATE TABLE users_old(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL
);
INSERT INTO users_old (firstname, lastname, email)
VALUES ('Степанов', 'Степан', 'stepa@mail.ru');

SELECT * FROM users_old;
DROP PROCEDURE IF EXISTS procedure_name;
DELIMITER $$ 
CREATE PROCEDURE procedure_name()
BEGIN

START TRANSACTION;
SET @new_firstname = (SELECT firstname from users WHERE id=1);
SET @new_lastname = (SELECT lastname from users WHERE id=1);
SET @new_email = (SELECT email from users WHERE id=1);
INSERT INTO users_old(firstname, lastname, email)
VALUES(@new_firstname, @new_lastname, @new_email);
DELETE FROM users
WHERE id=1;
COMMIT;

END $$
DELIMITER ;

CALL procedure_name();

SELECT * FROM users_old;
SELECT * FROM users;



-- Создайте функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
use Homework;

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS TEXT READS SQL DATA 
BEGIN
 DECLARE hour INT;
 SET hour = HOUR(NOW());
 
 CASE
		WHEN hour BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
 
END//
DELIMITER ;

SELECT hello();