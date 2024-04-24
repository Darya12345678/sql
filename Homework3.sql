CREATE DATABASE staff;
use staff;
-- создаем таблицу
CREATE TABLE staff
(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
post VARCHAR(10) NOT NULL,
seniority INT UNSIGNED NULL,
salary DECIMAL(10,2) NOT NULL,
age INT UNSIGNED NOT NULL
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

SELECT * FROM staff;

-- Отсортируйте данные по полю заработная плата (salary) в порядке убывания.
SELECT * FROM staff
ORDER BY salary DESC;

-- Отсортируйте данные по полю заработная плата (salary) в порядке возрастания.
SELECT * FROM staff
ORDER BY salary;

-- Выведите 5 максимальных заработных плат (salary)
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5; 

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) as SalarySum
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post, COUNT(*) AS Amount
FROM staff
WHERE age BETWEEN 24 AND 49 AND post = 'Рабочий';

-- Найдите количество уникальных специальностей
SELECT post, COUNT(*) AS Amount
FROM staff
GROUP BY post
HAVING COUNT(*) < 2;


-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(Age) AS AvgAge
FROM staff
GROUP BY post
HAVING AvgAge < 30
-- HAVING AVG(Age) < 30;
