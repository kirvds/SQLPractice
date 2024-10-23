/*
 * Вам необходимо проверить влияние семейного положения (family_status) на средний доход
 * клиентов (income) и запрашиваемый кредит (credit_amount) .
 */

SELECT family_status, ROUND(AVG(income)) AS avg_income, ROUND(AVG(credit_amount)) AS avg_credit FROM Clusters
GROUP BY family_status 
ORDER BY family_status;

/*
 * Сколько товаров в категории Meat/Poultry.
 * Нет таблиц с указанием названий категорий. Есть только индексы.
 */

/*
 * Какой товар (название) заказывали в сумме в самом большом количестве (sum(Quantity) в
 * таблице OrderDetails)
 */

SELECT (SELECT ProductName FROM Products WHERE ProductID = OrderDetails.ProductID) AS ProductName, SUM(Quantity) AS Quantity_sum FROM OrderDetails
GROUP BY ProductID 
ORDER BY Quantity_sum DESC;

-- Gorgonzola Telino 458