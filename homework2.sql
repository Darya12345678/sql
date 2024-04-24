-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
-- Чем NULL отличается от 0?

CREATE DATABASE sales;
 show databases;
use sales;
CREATE TABLE sales
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
	Price INT NOT NULL,
	Amount INT,
    ResultPrice INT
);   
    
INSERT INTO sales (Name, Price, Amount, ResultPrice)
VALUES
('Cacke', 50, 20, 1000),
('Icecream', 50, 100, 5000),
('Chupachups', 30, 500, 15000),
('Snikers', 40, 300, 12000);

SELECT * FROM sales;

SELECT * ,
CASE 
    WHEN Amount < 100
        THEN 'меньше 100'
	WHEN Amount = 100
        THEN '100-300'
	WHEN Amount > 100 and Amount < 300
		THEN '100-300'
    WHEN Amount = 300
	    THEN '100-300'
	ELSE 'больше 300'
END AS Category
FROM sales;



CREATE TABLE orders
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    OrderNumber INT NOT NULL,
	Price INT,
    StatusOrder VARCHAR(45)
); 

INSERT INTO orders (OrderNumber, Price, StatusOrder)
VALUES
(117, 1056, 'Оплачен'),
(118, 1000, 'Выдан'),
(119, 390, 'Собран'),
(120, 40, 'Отменен'),
(120, 40, 'Задерживается'),
(120, 40, 'В пути'),
(118, 1000, 'Оплачен'),
(118, 1000, 'В пути');

SELECT * FROM orders;
SELECT * ,
CASE 
    WHEN StatusOrder = 'Оплачен'
        THEN 'Статус заказа-Оплачен'
	WHEN StatusOrder ='Выдан'
        THEN 'Статус заказа-Выдан'
	WHEN StatusOrder = 'Собран'
		THEN 'Статус заказа-Собран'
    WHEN StatusOrder = 'Отменен'
	    THEN 'Статус заказа-Отменен'
        WHEN StatusOrder = 'В пути'
		THEN 'Статус заказа-В пути'
    WHEN StatusOrder = 'Задерживается'
	    THEN 'Статус заказа-Задерживается'
	ELSE ''
END AS FullStatusOrder
FROM orders;


/*
NULL - это специальное значение, которое используется в SQL для обозначения
 отсутствия данных. Оно отличается от пустой строки или нулевого значения,
 так как NULL означает отсутствие какого-либо значения в ячейке таблицы. 
*/
    