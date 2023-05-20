-- 0. Database context
USE [VacationDB_DavidSequeira];
GO


-----------------------------------------------------------------------------------------------------------------------
-- 19. Which employees belong to Financeiro, Sistemas de Informação, Administrativo and Recursos Humanos departments? 
-- List them, sorting increasingly by city and name.
-----------------------------------------------------------------------------------------------------------------------
SELECT
	e.[EmployeeName] AS [Employee Name],
	d.[DepartmentName] AS [Department],
	ci.[City] AS [City]
FROM
	[dbo].[Employees] AS e
INNER JOIN
	[dbo].[Department] AS d
ON
	d.[DepartmentID] = e.[DepartmentID]
INNER JOIN
	[dbo].[City] AS ci
ON
	ci.[CityID] = e.[CityID]
ORDER BY
	[City],
	[Employee Name];
GO


--------------------------------------------------------------------------------
-- 20. There may be employees from Braga, Lisboa or Porto. 
-- List their names in capital letters, code and the new column 'Localidade'.
--------------------------------------------------------------------------------
SELECT
	UPPER(e.[EmployeeName]) AS [Employee Name],
	CONCAT_WS('-', co.[CountryCode], ci.[CityCode], d.[DepartmentCode], CONCAT_WS('', IIF(LEN(e.[EmployeeCode]) = 2, '0000', '000'), e.[EmployeeCode])) AS [Employee Code],
	ci.[City] AS [Localidade]
FROM
	[dbo].[Employees] AS e
INNER JOIN
	[dbo].[City] AS ci
ON
	ci.CityID = e.[CityID]
INNER JOIN
	[dbo].[Country] AS co
ON
	co.[CountryID] = ci.[CountryID]
INNER JOIN
	[dbo].[Department] AS d
ON
	d.[DepartmentID] = e.[DepartmentID]
ORDER BY
	[Employee Name];
GO

--------------------------------------------------------------------------------------------------------------------------------
-- 21. Show the comparison between the number of vacation days that were registered and the calculated value between the dates. 
-- List the 3 values.
--------------------------------------------------------------------------------------------------------------------------------
SELECT
	FORMAT(p.[StartDate], 'dd-MM-yyyy') AS [Start Date],
	FORMAT(p.[EndDate], 'dd-MM-yyyy') AS [End Date],
	p.[TotalDay] AS [Total Days],
	DATEDIFF(DAY, p.[StartDate], p.[EndDate]) AS [Calculated Nº of Days]
FROM
	[dbo].[Periods] AS p;
GO

--------------------------------------------------------------------------------
-- 22. List all departments, regardless of whether they have employees or not.
--------------------------------------------------------------------------------
SELECT
	d.[DepartmentName] AS [Department Name]
FROM
	[dbo].[Department] AS d
ORDER BY
	[Department Name];
GO

-----------------------------------------------------------------------
-- 23. How many employees are there per localidade? Show in countdown.
-----------------------------------------------------------------------
SELECT
	ci.[City] AS [Localidade],
	COUNT(e.[EmployeeName]) AS [Nº of Employees]
FROM
	[dbo].[Employees] AS e
LEFT OUTER JOIN
	[dbo].[City] AS ci
ON
	ci.[CityID] = e.[CityID]
GROUP BY
	ci.[City]
ORDER BY
	[Nº of Employees] DESC;
GO

-----------------------------------------------------------------------
-- 24. Show departments that have no employees.
-----------------------------------------------------------------------
SELECT
	d.[DepartmentName] AS [Department Name],
	COUNT(e.[EmployeeName]) AS [Nº of Employees]
FROM
	[dbo].[Department] AS d
LEFT OUTER JOIN
	[dbo].[Employees] AS e
ON
	d.[DepartmentID] = e.[DepartmentID]
GROUP BY
	d.[DepartmentName]
HAVING
	COUNT(e.[EmployeeName]) = 0
ORDER BY
	[Nº of Employees];
GO