CREATE TABLE city (
id BIGSERIAL NOT NULL PRIMARY KEY,
name VARCHAR (20) NOT NULL
);

ALTER TABLE employee
    ADD city_id BIGSERIAL NOT NULL;

ALTER TABLE employee
    ADD FOREIGN KEY (city_id) REFERENCES city(id);

INSERT INTO city (name)
VALUES ('Moscow'), ('Pskov'),('Vladimir'),('Kazan'),('Belgorod'),('Voronezh'),('Lipetsk'),('Tula');

UPDATE employee SET city_id = 1 WHERE id = 5;


SELECT first_name AS Имя,
       last_name AS Фамилия,
       city.name AS Город
FROM employee
JOIN city
ON employee.city_id = city.id;


SELECT name AS Город,
       first_name AS Имя,
       last_name AS Фамилия
FROM city
LEFT JOIN employee
ON city.id = employee.city_id;


SELECT first_name AS Имя,
       city.name AS Город
FROM employee
FULL JOIN city
ON employee.city_id = city.id;


SELECT employee.first_name, city.name
FROM employee
CROSS JOIN city;


SELECT city.name
FROM city
LEFT JOIN employee
ON city.id = employee.city_id
WHERE employee.id IS NULL;