--Write a query to find the heaviest player for each position.
SELECT  [Pos], MAX([Wt]) AS Heaviest_weight
FROM [dbo].['Football Players Data$']
GROUP BY [Pos] 
--OR

SELECT * , MAX([Wt]) OVER(PARTITION BY [Pos]) AS Heaviest_weight
FROM [dbo].['Football Players Data$']

--Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.

SELECT * , RANK() OVER (PARTITION BY [Team]ORDER BY [Age])
FROM [dbo].['Football Players Data$']

Write a query to calculate the average height (in inches) for all players older than 25 years.

SELECT AVG([Inches]) AS Avg_inches
FROM [dbo].['Football Players Data$']
WHERE [Age] > '25'

--Write a query to find all players whose height is greater than the average height of their respective team.

SELECT *
FROM [dbo].['Football Players Data$'] 
WHERE [Inches] > (SELECT AVG([Inches]) AS Avg_Ht
FROM [dbo].['Football Players Data$'])

--Write a query to find all players who share the same last name.

SELECT [LastName], COUNT(*)
FROM [dbo].['Football Players Data$']
GROUP BY [LastName]
HAVING COUNT(*) > 1

--OR
SELECT * 
FROM [dbo].['Football Players Data$']
WHERE [LastName] IN (SELECT [LastName]
					FROM [dbo].['Football Players Data$']
					GROUP BY [LastName]
					HAVING COUNT(*) > 1)

Write a query to find the players with the minimum height for each position.

SELECT [FirstName], [LastName], [Pos], MIN([Inches]) AS Minimum_Height
FROM [dbo].['Football Players Data$']
GROUP BY [FirstName],[LastName], [Pos]

Write a query to get the number of players for each team grouped by their experience level.
SELECT [Team], [Exp], COUNT(*) AS No_of_Players
FROM [dbo].['Football Players Data$']
GROUP BY [Team], [Exp]

Write a query to find the tallest and shortest players from each college.

SELECT [College], MAX([Ht]) AS Height
FROM [dbo].['Football Players Data$']
GROUP BY [College]
UNION
SELECT  [College], MIN([Ht])
FROM [dbo].['Football Players Data$']
GROUP BY  [College]

Write a query to find all players whose weight is above the average weight for their respective position.

SELECT *
FROM [dbo].['Football Players Data$'] 
WHERE [Wt] > (SELECT AVG([Wt]) AS Avg_Wt
FROM [dbo].['Football Players Data$'])

--Write a query to calculate the percentage of players in each position for every team.

SELECT [Team],[Pos], COUNT(*) AS Percentile
FROM [dbo].['Football Players Data$']
GROUP BY [Team],[Pos]
ORDER BY [Team],[Pos]

--SQL CASE STATEMENT
SELECT * 
		, CASE
		WHEN [Age] < 23 THEN 'Young Player'
		WHEN [Age] < 30 THEN 'Middled_Aged_Player'
		ELSE 'Older Player'
		END 'category'
		FROM [dbo].['Football Players Data$']

SELECT * 
		, CASE
		WHEN [College] = 'Alabama' THEN 'Florida'
		WHEN [College] = 'Stanford' THEN 'London city college'		
		ELSE [College]
		END 'New_College'
		FROM [dbo].['Football Players Data$']



