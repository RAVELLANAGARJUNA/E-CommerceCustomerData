#1)List all the orders with customer names and order dates
select  o.OrderID , c.CustomerName, o.OrderDate 
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID;

#2)Creating OrderItems table
CREATE TABLE OrderItems(
        order_item_id INT PRIMARY KEY AUTO_INCREMENT,
        OrderID INT NOT NULL,
        ProductID INT NOT NULL,
        Quantity INT NOT NULL,
        Price Decimal(10,2) NOT NULL,
        FOREIGN KEY (OrderID) REFERENCES  orders(OrderID),
        FOREIGN KEY (ProductID) REFERENCES products(ProductID)
        );
        

#3Insert the data into orderitems table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1001, 101, 2, 1000.00),
(1001, 103, 1, 50.00),
(1002, 102, 1, 700.00),
(1003, 104, 3, 20.00);

select OrderID,OrderDate from orders;
select ProductID from products;


#4)Show Each product's Name and its Total Quantity Sold
select p.ProductName , sum(oi.Quantity) as Total_Quantity
from products p
join OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY ProductName
ORDER BY Total_Quantity;