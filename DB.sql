USE [master]
GO
/****** Object:  Database [Grocery_Database]    Script Date: 12/15/2023 13:35:08 ******/
CREATE DATABASE [Grocery_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Grocery_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Grocery_Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Grocery_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Grocery_Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Grocery_Database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Grocery_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Grocery_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Grocery_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Grocery_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Grocery_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Grocery_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Grocery_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Grocery_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Grocery_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Grocery_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Grocery_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Grocery_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Grocery_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Grocery_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Grocery_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Grocery_Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Grocery_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Grocery_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Grocery_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Grocery_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Grocery_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Grocery_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Grocery_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Grocery_Database] SET RECOVERY FULL 
GO
ALTER DATABASE [Grocery_Database] SET  MULTI_USER 
GO
ALTER DATABASE [Grocery_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Grocery_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Grocery_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Grocery_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Grocery_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Grocery_Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Grocery_Database', N'ON'
GO
ALTER DATABASE [Grocery_Database] SET QUERY_STORE = ON
GO
ALTER DATABASE [Grocery_Database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Grocery_Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[r_id] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillImport]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillImport](
	[bill_import_id] [int] IDENTITY(1,1) NOT NULL,
	[date_import] [datetime] NULL,
	[amount] [int] NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
 CONSTRAINT [PK_BillImport] PRIMARY KEY CLUSTERED 
(
	[bill_import_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillOutput]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillOutput](
	[bill_out_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NULL,
	[date_sell] [datetime] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_BillOutput] PRIMARY KEY CLUSTERED 
(
	[bill_out_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_id]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_id](
	[categery_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](200) NULL,
	[date_import] [datetime] NULL,
 CONSTRAINT [PK_category_id] PRIMARY KEY CLUSTERED 
(
	[categery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feature]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature](
	[feature_id] [int] IDENTITY(1,1) NOT NULL,
	[feature_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](200) NULL,
	[date_manufacture] [datetime] NULL,
	[date_expiration] [datetime] NULL,
	[quantity] [numeric](18, 0) NULL,
	[price] [numeric](18, 0) NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role_1] PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[r_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[r_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/15/2023 13:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[date_of_birth] [datetime] NULL,
	[address] [nvarchar](200) NULL,
	[a_id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([a_id], [username], [password], [r_id]) VALUES (1, N'Admin', N'admin', 1)
INSERT [dbo].[Account] ([a_id], [username], [password], [r_id]) VALUES (2, N'Em1', N'123', 2)
INSERT [dbo].[Account] ([a_id], [username], [password], [r_id]) VALUES (3, N'Em2', N'321', 2)
INSERT [dbo].[Account] ([a_id], [username], [password], [r_id]) VALUES (4, N'Em3', N'456', 2)
INSERT [dbo].[Account] ([a_id], [username], [password], [r_id]) VALUES (5, N'Em5', N'123', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[BillImport] ON 

INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (1, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 30, 1, 1)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (2, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 40, 1, 1)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (3, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 25, 2, 1)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (4, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 25, 2, 1)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (5, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 10, 3, 2)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (6, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 10, 3, 2)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (7, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 30, 4, 2)
INSERT [dbo].[BillImport] ([bill_import_id], [date_import], [amount], [category_id], [supplier_id]) VALUES (8, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 30, 4, 2)
SET IDENTITY_INSERT [dbo].[BillImport] OFF
GO
SET IDENTITY_INSERT [dbo].[BillOutput] ON 

INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (1, 4, CAST(N'2023-11-14T06:30:36.233' AS DateTime), 8)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (2, 4, CAST(N'2023-11-14T06:30:36.577' AS DateTime), 8)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (3, 4, CAST(N'2023-11-14T06:30:42.607' AS DateTime), 8)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (4, 1, CAST(N'2023-11-14T06:31:16.013' AS DateTime), 7)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (5, 1, CAST(N'2023-11-14T06:32:32.693' AS DateTime), 7)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (6, 1, CAST(N'2023-11-14T06:34:20.507' AS DateTime), 7)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (7, 2, CAST(N'2023-11-14T06:36:27.177' AS DateTime), 5)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (8, 5, CAST(N'2023-11-14T08:53:00.933' AS DateTime), 4)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (9, 1, CAST(N'2023-11-14T08:54:29.813' AS DateTime), 5)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (10, 2, CAST(N'2023-11-14T15:31:42.377' AS DateTime), 3)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (11, 3, CAST(N'2023-11-14T15:33:26.707' AS DateTime), 1)
INSERT [dbo].[BillOutput] ([bill_out_id], [amount], [date_sell], [product_id]) VALUES (12, 2, CAST(N'2023-12-15T13:07:24.723' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[BillOutput] OFF
GO
SET IDENTITY_INSERT [dbo].[category_id] ON 

INSERT [dbo].[category_id] ([categery_id], [category_name], [date_import]) VALUES (1, N'Fruit', NULL)
INSERT [dbo].[category_id] ([categery_id], [category_name], [date_import]) VALUES (2, N'Clothes', NULL)
INSERT [dbo].[category_id] ([categery_id], [category_name], [date_import]) VALUES (3, N'Milk', NULL)
INSERT [dbo].[category_id] ([categery_id], [category_name], [date_import]) VALUES (4, N'Kem', NULL)
SET IDENTITY_INSERT [dbo].[category_id] OFF
GO
SET IDENTITY_INSERT [dbo].[feature] ON 

INSERT [dbo].[feature] ([feature_id], [feature_name]) VALUES (1, N'inventory')
INSERT [dbo].[feature] ([feature_id], [feature_name]) VALUES (2, N'account manager')
INSERT [dbo].[feature] ([feature_id], [feature_name]) VALUES (3, N'home view')
SET IDENTITY_INSERT [dbo].[feature] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (1, N'Dưa hấu', CAST(N'2023-11-14T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(27 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (2, N'Chuối', CAST(N'2023-11-14T00:00:00.000' AS DateTime), CAST(N'2023-01-12T00:00:00.000' AS DateTime), CAST(40 AS Numeric(18, 0)), CAST(15000 AS Numeric(18, 0)), 1, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (3, N'Áo thun', CAST(N'2023-10-15T00:00:00.000' AS DateTime), CAST(N'2023-12-30T00:00:00.000' AS DateTime), CAST(21 AS Numeric(18, 0)), CAST(50000 AS Numeric(18, 0)), 2, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (4, N'Quần bò', CAST(N'2023-09-09T00:00:00.000' AS DateTime), CAST(N'2023-12-25T00:00:00.000' AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(80000 AS Numeric(18, 0)), 2, 1)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (5, N'Sữa bò', CAST(N'2023-11-14T00:00:00.000' AS DateTime), CAST(N'2023-11-17T00:00:00.000' AS DateTime), CAST(7 AS Numeric(18, 0)), CAST(30000 AS Numeric(18, 0)), 3, 2)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (6, N'Sữa dê', CAST(N'2023-11-14T00:00:00.000' AS DateTime), CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(50000 AS Numeric(18, 0)), 3, 2)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (7, N'Kem ốc quế', CAST(N'2023-11-10T00:00:00.000' AS DateTime), CAST(N'2023-12-20T00:00:00.000' AS DateTime), CAST(27 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 4, 2)
INSERT [dbo].[Product] ([product_id], [product_name], [date_manufacture], [date_expiration], [quantity], [price], [category_id], [supplier_id]) VALUES (8, N'Kem socola', CAST(N'2023-11-10T00:00:00.000' AS DateTime), CAST(N'2023-12-21T00:00:00.000' AS DateTime), CAST(22 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 4, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([r_id], [r_name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([r_id], [r_name]) VALUES (2, N'employee')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Role_Feature] ([r_id], [feature_id]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([r_id], [feature_id]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([r_id], [feature_id]) VALUES (2, 3)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplier_id], [supplier_name]) VALUES (1, N'Nhà cùng cấp A')
INSERT [dbo].[Supplier] ([supplier_id], [supplier_name]) VALUES (2, N'Nhà cung cấp B')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([r_id])
REFERENCES [dbo].[Role] ([r_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[BillImport]  WITH CHECK ADD  CONSTRAINT [FK_BillImport_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[category_id] ([categery_id])
GO
ALTER TABLE [dbo].[BillImport] CHECK CONSTRAINT [FK_BillImport_category_id]
GO
ALTER TABLE [dbo].[BillImport]  WITH CHECK ADD  CONSTRAINT [FK_BillImport_Supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([supplier_id])
GO
ALTER TABLE [dbo].[BillImport] CHECK CONSTRAINT [FK_BillImport_Supplier]
GO
ALTER TABLE [dbo].[BillOutput]  WITH CHECK ADD  CONSTRAINT [FK_BillOutput_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[BillOutput] CHECK CONSTRAINT [FK_BillOutput_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[category_id] ([categery_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_category_id]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([supplier_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([r_id])
REFERENCES [dbo].[Role] ([r_id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Account] FOREIGN KEY([a_id])
REFERENCES [dbo].[Account] ([a_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Account]
GO
USE [master]
GO
ALTER DATABASE [Grocery_Database] SET  READ_WRITE 
GO
