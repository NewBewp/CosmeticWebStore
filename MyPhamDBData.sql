USE [master]
GO
/****** Object:  Database [soryami_MyPhamDB]    Script Date: 4/22/2024 12:50:56 PM ******/
CREATE DATABASE [soryami_MyPhamDB]
GO
ALTER DATABASE [soryami_MyPhamDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [soryami_MyPhamDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [soryami_MyPhamDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [soryami_MyPhamDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [soryami_MyPhamDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [soryami_MyPhamDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [soryami_MyPhamDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET RECOVERY FULL 
GO
ALTER DATABASE [soryami_MyPhamDB] SET  MULTI_USER 
GO
ALTER DATABASE [soryami_MyPhamDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [soryami_MyPhamDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [soryami_MyPhamDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [soryami_MyPhamDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [soryami_MyPhamDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [soryami_MyPhamDB] SET QUERY_STORE = OFF
GO
USE [soryami_MyPhamDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [soryami_MyPhamDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attributes](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AttributesPrices]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AttributesPrices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AttributesPrices](
	[AttributesPriceID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AttributesPrices] PRIMARY KEY CLUSTERED 
(
	[AttributesPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[Levels] [int] NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NOT NULL,
	[Thumb] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Cover] [nvarchar](255) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](150) NULL,
	[Phone] [varchar](12) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](8) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Parent] [int] NULL,
	[Levels] [int] NULL,
	[Slug] [nvarchar](100) NULL,
	[NameWithType] [nvarchar](100) NULL,
	[Type] [nvarchar](10) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[TotalMoney] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NOT NULL,
	[HomeFlag] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[UnitsInStock] [int] NULL,
	[Alias] [nvarchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shippers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](150) NULL,
	[Phone] [nchar](10) NULL,
	[Company] [nvarchar](150) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 4/22/2024 12:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransactStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (2, N'0969514970', N'nguyenhakien99@gmail.com', N'1234', N'1         ', 1, N'Nguyễn Hà Kiên', 1, CAST(N'2022-05-25T02:02:00.000' AS DateTime), CAST(N'2022-05-10T06:03:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (3, N'0837185133', N'tridung2156@gmail.com', N'1234', N'1         ', 1, N'Đào Nguyễn Trí Dũng ', 1, CAST(N'2022-05-19T05:02:00.000' AS DateTime), CAST(N'2022-05-25T07:05:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (4, N'1234567', N'abc@gmail.com', N'123', N'2         ', 0, N'abc', 2, CAST(N'2022-05-24T06:12:00.000' AS DateTime), CAST(N'2022-05-11T18:11:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (5, N'11123456789', N'xzy@gmail.com', N'1234', N'1         ', 0, N'xyz', 1, CAST(N'2022-06-24T05:12:00.000' AS DateTime), CAST(N'2022-03-22T16:13:00.000' AS DateTime))
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (6, N'8234761298', N'abcxyz@gmail.com', N'1234', N'2         ', 1, N'abcxyz', 2, CAST(N'2019-08-01T18:16:00.000' AS DateTime), CAST(N'2022-06-04T18:14:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Attributes] ON 

INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (1, N'DuongAm')
INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (2, N'SuaRuaMat')
INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (3, N'Serum')
INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (4, N'Son môi')
INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (5, N'Mascara')
INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (6, N'Phấn mắt')
INSERT [dbo].[Attributes] ([AttributeID], [Name]) VALUES (7, N'Nước tẩy trang')
SET IDENTITY_INSERT [dbo].[Attributes] OFF
GO
SET IDENTITY_INSERT [dbo].[AttributesPrices] ON 

INSERT [dbo].[AttributesPrices] ([AttributesPriceID], [AttributeID], [ProductID], [Price], [Active]) VALUES (4, 1, 8, 200000, 1)
INSERT [dbo].[AttributesPrices] ([AttributesPriceID], [AttributeID], [ProductID], [Price], [Active]) VALUES (5, 2, 11, 210000, 1)
INSERT [dbo].[AttributesPrices] ([AttributesPriceID], [AttributeID], [ProductID], [Price], [Active]) VALUES (6, 3, 12, 220000, 1)
INSERT [dbo].[AttributesPrices] ([AttributesPriceID], [AttributeID], [ProductID], [Price], [Active]) VALUES (7, 4, 13, 230000, 1)
INSERT [dbo].[AttributesPrices] ([AttributesPriceID], [AttributeID], [ProductID], [Price], [Active]) VALUES (8, 5, 13, 230000, 1)
SET IDENTITY_INSERT [dbo].[AttributesPrices] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (4, N'Kem dưỡng da', N'Kem dưỡng da ', 1, 1, 2, 1, N'1.jpg', N'Dưỡng Da', N'Kem', N'Mô tả', N'Metakey là gì ?', N'Cover là gì ?', N'SchemaMarkup là gì ?')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (5, N'Serum', N'Serum mô tả', 1, 2, 4, 1, N'2.jpg', N'Serum', N'Serium Alias', N'Serium MetaDesc', N'SeriumMetaKey', N'SeriumCover', N'Serium SchemaMarkup')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (7, N'Tẩy trang', N'Tẩy trang mô tả', 1, 3, 3, 1, N'3.jpg', N'Tẩy trang Tile', N'Tẩy trang alias', N'Tẩy trang Metadesc', N'Tẩy trang MetaKey', N'Tẩy trang cover', N'Tẩy trang shema')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (8, N'trang điểm', N'trang điểm', 2, 2, 1, 1, N'4.jpg', N'trang điểm tile', N'trang điểm alias', N'trang điểm metadesc', N'trang điểm metakey', N'trang điểm meta', N'trang điểm')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (1002, N'Danh Mục Test', N'<p>mo ta&nbsp;</p>', 2, 1, 1, 1, N'danh-muc-test.gif', N'danh mục test', N'danh-muc-test', N'test', N'test', NULL, N'SchemaMarkup test')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (1, N'Nguyễn A', NULL, N'a1.jpg', N'TpHoChiMinh', N'a@gmail.com                                                                                                                                           ', N'1234567889', 1, 2, 3, CAST(N'2022-06-25T00:00:00.000' AS DateTime), N'1234', N'1       ', CAST(N'2022-06-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (2, N'Nguyễn b', NULL, N'a2.jpg', N'MyTho', N'b@gmail.com                                                                                                                                           ', N'12345667788', 2, 2, 4, CAST(N'2022-03-25T00:00:00.000' AS DateTime), N'1234', N'2       ', CAST(N'2022-03-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (15, N'Huynh Tuấn Hiền', NULL, NULL, NULL, N'tuanhien@gmail.com                                                                                                                                    ', N'0969514970', NULL, NULL, NULL, CAST(N'2022-07-23T18:49:40.767' AS DateTime), N'4aac8a4a113b56766177cc8d3341f814', N']nb@x   ', NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (1005, N'nguyenhakien', NULL, NULL, NULL, N'nguyenhakien99@gmail.com                                                                                                                              ', N'0969514970', NULL, NULL, NULL, CAST(N'2024-04-22T12:41:29.607' AS DateTime), N'7962b42a75c6b93ecf8cfd558605ad5a', N')f1%*   ', NULL, 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (1, N'Hồ Chí Minh', 1, 1, N'tphcm', N'Tp.Hồ Chí Minh', N'Thành Phố')
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (2, N'Mỹ Tho', 2, 2, N'tpmytho', N'Tp.Mỹ Tho', N'Thành Phố')
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (3, N'Thủ Đức', 3, 3, N'tpthuduc', N'Tp.Thủ Đức', N'Thành Phố')
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (4, N'Thanh Hóa', 4, 4, N'tpthanhhoa', N'Tp.Thanh Hóa', N'Thành Phố')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1, 1, 8, 423426234, 2, NULL, 2000000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (2, 2, 11, 932874509, 1, NULL, 2000000, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 40000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [Note], [Address], [LocationID], [District], [Ward]) VALUES (1, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, 0, 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 2000000, N'thành công', N'tpHCM', 1, 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [Note], [Address], [LocationID], [District], [Ward]) VALUES (2, 2, CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2022-01-02T00:00:00.000' AS DateTime), 2, 1, 0, NULL, 4000000, N'chưa thanh toán', N'tpThuDuc', 3, 2, 4)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1, N'thông tin liên hệ', N'thông tin liên hệ', N'pages1.jpg', 1, N'thôngtin', N'thôngtin_metadesc', N'thôngtin_metakey', N'thongtin', CAST(N'2022-06-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (2, N'thông báo ', N'thông báo ', N'pages2.jpg', 1, N'thông báo', N'thongbao_metadesc', N'thongbao_metakey', N'thongbao', CAST(N'2022-06-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1002, N'ĐIỀU KHOẢN', N'Trang Mô Tả điều khoản', N'dieu-khoan.gif', 0, N'điều khoản', N'điều khoản', N'điều khoản', N'dieu-khoan', CAST(N'2022-07-18T18:14:43.000' AS DateTime), 3)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1004, N'ĐIỀU KHOẢN 3', N'testtesttesttesttesttest <b>kien</b>', N'dieu-khoan-2.gif', 0, N'điều khoản', N'điều khoản', N'test', N'dieu-khoan-3', CAST(N'2022-07-18T18:15:59.000' AS DateTime), 5)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1006, N'Hướng Dẫn Mua Hàng', N'<p><b>Hướng dẫn mua hàng</b><br></p>', N'huong-dan-mua-hang.gif', 1, N'Hướng dẫn mua hàng', N'Hướng dẫn mua hàng', N'Hướng dẫn mua hàng', N'huong-dan-mua-hang', CAST(N'2022-07-19T22:48:25.000' AS DateTime), 2)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1007, N'Giới thiệu', N'<p><b><u>Về chúng tôi</u></b><br></p>', N've-chung-toi.gif', 1, N'Về chúng tôi', N'Về chúng tôi', N'Về chúng tôi', N'gioi-thieu', CAST(N'2022-07-19T22:49:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1008, N'Thông Tin Liên Hệ', N'<p>Thông tin liên hệ<br></p>', N'thong-tin-lien-he.gif', 1, N'Thông tin liên hệ', N'Thông tin liên hệ', N'Thông tin liên hệ', N'thong-tin-lien-he', CAST(N'2022-07-19T22:49:36.793' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Pages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (8, N'Nước Hoa Calvin Klein CK One Shock', N'Cho nữ', N'Nước hoa hồng', 8, 840000, 1, N'nuoc-hoa-calvin-klein-ck-one-shock.jpg', CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(N'2022-07-25T10:42:41.203' AS DateTime), 1, 1, 1, N'TayTrang', N'Tẩy trang', N'Tẩy trang Desc', N'Tẩy trang MetaKey', 10, N'nuoc-hoa-calvin-klein-ck-one-shock')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (11, N'Kem Nền Maybelline Fit Me ', N'Giúp săn chắc da, se khít lỗ chân lông', N'Kem nền', 8, 210000, 2, N'kem-nen-maybelline-fit-me.jpg', CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(N'2022-07-25T10:27:03.987' AS DateTime), 1, 1, 1, N'kem', N'kem', N'kemdesc', N'kemmetakey', 11, N'kem-nen-maybelline-fit-me')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (12, N'Make Up For Ever Full Cover Concealer Tone 05', N'760000', N'kẻ mắt', 8, 22000, 3, N'make-up-for-ever-full-cover-concealer-tone-05.jpg', CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(N'2022-07-25T10:44:59.420' AS DateTime), 1, 1, 1, N'trang điểm', N'trang điểm', N'trang điểm desc', N'trang điểm meta key', 12, N'make-up-for-ever-full-cover-concealer-tone-05')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (13, N'Chì Kẻ Mắt', N'Kẻ Mắt Không Trôi Karadium', N'chì kẻ mắt', 8, 150000, 4, N'chi-ke-mat.jpg', CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(N'2022-07-25T10:34:23.617' AS DateTime), 1, 1, 1, N'trang điểm', N'trang điểm', N'chì kẻ desc', N'chì kẻ metakey', 13, N'chi-ke-mat')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (1009, N'Dermalogica Multivitamin Power Serum', N'Tinh Chất Trẻ Hóa Da', NULL, 5, 2300000, 5, N'dermalogica-multivitamin-power-serum.jpg', CAST(N'2022-07-07T23:05:41.000' AS DateTime), CAST(N'2022-07-25T10:40:20.583' AS DateTime), 0, 1, 1, NULL, NULL, NULL, NULL, 4, N'dermalogica-multivitamin-power-serum')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (1010, N'Kem Chống Nắng TOLERIANE', N'Kem chống ', N'<span style="color: rgb(0, 0, 0); font-family: arial; font-size: 15px;">- KEM CHỐNG NẮNG VẬT LÝ - LAROCHE POSAY VẠCH VÀNG ANTHELIOS FLUIDE TEINTE 2in1 vừa là kem chống nắng vừa là kem nền luôn, dùng siêu thích, đặc biệt dành cho da nhạy cảm</span>', 4, 390000, 3, N'kem-chong-nang-toleriane.jpg', CAST(N'2022-07-07T23:09:00.000' AS DateTime), CAST(N'2022-07-25T11:07:04.400' AS DateTime), 0, 1, 1, N'sanphammoi', N'sanphammoi', N'sanphammoi', N'sanphammoi', 5, N'kem-chong-nang-toleriane')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2007, N'Sản Phẩm Mới Test', N'test cái thôi', NULL, 5, 10000000, 100, N'san-pham-moi-test.gif', CAST(N'2022-07-18T00:33:17.607' AS DateTime), CAST(N'2022-07-18T00:33:17.607' AS DateTime), 0, 0, 1, N'test', N'sản phẩm mới test', N'test', N'test', 50, N'san-pham-moi-test')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2008, N'Dfas', N'asfd', N'asdfasdf', 5, 1231, 43, N'dfas.gif', CAST(N'2022-07-18T00:36:55.560' AS DateTime), CAST(N'2022-07-18T00:36:55.560' AS DateTime), 0, 0, 1, NULL, N'sf', NULL, NULL, 123, N'dfas')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2009, N'Sdas ', N'asfdas', NULL, 7, 10000000, 100, N'sdas.gif', CAST(N'2022-07-18T00:39:53.927' AS DateTime), CAST(N'2022-07-18T00:39:53.927' AS DateTime), 0, 0, 1, N'test', N'sản phẩm mới test', N'test', N'test', 123, N'sdas')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2011, N'Fasdfa', N'fas', NULL, 5, 10000000, 100, N'default.jpg', CAST(N'2022-07-18T00:42:14.487' AS DateTime), CAST(N'2022-07-18T00:42:14.487' AS DateTime), 0, 0, 1, NULL, NULL, NULL, NULL, 1000, N'fasdfa')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2012, N'Son Dior Addict Stellar Shine', N'Màu Hồng Fuchsia', NULL, 8, 740000, 100, N'son-dior-addict-stellar-shine.jpg', CAST(N'2022-07-18T00:43:06.000' AS DateTime), CAST(N'2022-07-25T10:37:14.687' AS DateTime), 0, 1, 1, N'test', N'sf', N'test', N'test', 1000, N'son-dior-addict-stellar-shine')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2013, N'Safsfd A', N'asfa', NULL, 5, 10000000, 100, N'safsfd-a.gif', CAST(N'2022-07-18T01:01:53.580' AS DateTime), CAST(N'2022-07-18T01:01:53.580' AS DateTime), 0, 0, 1, N'test', N'sản phẩm mới test', N'test', N'test', 123, N'safsfd-a')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2014, N'Hada Labo Perfect White Arbutin Cream', N'Kem dưỡng da ', N'<ul style="list-style-position: initial; list-style-image: initial; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; margin-bottom: 1.3em; color: rgb(33, 33, 33); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: medium;"><li style="margin-bottom: 0.6em; margin-left: 1.3em;">Arbutin tinh khiết ức chế sự hình thành và phân tán hắc tố melanin – nguyên nhân gây nám, tàn nhang &amp; đốm nâu.</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">Vitamin C và B3 tăng cường khả năng chống ôxy hóa, dưỡng trắng các vùng da sậm màu, cho sắc da đều màu rạng rỡ.</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">HA và nano HA cung cấp độ ẩm toàn diện cho làn da ẩm mượt, sáng mịn.</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">Màng chống nắng bảo vệ da khỏi tác hại của tia UVA, UVB – nguyên nhân gây sạm da, đốm nâu, giúp dưỡng trắng da toàn diện.</li></ul>', 4, 200000, 100, N'hada-labo-perfect-white-arbutin-cream.jpg', CAST(N'2022-07-18T01:03:43.000' AS DateTime), CAST(N'2022-07-25T11:00:58.743' AS DateTime), 0, 1, 1, NULL, NULL, NULL, NULL, 123, N'hada-labo-perfect-white-arbutin-cream')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2015, N'Sản Phẩm Mới Test 1', N'asfdas', N'àdasfd ád', 7, 10000000, 100, N'default.jpg', CAST(N'2022-07-18T01:04:41.873' AS DateTime), CAST(N'2022-07-18T01:04:41.873' AS DateTime), 0, 0, 1, NULL, NULL, NULL, NULL, 50, N'san-pham-moi-test-1')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2017, N'Sản Phẩm Mới Test 2 ', N'test cái thôi', NULL, 5, 10000000, 43, N'default.jpg', CAST(N'2022-07-18T01:12:24.263' AS DateTime), CAST(N'2022-07-18T01:12:24.263' AS DateTime), 0, 0, 1, NULL, NULL, NULL, NULL, 50, N'san-pham-moi-test-2')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2018, N'Kem Dưỡng Da L’oreal Paris White Perfect Night Cream', N'Dưỡng ẩm sâu, giúp da mịn màng và căng mọng thấy rõ ', N'<span style="margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Arial; font-size: 14pt; vertical-align: baseline; color: rgb(76, 76, 76);">– LHA: làm giảm thâm nám bề mặt, thu nhỏ kích cỡ và làm mờ các vết thâm sạm trên da.</span><br style="color: rgb(76, 76, 76); font-family: Arial; font-size: 14px;"><span style="margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Arial; font-size: 14pt; vertical-align: baseline; color: rgb(76, 76, 76);">– Procystein: ức chế sự hình thành Melanin dưới da, nguyên nhân chính hình thành các vết thâm sạm, giúp giảm thâm nám ngau từ bên trong.</span><br style="color: rgb(76, 76, 76); font-family: Arial; font-size: 14px;"><span style="margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Arial; font-size: 14pt; vertical-align: baseline; color: rgb(76, 76, 76);">– Vitamin B3: dưỡng trắng an toàn và hiệu quả, mang lại làn da trắng mịn đều màu.</span>', 4, 180000, 10, N'kem-duong-da-loreal-paris-white-perfect-night-cream.jpg', CAST(N'2022-07-18T12:37:23.000' AS DateTime), CAST(N'2022-07-25T10:59:34.363' AS DateTime), 0, 1, 1, N'sanphammoi', N'Test thêm mới sản phẩm', N'Test thêm mới sản phẩm', N'Test thêm mới sản phẩm', 5, N'kem-duong-da-loreal-paris-white-perfect-night-cream')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2019, N'Skinceuticals Hydrating B5', N'Giúp làn da căng bóng, mịn màng hơn', N'<p><span style="color: rgb(0, 0, 0); font-family: Matbien; font-size: 15px;">&nbsp;Chứa công thức độc quyền cùng thành phần giàu dưỡng và hoạt tính: Hyaluronic Acid và Vitamin B5 với hàm lượng khá cao, có tác dụng cấp ẩm chuyên sâu, làm dịu và giảm kích ứng (sưng, mẫn đỏ,…), phục hồi thương tổn, kháng viêm, thu nhỏ lỗ chân lông, thúc đẩy tái tạo tế bào mới, phục hồi sinh khí, kích thích tuần hoàn máu dưới da, chống oxy hóa và các gốc tự do, kiểm soát dầu nhờn, làm chậm quá trình lão hóa da, bổ sung chất dinh dưỡng giúp trẻ hóa da, giảm thiểu nếp nhăn, ngăn ngừa tình trạng mất nước của da, giúp da luôn căng mịn và đầy sức sống.</span><br></p>', 5, 1750000, 2, N'skinceuticals-hydrating-b5.jpg', CAST(N'2022-07-18T17:37:51.000' AS DateTime), CAST(N'2022-07-25T10:58:10.797' AS DateTime), 0, 1, 1, N'test', N'sản phẩm mới test', N'test', N'test', 0, N'skinceuticals-hydrating-b5')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2020, N'Nước Tẩy Trang L''Oreal', N'Không làm da khô, kích ứng hay ửng đỏ', N'<p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px; line-height: 25px; color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;">-&nbsp; &nbsp;Tẩy sạch lớp tẩy trang cho làn da sạch thoáng</p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px; line-height: 25px; color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;">-&nbsp; &nbsp;Dưỡng ẩm cho làn da hiệu quả</p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px; line-height: 25px; color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;">-&nbsp; &nbsp;Dùng được cho vùng mắt môi nhạy cảm</p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px; line-height: 25px; color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;">-&nbsp; &nbsp;Không làm da khô, kích ứng hay ửng đỏ</p>', 1002, 80000, 12, N'san-pham-moi-test-4.jpg', CAST(N'2022-07-18T21:12:41.000' AS DateTime), CAST(N'2022-07-25T10:56:39.617' AS DateTime), 0, 1, 1, N'test', N'sản phẩm mới test', N'test', N'điều khoản', 1, N'nuoc-tay-trang-loreal')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [MetaDesc], [MetaKey], [UnitsInStock], [Alias]) VALUES (2021, N'Kem Dưỡng Ẩm Neutrogena', N'Cấp Nước Cho Da Dầu', N'<ul class="product_info" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;"><li style="margin-bottom: 5px;"><div class="g-mb-30" style="margin-bottom: 2.14286rem !important;"><h1 style="font-size: 18px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: inherit; font-weight: 700; line-height: 1.5; color: inherit; padding: 0px;"><span style="font-size: 16px;"><strong style="font-weight: bold;">Kem Dưỡng Ẩm Neutrogena Hydro Boost Water Gel</strong><br>-&nbsp;Cấp nước, bổ sung độ ẩm cho da luôn mềm mịn<br>-&nbsp;Giữ cho da luôn đàn hồi, căng bóng và tươi tắn<br>-&nbsp;Các thành phần dưỡng chất trong kem giúp se khít lỗ chân lông, ngăn ngừa mụn hiệu quả<br>-&nbsp;Tạo lớp nền trước khi makeup bảo vệ da an toàn.<br>-&nbsp;Chống lão hóa, giúp da luôn tươi trẻ<br>- Khóa ẩm cho da suốt 48 giờ cho da mềm mịn, ẩm mượt và trắng sáng nhanh chóng<br>- Phù hợp cho mọi loại da.</span></h1></div></li></ul>', 4, 150000, 2, N'kem-duong-am-neutrogena.jpg', CAST(N'2022-07-20T14:56:00.000' AS DateTime), CAST(N'2022-07-25T10:52:47.350' AS DateTime), 0, 1, 1, N'test', N'điều khoản', N'điều khoản', N'danh mục test', 3, N'kem-duong-am-neutrogena')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Staff', N'Nhân Viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1002, N'Nhân viên', N'Nhân Viên Thường')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1003, N'AdminN', N'Quản trị viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Shippers] ON 

INSERT [dbo].[Shippers] ([ShipperID], [ShipperName], [Phone], [Company], [ShipDate]) VALUES (1, N'kien', N'24152348  ', N'Grab', CAST(N'2022-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shippers] ([ShipperID], [ShipperName], [Phone], [Company], [ShipDate]) VALUES (2, N'dung', N'39845721  ', N'GHTK', CAST(N'2022-06-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shippers] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactStatus] ON 

INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (1, N'Shipping', N'The pakage are coming to you')
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (2, N'Packing', N'Shop is packing')
SET IDENTITY_INSERT [dbo].[TransactStatus] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts]'))
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts]'))
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AttributesPrices_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttributesPrices]'))
ALTER TABLE [dbo].[AttributesPrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributesPrices_Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AttributesPrices_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttributesPrices]'))
ALTER TABLE [dbo].[AttributesPrices] CHECK CONSTRAINT [FK_AttributesPrices_Attributes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AttributesPrices_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttributesPrices]'))
ALTER TABLE [dbo].[AttributesPrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributesPrices_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AttributesPrices_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[AttributesPrices]'))
ALTER TABLE [dbo].[AttributesPrices] CHECK CONSTRAINT [FK_AttributesPrices_Products]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customers_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customers_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetails_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetails_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetails_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetails_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_TransactStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_TransactStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransactStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [soryami_MyPhamDB] SET  READ_WRITE 
GO
