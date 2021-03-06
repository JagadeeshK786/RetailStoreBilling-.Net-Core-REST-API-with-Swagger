USE [master]
GO
/****** Object:  Database [RetailStore]    Script Date: 16-Nov-20 9:51:43 AM ******/
CREATE DATABASE [RetailStore]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RetailStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RetailStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RetailStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RetailStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RetailStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RetailStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RetailStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [RetailStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RetailStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RetailStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RetailStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RetailStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RetailStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RetailStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RetailStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RetailStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RetailStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RetailStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RetailStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RetailStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RetailStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RetailStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RetailStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RetailStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RetailStore] SET RECOVERY FULL 
GO
ALTER DATABASE [RetailStore] SET  MULTI_USER 
GO
ALTER DATABASE [RetailStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RetailStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RetailStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RetailStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RetailStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RetailStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RetailStore] SET QUERY_STORE = OFF
GO
USE [RetailStore]
GO
/****** Object:  Table [dbo].[Barcode]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcode](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Barcode] [char](13) NULL,
	[SerialNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_Barcode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillItems]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillItems](
	[SNO] [bigint] IDENTITY(100000,1) NOT NULL,
	[BillID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [decimal](18, 0) NULL,
	[NetPrice] [money] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_BillItems] PRIMARY KEY CLUSTERED 
(
	[SNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[BillID] [bigint] IDENTITY(10000,1) NOT NULL,
	[OperatorID] [int] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[BillDate] [smalldatetime] NULL,
	[TimeStamp] [varchar](20) NULL,
	[BillStatus] [nvarchar](20) NULL,
	[SalesTax] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(10000,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [char](128) NULL,
	[RoleID] [int] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[DOB] [smalldatetime] NOT NULL,
	[Address1] [nvarchar](30) NOT NULL,
	[Address2] [nvarchar](30) NULL,
	[City] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[Mobile] [nvarchar](20) NULL,
	[EmailId] [nvarchar](20) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[SerialNumber] [bigint] IDENTITY(1000,1) NOT NULL,
	[ProductName] [nvarchar](30) NOT NULL,
	[ProductDescription	] [nvarchar](50) NULL,
	[CategoryID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[IsWeightedItem] [bit] NOT NULL,
	[UnitWeight] [nchar](10) NULL,
	[UnitsInStock] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Picture] [image] NULL,
	[Color] [nvarchar](30) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(100,1) NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Picture] [image] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16-Nov-20 9:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(10,10) NOT NULL,
	[RoleName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[SupervisorID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Barcode] ON 

INSERT [dbo].[Barcode] ([ID], [Barcode], [SerialNumber]) VALUES (1000, N'b123456789012', 1000)
INSERT [dbo].[Barcode] ([ID], [Barcode], [SerialNumber]) VALUES (1001, N'b987654321098', 1001)
INSERT [dbo].[Barcode] ([ID], [Barcode], [SerialNumber]) VALUES (1002, N'b456789012345', 1002)
SET IDENTITY_INSERT [dbo].[Barcode] OFF
GO
SET IDENTITY_INSERT [dbo].[BillItems] ON 

INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100037, 10020, 1002, 120.0000, CAST(0 AS Decimal(18, 0)), 120.0000, CAST(10 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100038, 10020, 1001, 30.0000, CAST(0 AS Decimal(18, 0)), 30.0000, CAST(10 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100039, 10021, 1000, 70.0000, CAST(0 AS Decimal(18, 0)), 70.0000, CAST(14 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100040, 10021, 1002, 120.0000, CAST(0 AS Decimal(18, 0)), 120.0000, CAST(10 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100041, 10022, 1000, 100.0000, CAST(0 AS Decimal(18, 0)), 100.0000, CAST(20 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100042, 10022, 1002, 240.0000, CAST(0 AS Decimal(18, 0)), 240.0000, CAST(20 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100043, 10022, 1001, 123.0000, CAST(0 AS Decimal(18, 0)), 123.0000, CAST(41 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100044, 10023, 1002, 312.0000, CAST(0 AS Decimal(18, 0)), 312.0000, CAST(26 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100045, 10023, 1000, 30.0000, CAST(0 AS Decimal(18, 0)), 30.0000, CAST(6 AS Decimal(18, 0)), N'INPROGRESS')
INSERT [dbo].[BillItems] ([SNO], [BillID], [ProductID], [Price], [Discount], [NetPrice], [Quantity], [Status]) VALUES (100046, 10023, 1001, 36.0000, CAST(0 AS Decimal(18, 0)), 36.0000, CAST(12 AS Decimal(18, 0)), N'INPROGRESS')
SET IDENTITY_INSERT [dbo].[BillItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([BillID], [OperatorID], [TotalAmount], [BillDate], [TimeStamp], [BillStatus], [SalesTax]) VALUES (10020, 10000, 150.0000, CAST(N'2020-11-16T09:25:00' AS SmallDateTime), NULL, N'INPROGRESS', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Bills] ([BillID], [OperatorID], [TotalAmount], [BillDate], [TimeStamp], [BillStatus], [SalesTax]) VALUES (10021, 10001, 120.0000, CAST(N'2020-11-14T13:30:00' AS SmallDateTime), NULL, N'INPROGRESS', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Bills] ([BillID], [OperatorID], [TotalAmount], [BillDate], [TimeStamp], [BillStatus], [SalesTax]) VALUES (10022, 10000, 0.0000, CAST(N'2020-11-16T08:50:00' AS SmallDateTime), NULL, N'INPROGRESS', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Bills] ([BillID], [OperatorID], [TotalAmount], [BillDate], [TimeStamp], [BillStatus], [SalesTax]) VALUES (10023, 10002, 378.0000, CAST(N'2020-11-16T08:24:00' AS SmallDateTime), NULL, N'INPROGRESS', CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [UserName], [Password], [RoleID], [FirstName], [LastName], [DOB], [Address1], [Address2], [City], [Country], [Mobile], [EmailId], [Active]) VALUES (10000, N'jonpom', N'xxxxxxx                                                                                                                         ', 130, N'Jonaton', N'Pomroy', CAST(N'2000-11-16T00:00:00' AS SmallDateTime), N'Laim. 99', NULL, N'Munich', N'Germany', N'1245689952', N'jp@gmail.com', 1)
INSERT [dbo].[Employee] ([EmployeeID], [UserName], [Password], [RoleID], [FirstName], [LastName], [DOB], [Address1], [Address2], [City], [Country], [Mobile], [EmailId], [Active]) VALUES (10001, N'richardm', N'xxxxxxx                                                                                                                         ', 120, N'Richard', N'Mathson', CAST(N'2000-11-16T00:00:00' AS SmallDateTime), N'Allach Strasse.10', NULL, N'Munich', N'Germany', N'1234567788', N'rm@gmail.com', 1)
INSERT [dbo].[Employee] ([EmployeeID], [UserName], [Password], [RoleID], [FirstName], [LastName], [DOB], [Address1], [Address2], [City], [Country], [Mobile], [EmailId], [Active]) VALUES (10002, N'robblank', N'xxxxxxx                                                                                                                         ', 110, N'Rob', N'Blankson', CAST(N'2000-11-16T00:00:00' AS SmallDateTime), N'Erding Strasse', NULL, N'Munich', N'Germany', N'4561237894', N'robbl@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([SerialNumber], [ProductName], [ProductDescription	], [CategoryID], [UnitPrice], [IsWeightedItem], [UnitWeight], [UnitsInStock], [Discount], [Picture], [Color], [Active]) VALUES (1000, N'apple', N'apple', 100, 5.0000, 1, N'1kg       ', 5, 0, NULL, NULL, 1)
INSERT [dbo].[Product] ([SerialNumber], [ProductName], [ProductDescription	], [CategoryID], [UnitPrice], [IsWeightedItem], [UnitWeight], [UnitsInStock], [Discount], [Picture], [Color], [Active]) VALUES (1001, N'mango', N'mangoes', 100, 3.0000, 1, N'1kg       ', 25, 0, NULL, NULL, 1)
INSERT [dbo].[Product] ([SerialNumber], [ProductName], [ProductDescription	], [CategoryID], [UnitPrice], [IsWeightedItem], [UnitWeight], [UnitsInStock], [Discount], [Picture], [Color], [Active]) VALUES (1002, N'Deodarent', N'Body Spray', 101, 12.0000, 0, N'200gms    ', 20, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description], [Picture], [Active]) VALUES (100, N'Fruits', N'Fruits', NULL, 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description], [Picture], [Active]) VALUES (101, N'Cosmetics', N'Cosmetics', NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [SupervisorID], [Active]) VALUES (110, N'RegMngr', N'Regional manager', 99999, 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [SupervisorID], [Active]) VALUES (120, N'UnitMngr', N'Local unit manager', 110, 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [SupervisorID], [Active]) VALUES (130, N'Operator', N'Store employee', 120, 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[BillItems] ADD  CONSTRAINT [DF_OrderDetails_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[BillItems] ADD  CONSTRAINT [DF_OrderDetails_NetPrice]  DEFAULT ((0)) FOR [NetPrice]
GO
ALTER TABLE [dbo].[BillItems] ADD  CONSTRAINT [DF_OrderDetails_Quantity]  DEFAULT ((0.0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[BillItems] ADD  CONSTRAINT [DF_OrderDetails_BillStatus]  DEFAULT (N'INPROGRESS') FOR [Status]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Orders_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_BillDate]  DEFAULT (getdate()) FOR [BillDate]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_BillStatus]  DEFAULT (N'INPROGRESS') FOR [BillStatus]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_SalesTax]  DEFAULT ((0)) FOR [SalesTax]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsWeightedItem]  DEFAULT ((1)) FOR [IsWeightedItem]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Barcode]  WITH CHECK ADD  CONSTRAINT [FK_Barcode_Product] FOREIGN KEY([SerialNumber])
REFERENCES [dbo].[Product] ([SerialNumber])
GO
ALTER TABLE [dbo].[Barcode] CHECK CONSTRAINT [FK_Barcode_Product]
GO
ALTER TABLE [dbo].[BillItems]  WITH CHECK ADD  CONSTRAINT [FK_BillItems_Bills] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bills] ([BillID])
GO
ALTER TABLE [dbo].[BillItems] CHECK CONSTRAINT [FK_BillItems_Bills]
GO
ALTER TABLE [dbo].[BillItems]  WITH CHECK ADD  CONSTRAINT [FK_BillItems_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([SerialNumber])
GO
ALTER TABLE [dbo].[BillItems] CHECK CONSTRAINT [FK_BillItems_Product]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Employee] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
USE [master]
GO
ALTER DATABASE [RetailStore] SET  READ_WRITE 
GO
