#Creo la base de datos 
CREATE DATABASE maven_toys;
USE maven_toys;

#Creo las tablas 

CREATE TABLE Products (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Product_Category VARCHAR(50),
    Product_Cost DECIMAL(10,2),
    Product_Price DECIMAL(10,2)
);
CREATE TABLE Inventory (
	Store_ID INT,
    Product_ID INT,
    Stock_on_hand INT);
CREATE TABLE Sales (
	Sale_ID INT, 
    Date DATE,
    Store_ID INT,
    Product_ID INT,
    Units INT);
CREATE TABLE Stores (
	Store_ID INT,
    Store_name VARCHAR(100),
    Store_city VARCHAR(50), 
    Store_location VARCHAR(50),
    Store_Open_Date DATE);
    
#Procedo a la importación de datos

#Importo la tabla de Products
LOAD DATA LOCAL INFILE 'D:/DATASCIENCE/3.SQL/Portfolio definitivo/csv.limpios/Products_clean.csv'
INTO TABLE products
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
#Importo la tabla Store
LOAD DATA LOCAL INFILE 'D:/DATASCIENCE/3.SQL/Portfolio definitivo/csv.limpios/store_clean.csv'
INTO TABLE stores
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Store_ID, Store_Name, Store_City, Store_Location, @Store_Open_Date)
SET Store_Open_Date = STR_TO_DATE(@Store_Open_Date,'%d/%m/%Y');
#Importo la tabla de Inventory
LOAD DATA LOCAL INFILE 'D:/DATASCIENCE/3.SQL/Portfolio definitivo/csv.limpios/Inventory_clean.csv'
INTO TABLE inventory
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
#Importo la tabla de Sales
LOAD DATA LOCAL INFILE 'D:/DATASCIENCE/3.SQL/Portfolio definitivo/csv.limpios/sales_clean.csv'
INTO TABLE sales
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Sale_ID, @Date, Store_ID, Product_ID, Units)
SET Date = STR_TO_DATE(@Date,'%d/%m/%Y');

#Validación de la calidad de los datos

#Validamos los NULOS
SELECT *
FROM products
WHERE Product_ID IS NULL
   OR Product_Name IS NULL
   OR Product_Category IS NULL
   OR Product_Cost IS NULL
   OR Product_Price IS NULL;
SELECT *
FROM stores
WHERE Store_ID IS NULL
   OR Store_name IS NULL
   OR Store_city IS NULL
   OR Store_location IS NULL
   OR Store_Open_Date IS NULL;
SELECT *
FROM inventory
WHERE Store_ID IS NULL
   OR Product_ID IS NULL
   OR Stock_On_Hand IS NULL;
SELECT *
FROM sales
WHERE Sale_ID IS NULL
   OR Date IS NULL
   OR Store_ID IS NULL
   OR Product_ID IS NULL
   OR Units IS NULL;
#Busco si hay duplicados
SELECT Product_ID, COUNT(*)
FROM products
GROUP BY Product_ID
HAVING COUNT(*)>1;

SELECT Store_ID, Product_ID, COUNT(*)
FROM inventory
GROUP BY Store_ID, Product_ID
HAVING COUNT(*)>1;

SELECT Store_ID,
       COUNT(*)
FROM stores
GROUP BY Store_ID
HAVING COUNT(*) > 1;

SELECT Sale_ID,
       COUNT(*)
FROM sales
GROUP BY Sale_ID
HAVING COUNT(*) > 1;

#Veo el rango de fechas a estudiar
SELECT
MIN(Date) AS first_sale,
MAX(Date) AS last_sale
FROM sales;

#Valores Imposibles
SELECT *
FROM inventory
WHERE Stock_on_hand<0;

SELECT *
FROM sales
WHERE units<=0;
SELECT *
FROM products
WHERE Product_Cost<=0 OR Product_Price<0;

#Veo si hay integridad referencial
SELECT *
FROM sales AS s
LEFT JOIN products AS p
ON s.Product_ID = p.Product_ID
WHERE p.Product_ID IS NULL;

SELECT *
FROM sales AS s
LEFT JOIN stores AS so
ON s.store_ID=so.store_ID
WHERE so.store_ID IS NULL;

SELECT *
FROM Inventory AS i
LEFT JOIN Stores AS s
ON i.store_ID=s.store_ID
WHERE s.store_ID IS NULL;

SELECT *
FROM inventory AS i
LEFT JOIN products AS p
ON i.product_id=p.product_id
WHERE p.product_id IS NULL;


#Modelado e integridad de los datos
#Añadimos los Primary Key
ALTER TABLE Products ADD primary key (Product_ID);
ALTER TABLE Stores ADD primary key (Store_ID);
ALTER TABLE Sales ADD primary key (Sale_ID);

#Añadimos las Foreign keys
ALTER TABLE Inventory ADD CONSTRAINT fk_inventory FOREIGN KEY (store_id) REFERENCES Stores(store_id);
ALTER TABLE Inventory ADD CONSTRAINT fk_product_ID FOREIGN KEY (product_id) REFERENCES Products(Product_ID);
ALTER TABLE Sales ADD CONSTRAINT fk_store FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID);
ALTER TABLE Sales ADD CONSTRAINT fk_Product FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID);



    