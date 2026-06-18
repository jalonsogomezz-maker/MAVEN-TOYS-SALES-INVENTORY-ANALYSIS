#Análisis de Ventas
USE maven_toys;

#Revenue total
SELECT SUM(units*Product_Price) AS revenue_total
FROM sales AS s
INNER JOIN products AS p
ON s.product_ID=p.product_ID;

#Cantidad vendida
SELECT Sum(units) AS total_unidades
FROM sales;

#Revenue por mes/año asi veremos la tendencia 
SELECT SUM(units*Product_Price) AS revenue, year(s.date) AS Año, month(s.date) AS Mes
FROM sales AS s
INNER JOIN products AS p
ON s.product_ID=p.product_ID
GROUP BY Año, Mes
ORDER BY Año, Mes;

#Crecimiento MoM
WITH revenue_month AS (SELECT SUM(units*Product_Price) AS revenue, year(s.date) AS Año, month(s.date) AS Mes
						FROM sales AS s
						INNER JOIN products AS p
						ON s.product_ID=p.product_ID
						GROUP BY Año, Mes
						ORDER BY Año, Mes), 
	Cte_MoM AS(SELECT revenue, año, mes, lag(revenue) OVER(ORDER BY Año, Mes) AS Mes_anterior
				FROM revenue_month)
SELECT año, mes, ROUND(((revenue-Mes_anterior)/Mes_anterior)*100,2) AS MoM
FROM Cte_MoM;

#Revenue por categoria top categorias
SELECT p.product_category, SUM(p.Product_Price*s.units) AS revenue_categoria
FROM products AS p
INNER JOIN sales AS s
ON p.Product_ID=s.Product_ID
GROUP BY p.product_category
ORDER BY revenue_categoria DESC;

#Revenue por Productos top productos/categoria
SELECT p.product_name, p.product_category, SUM(p.Product_Price*s.units) AS revenue_producto
FROM products AS p
INNER JOIN sales AS s
ON p.Product_ID=s.Product_ID
GROUP BY p.product_name, p.product_category
ORDER BY revenue_producto DESC;

#Productos mas vendidos (Cantidad)
SELECT p.Product_name, p.Product_Category, SUM(s.units) AS units_sold
FROM products as p
INNER JOIN sales as s
ON p.product_ID=s.product_ID
GROUP BY Product_name, p.Product_Category
ORDER BY units_sold DESC;

#Profit total
SELECT ROUND(SUM((p.Product_price-p.Product_cost)*s.units),2) AS profit_total
FROM products AS p
INNER JOIN sales AS s
ON p.Product_ID=s.Product_ID;

#Profit Margin
SELECT ROUND(SUM((P.product_price-P.Product_cost)*S.units)/SUM(P.product_price*S.units),2) AS Profit_Margin
FROM products AS p
INNER JOIN sales AS s
ON p.Product_ID=s.Product_ID;


#Profit por categoria
SELECT Product_category, Sum((p.product_price-p.product_cost)*s.units) AS profit
FROM products AS p
INNER JOIN sales AS s 
ON p.Product_ID=s.Product_ID
GROUP BY Product_Category
ORDER BY profit DESC;

#Profit por productos/categoria
SELECT Product_name, Product_Category, Sum((p.product_price-p.product_cost)*s.units) AS profit
FROM products AS p
INNER JOIN sales AS s 
ON p.Product_ID=s.Product_ID
GROUP BY Product_name, Product_Category
ORDER BY profit DESC;

#Profit margin por categoria
SELECT
    p.Product_Category,
    ROUND(SUM((p.Product_Price - p.Product_Cost) * s.Units),2) AS Profit, ROUND(SUM(p.Product_Price * s.Units),2) AS Revenue,
ROUND((SUM((p.Product_Price - p.Product_Cost) * s.Units)/SUM(p.Product_Price * s.Units)) * 100,2) AS Profit_Margin
FROM products p
INNER JOIN sales s
    ON p.Product_ID = s.Product_ID
GROUP BY p.Product_Category
ORDER BY Profit_Margin DESC;

#Revenue por tienda
SELECT st.Store_ID, st.Store_name, SUM(s.units*p.product_price) AS revenue
FROM Sales AS s
INNER JOIN products AS p
ON s.product_ID=p.product_ID
INNER JOIN stores AS st
ON st.Store_ID=s.Store_ID
GROUP BY st.Store_ID, st.Store_name
ORDER BY revenue DESC;

#Revenue por ciudad
SELECT st.Store_city, SUM(s.units*p.product_price) AS revenue
FROM Sales AS s
INNER JOIN products AS p
ON s.product_ID=p.product_ID
INNER JOIN stores AS st
ON st.Store_ID=s.Store_ID
GROUP BY st.Store_city
ORDER BY revenue DESC;

#Revenue por localización
SELECT st.Store_location, SUM(s.units*p.product_price) AS revenue
FROM Sales AS s
INNER JOIN products AS p
ON s.product_ID=p.product_ID
INNER JOIN stores AS st
ON st.Store_ID=s.Store_ID
GROUP BY st.Store_location
ORDER BY revenue DESC;


#Top productos con mayor riesgo de stock
WITH stock_producto AS(SELECT product_id, sum(Stock_on_hand) AS total_stock
FROM inventory
GROUP BY product_ID)

SELECT sp.Product_ID, p.product_Name, SUM(s.units) AS total_units, SUM(s.Units * p.Product_Price) AS Revenue, total_stock
FROM Sales AS s
INNER JOIN Products AS p
ON s.Product_ID=p.Product_ID
INNER JOIN stock_producto AS sp
ON s.Product_ID=sp.Product_ID
GROUP BY sp.Product_ID, p.product_Name, sp.total_stock
ORDER BY
    total_units DESC,
    sp.total_stock ASC;









