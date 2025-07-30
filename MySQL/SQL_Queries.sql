USE ecommercesqlproject;
SHOW TABLES;
DESC customers;
desc orders;
desc payments;
desc products;
desc shipments;

select *from customers limit 5;
select *from orders limit 5;
select *from payments limit 5;
select *from products limit 5;
select *from shipments limit 5;

select round(sum(Amount),2) as total_revenue from payments;

select customers.country , count(orders.OrderID) as total_orders 
from customers
join orders ON customers.CustomerID = orders.CustomerID
GROUP BY 
customers.country
order by
total_orders desc;


select ProductID, Count(*) as total_sales from orders 
group by ProductID
order by total_sales desc limit 5;

#MONTHLY REVENUE TREND
select date_format(PaymentDate,"%y-%m") as month,
round(sum(Amount),2) as monthly_revenue
from payments
group by 
month  
order by 
month;

#Top 5 Countries by Total_Revenue
select 
       customers.country,
       round(sum(payments.Amount),2) as total_revenue
       
from
     customers
     
join
	orders on customers.CustomerID = orders.CustomerID
join 
	payments on orders.orderID = payments.OrderID
    
 group by
         country
 order by
        total_revenue desc
        
        limit 5;
        
 #Total number of orders by each payment  
        
SELECT 
    PaymentMethod, 
    COUNT(*) 
FROM 
    payments
GROUP BY 
    PaymentMethod
ORDER BY 
    COUNT(*) DESC;

  #Insight: Top 3 countries with the most no.of customers
select 
       country,count(CustomerID) as no_of_customers from customers
       group by
               country
       order by
                no_of_customers desc
                limit 3;
                
      #INSIGHT: Average purchase amount per payment methods
select PaymentMethod,round(avg(Amount),2) as Average_purchase 
from
    payments
group by
      PaymentMethod
order by
       Average_purchase desc;     
       
       #Daily order trend
select OrderDate,count(OrderID) as total_orders from orders
group by 
        orderDate
order by 
        total_orders;    
        
        #Top 5 Customers by total spend
 select 
        orders.CustomerID,
        sum(payments.Amount)  as total_spent
from 
     orders
join 
     payments on orders.OrderID = payments.OrderID
 group by
         orders.CustomerID
order by
         total_spent desc;         