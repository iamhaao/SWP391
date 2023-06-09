USE [master]
GO
/****** Object:  Database [Fastfood]    Script Date: 5/28/2023 12:44:35 PM ******/
CREATE DATABASE [Fastfood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fastfood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Fastfood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fastfood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Fastfood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fastfood] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fastfood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fastfood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fastfood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fastfood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fastfood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fastfood] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fastfood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fastfood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fastfood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fastfood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fastfood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fastfood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fastfood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fastfood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fastfood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fastfood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fastfood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fastfood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fastfood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fastfood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fastfood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fastfood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fastfood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fastfood] SET RECOVERY FULL 
GO
ALTER DATABASE [Fastfood] SET  MULTI_USER 
GO
ALTER DATABASE [Fastfood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fastfood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fastfood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fastfood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fastfood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fastfood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fastfood', N'ON'
GO
ALTER DATABASE [Fastfood] SET QUERY_STORE = OFF
GO
USE [Fastfood]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50)  NULL,
	[name] [nvarchar](50) NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](20) NULL,
	[roleId] [int] NULL,
	[avatar] [nvarchar](1000) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK__Account__3214EC07B224BB4F] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [nvarchar](6) NOT NULL,
	[AccountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[CartID] [nvarchar](6) NULL,
	[ProductID] [int] NULL,
	[quantityCart] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery1]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery1](
	[AccountID] [int] NOT NULL,
	[OrderID] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Delivery1] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[scrip] [nvarchar](1000) NULL,
	[date] [datetime] NULL,
	[rating] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [nvarchar](6) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceDetails] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__OrderDet__3214EC07E182AECD] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [nvarchar](6) NOT NULL,
	[AccountID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[StoreID] [int] NULL,
	[Status] [int] NOT NULL,
	[Shipper] [int] NULL,
	[AddressShip] [nchar](100) NULL,
	[Method] [int] NULL,
 CONSTRAINT [PK__Orders__3214EC07B8DAED87] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Image] [varchar](2000) NULL,
	[CategoryId] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__Product__3214EC27AD98E137] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] NOT NULL,
	[question] [nvarchar](1000) NOT NULL,
	[answer] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WareHouse]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouse](
	[ProductID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (1, N'iamhaao', N'lehao1911', N'Lê Hào ', N'haolee2002tst@gmail.com', N'Thừa Thiên Huế', N'0899202235', 1, N'./images/8e12a0df-d89a-46a3-a22e-e8a2fbb9ace6_org.apache.catalina.core.ApplicationPart@6308070b', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (2, N'tiendung', N'123', N'Lê Tiến Dũng', N'dungltde160491@fpt.edu.vn', N'Hà Tinh', N'0123456789', 2, N'./images/8c808d86-5b1d-4ee7-b011-7a01cc31f39f_org.apache.catalina.core.ApplicationPart@6c976b57', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (3, N'lehao', N'123', N'Lê Hào', N'haolde160051@fpt.edu.vn', N'Huế', N'0967327500', 2, N'./images/38e76073-feb2-4388-99d2-b676b6b81f24_org.apache.catalina.core.ApplicationPart@41e9f67e', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (5, N'luong123', N'123', N'Trần Đức Lương', N'qwe@gmail.com', N'DAI HOC FPT DA NANG', N'0386562704', 2, N'./images/d96f000e-c866-4b9e-9194-49b675eab411_org.apache.catalina.core.ApplicationPart@6f75d229', 0)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (6, N'trinh', N'123', N'trinh', N'Haolde160051@fpt.edu.vn', N'Thừa thiên huế', N'0336951009', 2, N'./images/defaultAvt.jpg', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (7, N'nin', N'123456', N'Lê Hoàn Nin nef he', N'abc@abc.com', N'Gia Lai-Viet Nam', N'0123456789', 3, N'./images/7f025ea9-3c6f-4e83-b97a-7ce3a6a2a1c5_org.apache.catalina.core.ApplicationPart@1487a831', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (8, N'conganh', N'123', N'Lê Công Anh', N'123@gmail.com', N'135 Bình Kì-Ngũ Hành Sơn-Đà Nẵng', N'0366854448', 2, N'./images/ae124c2d-951b-41aa-828d-41b793f27134_org.apache.catalina.core.ApplicationPart@163dbd7', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (9, N'congly', N'123456', N'Lê Công Lý', N'123@gmail.com', N'Thừa thiên huế', N'123', 2, N'./images/d3a38e3b-d295-47cb-93ad-872f6c7920fe_org.apache.catalina.core.ApplicationPart@d69f0f1', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (10, N'nhatlinh', N'123456', N'Lê Hoàng Nhật Linh', N'123@gmail.com', N'DAI HOC FPT DA NANG', N'0123456789', 2, N'./images/f8798295-1d10-40c5-8f06-ec0071af2b6e_org.apache.catalina.core.ApplicationPart@5872f5f2', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (11, N'vanluong', N'123456', N'Tran Van Luong', N'123@gmail.com', N'DAI HOC FPT DA NANG', N'0123456789', 2, N'./images/92c21a83-0ca0-46a2-86f7-4c0cfbe0fcc0_org.apache.catalina.core.ApplicationPart@728c2332', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (12, N'aaaaaa', N'123456', N'ADG', N'123@gmail.com', N'DAI HOC FPT DA NANG', N'0123456789', 2, N'./images/95cc39c5-8033-4b2f-afc8-875ea252cee1_org.apache.catalina.core.ApplicationPart@3131274', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (13, N'congly123', N'123456', N'Le Cong Ly', N'123@gmail.com', N'DAI HOC FPT DA NANG', N'0123456789', 2, N'./images/defaultAvt.jpg', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [name], [Email], [Address], [Phone], [roleId], [avatar], [active]) VALUES (14, N'congly1', N'123456', N'Le Cong Ly', N'123@gmail.com', N'DAI HOC FPT DA NANG', N'0123456789', 2, N'./images/defaultAvt.jpg', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (1, N'Chicken', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (2, N'Icream', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (3, N'Pizza', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (4, N'Popcorn', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (5, N'Donut', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (6, N'Hambuger', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (7, N'Sandwich', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (8, N'Water', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (9, N'Another', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'1zbHN0', 21, 1, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'1zbHN0', 23, 2, CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'1zbHN0', 28, 2, CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'2q3ScC', 7, 2, CAST(4200.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'2q3ScC', 12, 2, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'3vlhST', 14, 2, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'3vlhST', 22, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4bGEGv', 21, 1, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4bGEGv', 25, 1, CAST(7000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4bGEGv', 39, 1, CAST(4500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4lAT4t', 15, 1, CAST(32000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4lAT4t', 17, 1, CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4lAT4t', 30, 1, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'4lAT4t', 31, 1, CAST(7000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'5TuHrx', 39, 1, CAST(4500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'8Z5XAs', 14, 6, CAST(192000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'BGrJpf', 6, 3, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'BGrJpf', 27, 2, CAST(24000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'BGrJpf', 32, 2, CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'cl77mp', 6, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'cl77mp', 7, 2, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'cl77mp', 12, 2, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'fqepUV', 19, 1, CAST(14000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'lPxi7Y', 39, 1, CAST(4500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'lRNFx5', 21, 5, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'nCdzvF', 21, 1, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'nCdzvF', 25, 1, CAST(7000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'nCdzvF', 39, 1, CAST(4500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'RszgT9', 21, 4, CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'sAxaZC', 7, 2, CAST(4200.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'sAxaZC', 12, 2, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'sAxaZC', 15, 2, CAST(64000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'sAxaZC', 20, 1, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N't1ckAr', 8, 2, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N't1ckAr', 19, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N't1ckAr', 32, 2, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vVAnr1', 24, 1, CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vVAnr1', 29, 1, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vVAnr1', 30, 1, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vzqFvA', 21, 1, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vzqFvA', 22, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vzqFvA', 25, 1, CAST(7000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vzqFvA', 28, 1, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'vzqFvA', 39, 1, CAST(4500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'xzr2U9', 21, 4, CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'zTUqjR', 20, 1, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [PriceDetails]) VALUES (N'zTUqjR', 39, 1, CAST(4500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'1zbHN0', 3, CAST(N'2023-05-18T00:00:00.000' AS DateTime), CAST(37000.00 AS Decimal(18, 2)), 1, 2, 7, N'Triều Sơn Trung-Hương Toàn-Hương Trà-Thừa Thiên Huế                                                 ', 1)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'2q3ScC', 2, CAST(N'2023-05-23T00:00:00.000' AS DateTime), CAST(10200.00 AS Decimal(18, 2)), 1, 3, 7, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'3vlhST', 3, CAST(N'2023-05-18T00:00:00.000' AS DateTime), CAST(74000.00 AS Decimal(18, 2)), 1, 2, 7, N'Triều Sơn Trung-Hương Toàn-Hương Trà-Thừa Thiên Huế                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'4bGEGv', 1, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(16500.00 AS Decimal(18, 2)), 1, 0, NULL, N'123                                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'4lAT4t', 3, CAST(N'2023-05-21T00:00:00.000' AS DateTime), CAST(62000.00 AS Decimal(18, 2)), 1, 2, 7, N'53 Bình Kì-Hòa Quý-Ngũ Hành Sơn-TP Đà Nẵng                                                          ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'5TuHrx', 6, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(4725.00 AS Decimal(18, 2)), 1, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'8Z5XAs', 1, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(201600.00 AS Decimal(18, 2)), 1, 0, NULL, N'DAI HOC FPT DA NANG123                                                                              ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'BGrJpf', 3, CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(50000.00 AS Decimal(18, 2)), 1, 2, 7, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'cl77mp', 2, CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(12200.00 AS Decimal(18, 2)), 1, 3, 7, N'Triều Sơn Trung-Hương Toàn-Hương Trà-Thừa Thiên Huế                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'fqepUV', 3, CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(14000.00 AS Decimal(18, 2)), 1, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'lPxi7Y', 6, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(4725.00 AS Decimal(18, 2)), 1, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'lRNFx5', 3, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(5250.00 AS Decimal(18, 2)), 3, 2, 7, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'nCdzvF', 1, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(16500.00 AS Decimal(18, 2)), 1, 0, NULL, N'Triều Sơn Trung-Hương Toàn-Hương Trà-Thừa Thiên Huế                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'RszgT9', 6, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(21000.00 AS Decimal(18, 2)), 2, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'sAxaZC', 3, CAST(N'2023-05-22T00:00:00.000' AS DateTime), CAST(79200.00 AS Decimal(18, 2)), 1, 2, 7, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N't1ckAr', 3, CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(70000.00 AS Decimal(18, 2)), 1, 2, 7, N'Quang Nam Province                                                                                  ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'vVAnr1', 2, CAST(N'2023-05-23T00:00:00.000' AS DateTime), CAST(26000.00 AS Decimal(18, 2)), 1, 0, NULL, N'Quang Nam Province                                                                                  ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'vzqFvA', 3, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(34125.00 AS Decimal(18, 2)), 2, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'xzr2U9', 6, CAST(N'2023-05-24T00:00:00.000' AS DateTime), CAST(21000.00 AS Decimal(18, 2)), 2, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
INSERT [dbo].[Orders] ([OrderID], [AccountID], [OrderDate], [TotalAmount], [StoreID], [Status], [Shipper], [AddressShip], [Method]) VALUES (N'zTUqjR', 12, CAST(N'2023-05-26T00:00:00.000' AS DateTime), CAST(9975.00 AS Decimal(18, 2)), 1, 0, NULL, N'DAI HOC FPT DA NANG                                                                                 ', 0)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (6, N'Chicken Spicy', N'
Gà rán cay là một món ăn độc đáo và hấp dẫn, với hương vị cay nồng và cảm giác thích thú khi ăn', CAST(2000.00 AS Decimal(18, 2)), N'./images/chicken1.png', 1, 20, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (7, N'Chicken Cheese', N'Gà rán vị phô mai là một biến thể hấp dẫn của gà rán truyền thống, với lớp vỏ giòn rụm bên ngoài và phô mai béo ngậy bên trong.', CAST(2100.00 AS Decimal(18, 2)), N'./images/chicken2.png', 1, 25, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (8, N'Chicken Traditional', N'Lớp vỏ bên ngoài của gà rán truyền thống thường có màu nâu vàng hấp dẫn, có vẻ ngoài hấp dẫn và mùi thơm ngon. ', CAST(18000.00 AS Decimal(18, 2)), N'./images/chicken3.png', 1, 30, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (9, N'Ice-ream Vani', N'
Kem vani là một loại kem phổ biến và được ưa chuộng trên khắp thế giới. Nó có một hương vị ngọt ngào và một màu trắng kem tinh khiết, tạo nên một món tráng miệng thật sự hấp dẫn.', CAST(3000.00 AS Decimal(18, 2)), N'./images/ice1.png', 2, 21, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (12, N'Ice-Cream Blueberry', N'Kem việt quất là một loại kem ngon và hấp dẫn, có hương vị tươi mát và độ ngọt vừa phải, được làm từ trái việt quất tươi hoặc đông lạnh.', CAST(3000.00 AS Decimal(18, 2)), N'./images/ic3.png', 2, 16, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (13, N'Ice-Cream Strawberry', N'Kem dâu tây là một loại kem hấp dẫn với hương vị tươi mát và màu sắc tươi tắn từ trái dâu tây. Nó được làm từ trái dâu tây mang đến hương vị ngọt ngào và độ chua tự nhiên của trái cây.', CAST(3000.00 AS Decimal(18, 2)), N'./images/ice2.png', 2, 17, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (14, N'Pizza DoubeD', N'được làm từ các thành phần hải sản tươi ngon. Nó là một sự kết hợp tuyệt vời giữa hương vị biển cả và bánh pizza truyền thống.', CAST(32000.00 AS Decimal(18, 2)), N'./images/pizza1.jpg', 3, 24, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (15, N'Pizza Danse', N'Pizza xúc xích là một loại pizza phổ biến và thú vị, được làm từ xúc xích và các thành phần khác để tạo ra một hương vị ngon lành và đậm đà.', CAST(32000.00 AS Decimal(18, 2)), N'./images/pizza2.jpg', 3, 16, CAST(N'2023-04-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (16, N'Pizza Vegetable', N'Pizza rau củ là một loại pizza đặc biệt được tạo ra với một phần hoặc toàn bộ các thành phần từ rau củ tươi.', CAST(30000.00 AS Decimal(18, 2)), N'./images/pizza3.jpg', 3, 18, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (17, N'PopCorn Cheese', N'Bắp phô mai là một món ăn ngon và hấp dẫn, kết hợp giữa vị ngọt của bắp và vị béo, thơm của phô mai. Đây là một món ăn truyền thống trong các sự kiện, hội chợ và tiệc tùng', CAST(15000.00 AS Decimal(18, 2)), N'./images/bap1.png', 4, 25, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (19, N'PopCorn Caramel', N'Bắp caramel thường được làm từ những chiếc bắp tươi, có hạt ngọt và giòn. Bắp được luộc hoặc hấp chín để đảm bảo vẫn giữ được độ tươi ngon và màu sắc tươi tắn.', CAST(14000.00 AS Decimal(18, 2)), N'./images/bap2.png', 4, 36, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (20, N'Donut Dinel', N'
Donut dâu là một loại bánh ngọt tròn, có lỗ ở giữa và được phủ đều bằng một lớp glaze dâu tươi, tạo nên một hương vị ngon ngọt và màu sắc hấp dẫn.', CAST(5000.00 AS Decimal(18, 2)), N'./images/donut1.jpg', 5, 17, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (21, N'Dout Pumle', N'Trên mặt donut, có một lớp sô cô la được đổ đều, tạo nên một lớp phủ sô cô la mịn và bóng bẩy. ', CAST(5000.00 AS Decimal(18, 2)), N'./images/donut2.jpg', 5, 12, CAST(N'2023-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (22, N'Hambuger Chicken ', N'có lớp thịt gà xối mềm mịn và hương vị tươi ngon. Đây là một món ăn phổ biến và được ưa chuộng trong ẩm thực thế giới.', CAST(10000.00 AS Decimal(18, 2)), N'./images/ham1.jpg', 6, 18, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (23, N'Hambuger Beef', N'Hamburger bò thường bắt đầu với một chiếc bánh mì hamburger mềm mịn, có đôi khi được nướng lên để tạo ra một lớp vỏ giòn mặt ngoài.', CAST(10000.00 AS Decimal(18, 2)), N'./images/ham2.png', 6, 14, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (24, N'Hambuger Mix', N'kết hợp giữa thịt bò và thịt gà để tạo ra một hương vị đặc biệt. Đây là một lựa chọn thú vị cho những người muốn trải nghiệm hương vị mới mẻ và phong phú.', CAST(12000.00 AS Decimal(18, 2)), N'./images/ham3.jpg', 6, 28, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (25, N'Sandwich-Bubber', N'Đây là một lựa chọn ăn chay hoặc dành cho những người muốn thưởng thức một bữa ăn nhẹ và giàu chất dinh dưỡng.', CAST(7000.00 AS Decimal(18, 2)), N'./images/sw1.png', 7, 17, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (26, N'Sandwich-OLD', N'i bánh mì sandwich truyền thống của Việt Nam, có lớp chả thịt giòn mềm và hương vị đậm đà. Đây là một món ăn phổ biến và được ưa chuộng trong ẩm thực Việt.', CAST(7000.00 AS Decimal(18, 2)), N'./images/sw2.jpg', 7, 13, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (27, N'Milk Tea', N' kết hợp giữa hương vị trà thơm ngon và sữa mềm mịn. Đây là một loại đồ uống truyền thống của Đài Loan, và đã trở thành một xu hướng phổ biến trên toàn thế giới.', CAST(12000.00 AS Decimal(18, 2)), N'./images/water2.png', 8, 36, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (28, N'Soda', N'Nước soda thường có màu trong suốt và có một lượng carbon dioxide được thêm vào để tạo ra bọt và cảm giác ga trong miệng. Carbon dioxide là một loại khí tự nhiên và không gây hại cho sức khỏe.', CAST(6000.00 AS Decimal(18, 2)), N'./images/water4.png', 8, 16, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (29, N'CocaCola', N'Coca-Cola có màu đen và có một hương vị độc đáo, pha trộn giữa hương vị ngọt ngào, một chút axit và một chút mát lạnh. Một phần quan trọng của hương vị là công thức bí mật của Coca-Cola', CAST(6000.00 AS Decimal(18, 2)), N'./images/water3.png', 8, 34, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (30, N'Hot Dog', N'Bên trong ổ bánh mì, có một xúc xích được làm từ thịt lợn, thịt bò hoặc một sự kết hợp của cả hai.', CAST(8000.00 AS Decimal(18, 2)), N'./images/hotdog.png', 9, 27, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (31, N'Potato Chips', N'Khoai tây sau đó được chiên trong dầu nóng cho đến khi màu vàng và giòn. Quá trình chiên làm cho khoai tây có bề mặt giòn màu vàng và bên trong mềm mịn.', CAST(7000.00 AS Decimal(18, 2)), N'./images/ktc1.jpg', 9, 24, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (32, N'Pasta', N'Mì ý, hay còn được gọi là spaghetti, là một món ăn Ý nổi tiếng và phổ biến trên khắp thế giới. Nó là một loại mì dài và mềm, được nấu chín và thường được kết hợp với các loại sốt', CAST(10000.00 AS Decimal(18, 2)), N'./images/mi1.jpg', 9, 28, CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryId], [Quantity], [CreatedAt]) VALUES (39, N'Cake SheSo', N'This is a best for your lunch', CAST(4500.00 AS Decimal(18, 2)), N'./images/586e598d-6ed5-4c39-a57f-e9690d9ca423_org.apache.catalina.core.ApplicationPart@71446bd5', 9, 12, CAST(N'2023-05-24T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'user')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (3, N'shipper')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Store] ([StoreID], [Name], [Address]) VALUES (1, N'FastBites DANANG', N'126 Nguyễn Văn Linh, Vĩnh Trung, Thanh Khê, Đà Nẵng 550000, Việt Nam')
INSERT [dbo].[Store] ([StoreID], [Name], [Address]) VALUES (2, N'FastBites HANOI', N'136 Trần Hưng Đạo, Cửa Nam, Hoàn Kiếm, Hà Nội, Việt Nam')
INSERT [dbo].[Store] ([StoreID], [Name], [Address]) VALUES (3, N'FastBites HCM', N'283 Đ. Trần Hưng Đạo, Phường Cô Giang, Quận 1, Thành phố Hồ Chí Minh, Việt Nam')
GO
INSERT [dbo].[WareHouse] ([ProductID], [StoreID], [quantity]) VALUES (21, 1, 67)
INSERT [dbo].[WareHouse] ([ProductID], [StoreID], [quantity]) VALUES (21, 2, 46)
INSERT [dbo].[WareHouse] ([ProductID], [StoreID], [quantity]) VALUES (21, 3, 51)
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__roleId__59FA5E80] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__roleId__59FA5E80]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Delivery1]  WITH CHECK ADD  CONSTRAINT [FK_Delivery1_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Delivery1] CHECK CONSTRAINT [FK_Delivery1_Account]
GO
ALTER TABLE [dbo].[Delivery1]  WITH CHECK ADD  CONSTRAINT [FK_Delivery1_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Delivery1] CHECK CONSTRAINT [FK_Delivery1_Orders]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__Accoun__5AEE82B9] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__Accoun__5AEE82B9]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__Produc__5BE2A6F2] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__Produc__5BE2A6F2]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__2F10007B] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__2F10007B]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__300424B4] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__300424B4]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__AccountI__2C3393D0] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__AccountI__2C3393D0]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Store]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[WareHouse]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[WareHouse]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
/****** Object:  StoredProcedure [dbo].[bestseller]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[bestseller] 
as

select top(6) o.ProductID,COUNT(o.Quantity) as number  from OrderDetails O group by o.ProductID order by number;
GO
/****** Object:  StoredProcedure [dbo].[newproduct]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[newproduct] 
as
begin
  select top(2) * from Product order by CreatedAt DESC;
END 
GO
/****** Object:  StoredProcedure [dbo].[orderStatus]    Script Date: 5/28/2023 12:44:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[orderStatus] 
as 
select * from Orders where Status=0
GO
USE [master]
GO
ALTER DATABASE [Fastfood] SET  READ_WRITE 
GO
