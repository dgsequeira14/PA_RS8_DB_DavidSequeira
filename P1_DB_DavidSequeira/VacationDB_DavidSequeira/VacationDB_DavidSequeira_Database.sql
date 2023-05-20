USE [master]
GO
/****** Object:  Database [VacationDB_DavidSequeira]    Script Date: 11/12/2022 14:28:58 ******/
CREATE DATABASE [VacationDB_DavidSequeira]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VacationDB_DavidSequeira', FILENAME = N'C:\VacationDB_DavidSequeira\DB\VacationDB_DavidSequeira.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VacationDB_DavidSequeira_log', FILENAME = N'C:\VacationDB_DavidSequeira\DB\VacationDB_DavidSequeira_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VacationDB_DavidSequeira].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ARITHABORT OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET RECOVERY FULL 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET  MULTI_USER 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VacationDB_DavidSequeira', N'ON'
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET QUERY_STORE = OFF
GO
USE [VacationDB_DavidSequeira]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/12/2022 14:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[City] [nvarchar](70) NOT NULL,
	[CityCode] [varchar](4) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/12/2022 14:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[CountryCode] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/12/2022 14:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[DepartmentCode] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/12/2022 14:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[ReportsTo] [int] NULL,
	[EmployeeName] [nvarchar](100) NOT NULL,
	[EmployeeCode] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periods]    Script Date: 11/12/2022 14:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periods](
	[PeriodID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalDay] [tinyint] NULL,
	[Approved] [bit] NOT NULL,
 CONSTRAINT [PK_Periods] PRIMARY KEY CLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 11/12/2022 14:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[RequestDate] [date] NOT NULL,
	[ApprovalDate] [date] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([CityID], [CountryID], [City], [CityCode]) VALUES (1, 1, N'Porto', N'PRT')
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([CountryID], [Country], [CountryCode]) VALUES (1, N'Portugal', N'PT')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentCode]) VALUES (1, N'Tecnologias de Informação', N'TI')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [DepartmentCode]) VALUES (2, N'Recursos Humanos', N'HR')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmployeeID], [CityID], [DepartmentID], [ReportsTo], [EmployeeName], [EmployeeCode]) VALUES (1, 1, 1, 2, N'Maria Antónia de Castro e Sá', N'120')
GO
INSERT [dbo].[Employees] ([EmployeeID], [CityID], [DepartmentID], [ReportsTo], [EmployeeName], [EmployeeCode]) VALUES (2, 1, 2, NULL, N'Carolina Franco de Lima', N'12')
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Periods] ON 
GO
INSERT [dbo].[Periods] ([PeriodID], [RequestID], [StartDate], [EndDate], [TotalDay], [Approved]) VALUES (1, 1, CAST(N'2019-03-04' AS Date), CAST(N'2019-03-08' AS Date), 5, 1)
GO
INSERT [dbo].[Periods] ([PeriodID], [RequestID], [StartDate], [EndDate], [TotalDay], [Approved]) VALUES (2, 1, CAST(N'2019-07-29' AS Date), CAST(N'2019-08-16' AS Date), 15, 1)
GO
INSERT [dbo].[Periods] ([PeriodID], [RequestID], [StartDate], [EndDate], [TotalDay], [Approved]) VALUES (3, 1, CAST(N'2019-12-23' AS Date), CAST(N'2020-01-03' AS Date), 8, 0)
GO
SET IDENTITY_INSERT [dbo].[Periods] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 
GO
INSERT [dbo].[Request] ([RequestID], [EmployeeID], [RequestDate], [ApprovalDate]) VALUES (1, 1, CAST(N'2019-02-25' AS Date), CAST(N'2019-03-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_City]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Periods]  WITH CHECK ADD  CONSTRAINT [FK_Periods_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[Periods] CHECK CONSTRAINT [FK_Periods_Request]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employees]
GO
USE [master]
GO
ALTER DATABASE [VacationDB_DavidSequeira] SET  READ_WRITE 
GO
