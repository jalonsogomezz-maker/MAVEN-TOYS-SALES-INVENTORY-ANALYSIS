use maven_toys;
--------------------------
#SALES

#Periodo temporal
SELECT MIN(date) AS start_date, MAX(date) AS end_date
FROM Sales;

#Volumen de ventas en este periodo
SELECT COUNT(*) AS total_sales
FROM Sales;

#Distribución de las unidades por pedido
SELECT MIN(units) AS min_units, MAX(units) AS max_units, AVG(units) AS avg_units 
FROM sales;

#Distribución de las ventas 
SELECT YEAR(date) AS year, MONTH(date) AS month, COUNT(Sale_ID) AS Sales
FROM sales
GROUP BY year, month 
ORDER BY year, month;
--------------------------
#PRODUCTS
#Cantidad diferente de productos/juguetes
SELECT COUNT(*) AS Distinct_product
FROM products;

#Num de categorias de producto 
SELECT COUNT(DISTINCT product_category) AS Num_category
FROM products;

#Cuales son 
SELECT DISTINCT product_category
FROM products;

#Distribución de las categorias
SELECT product_category, COUNT(*)  AS products
FROM products
GROUP BY product_category;
-----------------------
#STORES
#Numero de tiendas
SELECT COUNT(*) Num_stores
FROM stores;

#Numero de ciudades  
SELECT COUNT(DISTINCT Store_city) AS Num_city
FROM stores;

#zonas donde se opera
SELECT DISTINCT store_location
FROM stores;

#Distribucion de las tiendas
SELECT store_location, COUNT(*) AS tiendas
FROM stores
GROUP BY store_location;
----------------
#Inventory
SELECT *
FROM inventory;
SELECT COUNT(*) AS Num_products
FROM inventory
WHERE Stock_on_hand =0;


