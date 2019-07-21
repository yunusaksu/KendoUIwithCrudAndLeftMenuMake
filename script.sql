USE [master]
GO
/****** Object:  Database [KendoUIDatabase]    Script Date: 19.07.2019 11:48:08 ******/
CREATE DATABASE [KendoUIDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KendoUIDatabase', FILENAME = N'C:\Users\Yunus\KendoUIDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KendoUIDatabase_log', FILENAME = N'C:\Users\Yunus\KendoUIDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KendoUIDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KendoUIDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KendoUIDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KendoUIDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KendoUIDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KendoUIDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KendoUIDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KendoUIDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [KendoUIDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KendoUIDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KendoUIDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KendoUIDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KendoUIDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KendoUIDatabase] SET QUERY_STORE = OFF
GO
USE [KendoUIDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [KendoUIDatabase]
GO
/****** Object:  Table [dbo].[AcilIsler]    Script Date: 19.07.2019 11:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcilIsler](
	[AcilIsID] [int] IDENTITY(1,1) NOT NULL,
	[IsinAdi] [nvarchar](250) NULL,
	[BildirimTarihi] [datetime] NULL,
	[CozumTarihi] [datetime] NULL,
	[IsinSahibi] [nvarchar](250) NULL,
	[MenuId] [int] NULL,
 CONSTRAINT [PK_AcilIsler] PRIMARY KEY CLUSTERED 
(
	[AcilIsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 19.07.2019 11:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenuId] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 19.07.2019 11:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AcilIsler]  WITH CHECK ADD  CONSTRAINT [FK_AcilIsler_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcilIsler] CHECK CONSTRAINT [FK_AcilIsler_Menu]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Parent] FOREIGN KEY([ParentMenuId])
REFERENCES [dbo].[Parent] ([ParentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Parent]
GO
USE [master]
GO
ALTER DATABASE [KendoUIDatabase] SET  READ_WRITE 
GO