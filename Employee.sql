1	. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
SELECT [EmpId], [FullName]
FROM [dbo].[Employee_Details$]
WHERE [ManagerId]= '986'

2	Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT [Project]
FROM [dbo].[Employee_Salary$]

3	Write an SQL query to fetch the count of employees working in project ‘P1’.
SELECT COUNT(*) AS [Project] 
FROM [dbo].[Employee_Salary$]
WHERE [Project] = 'P1'

4	Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT MAX ([Salary])
FROM [dbo].[Employee_Salary$]

SELECT MIN ([Salary])
FROM [dbo].[Employee_Salary$]

SELECT AVG ([Salary])
FROM [dbo].[Employee_Salary$]

5	Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT [EmpId]
FROM [dbo].[Employee_Salary$]
WHERE [Salary] BETWEEN 9000 AND 15000

6	Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT *
FROM [dbo].[Employee_Details$]
WHERE [City]= 'Toronto' AND [ManagerId] = '321'

7	Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT *
FROM [dbo].[Employee_Details$]
WHERE [City]= 'Carlifornia' OR [ManagerId] = '321'

8	Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT *
FROM [dbo].[Employee_Salary$]
WHERE [Project] <> 'P1'

9	Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
SELECT *
FROM [dbo].[Employee_Salary$]

10	Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
SELECT *
FROM [dbo].[Employee_Details$]
WHERE [FullName] LIKE '_hn%'

11	Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
SELECT [EmpId]
FROM [dbo].[Employee_Details$] UNION 
SELECT [EmpId] 
FROM [dbo].[Employee_Salary$]

