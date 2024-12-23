USE [master]
GO
/****** Object:  Database [School]    Script Date: 12/3/2023 3:55:35 PM ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'D:\School.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'D:\School_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [School] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School] SET ARITHABORT OFF 
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School] SET  MULTI_USER 
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [School] SET QUERY_STORE = OFF
GO
USE [School]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/3/2023 3:55:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 12/3/2023 3:55:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[LearnerID] [int] NOT NULL,
	[Grade] [real] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Learner]    Script Date: 12/3/2023 3:55:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Learner](
	[LearnerID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[FirstMidName] [nvarchar](max) NOT NULL,
	[EnrollmentDate] [datetime2](7) NOT NULL,
	[MajorID] [int] NOT NULL,
 CONSTRAINT [PK_Learner] PRIMARY KEY CLUSTERED 
(
	[LearnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 12/3/2023 3:55:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[MajorID] [int] IDENTITY(1,1) NOT NULL,
	[MajorName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (1050, N'Chemistry', 3)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (4022, N'Microeconomics', 3)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits]) VALUES (4041, N'Macroeconomics', 3)
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [LearnerID], [Grade]) VALUES (3, 1050, 2, 3.5)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [LearnerID], [Grade]) VALUES (4, 4041, 2, 7)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
SET IDENTITY_INSERT [dbo].[Learner] ON 

INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (2, N'Alonso', N'Meredith', CAST(N'2002-09-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (5, N'Lê', N'Nam', CAST(N'2023-10-04T13:59:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (7, N'Trần', N'Minh', CAST(N'2023-10-04T14:47:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (9, N'Trần', N'Tuấn Nam', CAST(N'2023-10-05T14:46:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (10, N'Mai', N'Hồng', CAST(N'2023-10-18T17:08:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (11, N'Nguyễn', N'Tùng', CAST(N'2023-10-17T17:08:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (12, N'Trần', N'Hằng', CAST(N'2023-10-17T17:08:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (13, N'vũ', N'Bích', CAST(N'2023-10-23T17:09:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (14, N'Võ', N'Hoa', CAST(N'2023-10-10T17:09:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (15, N'Trần', N'Hưng', CAST(N'2023-10-19T17:10:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (16, N'Nguyễn', N'Tùng', CAST(N'2023-10-18T17:10:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (17, N'Tùng', N'Lâm', CAST(N'2023-10-17T17:11:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (18, N'Nam', N'Khoa', CAST(N'2023-10-18T17:11:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (19, N'Na', N'Tu', CAST(N'2023-10-17T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Learner] ([LearnerID], [LastName], [FirstMidName], [EnrollmentDate], [MajorID]) VALUES (20, N'abc', N'xyz', CAST(N'2023-10-17T00:00:00.0000000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[Learner] OFF
SET IDENTITY_INSERT [dbo].[Major] ON 

INSERT [dbo].[Major] ([MajorID], [MajorName]) VALUES (1, N'IT')
INSERT [dbo].[Major] ([MajorID], [MajorName]) VALUES (2, N'Economics')
INSERT [dbo].[Major] ([MajorID], [MajorName]) VALUES (3, N'Mathematics')
SET IDENTITY_INSERT [dbo].[Major] OFF
/****** Object:  Index [IX_Enrollment_CourseID]    Script Date: 12/3/2023 3:55:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_CourseID] ON [dbo].[Enrollment]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_LearnerID]    Script Date: 12/3/2023 3:55:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_LearnerID] ON [dbo].[Enrollment]
(
	[LearnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Learner_MajorID]    Script Date: 12/3/2023 3:55:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Learner_MajorID] ON [dbo].[Learner]
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course_CourseID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Learner_LearnerID] FOREIGN KEY([LearnerID])
REFERENCES [dbo].[Learner] ([LearnerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Learner_LearnerID]
GO
ALTER TABLE [dbo].[Learner]  WITH CHECK ADD  CONSTRAINT [FK_Learner_Major_MajorID] FOREIGN KEY([MajorID])
REFERENCES [dbo].[Major] ([MajorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Learner] CHECK CONSTRAINT [FK_Learner_Major_MajorID]
GO
USE [master]
GO
ALTER DATABASE [School] SET  READ_WRITE 
GO
