1	write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

SELECT 
    S.[Name] AS Sales_man
   , C.[Customer_Name]
   , S.[city]
FROM [dbo].[Salesman$] AS S
INNER JOIN [dbo].[Customer$] AS C 
ON s.City = c.City

2	write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

SELECT 
		O.[Order Number]
		,O.[Purchase_Amount]
		,C.[Customer_Name]
		,C.[City]
FROM [dbo].[Order$] AS O
JOIN [dbo].[Customer$] AS C
ON O.[Customer ID] = C.[Customer_ID]
WHERE [Purchase_Amount] BETWEEN 500 AND 2000 

3	write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

SELECT 
		c.[Customer_Name]
		,c.[City]
		,s.[Name] AS Sales_man
		,s.[commission]
FROM [dbo].[Salesman$] AS S
JOIN [dbo].[Customer$] AS C
ON  S.[Salesman_id] = C.[Salesman_ID]

4	write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

SELECT C.[Customer_Name]
		,C.[City]
		,S.[Name] AS Sales_Man
		,S.[commission]
FROM [dbo].[Salesman$] AS S
INNER JOIN [dbo].[Customer$] AS C
ON S.[Salesman_id] = C.[Salesman_ID]
WHERE [commission] > 0.12
5	write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission. 

SELECT C.[Customer_Name]
		,C.[City]
		,S.[Name] AS Sales_Man
		,S.[City]
		,S.[commission]
FROM [dbo].[Salesman$] AS S
INNER JOIN [dbo].[Customer$] AS C
ON S.[city] <> C.[City]
WHERE [commission] > 0.12
6	write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission

SELECT O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
		,C.[Customer_Name]
		,C.[Grade]
		,S.[Name] AS Sales_Man
		,S.[commission]
FROM [dbo].[Order$] AS O
INNER JOIN [dbo].[Customer$] AS C
ON O.[Customer ID] = C. [Customer_ID]                                        
INNER JOIN [dbo].[Salesman$] AS S   
ON O. [Salesman_id] = S. [Salesman_id]
WHERE O.[Order Number] = '70007'

7	Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.

SELECT *
FROM [dbo].[Salesman$] AS S
LEFT JOIN [dbo].[Customer$] AS C
ON S.[Salesman_ID] = C.[Salesman_id]
LEFT JOIN [dbo].[Order$] AS O
ON S.[Salesman_id] = O.[Salesman_id]

8	write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

SELECT C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,S.[Name] AS Sales_Man
		,S.[city]
FROM [dbo].[Customer$] AS C
JOIN [dbo].[Salesman$] AS S
ON C.[Salesman_ID] = S.[Salesman_id]
ORDER BY [Customer_ID]

9	write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

SELECT C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,S.[Name] AS Sales_Man
		,S.[city]
FROM [dbo].[Customer$] AS C
JOIN [dbo].[Salesman$] AS S
ON C.[Salesman_ID] = S.[Salesman_id]
WHERE [Grade] < '300'

10	Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.

SELECT C.[Customer_Name]
		,C.[City]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
FROM [dbo].[Customer$] AS C
JOIN [dbo].[Order$] AS O
ON C.[Customer_ID] = O.[Customer ID]
ORDER BY [Purchase_Amount]

11	SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

SELECT C.[Customer_Name]
		,C.[City]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
		,S.[Name] AS Sales_Man
		,S.[commission]
FROM [dbo].[Customer$] AS C
JOIN [dbo].[Order$] AS O
ON C.[Customer_ID] = O.[Customer ID]
JOIN [dbo].[Salesman$] AS S
ON C.[Salesman_ID] = S.[Salesman_id]

12	Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.

SELECT S.[Name] AS Sales_Man
		,C.[Customer_Name]
FROM [dbo].[Customer$] AS C 
JOIN [dbo].[Salesman$] AS S
ON C.[Salesman_id] = S.[Salesman_ID]
ORDER BY [Name]

13	write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.

SELECT S.[Name] AS Sales_Persons
		,C.[Customer_Name]
		,C.[City]
		,C.[Grade]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
FROM [dbo].[Salesman$] AS S
JOIN [dbo].[Customer$] AS C
ON S. [Salesman_id] = C.[Salesman_ID]
JOIN [dbo].[Order$] AS O
ON S.[Salesman_id] = O. [Salesman_id]

14	Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

SELECT S.[Name] AS Sales_Man
		,C.[Customer_Name]
		,C.[Grade]
		,O.[Purchase_Amount]
FROM [dbo].[Customer$] AS C 
INNER JOIN [dbo].[Salesman$] AS S
ON C.[Salesman_id] = S.[Salesman_ID]
INNER JOIN [dbo].[Order$] AS O
ON S.[Salesman_id] = O.[Salesman_id]
WHERE [Purchase_Amount] >= '200'

15	For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount

SELECT 
		C.[Customer_Name]
		,C.[City]
		,O.[Order Number]
		,O.[Order Date]
		,O.[Purchase_Amount]
FROM [dbo].[Customer$] AS C
JOIN [dbo].[Order$] AS O
ON [Customer_ID] = [Customer ID]
ORDER BY [Customer_Name]

16	Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

SELECT  c.[Customer_Name]
		,c.[City]
		,o.[Order Number]
		,o.[Order Date]
		,o.[Purchase_Amount]
FROM [dbo].[Customer$] AS C
FULL OUTER JOIN [dbo].[Order$] AS O
ON C.[Customer_ID]  = O.[Customer ID]
WHERE (C.[Grade] IS NOT NULL AND O.[Order Number] IS NOT NULL)

17	Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT *
FROM [dbo].[Salesman$] AS S
CROSS JOIN [dbo].[Customer$] AS C

18	Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

SELECT 
		S.[Name] AS Sales_Persons
		,S.[city]
		,C.[Customer_Name]
		,C.[City]
FROM [dbo].[Salesman$] AS S
CROSS JOIN [dbo].[Customer$] AS C
19	Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.

SELECT 
		S.[Name] AS Sales_Persons
		,S.[city]
		,C.[Customer_Name]
		,C.[City]
		,C.[Grade]
FROM [dbo].[Salesman$] AS S
CROSS JOIN [dbo].[Customer$] AS C

20	Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.

SELECT 
		S.[Name] AS Sales_Persons
		,S.[city]
		,C.[Customer_Name]
		,C.[City]
		,C.[Grade]
FROM [dbo].[Salesman$] AS S
CROSS JOIN [dbo].[Customer$] AS C
WHERE S.[city] <> C.[City]  
