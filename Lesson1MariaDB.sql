-- Task 1 Уникальные страны клиентов

SELECT COUNT(DISTINCT Country) AS Countries
FROM sqlstudy.Customers;

-- 21

-- Task 2 Клиенты из Бразилии

SELECT COUNT(*) AS Brazil_Clients
FROM sqlstudy.Customers
WHERE Country = 'Brazil';

-- 9

-- Task 3 Средняя цена и количество товаров в категории 5

SELECT AVG(Price), COUNT(*) 
FROM sqlstudy.Products
WHERE CategoryID = '5';

-- 20,25 7

-- Task 4  Средний возраст сотрудников на 2024-01-01

SELECT AVG(DATEDIFF('2024-01-01', BirthDate)/365)
FROM sqlstudy.Employees;

-- 66,168

-- Task 5 Заказы в период 30 дней до 2024-02-15
-- Найдите заказы, сделанные в период с 16 января по 15 февраля 2024 года, и отсортируйте их по дате заказа.

SELECT *
FROM sqlstudy.Orders
WHERE OrderDate BETWEEN '2024-01-16' AND '2024-02-15'
ORDER BY OrderDate;

-- Task 6 Количество заказов за ноябрь 2023 года (используя начальную и конечную дату)

SELECT COUNT(*)
FROM sqlstudy.Orders
WHERE OrderDate >= '2023-11-01' AND OrderDate <= '2023-11-30';

-- 25

-- Task 7 Количество заказов за январь 2024 года (используя LIKE)

SELECT COUNT(*)
FROM sqlstudy.Orders
WHERE OrderDate LIKE '2024-01%';

-- 33

-- Task 8 Количество заказов за 2024 год

SELECT COUNT(*)
FROM sqlstudy.Orders
WHERE YEAR(OrderDate) = 2024;

-- 44

