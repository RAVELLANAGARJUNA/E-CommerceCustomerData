# E-Commerce Customer Data Analysis (SQL Project)

SQL-based e-commerce data analysis to explore customer behavior, order patterns, and business insights.


## Project Overview

This project involves analyzing real-world e-commerce data using SQL to extract insights about customer behavior, order trends, product performance, and payment patterns. The goal is to support data-driven decision-making by performing efficient data querying, relationship analysis, and KPI generation using structured query language (SQL).

This analysis was performed on a relational database named `ecommercesqlproject` consisting of multiple interconnected tables such as Customers, Orders, Products, OrderItems, Payments, and Shipments.

## Objectives

- Understand the structure and relationships within the e-commerce dataset
- Write intermediate to advanced SQL queries to analyze customer purchase behavior
- Track order volume, revenue, and product trends
- Identify high-value customers and popular products
- Generate insights for business strategy and customer engagement

## Tools & Technologies

- MySQL (Relational Database)
- SQL (Joins, Aggregations, Subqueries, Window Functions)
- MySQL Workbench / phpMyAdmin (for query execution)
- Excel or Power BI (optional: for visualizing SQL outputs)

## Database Schema Overview

The project uses the following key tables:

- `Customers`: Contains customer information such as name, location, and registration date  
- `Orders`: Tracks each order’s ID, date, customer, and status  
- `Products`: Holds product-level information like name, category, and price  
- `OrderItems`: Line items for each order including quantity and per-product total  
- `Payments`: Details about payment methods, amounts, and order IDs  
- `Shipments`: Shipping status and dates associated with orders  

## Key SQL Concepts Used

- `INNER JOIN`, `LEFT JOIN` for combining data across tables  
- `GROUP BY`, `ORDER BY`, `HAVING` for summarization and filtering  
- `CASE` statements for conditional logic  
- `CTEs` (Common Table Expressions) for modular and reusable queries  
- `WINDOW FUNCTIONS` for ranking and running totals  
- `DATE FUNCTIONS` to analyze time-based trends

## Sample Insights Extracted

- Monthly revenue trends and number of orders  
- Top 10 most ordered and highest-revenue products  
- Customer lifetime value (CLV) based on total purchase  
- Most used payment methods and their performance  
- Orders by region/country and delivery status  
- Average order value and repeat customer behavior  

## Sample Queries

```sql
-- Total revenue per month
SELECT MONTH(order_date) AS Month, SUM(order_items.total_price) AS MonthlyRevenue
FROM Orders
JOIN OrderItems ON Orders.order_id = OrderItems.order_id
GROUP BY MONTH(order_date)
ORDER BY Month;

-- Top 5 customers by total spending
SELECT c.customer_id, c.customer_name, SUM(oi.total_price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
