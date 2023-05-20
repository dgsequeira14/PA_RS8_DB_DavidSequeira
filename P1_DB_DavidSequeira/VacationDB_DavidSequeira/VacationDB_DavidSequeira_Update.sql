-- 0. Database context
USE [VacationDB_DavidSequeira];
GO


-----------------------------------------------------------------------------------------------------------------------
-- 25. Update the first Vacation Request Form 
-----------------------------------------------------------------------------------------------------------------------
UPDATE
	[dbo].[Employees]
SET
	[EmployeeName] = 'Carolina Lima de França'
WHERE
	[EmployeeID] = 2;
GO

UPDATE
	[dbo].[Department]
SET
	[DepartmentName] = 'Sistemas de Informação',
	[DepartmentCode] = 'SI'
WHERE
	[DepartmentID] = 1;
GO

UPDATE
	[dbo].[Periods]
SET
	[EndDate] = '2019-12-31',
	[TotalDay] = '7',
	[Approved] = 1
WHERE
	[PeriodID] = 3;
GO