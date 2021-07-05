USE [master]
GO
/****** Object:  Database [CityBookDB]    Script Date: 04/07/2021 13:31:55 ******/
CREATE DATABASE [CityBookDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'loginDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\loginDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'loginDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\loginDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CityBookDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CityBookDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CityBookDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CityBookDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CityBookDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CityBookDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CityBookDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CityBookDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CityBookDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CityBookDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CityBookDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CityBookDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CityBookDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CityBookDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CityBookDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CityBookDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CityBookDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CityBookDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CityBookDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CityBookDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CityBookDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CityBookDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CityBookDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CityBookDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CityBookDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CityBookDB] SET  MULTI_USER 
GO
ALTER DATABASE [CityBookDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CityBookDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CityBookDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CityBookDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CityBookDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CityBookDB', N'ON'
GO
ALTER DATABASE [CityBookDB] SET QUERY_STORE = OFF
GO
USE [CityBookDB]
GO
/****** Object:  Table [dbo].[Children]    Script Date: 04/07/2021 13:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Children](
	[ChildId] [int] IDENTITY(1,1) NOT NULL,
	[IdParent] [int] NOT NULL,
	[ChildName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Tz] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Children] PRIMARY KEY CLUSTERED 
(
	[ChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HMO]    Script Date: 04/07/2021 13:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMO](
	[HmoId] [int] IDENTITY(1,1) NOT NULL,
	[HmoName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HMO] PRIMARY KEY CLUSTERED 
(
	[HmoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kind]    Script Date: 04/07/2021 13:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kind](
	[KindId] [int] IDENTITY(1,1) NOT NULL,
	[KindName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Kind] PRIMARY KEY CLUSTERED 
(
	[KindId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/07/2021 13:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Tz] [varchar](15) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[IdHMO] [int] NOT NULL,
	[IdKind] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Children] ON 
GO
INSERT [dbo].[Children] ([ChildId], [IdParent], [ChildName], [DateOfBirth], [Tz]) VALUES (1, 1, N'roni', CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'11224477  ')
GO
INSERT [dbo].[Children] ([ChildId], [IdParent], [ChildName], [DateOfBirth], [Tz]) VALUES (4, 25, N'racheli', CAST(N'2021-07-13T00:00:00.000' AS DateTime), N'12032523  ')
GO
INSERT [dbo].[Children] ([ChildId], [IdParent], [ChildName], [DateOfBirth], [Tz]) VALUES (5, 1, N'ran', CAST(N'2021-07-16T00:00:00.000' AS DateTime), N'123456967 ')
GO
SET IDENTITY_INSERT [dbo].[Children] OFF
GO
SET IDENTITY_INSERT [dbo].[HMO] ON 
GO
INSERT [dbo].[HMO] ([HmoId], [HmoName]) VALUES (1, N'Maccabi')
GO
INSERT [dbo].[HMO] ([HmoId], [HmoName]) VALUES (2, N'Clalit')
GO
INSERT [dbo].[HMO] ([HmoId], [HmoName]) VALUES (3, N'Leumit')
GO
INSERT [dbo].[HMO] ([HmoId], [HmoName]) VALUES (4, N'Meuhedet')
GO
SET IDENTITY_INSERT [dbo].[HMO] OFF
GO
SET IDENTITY_INSERT [dbo].[Kind] ON 
GO
INSERT [dbo].[Kind] ([KindId], [KindName]) VALUES (1, N'male')
GO
INSERT [dbo].[Kind] ([KindId], [KindName]) VALUES (2, N'female')
GO
SET IDENTITY_INSERT [dbo].[Kind] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (1, N'zivi', N'cohen', N'123456789', CAST(N'2021-07-08T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (2, N'racheli', N'cohen', N'85295123', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (3, N'eliyou', N'cohen', N'85295127', CAST(N'2021-07-18T00:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (4, N'yair', N'fan', N'111111111', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (5, N'noam', N'frank', N'12087963', CAST(N'2021-07-13T00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (7, N'yeda', N'golany', N'11155588', CAST(N'2021-07-28T00:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (8, N'elyae', N'tomer', N'1233333', CAST(N'2021-07-16T00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (9, N'nomi', N'shapira', N'10101010', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (10, N'gh', N'ttt', N'12323232', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (11, N'batya', N'golany', N'4789877', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (12, N'gon', N'omrani', N'444444444', CAST(N'2021-07-26T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (15, N'noam', N'cohen', N'112211222', CAST(N'2021-07-13T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (16, N'noam', N'it', N'11112222', CAST(N'2021-07-27T00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (17, N'fog', N'cvi', N'1238974', CAST(N'2021-07-27T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (18, N'noam', N'it', N'3232322', CAST(N'2021-07-07T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (19, N'eliyou', N'shlomo', N'1232211', CAST(N'2021-07-06T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (20, N'nama', N'merchavi', N'123456543', CAST(N'2020-06-24T00:00:00.000' AS DateTime), 2, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (21, N'nomi', N'elyshyov', N'24534657', CAST(N'2021-07-19T00:00:00.000' AS DateTime), 3, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (22, N'yeuda', N'glik', N'951545487', CAST(N'2021-07-20T00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (23, N'yeda', N'chymson', N'1258963', CAST(N'2021-07-13T00:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (24, N'chim', N'yonatan', N'1258479', CAST(N'2021-07-13T00:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (25, N'elyau', N'shushan', N'7458964', CAST(N'2021-07-07T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (26, N'racheli', N'cohen', N'78965423', CAST(N'2021-07-07T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (27, N'racheli', N'lll', N'151515154', CAST(N'2021-07-30T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (28, N'racheli', N'tomer', N'123', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (29, N'racheli', N'cohen', N'789874561', CAST(N'2021-07-21T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Tz], [DateOfBirth], [IdHMO], [IdKind]) VALUES (30, N'racheli', N'cohen', N'789456123', CAST(N'2021-07-22T00:00:00.000' AS DateTime), 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Children]  WITH CHECK ADD  CONSTRAINT [FK_Children_Users1] FOREIGN KEY([IdParent])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Children] CHECK CONSTRAINT [FK_Children_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_HMO] FOREIGN KEY([IdHMO])
REFERENCES [dbo].[HMO] ([HmoId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_HMO]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Kind] FOREIGN KEY([IdKind])
REFERENCES [dbo].[Kind] ([KindId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Kind]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'CONSTRAINT',@level2name=N'FK_Users_HMO'
GO
USE [master]
GO
ALTER DATABASE [CityBookDB] SET  READ_WRITE 
GO
