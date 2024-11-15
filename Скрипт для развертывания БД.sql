USE [master]
GO
/****** Object:  Database [VitaLab_Test_Kharaman]    Script Date: 11.11.2024 19:36:43 ******/
CREATE DATABASE [VitaLab_Test_Kharaman]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VitaLab_Test_Kharaman', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VitaLab_Test_Kharaman1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VitaLab_Test_Kharaman_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VitaLab_Test_Kharaman1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VitaLab_Test_Kharaman].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ARITHABORT OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET  MULTI_USER 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET QUERY_STORE = OFF
GO
USE [VitaLab_Test_Kharaman]
GO
/****** Object:  Table [dbo].[Income]    Script Date: 11.11.2024 19:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Income](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Sum] [decimal](18, 2) NOT NULL,
	[Remains] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.11.2024 19:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Sum] [decimal](18, 2) NOT NULL,
	[SumPayment] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11.11.2024 19:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[SumPayment] [decimal](18, 2) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[IncomeNumber] [int] NOT NULL,
 CONSTRAINT [pk] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC,
	[IncomeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Income] ON 

INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1036, CAST(N'2024-11-11' AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1037, CAST(N'2024-11-11' AS Date), CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1038, CAST(N'2024-11-11' AS Date), CAST(3.00 AS Decimal(18, 2)), CAST(0.89 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1039, CAST(N'2024-11-11' AS Date), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1040, CAST(N'2024-11-11' AS Date), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1041, CAST(N'2024-11-11' AS Date), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1042, CAST(N'2024-11-11' AS Date), CAST(18.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1043, CAST(N'2024-11-11' AS Date), CAST(120.00 AS Decimal(18, 2)), CAST(58.50 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1044, CAST(N'2024-11-11' AS Date), CAST(44.00 AS Decimal(18, 2)), CAST(44.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1045, CAST(N'2024-11-11' AS Date), CAST(12.60 AS Decimal(18, 2)), CAST(12.60 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1046, CAST(N'2024-11-11' AS Date), CAST(12.99 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1047, CAST(N'2024-11-11' AS Date), CAST(130.00 AS Decimal(18, 2)), CAST(127.50 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1048, CAST(N'2024-11-11' AS Date), CAST(99.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1049, CAST(N'2023-12-22' AS Date), CAST(56.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1050, CAST(N'2023-11-12' AS Date), CAST(900.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1051, CAST(N'2024-11-11' AS Date), CAST(1599.00 AS Decimal(18, 2)), CAST(1599.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1052, CAST(N'2024-11-11' AS Date), CAST(125.00 AS Decimal(18, 2)), CAST(125.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1053, CAST(N'2023-06-06' AS Date), CAST(590.99 AS Decimal(18, 2)), CAST(590.99 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1054, CAST(N'2019-05-09' AS Date), CAST(999.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1055, CAST(N'2024-11-11' AS Date), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1056, CAST(N'2024-11-11' AS Date), CAST(345.00 AS Decimal(18, 2)), CAST(345.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1057, CAST(N'2024-11-11' AS Date), CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1058, CAST(N'2024-11-11' AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Income] ([Number], [Date], [Sum], [Remains]) VALUES (1059, CAST(N'2024-11-11' AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Income] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1041, CAST(N'2024-11-11' AS Date), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1042, CAST(N'2024-11-11' AS Date), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1043, CAST(N'2024-11-11' AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1044, CAST(N'2024-11-11' AS Date), CAST(12.00 AS Decimal(18, 2)), CAST(10.11 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1045, CAST(N'2024-11-11' AS Date), CAST(23.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1046, CAST(N'2024-11-11' AS Date), CAST(99.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1047, CAST(N'2024-11-11' AS Date), CAST(90.80 AS Decimal(18, 2)), CAST(13.49 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1048, CAST(N'2024-11-11' AS Date), CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1049, CAST(N'2024-11-11' AS Date), CAST(55.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1050, CAST(N'2024-11-11' AS Date), CAST(12.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1051, CAST(N'2024-11-11' AS Date), CAST(9.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1052, CAST(N'2024-11-11' AS Date), CAST(57.00 AS Decimal(18, 2)), CAST(57.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1053, CAST(N'2024-11-11' AS Date), CAST(44.00 AS Decimal(18, 2)), CAST(44.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1055, CAST(N'2023-10-10' AS Date), CAST(68.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1056, CAST(N'2024-11-11' AS Date), CAST(45.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1057, CAST(N'2024-11-11' AS Date), CAST(9009.00 AS Decimal(18, 2)), CAST(786.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1058, CAST(N'2024-11-11' AS Date), CAST(6786.00 AS Decimal(18, 2)), CAST(213.99 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1059, CAST(N'2023-12-31' AS Date), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1060, CAST(N'2024-11-11' AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1061, CAST(N'2024-11-11' AS Date), CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1062, CAST(N'2024-11-11' AS Date), CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1063, CAST(N'2024-11-11' AS Date), CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1064, CAST(N'2024-11-11' AS Date), CAST(23.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1065, CAST(N'2024-11-11' AS Date), CAST(5.90 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([Number], [Date], [Sum], [SumPayment]) VALUES (1066, CAST(N'2024-11-11' AS Date), CAST(16.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(7.00 AS Decimal(18, 2)), 1041, 1042)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(0.00 AS Decimal(18, 2)), 1041, 1045)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(6.00 AS Decimal(18, 2)), 1042, 1042)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(0.00 AS Decimal(18, 2)), 1042, 1045)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(0.00 AS Decimal(18, 2)), 1042, 1047)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(1.00 AS Decimal(18, 2)), 1043, 1047)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(2.00 AS Decimal(18, 2)), 1044, 1037)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(1.11 AS Decimal(18, 2)), 1044, 1038)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(5.00 AS Decimal(18, 2)), 1044, 1042)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(2.00 AS Decimal(18, 2)), 1044, 1057)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(11.99 AS Decimal(18, 2)), 1047, 1046)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(1.50 AS Decimal(18, 2)), 1047, 1047)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(4.50 AS Decimal(18, 2)), 1051, 1043)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(57.00 AS Decimal(18, 2)), 1052, 1043)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(44.00 AS Decimal(18, 2)), 1053, 1048)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(786.00 AS Decimal(18, 2)), 1057, 1054)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(213.99 AS Decimal(18, 2)), 1058, 1054)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(0.50 AS Decimal(18, 2)), 1065, 1036)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(1.00 AS Decimal(18, 2)), 1065, 1058)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(1.00 AS Decimal(18, 2)), 1066, 1038)
INSERT [dbo].[Payment] ([SumPayment], [OrderNumber], [IncomeNumber]) VALUES (CAST(1.00 AS Decimal(18, 2)), 1066, 1059)
GO
ALTER TABLE [dbo].[Income] ADD  CONSTRAINT [DF_Income_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SumPayement]  DEFAULT ((0)) FOR [SumPayment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Income1] FOREIGN KEY([IncomeNumber])
REFERENCES [dbo].[Income] ([Number])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Income1]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order1] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[Order] ([Number])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Order1]
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD  CONSTRAINT [IncomeSumConstraint] CHECK  (([Sum]>(0)))
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [IncomeSumConstraint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [OrderSumConstraint] CHECK  (([Sum]>(0)))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [OrderSumConstraint]
GO
/****** Object:  StoredProcedure [dbo].[Pay]    Script Date: 11.11.2024 19:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pay]
	@orderNumber int,
	@incomeNumber int,
	@sumPayment decimal(18,2),
	@orderPayed decimal(18,2)
AS
begin
Declare @OrderRemainCur decimal(18,2);
set @OrderRemainCur = (Select SumPayment from [Order] where [Order].Number = @OrderNumber)
if(@OrderRemainCur <> @orderPayed)
	begin
		begin try
		THROW 50005, N'Попытка изменения неактуальных данных', 1;
		end try
		begin catch
		throw
		end catch
	end
else
insert into Payment(OrderNumber, IncomeNumber, SumPayment)
Values(@orderNumber, @incomeNumber, @sumPayment)
end
GO
/****** Object:  Trigger [dbo].[Income_Inesrt]    Script Date: 11.11.2024 19:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[Income_Inesrt] 
on [dbo].[Income]
After Insert
as
update Income
Set Remains = Sum
where number = (select Number from inserted)
GO
ALTER TABLE [dbo].[Income] ENABLE TRIGGER [Income_Inesrt]
GO
/****** Object:  Trigger [dbo].[Payment_Calculate]    Script Date: 11.11.2024 19:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   trigger [dbo].[Payment_Calculate]
on [dbo].[Payment]
instead of Insert
as
begin
	declare @orderremain decimal(18,2)
	declare @sumpayment decimal(18,2)
	declare @incomeremain decimal(18,2);

	set @sumpayment = (select SumPayment from inserted);


	/*Если сумма платежа отрицательная*/
	if (@sumpayment < 0)
		begin
			begin try
				THROW 50005, N'Сумма платежа не может быть отрицательной', 1;
			end try
			begin catch
				throw
			end catch
		end
	else


	set @orderremain = 
		(select [dbo].[Order].[Sum] - [dbo].[Order].SumPayment 
		from [Order]
		where [dbo].[Order].Number = 
			(select OrderNumber from inserted));


	set @incomeremain = 
	(select [Income].Remains 
		from [Income] 
		where [Income].Number = 
		(select IncomeNumber from inserted))



	/*Если остаток от прихода меньше, чем указанная сумма платежа*/
	if (@incomeremain < @sumpayment)
	begin
		set @sumpayment = @incomeremain
	end


		/*Если указанная сумма платежа больше, чем необходимо оплатить в заказе*/
		if(@sumpayment > @orderremain)
	begin
	set @sumpayment = @orderremain
	end
	
		begin
			UPDATE [dbo].[Order]
			set [Order].SumPayment = [Order].SumPayment + @sumpayment
			from [Order]
			inner join Inserted On inserted.OrderNumber = [Order].Number;
			Update [Income]
		set [Income].Remains = [Income].Remains - @sumpayment
		from [Income]
		inner join Inserted on inserted.IncomeNumber = [Income].Number;
		end


	/* Если ранее этот заказ оплачивался этим приходом -> изменяем существующий платеж */
	if (exists(select 1 from [Payment] where OrderNumber = (select OrderNumber from inserted) 
	and IncomeNumber = (select IncomeNumber from inserted)))
		begin
							update [Payment]
					set [Payment].SumPayment = [Payment].SumPayment + @sumpayment
					where Payment.OrderNumber = (select OrderNumber from inserted)
					and Payment.IncomeNumber = (select IncomeNumber from inserted)
		end
	/* Если ранее этот заказ не оплачивался этим приходом*/
	else					
		begin
				insert into Payment(
		OrderNumber,
		IncomeNumber,
		SumPayment) 
		values (
		(select OrderNumber from inserted),
		(select IncomeNumber from inserted),
		@sumpayment)
		end
end
GO
ALTER TABLE [dbo].[Payment] ENABLE TRIGGER [Payment_Calculate]
GO
USE [master]
GO
ALTER DATABASE [VitaLab_Test_Kharaman] SET  READ_WRITE 
GO
