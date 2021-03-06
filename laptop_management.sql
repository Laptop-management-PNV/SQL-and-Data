USE [master]
GO
/****** Object:  Database [laptop_management]    Script Date: 4/4/2022 9:38:02 AM ******/
CREATE DATABASE [laptop_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'laptop_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\laptop_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'laptop_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\laptop_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [laptop_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [laptop_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [laptop_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [laptop_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [laptop_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [laptop_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [laptop_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [laptop_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [laptop_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [laptop_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [laptop_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [laptop_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [laptop_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [laptop_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [laptop_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [laptop_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [laptop_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [laptop_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [laptop_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [laptop_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [laptop_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [laptop_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [laptop_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [laptop_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [laptop_management] SET RECOVERY FULL 
GO
ALTER DATABASE [laptop_management] SET  MULTI_USER 
GO
ALTER DATABASE [laptop_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [laptop_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [laptop_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [laptop_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [laptop_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [laptop_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'laptop_management', N'ON'
GO
ALTER DATABASE [laptop_management] SET QUERY_STORE = OFF
GO
USE [laptop_management]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[name] [varchar](20) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[permission] [varchar](10) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[laptops]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laptops](
	[id] [varchar](10) NOT NULL,
	[brand_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[img] [text] NULL,
	[loan_status] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK__laptops__3213E83FE49504C4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loan]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [varchar](10) NULL,
	[laptop_id] [varchar](10) NULL,
	[loaned_date] [datetime] NULL,
	[returned_date] [datetime] NULL,
	[admin_name] [varchar](20) NULL,
 CONSTRAINT [PK__loan__3213E83FA3E3CD1A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specs]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specs](
	[laptop_id] [varchar](10) NOT NULL,
	[memory] [varchar](30) NULL,
	[hard_drive] [varchar](10) NULL,
	[graphic_card] [varchar](50) NULL,
	[resolution] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[laptop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone_number] [varchar](10) NOT NULL,
	[loan_status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admins] ADD  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[laptops] ADD  CONSTRAINT [DF__laptops__loan_st__74AE54BC]  DEFAULT ((0)) FOR [loan_status]
GO
ALTER TABLE [dbo].[laptops] ADD  CONSTRAINT [DF__laptops__is_dele__02084FDA]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ((0)) FOR [loan_status]
GO
ALTER TABLE [dbo].[laptops]  WITH CHECK ADD  CONSTRAINT [FK__laptops__brand_i__30F848ED] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([id])
GO
ALTER TABLE [dbo].[laptops] CHECK CONSTRAINT [FK__laptops__brand_i__30F848ED]
GO
ALTER TABLE [dbo].[loan]  WITH CHECK ADD  CONSTRAINT [FK__loan__admin_name__398D8EEE] FOREIGN KEY([admin_name])
REFERENCES [dbo].[admins] ([name])
GO
ALTER TABLE [dbo].[loan] CHECK CONSTRAINT [FK__loan__admin_name__398D8EEE]
GO
ALTER TABLE [dbo].[loan]  WITH CHECK ADD  CONSTRAINT [FK__loan__laptop_id__37A5467C] FOREIGN KEY([laptop_id])
REFERENCES [dbo].[laptops] ([id])
GO
ALTER TABLE [dbo].[loan] CHECK CONSTRAINT [FK__loan__laptop_id__37A5467C]
GO
ALTER TABLE [dbo].[loan]  WITH CHECK ADD  CONSTRAINT [FK__loan__student_id__38996AB5] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[loan] CHECK CONSTRAINT [FK__loan__student_id__38996AB5]
GO
ALTER TABLE [dbo].[specs]  WITH CHECK ADD  CONSTRAINT [FK__specifica__lapto__3E52440B] FOREIGN KEY([laptop_id])
REFERENCES [dbo].[laptops] ([id])
GO
ALTER TABLE [dbo].[specs] CHECK CONSTRAINT [FK__specifica__lapto__3E52440B]
GO
ALTER TABLE [dbo].[admins]  WITH CHECK ADD CHECK  (([permission]='low' OR [permission]='high'))
GO
/****** Object:  StoredProcedure [dbo].[SP_ActiveAdmin]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ActiveAdmin] 
	-- Add the parameters for the stored procedure here
	@name varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE admins SET active = 1 WHERE name = @name
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateAdmin]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_CreateAdmin] 
	-- Add the parameters for the stored procedure here
	@name varchar(20),
	@password varchar(100),
	@permission varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into admins values(@name, @password, @permission, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateLaptop]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateLaptop]
	-- Add the parameters for the stored procedure here
	@id varchar(10),
	@brandId int,
	@name nvarchar(100),
	@img text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO laptops VALUES (@id, @brandId, @name, @img, 0, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateLoanDetail]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateLoanDetail] 
	-- Add the parameters for the stored procedure here
	@stdId varchar(10),
	@laptopId varchar(10),
	@loanedDate date,
	@adminName varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	InSERT INTO loan(student_id, laptop_id, loaned_date, admin_name) VALUES (@stdId, @laptopId, @loanedDate, @adminName)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateSpec]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateSpec]
	-- Add the parameters for the stored procedure here
	@laptopId varchar(10),
	@memory varchar(30),
	@hardDrive varchar(10),
	@graphicCard varchar(50),
	@resolution varchar(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO specs VALUES (@laptopId, @memory, @hardDrive, @graphicCard, @resolution)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAdmin]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteAdmin]
	-- Add the parameters for the stored procedure here
	@name varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE admins Set active = 0 Where name = @name
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteLaptop]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteLaptop] 
	-- Add the parameters for the stored procedure here
	@id varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update laptops set is_deleted = 1 where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAdmin]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetAdmin]
	-- Add the parameters for the stored procedure here
	@name varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM admins WHERE name = @name;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBrandById]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetBrandById] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from brands WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLaptopById]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetLaptopById]
	-- Add the parameters for the stored procedure here
	@id varchar(10)
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from laptops where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLaptopList]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetLaptopList]
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT * from laptops;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLoanDetailById]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetLoanDetailById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM loan WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLoanDetailByStdId]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetLoanDetailByStdId]
	-- Add the parameters for the stored procedure here
	@id varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM loan WHERE student_id = @id and returned_date is null
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetSpecById]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetSpecById]
	-- Add the parameters for the stored procedure here
	@id varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM specs WHERE laptop_id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetStudentById]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetStudentById] 
	-- Add the parameters for the stored procedure here
	@id varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM students WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoginCheck]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoginCheck] 
	-- Add the parameters for the stored procedure here
	@name varchar(20),
	@password varchar(100)
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT count(*) from admins where name = @name and password = @password and active = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateLaptop]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateLaptop]
	-- Add the parameters for the stored procedure here
	@id varchar(10),
	@brandId int,
	@name varchar(100),
	@img text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE laptops SET brand_id = @brandId, name = @name, img = @img WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateLaptopLoanStatus]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateLaptopLoanStatus]
	-- Add the parameters for the stored procedure here
	@id varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE laptops SET loan_status = ~loan_status WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateReturnedDate]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateReturnedDate] 
	-- Add the parameters for the stored procedure here
	@id varchar(10),
	@returnedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE loan SET returned_date = @returnedDate WHERE student_id = @id and returned_date is null
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSpec]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateSpec] 
	-- Add the parameters for the stored procedure here
	@laptopId varchar(10),
	@memory varchar(30),
	@hardDrive varchar(6),
	@graphicCard varchar(50),
	@resolution varchar(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE specs SET memory = @memory, hard_drive = @hardDrive, graphic_card = @graphicCard, resolution = @resolution WHERE laptop_id = @laptopId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStudentLoanStatus]    Script Date: 4/4/2022 9:38:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SP_UpdateStudentLoanStatus]
	-- Add the parameters for the stored procedure here
	@id varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE students SET loan_status = ~loan_status WHERE id = @id
END
GO
USE [master]
GO
ALTER DATABASE [laptop_management] SET  READ_WRITE 
GO
