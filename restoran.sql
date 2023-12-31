USE [master]
GO
/****** Object:  Database [Restoran]    Script Date: 19.08.2023 13:41:42 ******/
CREATE DATABASE [Restoran]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restoran', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Restoran.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Restoran_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Restoran_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Restoran] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restoran].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restoran] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restoran] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restoran] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restoran] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restoran] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restoran] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Restoran] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restoran] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restoran] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restoran] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restoran] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restoran] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restoran] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restoran] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restoran] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Restoran] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restoran] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restoran] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restoran] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restoran] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restoran] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restoran] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restoran] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restoran] SET  MULTI_USER 
GO
ALTER DATABASE [Restoran] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restoran] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restoran] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restoran] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restoran] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restoran] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Restoran] SET QUERY_STORE = ON
GO
ALTER DATABASE [Restoran] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Restoran]
GO
/****** Object:  Table [dbo].[MusteriSet]    Script Date: 19.08.2023 13:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriSet](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[musteriName] [nvarchar](max) NOT NULL,
	[musteriPhone] [nvarchar](max) NOT NULL,
	[musteriBudget] [nvarchar](max) NOT NULL,
	[musteriAdress] [nvarchar](max) NOT NULL,
	[RestoranID] [int] NOT NULL,
 CONSTRAINT [PK_MusteriSet] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestoranMusteri]    Script Date: 19.08.2023 13:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestoranMusteri](
	[RestoranMusteri_Musteri_RestoranID] [int] NOT NULL,
	[RestoranMusteri_Restoran_MusteriID] [int] NOT NULL,
 CONSTRAINT [PK_RestoranMusteri] PRIMARY KEY CLUSTERED 
(
	[RestoranMusteri_Musteri_RestoranID] ASC,
	[RestoranMusteri_Restoran_MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestoranSet]    Script Date: 19.08.2023 13:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestoranSet](
	[RestoranID] [int] IDENTITY(1,1) NOT NULL,
	[restoranName] [nvarchar](max) NOT NULL,
	[restoranAdress] [nvarchar](max) NOT NULL,
	[restoranSalary] [decimal](18, 0) NOT NULL,
	[restoranPhone] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RestoranSet] PRIMARY KEY CLUSTERED 
(
	[RestoranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisSet]    Script Date: 19.08.2023 13:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisSet](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[siparisPrice] [nvarchar](max) NOT NULL,
	[RestoranID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[urunCount] [int] NOT NULL,
	[urunSecim] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SiparisSet] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunSet]    Script Date: 19.08.2023 13:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunSet](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[urunName] [nvarchar](max) NOT NULL,
	[urunPrice] [decimal](18, 0) NOT NULL,
	[urunType] [nvarchar](max) NOT NULL,
	[RestoranID] [int] NOT NULL,
 CONSTRAINT [PK_UrunSet] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MusteriSet] ON 

INSERT [dbo].[MusteriSet] ([MusteriID], [musteriName], [musteriPhone], [musteriBudget], [musteriAdress], [RestoranID]) VALUES (1, N'orhun gença', N'0555', N'450', N'sadfas', 1)
INSERT [dbo].[MusteriSet] ([MusteriID], [musteriName], [musteriPhone], [musteriBudget], [musteriAdress], [RestoranID]) VALUES (2, N'orhungnc', N'0555', N'3435', N'sad', 2)
INSERT [dbo].[MusteriSet] ([MusteriID], [musteriName], [musteriPhone], [musteriBudget], [musteriAdress], [RestoranID]) VALUES (3, N'orhungnc', N'0555', N'3435', N'sad', 2)
INSERT [dbo].[MusteriSet] ([MusteriID], [musteriName], [musteriPhone], [musteriBudget], [musteriAdress], [RestoranID]) VALUES (4, N'orhungnc', N'0555', N'3435', N'sad', 2)
SET IDENTITY_INSERT [dbo].[MusteriSet] OFF
GO
SET IDENTITY_INSERT [dbo].[RestoranSet] ON 

INSERT [dbo].[RestoranSet] ([RestoranID], [restoranName], [restoranAdress], [restoranSalary], [restoranPhone]) VALUES (1, N'BurgerKing', N'Ataşehir', CAST(340593 AS Decimal(18, 0)), N'053534')
INSERT [dbo].[RestoranSet] ([RestoranID], [restoranName], [restoranAdress], [restoranSalary], [restoranPhone]) VALUES (2, N'McDonalds', N'Beşiktaş', CAST(344395 AS Decimal(18, 0)), N'0543543')
INSERT [dbo].[RestoranSet] ([RestoranID], [restoranName], [restoranAdress], [restoranSalary], [restoranPhone]) VALUES (3, N'Starbucks', N'Kadıköy', CAST(495933 AS Decimal(18, 0)), N'05334')
SET IDENTITY_INSERT [dbo].[RestoranSet] OFF
GO
SET IDENTITY_INSERT [dbo].[SiparisSet] ON 

INSERT [dbo].[SiparisSet] ([SiparisID], [siparisPrice], [RestoranID], [MusteriID], [urunCount], [urunSecim]) VALUES (1, N'75', 1, 1, 3, N'Hamburger')
INSERT [dbo].[SiparisSet] ([SiparisID], [siparisPrice], [RestoranID], [MusteriID], [urunCount], [urunSecim]) VALUES (2, N'85', 2, 1, 2, N'McBurger')
INSERT [dbo].[SiparisSet] ([SiparisID], [siparisPrice], [RestoranID], [MusteriID], [urunCount], [urunSecim]) VALUES (3, N'65', 3, 1, 1, N'Coffe')
INSERT [dbo].[SiparisSet] ([SiparisID], [siparisPrice], [RestoranID], [MusteriID], [urunCount], [urunSecim]) VALUES (4, N'85', 2, 2, 4, N'McBurger')
SET IDENTITY_INSERT [dbo].[SiparisSet] OFF
GO
SET IDENTITY_INSERT [dbo].[UrunSet] ON 

INSERT [dbo].[UrunSet] ([UrunID], [urunName], [urunPrice], [urunType], [RestoranID]) VALUES (1, N'Hamburger', CAST(75 AS Decimal(18, 0)), N'Food', 1)
INSERT [dbo].[UrunSet] ([UrunID], [urunName], [urunPrice], [urunType], [RestoranID]) VALUES (2, N'McBurger', CAST(85 AS Decimal(18, 0)), N'Food', 2)
INSERT [dbo].[UrunSet] ([UrunID], [urunName], [urunPrice], [urunType], [RestoranID]) VALUES (3, N'Coffe', CAST(65 AS Decimal(18, 0)), N'Hot Drink', 3)
SET IDENTITY_INSERT [dbo].[UrunSet] OFF
GO
/****** Object:  Index [IX_FK_RestoranMusteri_Musteri]    Script Date: 19.08.2023 13:41:43 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RestoranMusteri_Musteri] ON [dbo].[RestoranMusteri]
(
	[RestoranMusteri_Restoran_MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_MusteriSiparis]    Script Date: 19.08.2023 13:41:43 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MusteriSiparis] ON [dbo].[SiparisSet]
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RestoranSiparis]    Script Date: 19.08.2023 13:41:43 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RestoranSiparis] ON [dbo].[SiparisSet]
(
	[RestoranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RestoranUrun]    Script Date: 19.08.2023 13:41:43 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RestoranUrun] ON [dbo].[UrunSet]
(
	[RestoranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RestoranMusteri]  WITH CHECK ADD  CONSTRAINT [FK_RestoranMusteri_Musteri] FOREIGN KEY([RestoranMusteri_Restoran_MusteriID])
REFERENCES [dbo].[MusteriSet] ([MusteriID])
GO
ALTER TABLE [dbo].[RestoranMusteri] CHECK CONSTRAINT [FK_RestoranMusteri_Musteri]
GO
ALTER TABLE [dbo].[RestoranMusteri]  WITH CHECK ADD  CONSTRAINT [FK_RestoranMusteri_Restoran] FOREIGN KEY([RestoranMusteri_Musteri_RestoranID])
REFERENCES [dbo].[RestoranSet] ([RestoranID])
GO
ALTER TABLE [dbo].[RestoranMusteri] CHECK CONSTRAINT [FK_RestoranMusteri_Restoran]
GO
ALTER TABLE [dbo].[SiparisSet]  WITH CHECK ADD  CONSTRAINT [FK_MusteriSiparis] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[MusteriSet] ([MusteriID])
GO
ALTER TABLE [dbo].[SiparisSet] CHECK CONSTRAINT [FK_MusteriSiparis]
GO
ALTER TABLE [dbo].[SiparisSet]  WITH CHECK ADD  CONSTRAINT [FK_RestoranSiparis] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[RestoranSet] ([RestoranID])
GO
ALTER TABLE [dbo].[SiparisSet] CHECK CONSTRAINT [FK_RestoranSiparis]
GO
ALTER TABLE [dbo].[UrunSet]  WITH CHECK ADD  CONSTRAINT [FK_RestoranUrun] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[RestoranSet] ([RestoranID])
GO
ALTER TABLE [dbo].[UrunSet] CHECK CONSTRAINT [FK_RestoranUrun]
GO
USE [master]
GO
ALTER DATABASE [Restoran] SET  READ_WRITE 
GO
