-- Создание таблиц и связи между ними
CREATE TABLE CUSTOMERS
(
    CUSTOMERID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER VARCHAR(30),
    CITY VARCHAR(30)
);

CREATE TABLE ORDERS
(
    ORDERID INT PRIMARY KEY AUTO_INCREMENT,
    ORDERNO VARCHAR(30), 
    ORD_DATE DATE,
    PRICE DECIMAL(8, 2),
    CUSTOMERID INT,
    CONSTRAINT orders_custonmerid_fk
    FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);


-- Заполнение таблиц данными из условия
INSERT INTO ORDERS (`ORDERID`,`ORDERNO`,`ORD_DATE`,`PRICE`,`CUSTOMERID`)
VALUES
(1, "ord1", "11.11.16", 2636.37, 1),
(2, "ord2", "11.11.16", 4352.32, 2),
(3, "ord3", "13.11.16", 6472.1, 6),
(4, "ord4", "14.11.16", 4342.34, 1),
(5, "ord5", "15.11.16", 7374.92, 4),
(6, "ord6", "17.11.16", 5647.34, 8),
(7, "ord7", "03.12.16", 8838.81, 8),
(8, "ord8", "05.12.16", 7234.12, 5),
(9, "ord9", "07.12.16", 6543.84, 7),
(10, "ord10", "07.12.16", 2983.94, 8);

INSERT INTO CUSTOMERS (`CUSTOMERID`, `CUSTOMER`, `CITY`) 
VALUES 
(1, "Иванов", "Москва"),
(2, "Петров", "Питер"),
(3, "Семенов", "Москва"),
(4, "Васильев", "Самара"),
(5, "Макаров", "Питер"),
(6, "Безруков", "Тамбов"),
(7, "Башаров", "Ростов"),
(8, "Куценко", "Питер"),
(9, "Михалков", "Челябинск");


-- Вывести номер и заказчика самого дорогого заказа
SELECT CUSTOMERS.CUSTOMER AS Заказчик, ORDERS.ORDERNO AS Номер_заказа
FROM 
CUSTOMERS INNER JOIN ORDERS
ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID
WHERE ORDERS.PRICE IN (
    SELECT MAX(ORDERS.PRICE)
    FROM ORDERS
);


-- Вывести список заказчиков, у которых нет покупок в алфавитном порядке
SELECT CUSTOMERS.CUSTOMERID, CUSTOMERS.CUSTOMER, CUSTOMERS.CITY
FROM 
CUSTOMERS LEFT JOIN ORDERS
ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID
WHERE ORDERS.PRICE IS null
ORDER BY CUSTOMER;


-- Вывести сумму заказов каждого города в порядке убывания суммы
SELECT CUSTOMERS.CITY AS Город, SUM(ORDERS.PRICE) AS Сумма_заказов
FROM CUSTOMERS INNER JOIN ORDERS
ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID
GROUP BY CUSTOMERS.CITY
ORDER BY Сумма_заказов DESC;