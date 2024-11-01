/*Создайте таблицу EmployeeDetails для хранения информации о
сотрудниках. Таблица должна содержать следующие столбцы:
EmployeeID (INTEGER, PRIMARY KEY)
EmployeeName (TEXT)
Position (TEXT)
HireDate (DATE)
Salary (NUMERIC)
После создания таблицы добавьте в неё три записи с произвольными данными о
сотрудниках.*/

CREATE TABLE EmployeeDetails (
EmployeeID INTEGER PRIMARY KEY,
EmployeeName TEXT,
Position TEXT,
HireDate DATE,
Salary NUMERIC
);

INSERT INTO Lesson5.EmployeeDetails
(EmployeeID, EmployeeName, `Position`, HireDate, Salary)
VALUES(0, 'Николай Павлов', 'Инженер', '2020-09-01', 90000);
INSERT INTO Lesson5.EmployeeDetails
(EmployeeID, EmployeeName, `Position`, HireDate, Salary)
VALUES(1, 'Федор Сумкин', 'Технолог', '2019-10-21', 100000);
INSERT INTO Lesson5.EmployeeDetails
(EmployeeID, EmployeeName, `Position`, HireDate, Salary)
VALUES(2, 'Григорий Умов', 'Программист', '2018-11-23', 120000);

/*Создайте представление HighValueOrders для отображения всех заказов,
сумма которых превышает 10000. В представлении должны быть следующие столбцы:
OrderID (идентификатор заказа),
OrderDate (дата заказа),
TotalAmount (общая сумма заказа, вычисленная как сумма всех Quantity *
Price).
Используйте таблицы Orders, OrderDetails и Products.*/

CREATE VIEW HighValueOrders AS
SELECT o.OrderID, o.OrderDate, SUM(od.Quantity*p.Price) AS TotalAmount 
FROM orders o
JOIN order_details od ON o.OrderID = od.OrderID
JOIN products p ON p.ProductID = od.ProductID 
GROUP BY o.OrderID, o.OrderDate 
HAVING TotalAmount > 10000;

SELECT * FROM HighValueOrders;

/*Удалите все записи из таблицы EmployeeDetails, где Salary меньше
50000. Затем удалите таблицу EmployeeDetails из базы данных.*/

DELETE FROM EmployeeDetails
WHERE Salary < 50000;

DROP TABLE IF EXISTS EmployeeDetails;


