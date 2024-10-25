/*
 * Определите общую прибыль для каждой категории продуктов, 
 * используя таблицы OrderDetails, Orders и Products. 
 * Для расчета прибыли умножьте цену продукта на количество, 
 * а затем суммируйте результаты по категориям.
*/

select c."CategoryName", round(sum(p."Price"*od."Quantity")) as profit_sum from "Orders" o 
join "OrderDetails" od on  o."OrderID" = od."OrderID" 
join "Products" p on od."ProductID" = p."ProductID"
join "Categories" c on c."CategoryID" = p."CategoryID" 
group by c."CategoryName"
order by profit_sum desc;

/*
 * Определите количество заказов, размещенных клиентами из различных стран, за каждый месяц.
 */

select c."Country", EXTRACT(MONTH from DATE o."OrderDate") AS Month,
EXTRACT(YEAR FROM DATE o."OrderDate") AS Year,
COUNT(o."OrderID") AS OrderCount
from "Customers" c 
join "Orders" o on o."CustomerID" = c."CustomerID" 
group by c."Country", Month, Year;


/*
 * Рассчитайте среднюю продолжительность кредитного срока для клиентов по категориям образования.
 */

select education, round(avg(credit_term)) from "Clusters"
group by education; 

