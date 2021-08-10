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


/*Single entity*/
/*Prepare a list of offices sorted by country, state, city.*/
SELECT 
	*
FROM 
	offices
ORDER BY 
	FIELD(country, "USA", "UK", "France", "Australia", "Japan"), -- define the specific order; see https://www.mysqltutorial.org/mysql-order-by/
    state,
    city;
    
/*How many employees are there in the company?*/
SELECT COUNT(employeeNumber) FROM employees;

/*What is the total of payments received?*/
SELECT sum(amount) totalpayment FROM payments;

/*List the product lines that contain 'Cars'.*/
SELECT Distinct 
	productLine 
FROM 
	products
WHERE 
	productLine LIKE "%Cars%";
    
/*Report total payments for October 28, 2004.*/
SELECT SUM(amount) subtotal FROM payments WHERE paymentDate = "2004-10-28";

/*Report those payments greater than $100,000.*/

/*List the products in each product line.
How many products in each product line?
What is the minimum payment received?
List all payments greater than twice the average payment.
What is the average percentage markup of the MSRP on buyPrice?
How many distinct products does ClassicModels sell?
Report the name and city of customers who don't have sales representatives?
What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
Which orders have a value greater than $5,000?
*/