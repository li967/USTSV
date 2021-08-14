/* 
Data bootcamp homewowrk
This homework is for sql starters to solid their sql skills, 
assigned by Dave from USTSV.
***************************************************************
homework questions: 
Additional SQL queries
https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html

sample data used:
classicmodels
https://www.mysqltutorial.org/mysql-sample-database.aspx
***************************************************************
*/ 


/*One to many relationship*/
/*Report the account representative for each customer.*/
SELECT 
c.customerName, c.salesRepEmployeeNumber, CONCAT(e.firstName, e.lastName) employeeName 
FROM 
customers c
LEFT JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber;

/*Report total payments for Atelier graphique.*/
SELECT c.customerName, c.customerNumber, SUM(p.amount)
FROM payments p 
LEFT JOIN customers c USING(customerNumber)
WHERE c.customerName = "Atelier graphique" 
GROUP BY c.customerNumber;



/*Report the total payments by date*/
SELECT paymentDate, sum(amount) 
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate;

/*Report the products that have not been sold.*/
-- solution from the key
SELECT * FROM products p
WHERE p.productCode NOT IN (SELECT productCode FROM orderdetails);
-- my solution
SELECT DISTINCT p.productCode, p.productName FROM orderdetails od
RIGHT JOIN products p USING(productCode) WHERE od.productCode IS NULL;

/*List the amount paid by each customer.*/
SELECT p.customerNumber, customerName, SUM(amount) 
FROM payments p, customers c
WHERE p.customerNumber = c.customerNumber
GROUP BY p.customerNumber;

/*How many orders have been placed by Herkku Gifts?*/
SELECT COUNT(*) 
FROM orders 
WHERE customerNumber = 
(SELECT customerNumber FROM customers WHERE customerName = "Herkku Gifts");

/*Who are the employees in Boston?
Report those payments greater than $100,000. Sort the report so the customer who made the highest payment appears first.
List the value of 'On Hold' orders.
Report the number of orders 'On Hold' for each customer./