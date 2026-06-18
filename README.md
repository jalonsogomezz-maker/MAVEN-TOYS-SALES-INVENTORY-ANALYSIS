# ANÁLISIS DE INVENTARIO Y VENTAS DE JUGUETES MAVEN

## Descripción del Proyecto

Este proyecto analiza el rendimiento comercial de Maven Toys, una cadena ficticia de jugueterías en México.

Utilizando SQL para la extracción y análisis de datos y Excel para la visualización, se desarrolló un dashboard ejecutivo para identificar tendencias de ventas, productos más rentables, categorías con mejor desempeño y posibles riesgos de inventario.

## Objetivos del Análisis

- ¿Cómo evolucionan los ingresos a lo largo del tiempo?
- ¿Qué categorías generan más ingresos?
- ¿Qué productos son los más rentables?
- ¿Qué ciudades generan mayor facturación?
- ¿Qué productos presentan mayor riesgo de rotura de stock?
- ¿Cuál es el margen de beneficio del negocio?
  
## Metodología
1. Validación y limpieza de datos.
2. Análisis exploratorio (EDA).
3. Desarrollo de consultas SQL orientadas a negocio.
4. Construcción de KPIs.
5. Diseño del dashboard en Excel.
6. Elaboración de conclusiones y recomendaciones.

## Dataset

El análisis se realizó sobre cuatro tablas relacionales:

- Sales: Transacciones de venta
- Products: Información de productos
- Stores: Información de tiendas
- Inventory: Niveles de inventario

## Modelo de Datos
![Modelo de Datos](images/Modelo_datos.png)

## Dashboard

![Dashboard](images/Dashboard.png)

## KPIs Analizados

Durante el análisis se desarrollaron los siguientes indicadores clave de rendimiento (KPIs):

- Revenue Total
- Units Sold
- Total Profit
- Profit Margin

Estos indicadores permiten evaluar el rendimiento global del negocio y sirven como punto de partida para el resto de análisis.



## Análisis Realizados

### Revenue Trend

Se analizó la evolución temporal de los ingresos para identificar tendencias de crecimiento o desaceleración del negocio durante el periodo estudiado.

### Revenue por Categoría

Se comparó el rendimiento económico de las distintas categorías de productos con el objetivo de identificar cuáles generan una mayor contribución a los ingresos totales.

### Top Productos por Revenue

Se identificaron los productos con mayor impacto económico para conocer qué artículos son los principales impulsores de la facturación.

### Revenue por Ciudad

Se realizó un análisis geográfico de los ingresos para detectar las ciudades con mejor rendimiento comercial y comprender la distribución territorial de las ventas.

### Inventory Pressure Analysis

Se desarrolló un indicador de presión sobre el inventario basado en la relación entre unidades vendidas y stock disponible.

Este análisis permite detectar productos con riesgo potencial de rotura de stock y facilita la toma de decisiones relacionadas con la reposición de inventario.



## Principales Hallazgos

Los resultados obtenidos durante el análisis permitieron identificar varios aspectos relevantes para el negocio:

- La empresa presenta una tendencia general positiva en sus ingresos durante el periodo analizado.
- Existen categorías que concentran una parte significativa de la facturación total.
- Algunos productos generan una contribución desproporcionadamente alta al revenue del negocio.
- Determinadas ciudades destacan por su capacidad para generar ingresos superiores al resto.
- Se identificaron productos con una elevada presión sobre el inventario que podrían requerir una revisión de stock.



## Herramientas Utilizadas

- MySQL
- MySQL Workbench
- Excel
- Power Query
- GitHub



## Habilidades Demostradas

A través de este proyecto se pusieron en práctica las siguientes competencias:

- SQL
- Joins
- Aggregations
- Common Table Expressions (CTEs)
- Window Functions
- Data Cleaning
- Exploratory Data Analysis (EDA)
- KPI Development
- Dashboard Design
- Business Analysis
- Data Visualization

## Autor

Proyecto desarrollado por Javier Alonso Gómez como parte de su portfolio de análisis de datos.

GitHub: https://github.com/jalonsogomezz-maker

## Fuente de Datos

Dataset obtenido de Maven Analytics Data Playground:

https://mavenanalytics.io/data-playground/mexico-toy-sales
