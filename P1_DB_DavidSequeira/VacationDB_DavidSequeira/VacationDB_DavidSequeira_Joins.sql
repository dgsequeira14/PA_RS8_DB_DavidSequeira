-- 0. Database context
USE [VacationDB_DavidSequeira];
GO


---------------------------------------------------------------------------------
-- 15. Produce a result with the same data as the paper form
---------------------------------------------------------------------------------
SELECT
	r.[RequestID] AS [Request form nº],
	FORMAT(r.[RequestDate],'dd-MM-yyyy') AS [Request date],
	FORMAT(r.[ApprovalDate], 'dd-MM-yyyy') AS [Approval date],
	CONCAT_WS('-', co.[CountryCode], cim.[CityCode], dm.[DepartmentCode], CONCAT(IIF(LEN(em.[EmployeeCode]) < 2 , '00000', '0000'),'', em.[EmployeeCode])) AS [Manager code],
	em.[EmployeeName] AS [Manager name],
	CONCAT_WS('-', co.[CountryCode], ci.[CityCode], d.[DepartmentCode], CONCAT(IIF(LEN(e.[EmployeeCode]) > = 2, '000','0000'),'', e.[EmployeeCode])) AS [Employee code], 
	e.[EmployeeName] AS [Employee name],
	d.[DepartmentName] AS [Department],
	p.[PeriodID] AS [Vacation period nº],
	FORMAT(p.[StartDate], 'dd-MM-yyyy') AS [Start date],
	FORMAT(p.[EndDate], 'dd-MM-yyyy') AS [End date],
	p.[TotalDay] AS [Total days],
	IIF(p.[Approved] = 1, 'Yes', 'No') AS [Approved?]
FROM
	[dbo].[Request] AS r
INNER JOIN
	[dbo].[Employees] AS e
ON
	e.[EmployeeID] = r.[EmployeeID]
INNER JOIN
    [dbo].[Employees] AS em
ON
	e.ReportsTo = em.EmployeeID
INNER JOIN
	[dbo].[Department] AS d
ON
	d.[DepartmentID] = e.[DepartmentID]
INNER JOIN
	[dbo].[Department] AS dm
ON
	dm.[DepartmentID] = em.[DepartmentID]
INNER JOIN
	[dbo].[City] AS ci
ON
	ci.[CityID] = e.[CityID]
INNER JOIN
	[dbo].[City] AS cim
ON
	cim.[CityID] = em.[CityID]
INNER JOIN
	[dbo].[Country] AS co
ON
	co.[CountryID] = ci.[CountryID]	
INNER JOIN
	[dbo].[Periods] AS p
ON
	r.[RequestID] = p.[RequestID];
GO