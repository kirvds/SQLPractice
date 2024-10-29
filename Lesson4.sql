/* Ранжируйте продукты в каждой категории на основе их средней цены
(AvgPrice). Используйте таблицы OrderDetails и Products.*/

with ProductAvgPrice AS (SELECT p.ProductName, p.CategoryID, p.ProductID,
AVG(p.Price) AS AvgPrice
FROM Products p 
JOIN OrderDetails od ON p.ProductID = od.ProductID 
GROUP BY p.ProductID, p.CategoryID, p.ProductName)
SELECT ProductName, CategoryID, ProductID, AvgPrice,
RANK() OVER (PARTITION BY CategoryID ORDER BY AvgPrice DESC) AS ProductRank
FROM ProductAvgPrice;

/*Рассчитайте среднюю сумму кредита (AvgCreditAmount) для каждого
кластера в каждом месяце и сравните её с максимальной суммой кредита
(MaxCreditAmount) за тот же месяц. Используйте таблицу Clusters.*/

with AvgCredit AS (
SELECT month, cluster,
AVG(credit_amount) AS AvgCreditAmount
FROM Clusters
GROUP BY month, cluster),
MaxCredit AS (
SELECT month, MAX(credit_amount) AS MaxCreditAmount
FROM Clusters
GROUP BY month)
SELECT a.month, a.cluster, AvgCreditAmount, MaxCreditAmount
FROM AvgCredit a
JOIN MaxCredit m ON a.month = m.month;

/*Создайте таблицу с разницей (Difference) между суммой кредита и
предыдущей суммой кредита по месяцам для каждого кластера. Используйте таблицу
Clusters.*/

with CreditWithPrevious AS (
SELECT month, cluster, credit_amount, LAG(credit_amount) OVER (PARTITION BY cluster ORDER BY month) AS prev_credit
FROM Clusters)
SELECT month, cluster, credit_amount, prev_credit, COALESCE(credit_amount - prev_credit, 0) AS Difference
FROM CreditWithPrevious;
