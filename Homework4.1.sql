CREATE DATABASE zoo;
use zoo;
CREATE TABLE shops (
	id INT,
    shopname VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE cats (
	name VARCHAR (100),
    id INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES shops (id)
);

INSERT INTO shops
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO cats
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
SELECT * FROM cats;

SELECT shops.id, shops.shopname, cats.name FROM cats
JOIN shops ON shops.id = cats.shops_id;
-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT shops.shopname FROM cats
JOIN shops ON shops.id = cats.shops_id
WHERE name = 'Murzik';

SELECT shopname FROM shops
WHERE EXISTS
(SELECT * FROM cats WHERE shops.id = cats.shops_id and name = 'Murzik');

-- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
SELECT shopname FROM shops
WHERE NOT EXISTS
(SELECT * FROM cats WHERE shops.id = cats.shops_id and name = 'Murzik' UNION SELECT * FROM cats WHERE shops.id = cats.shops_id and name = 'Zuza');

SELECT s.shopname
FROM shops AS s
LEFT JOIN cats AS c
  ON s.id = c.shops_id AND c.name IN ('Murzik', 'Zuza')
WHERE c.id IS NULL;







