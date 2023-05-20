-- 0. Database context
USE [VacationDB_DavidSequeira];
GO


---------------------------------------------------------------------------------
-- 14. First load of data
---------------------------------------------------------------------------------
INSERT INTO [dbo].[Country]
(
	[Country],
	[CountryCode]
)
VALUES
(
	'Portugal',
	'PT'
)



INSERT INTO [dbo].[Department]
(
	[DepartmentName],
	[DepartmentCode]
)
VALUES
(
	'Tecnologias de Informação',
	'TI'
),
(
	'Recursos Humanos',
	'HR'
)



INSERT INTO [dbo].[City]
(
	[CountryID],
	[City],
	[CityCode]
)
VALUES
(
	'1',
	'Porto',
	'PRT'
)



INSERT INTO [dbo].[Employees]
(
	[CityID],
	[DepartmentID],
	[EmployeeName],
	[EmployeeCode]
)
VALUES
(
	'1',
	'1',
	'Maria Antónia de Castro e Sá',
	'120'
),
(
	'1',
	'2',
	'Carolina Franco de Lima',
	'12'
)



INSERT INTO [dbo].[Request]
(
	[EmployeeID],
	[RequestDate],
	[ApprovalDate]
)
VALUES
(
	'1',
	'2019/02/25',
	'2019/03/04'
)



INSERT INTO [dbo].[Periods]
(
	[RequestID],
	[StartDate],
	[EndDate],
	[TotalDay],
	[Approved]
)
VALUES
(
	'1',
	'2019/03/04',
	'2019/03/08',
	'5',
	'1'
),
(
	'1',
	'2019/07/29',
	'2019/08/16',
	'15',
	'1'
),
(
	'1',
	'2019/12/23',
	'2020/01/03',
	'8',
	'0'
);
GO