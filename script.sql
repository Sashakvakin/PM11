USE [master]
GO
/****** Object:  Database [ХранительПРО_Квакин]    Script Date: 15.04.2024 16:44:32 ******/
CREATE DATABASE [ХранительПРО_Квакин]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО_Квакин', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО_Квакин.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ХранительПРО_Квакин_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО_Квакин_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ХранительПРО_Квакин] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО_Квакин].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО_Квакин] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ХранительПРО_Квакин]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[id_заявки] [int] NOT NULL,
	[id_пользователя] [int] NOT NULL,
	[тип_заявки] [nvarchar](150) NOT NULL,
	[дата_подачи_заявки] [date] NOT NULL,
	[время_подачи_заявки] [time](7) NOT NULL,
	[статус_заявки] [nvarchar](30) NOT NULL,
	[причина_отказа] [nvarchar](150) NULL,
 CONSTRAINT [PK_Заявка] PRIMARY KEY CLUSTERED 
(
	[id_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[id_пользователя] [int] NOT NULL,
	[ФИО] [nvarchar](150) NOT NULL,
	[должность] [nvarchar](150) NULL,
	[email] [nvarchar](150) NOT NULL,
	[пароль] [nvarchar](150) NOT NULL,
	[дата_регистрации] [date] NOT NULL,
	[роль] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[id_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Посетитель]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посетитель](
	[id_посетителя] [int] NOT NULL,
	[id_пропуска] [int] NOT NULL,
	[фамилия] [nvarchar](50) NOT NULL,
	[имя] [nvarchar](50) NOT NULL,
	[отчество] [nvarchar](50) NULL,
	[телефон] [nchar](11) NULL,
	[email] [nvarchar](10) NOT NULL,
	[организация] [nvarchar](150) NOT NULL,
	[примечание] [nvarchar](200) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[серия_паспорта] [nchar](6) NOT NULL,
	[номер_паспорта] [nchar](4) NOT NULL,
	[фотография_посетителя] [image] NULL,
 CONSTRAINT [PK_Посетитель] PRIMARY KEY CLUSTERED 
(
	[id_посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Принимающая сторона]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Принимающая сторона](
	[id_принимающей_стороны] [int] NOT NULL,
	[id_пропуска] [int] NOT NULL,
	[подразделение] [nvarchar](150) NULL,
	[ФИО_сотрудника] [nvarchar](150) NULL,
	[цель_посещения] [nvarchar](150) NULL,
 CONSTRAINT [PK_Принимающая сторона] PRIMARY KEY CLUSTERED 
(
	[id_принимающей_стороны] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пропуск]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пропуск](
	[id_пропуска] [int] NOT NULL,
	[id_заявки] [int] NOT NULL,
	[дата_начала_действия_пропуска] [date] NOT NULL,
	[дата_окончания_действия_пропуска] [date] NOT NULL,
	[цель_посещения] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Пропуск] PRIMARY KEY CLUSTERED 
(
	[id_пропуска] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Скан паспорта]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Скан паспорта](
	[id_скана_паспорта] [int] NOT NULL,
	[id_посетителя] [int] NOT NULL,
	[файл_скана_паспорта] [image] NOT NULL,
 CONSTRAINT [PK_Скан паспорта] PRIMARY KEY CLUSTERED 
(
	[id_скана_паспорта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список посетителей]    Script Date: 15.04.2024 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список посетителей](
	[id_списка_посетителей] [int] NOT NULL,
	[id_посетителя] [int] NOT NULL,
	[порядковый_номер] [int] NOT NULL,
 CONSTRAINT [PK_Список посетителей] PRIMARY KEY CLUSTERED 
(
	[id_списка_посетителей] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Пользователь] ([id_пользователя], [ФИО], [должность], [email], [пароль], [дата_регистрации], [роль]) VALUES (1, N'Степанова Радинка Власовна', NULL, N'Radinka100@yandex.ru
', N'b3uWS6#Thuvq
', CAST(N'2024-01-01' AS Date), N'пользователь
')
INSERT [dbo].[Пользователь] ([id_пользователя], [ФИО], [должность], [email], [пароль], [дата_регистрации], [роль]) VALUES (2, N'Шилов Прохор Герасимович', NULL, N'Prohor156@list.ru
', N'zDdom}SIhWs?
', CAST(N'2024-01-02' AS Date), N'пользователь
')
INSERT [dbo].[Пользователь] ([id_пользователя], [ФИО], [должность], [email], [пароль], [дата_регистрации], [роль]) VALUES (3, N'Кононов Юрин Романович
', NULL, N'YUrin155@gmail.com
', N'u@m*~ACBCqNQ
', CAST(N'2024-01-03' AS Date), N'пользователь
')
INSERT [dbo].[Пользователь] ([id_пользователя], [ФИО], [должность], [email], [пароль], [дата_регистрации], [роль]) VALUES (4, N'Елисеева Альбина Николаевна
', NULL, N'Aljbina33@lenta.ru', N'Bu?BHCtwDFin', CAST(N'2024-01-04' AS Date), N'пользователь
')
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО_Квакин] SET  READ_WRITE 
GO
