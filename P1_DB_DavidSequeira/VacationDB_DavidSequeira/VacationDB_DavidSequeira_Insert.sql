-- 0. Database context
USE [VacationDB_DavidSequeira];
GO


-----------------------------------------------------------------------------------
-- 17. Insert the remaining company departments: Comercial, Gestão e Administração
-----------------------------------------------------------------------------------
INSERT INTO [dbo].[Department]
(
	[DepartmentName],
	[DepartmentCode]
)
VALUES
(
	'Comercial',
	'CML'
),
(
	'Gestão',
	'GST'
),
(
	'Administração',
	'ADM'
);
GO

----------------------------------------------
-- 26. Insert two new Vacation Request Forms
----------------------------------------------
INSERT INTO [dbo].[Department]
(
	[DepartmentName],
	[DepartmentCode]
)
VALUES
(
	'Financeiro',
	'FI'
),
(
	'Administrativo',
	'AD'
);
GO


INSERT INTO [dbo].[City]
(
	[CountryID],
	[City],
	[CityCode]
)
VALUES
(
	'1',
	'Lisboa',
	'LIS'
),
(
	'1',
	'Braga',
	'BRG'
);
GO


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
	'2',
	'Mário Ramos',
	'3'
),
(
	'2',
	'6',
	'Rui Pina de Oliveira',
	'83'
),
(
	'3',
	'7',
	'Maria Teresa Vale dos Santos',
	'100'
);
GO


INSERT INTO [dbo].[Request]
(
	[EmployeeID],
	[RequestDate],
	[ApprovalDate]
)
VALUES
(
	'4',
	'2019/02/26',
	'2019/03/06'
),
(
	'5',
	'2019/03/04',
	'2019/03/13'
);
GO


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
	'2',
	'2019/04/15',
	'2019/04/19',
	'6',
	'0'
),
(
	'2',
	'2019/07/29',
	'2019/08/21',
	'27',
	'1'
),
(
	'3',
	'2019/02/04',
	'2019/02/15',
	NULL,
	'1'
),
(
	'3',
	'2019/07/29',
	'2019/07/31',
	NULL,
	'1'
),
(
	'3',
	'2019/12/23',
	'2019/12/31',
	NULL,
	'0'
);
GO