USE [master]
GO
/****** Object:  Database [ХранительПРО_Квакин]    Script Date: 17.04.2024 20:37:27 ******/
CREATE DATABASE [ХранительПРО_Квакин]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО_Квакин', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ХранительПРО_Квакин.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ХранительПРО_Квакин_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ХранительПРО_Квакин_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ХранительПРО_Квакин] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [ХранительПРО_Квакин] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ХранительПРО_Квакин] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ХранительПРО_Квакин] SET QUERY_STORE = ON
GO
ALTER DATABASE [ХранительПРО_Квакин] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ХранительПРО_Квакин]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[id_авторизации] [int] IDENTITY(1,1) NOT NULL,
	[логин] [nvarchar](255) NOT NULL,
	[пароль] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_авторизации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Групповые_Посетители]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Групповые_Посетители](
	[id_группового_посетителя] [int] IDENTITY(1,1) NOT NULL,
	[id_заявки] [int] NOT NULL,
	[id_посетителя] [int] NOT NULL,
	[название_группы] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_группового_посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[id_заявки] [int] NOT NULL,
	[id_посетителя] [int] NULL,
	[id_сотрудника] [int] NULL,
	[дата_подачи] [date] NULL,
	[дата_начала_действия_пропуска] [date] NULL,
	[дата_окончания_действия_пропуска] [date] NULL,
	[групповая_запись] [bit] NULL,
	[id_статуса_заявки] [int] NOT NULL,
	[комментарий] [nvarchar](250) NULL,
 CONSTRAINT [PK_Заявка] PRIMARY KEY CLUSTERED 
(
	[id_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отдел](
	[id_отдела] [int] IDENTITY(1,1) NOT NULL,
	[название_отдела] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_отдела] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделение]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделение](
	[id_подразделения] [int] IDENTITY(1,1) NOT NULL,
	[название_подразделения] [nvarchar](255) NOT NULL,
	[id_отдела] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Посетитель]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посетитель](
	[id_посетителя] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [nvarchar](255) NOT NULL,
	[имя] [nvarchar](255) NOT NULL,
	[отчество] [nvarchar](255) NULL,
	[телефон] [nvarchar](20) NULL,
	[email] [nvarchar](255) NULL,
	[организация] [nvarchar](255) NULL,
	[примечание] [nvarchar](max) NULL,
	[дата_рождения] [date] NULL,
	[серия_паспорта] [nvarchar](4) NULL,
	[номер_паспорта] [nvarchar](6) NULL,
	[id_авторизации] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Скан_Паспорта]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Скан_Паспорта](
	[id_скана] [int] NOT NULL,
	[id_посетителя] [int] NOT NULL,
	[скан_паспорта] [varbinary](max) NULL,
 CONSTRAINT [PK_Скан_Паспорта] PRIMARY KEY CLUSTERED 
(
	[id_скана] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[id_cотруника] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [nvarchar](255) NOT NULL,
	[имя] [nvarchar](255) NOT NULL,
	[отчество] [nvarchar](255) NULL,
	[id_подразделения] [int] NOT NULL,
	[id_отдела] [int] NOT NULL,
	[код_сотрудника] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cотруника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус_Заявки]    Script Date: 17.04.2024 20:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус_Заявки](
	[id_статуса] [int] IDENTITY(1,1) NOT NULL,
	[наименование_статуса] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Авторизация] ON 

INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (1, N'Vlas86', N'b3uWS6#Thuvvq
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (2, N'Prohor156
', N'zDdom}SIhWs?
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (3, N'YUrin155
', N'u@m*~ACBCqNQ
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (4, N'Aljbina33
', N'Bu?BHCtwDFin
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (5, N'Klavdiya113
', N'FjC#hNIJori}
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (6, N'Tamara179
', N'TJxVqMXrbesI
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (7, N'Taras24
', N'07m5yspn3K~K
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (8, N'Arkadij123
', N'vk2N7lxX}ck%
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (10, N'Glafira73
', N'Zz8POQlP}M4~
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (11, N'Gavriila68
', N'x4K5WthEe8ua
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (12, N'Kuzjma124
', N'OsByQJ}vYznW
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (13, N'Roman89
', N'Xd?xP$2yICcG
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (14, N'Aleksej43
', N'~c%PlTY0?qgl
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (15, N'Nadezhda137
', N'QQ~0q~rXHb?p
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (16, N'Bronislava56
', N'LO}xyC~1S4l6
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (18, N'Taisiya177
', N'R94YGT3XFjgD
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (19, N'Adelaida20
', N'LCY*{L*fEGYB
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (20, N'Lev131
', N'~?oj2Lh@S7*T')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (21, N'lzaihtvkdn
', N'L2W#uo7z{EsO
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (22, N'Lyudmila123
', N'@8mk9M?NBAGj
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (23, N'Taisiya176
', N'~rIWfsnXA~7C')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (24, N'Vera195', N'B|5v$2r$7luL')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (25, N'YAkov196', N'$6s5bggKP7aw
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (26, N'Nina145
', N'Uxy6RtBXIcpT
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (27, N'Leontij161
', N'KkMY8yKw@oCa
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (28, N'Serafima169
', N'gNe3I9}8J3Z@
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (29, N'Sergej35
', N'$39vc%ljqN%r
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (30, N'Georgij121', N'bbx5H}f*BC?w
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (32, N'Elizar30
', N'wJs1~r3RS~dr
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (34, N'Lana117', N'mFoG$jcS3c4~')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (35, N'1', N'123')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (36, N'rw', N'mFoG$jcS3c4~
')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (37, N'123', N'123')
INSERT [dbo].[Авторизация] ([id_авторизации], [логин], [пароль]) VALUES (38, N'234', N'234')
SET IDENTITY_INSERT [dbo].[Авторизация] OFF
GO
SET IDENTITY_INSERT [dbo].[Групповые_Посетители] ON 

INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (1, 3, 38, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (2, 4, 40, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (3, 5, 43, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (4, 6, 44, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (5, 7, 46, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (6, 8, 48, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (7, 9, 50, N'24/04/2023_Производство_Фомичева_9367788_ГР1
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (8, 10, 52, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (9, 11, 54, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (10, 12, 56, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (11, 13, 58, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (12, 14, 59, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (13, 15, 62, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
INSERT [dbo].[Групповые_Посетители] ([id_группового_посетителя], [id_заявки], [id_посетителя], [название_группы]) VALUES (14, 16, 66, N'24/04/2023_Производство_Фомичева_9367788_ГР2
')
SET IDENTITY_INSERT [dbo].[Групповые_Посетители] OFF
GO
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (1, 7, 1, CAST(N'2024-04-16' AS Date), CAST(N'2024-06-20' AS Date), CAST(N'2024-06-27' AS Date), 0, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (2, 8, 1, CAST(N'2024-04-17' AS Date), CAST(N'2024-07-02' AS Date), CAST(N'2024-07-12' AS Date), 0, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (3, 38, 2, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-02-01' AS Date), 1, 2, N'давайте быстрей')
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (4, 40, 3, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-02-01' AS Date), 1, 3, N'занято')
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (5, 43, 1, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-03-01' AS Date), 1, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (6, 44, 1, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-07' AS Date), 1, 3, N'потому что')
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (7, 46, 3, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-12' AS Date), 1, 2, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (8, 48, 2, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-24' AS Date), 1, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (9, 50, 4, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-04-17' AS Date), 1, 3, N'большой срок')
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (10, 52, 5, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-10' AS Date), 1, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (11, 54, 5, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-02-01' AS Date), 1, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (12, 56, 4, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-11-01' AS Date), 1, 1, N'надо')
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (13, 58, 4, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-02-05' AS Date), 1, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (14, 59, 1, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-12' AS Date), 1, 1, NULL)
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (15, 62, 5, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-04' AS Date), 1, 2, N'ну')
INSERT [dbo].[Заявка] ([id_заявки], [id_посетителя], [id_сотрудника], [дата_подачи], [дата_начала_действия_пропуска], [дата_окончания_действия_пропуска], [групповая_запись], [id_статуса_заявки], [комментарий]) VALUES (16, 66, 2, CAST(N'2024-04-17' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-02' AS Date), 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Отдел] ON 

INSERT [dbo].[Отдел] ([id_отдела], [название_отдела]) VALUES (1, N'Общий отдел')
INSERT [dbo].[Отдел] ([id_отдела], [название_отдела]) VALUES (2, N'Охрана')
SET IDENTITY_INSERT [dbo].[Отдел] OFF
GO
SET IDENTITY_INSERT [dbo].[Подразделение] ON 

INSERT [dbo].[Подразделение] ([id_подразделения], [название_подразделения], [id_отдела]) VALUES (1, N'Производство', 1)
INSERT [dbo].[Подразделение] ([id_подразделения], [название_подразделения], [id_отдела]) VALUES (2, N'Сбыт', 1)
INSERT [dbo].[Подразделение] ([id_подразделения], [название_подразделения], [id_отдела]) VALUES (3, N'Администрация
', 1)
INSERT [dbo].[Подразделение] ([id_подразделения], [название_подразделения], [id_отдела]) VALUES (4, N'Служба безопасности
', 2)
INSERT [dbo].[Подразделение] ([id_подразделения], [название_подразделения], [id_отдела]) VALUES (5, N'Планирование
', 1)
SET IDENTITY_INSERT [dbo].[Подразделение] OFF
GO
SET IDENTITY_INSERT [dbo].[Посетитель] ON 

INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (7, N'Степанова
', N'Радинка
', N'Власовна
', N'+7 (613) 272-60-62
', N'Radinka100@yandex.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1986-10-18' AS Date), N'0208', N'530509', 1)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (8, N'Шилов
', N'Прохор
', N'Герасимович
', N'+7 (615) 594-77-66
', N'Prohor156@list.ru
', NULL, N'24/04/2023_9788737
', CAST(N'1977-10-09' AS Date), N'3036', N'796488', 2)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (9, N'Кононов
', N'Юрин
', N'Романович
', N'+7 (784) 673-51-91
', N'YUrin155@gmail.com
', NULL, N'24/04/2023_9736379
', CAST(N'1971-10-08' AS Date), N'2747', N'790512', 3)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (10, N'Елисеева
', N'Альбина
', N'Николаевна
', N'+7 (654) 864-77-46
', N'Aljbina33@lenta.ru
', NULL, N'25/04/2023_9367788
', CAST(N'1983-02-15' AS Date), N'5241', N'213304', 4)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (11, N'Шарова
', N'Клавдия
', N'Макаровна
', N'+7 (822) 525-82-40
', N'Klavdiya113@live.com
', NULL, N'25/04/2023_9788737
', CAST(N'1980-07-22' AS Date), N'8143', N'593309', 5)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (12, N'Сидорова
', N'Тамара
', N'Григорьевна
', N'+7 (334) 692-79-77
', N'Tamara179@live.com
', NULL, N'25/04/2023_9736379
', CAST(N'1995-11-22' AS Date), N'8143', N'905520', 6)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (19, N'Петухов
', N'Тарас
', N'Фадеевич
', N'+7 (376) 220-62-51
', N'Taras24@rambler.ru
', NULL, N'26/04/2023_9367788
', CAST(N'1991-01-05' AS Date), N'8271', N'726518', 7)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (21, N'Родионов
', N'Аркадий
', N'Власович
', N'+7 (491) 696-17-11
', N'Arkadij123@inbox.ru
', NULL, N'26/04/2023_9788737
', CAST(N'1993-08-11' AS Date), N'3841', N'642594', 8)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (25, N'Горшкова
', N'Глафира
', N'Валентиновна
', N'+7 (553) 343-38-82
', N'Glafira73@outlook.com
', NULL, N'26/04/2023_9736379
', CAST(N'1978-05-25' AS Date), N'9170', N'402601', 10)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (26, N'Кириллова
', N'Гавриила
', N'Яковна
', N'+7 (648) 700-43-34
', N'Gavriila68@msn.com
', NULL, N'27/04/2023_9367788
', CAST(N'1992-04-26' AS Date), N'9438', N'379667', 11)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (28, N'Овчинников
', N'Кузьма
', N'Ефимович
', N'+7 (562) 866-15-27
', N'Kuzjma124@yandex.ru
', NULL, N'27/04/2023_9788737
', CAST(N'1993-08-02' AS Date), N'766', N'647226', 12)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (29, N'Беляков
', N'Роман
', N'Викторович
', N'+7 (595) 196-56-28
', N'Roman89@gmail.com
', NULL, N'27/04/2023_9736379
', CAST(N'1991-06-07' AS Date), N'2411', N'478305', 13)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (31, N'Лыткин
', N'Алексей
', N'Максимович
', N'+7 (994) 353-29-52
', N'Aleksej43@gmail.com
', NULL, N'28/04/2023_9367788
', CAST(N'1996-03-07' AS Date), N'2383', N'259825', 14)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (33, N'Шубина
', N'Надежда
', N'Викторовна
', N'+7 (736) 488-66-95
', N'Nadezhda137@outlook.com
', NULL, N'28/04/2023_9788737
', CAST(N'1981-09-24' AS Date), N'8844', N'708476', 15)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (36, N'Зиновьева
', N'Бронислава
', N'Викторовна
', N'+7 (778) 565-12-18
', N'Bronislava56@yahoo.com
', NULL, N'28/04/2023_9736379
', CAST(N'1981-03-19' AS Date), N'6736', N'319423', 16)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (38, N'Самойлова
', N'Таисия
', N'Гермоновна
', N'+7 (891) 555-81-44
', N'Taisiya177@lenta.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1979-11-14' AS Date), N'5193', N'897719', 18)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (40, N'Ситникова
', N'Аделаида
', N'Гермоновна
', N'+7 (793) 736-70-31
', N'Adelaida20@hotmail.com
', NULL, N'24/04/2023_9367788
', CAST(N'1979-01-21' AS Date), N'7561', N'148016', 19)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (42, N'Исаев
', N'Лев
', N'Юлианович
', N'+7 (675) 593-89-30
', N'Lev131@rambler.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1994-08-05' AS Date), N'1860', N'680004', 20)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (43, N'Никифоров
', N'Даниил
', N'Степанович
', N'+7 (384) 358-77-82
', N'Daniil198@bk.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1970-12-13' AS Date), N'4557', N'999958', 21)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (44, N'Титова
', N'Людмила
', N'Якововна
', N'+7 (221) 729-16-84
', N'Lyudmila123@hotmail.com
', NULL, N'24/04/2023_9367788
', CAST(N'1976-08-21' AS Date), N'7715', N'639425', 22)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (46, N'Абрамова
', N'Таисия
', N'Дмитриевна
', N'+7 (528) 312-18-20
', N'Taisiya176@hotmail.com
', NULL, N'24/04/2023_9367788
', CAST(N'1982-11-20' AS Date), N'7310', N'893510', 23)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (48, N'Кузьмина
', N'Вера
', N'Максимовна
', N'+7 (598) 583-53-45
', N'Vera195@list.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1989-12-10' AS Date), N'3537', N'982933', 24)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (50, N'Мартынов
', N'Яков
', N'Ростиславович
', N'+7 (546) 159-67-33
', N'YAkov196@rambler.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1976-12-05' AS Date), N'1793', N'986963', 25)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (52, N'Евсеева
', N'Нина
', N'Павловна
', N'+7 (833) 521-31-50
', N'Nina145@msn.com
', NULL, N'24/04/2023_9367788
', CAST(N'1994-09-26' AS Date), N'9323', N'745717', 26)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (54, N'Голубев
', N'Леонтий
', N'Вячеславович
', N'+7 (160) 527-57-41
', N'Leontij161@mail.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1990-10-03' AS Date), N'1059', N'822077', 27)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (56, N'Карпова
', N'Серафима
', N'Михаиловна
', N'+7 (459) 930-91-70
', N'Serafima169@yahoo.com
', NULL, N'24/04/2023_9367788
', CAST(N'1989-11-19' AS Date), N'7034', N'858987', 28)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (58, N'Орехов
', N'Сергей
', N'Емельянович
', N'+7 (669) 603-29-87
', N'Sergej35@inbox.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1972-02-11' AS Date), N'3384', N'223682', 29)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (59, N'Исаев
', N'Георгий
', N'Павлович
', N'+7 (678) 516-36-86
', N'Georgij121@inbox.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1987-08-11' AS Date), N'4076', N'629809', 30)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (62, N'Богданов
', N'Елизар
', N'Артемович
', N'+7 (165) 768-30-97
', N'Elizar30@yandex.ru
', NULL, N'24/04/2023_9367788
', CAST(N'1978-02-02' AS Date), N'573', N'198559', 32)
INSERT [dbo].[Посетитель] ([id_посетителя], [фамилия], [имя], [отчество], [телефон], [email], [организация], [примечание], [дата_рождения], [серия_паспорта], [номер_паспорта], [id_авторизации]) VALUES (66, N'Тихонова
', N'Лана
', N'Семеновна
', N'+7 (478) 467-75-15
', N'Lana117@outlook.com
', NULL, N'24/04/2023_9367788
', CAST(N'1990-07-23' AS Date), N'8761', N'609740', 34)
SET IDENTITY_INSERT [dbo].[Посетитель] OFF
GO
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (7, 7, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (8, 8, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (9, 9, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (10, 10, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (11, 11, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (12, 12, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (19, 19, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (21, 21, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (25, 25, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (26, 26, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (28, 28, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (29, 29, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (31, 31, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (33, 33, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (36, 36, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (38, 38, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (40, 40, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (42, 42, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (43, 43, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (44, 44, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (46, 46, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (48, 48, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (50, 50, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (52, 52, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (54, 54, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (56, 56, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (58, 58, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (59, 59, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (62, 62, NULL)
INSERT [dbo].[Скан_Паспорта] ([id_скана], [id_посетителя], [скан_паспорта]) VALUES (66, 66, NULL)
GO
SET IDENTITY_INSERT [dbo].[Сотрудник] ON 

INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (1, N'Фомичева', N'Авдотья', N'Трофимовна', 1, 1, 9367788)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (2, N'Гаврилова', N'Римма', N'Ефимовна', 2, 1, 9788737)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (3, N'Носкова', N'Наталия', N'Прохоровна', 3, 1, 9736379)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (4, N'Архипов', N'Тимофей', N'Васильевич', 4, 2, 9362832)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (5, N'Орехова', N'Вероника', N'Артемовна', 5, 1, 9737848)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (8, N'Савельев', N'Павел', N'Степанович', 1, 1, 9768239)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (9, N'Чернов', N'Всеволод', N'Наумович', 2, 1, 9404040)
INSERT [dbo].[Сотрудник] ([id_cотруника], [фамилия], [имя], [отчество], [id_подразделения], [id_отдела], [код_сотрудника]) VALUES (10, N'Марков', N'Юрий', N'Романович', 4, 2, 9404041)
SET IDENTITY_INSERT [dbo].[Сотрудник] OFF
GO
SET IDENTITY_INSERT [dbo].[Статус_Заявки] ON 

INSERT [dbo].[Статус_Заявки] ([id_статуса], [наименование_статуса]) VALUES (1, N'на проверке')
INSERT [dbo].[Статус_Заявки] ([id_статуса], [наименование_статуса]) VALUES (2, N'одобрена')
INSERT [dbo].[Статус_Заявки] ([id_статуса], [наименование_статуса]) VALUES (3, N'отказана')
SET IDENTITY_INSERT [dbo].[Статус_Заявки] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Авториза__5EB64DCC5040F615]    Script Date: 17.04.2024 20:37:28 ******/
ALTER TABLE [dbo].[Авторизация] ADD UNIQUE NONCLUSTERED 
(
	[логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Групповые_Посетители]  WITH CHECK ADD FOREIGN KEY([id_посетителя])
REFERENCES [dbo].[Посетитель] ([id_посетителя])
GO
ALTER TABLE [dbo].[Групповые_Посетители]  WITH CHECK ADD  CONSTRAINT [FK_Групповые_Посетители_Заявка] FOREIGN KEY([id_заявки])
REFERENCES [dbo].[Заявка] ([id_заявки])
GO
ALTER TABLE [dbo].[Групповые_Посетители] CHECK CONSTRAINT [FK_Групповые_Посетители_Заявка]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Посетитель] FOREIGN KEY([id_посетителя])
REFERENCES [dbo].[Посетитель] ([id_посетителя])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Посетитель]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Сотрудник] FOREIGN KEY([id_сотрудника])
REFERENCES [dbo].[Сотрудник] ([id_cотруника])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Сотрудник]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Статус_Заявки] FOREIGN KEY([id_статуса_заявки])
REFERENCES [dbo].[Статус_Заявки] ([id_статуса])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Статус_Заявки]
GO
ALTER TABLE [dbo].[Посетитель]  WITH CHECK ADD FOREIGN KEY([id_авторизации])
REFERENCES [dbo].[Авторизация] ([id_авторизации])
GO
ALTER TABLE [dbo].[Скан_Паспорта]  WITH CHECK ADD  CONSTRAINT [FK_Скан_Паспорта_Посетитель] FOREIGN KEY([id_посетителя])
REFERENCES [dbo].[Посетитель] ([id_посетителя])
GO
ALTER TABLE [dbo].[Скан_Паспорта] CHECK CONSTRAINT [FK_Скан_Паспорта_Посетитель]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD FOREIGN KEY([id_отдела])
REFERENCES [dbo].[Отдел] ([id_отдела])
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD FOREIGN KEY([id_подразделения])
REFERENCES [dbo].[Подразделение] ([id_подразделения])
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО_Квакин] SET  READ_WRITE 
GO
