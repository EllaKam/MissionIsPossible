USE [master]
GO
/****** Object:  Database [AlignDB]    Script Date: 1/16/2021 5:35:14 PM ******/
CREATE DATABASE [AlignDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlignDB', FILENAME = N'C:\Temp\AlignDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlignDB_log', FILENAME = N'C:\Temp\AlignDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlignDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlignDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlignDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlignDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlignDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlignDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlignDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlignDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlignDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlignDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlignDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlignDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlignDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlignDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlignDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlignDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlignDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlignDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlignDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlignDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlignDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlignDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlignDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlignDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlignDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AlignDB] SET  MULTI_USER 
GO
ALTER DATABASE [AlignDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlignDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlignDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlignDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlignDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlignDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AlignDB] SET QUERY_STORE = OFF
GO
USE [AlignDB]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 1/16/2021 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[CodeName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 1/16/2021 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missions]    Script Date: 1/16/2021 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[MissionId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
 CONSTRAINT [PK_Missions] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CodeName]    Script Date: 1/16/2021 5:35:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CodeName] ON [dbo].[Agents]
(
	[CodeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CountryName]    Script Date: 1/16/2021 5:35:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CountryName] ON [dbo].[Countries]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Missions]    Script Date: 1/16/2021 5:35:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Missions] ON [dbo].[Missions]
(
	[CountryId] ASC,
	[AgentId] ASC,
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Missions] ADD  CONSTRAINT [DF_Missions_DateStart]  DEFAULT (getdate()) FOR [DateStart]
GO
ALTER TABLE [dbo].[Missions]  WITH CHECK ADD  CONSTRAINT [FK_Missions_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([AgentId])
GO
ALTER TABLE [dbo].[Missions] CHECK CONSTRAINT [FK_Missions_Agents]
GO
ALTER TABLE [dbo].[Missions]  WITH CHECK ADD  CONSTRAINT [FK_Missions_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Missions] CHECK CONSTRAINT [FK_Missions_Countries]
GO
/****** Object:  StoredProcedure [dbo].[CreateMission]    Script Date: 1/16/2021 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ella Kamenetsky
-- Create date: 15 Jan 2021 
-- Description:	Create New Mission
-- =============================================
CREATE PROCEDURE [dbo].[CreateMission]
-- DECLARE
	   @CodeName varchar(10)
	 , @CountryName varchar(100)
	 , @Address varchar(500)
	 , @DateStart datetime
	 , @Latitude float
	 , @Longitude float
AS
BEGIN
	SET NOCOUNT ON;
	-- FOR DEBUG
	--SET   @CodeName= 'OO5'
	--SET @CountryName = 'Russia'
	--SET @Address ='mama mila ramu'
	--SET @DateStart = getdate()
	--SET @Latitude = 1
	--SET @Longitude =1

	DECLARE @AgentId int
	DECLARE @CountryId int
	-- Insert Agent
	INSERT INTO Agents
	(
		CodeName
	)
	SELECT @CodeName
	WHERE NOT EXISTS 
	(
	SELECT  1
	FROM Agents
	WHERE CodeName =@CodeName 
	) 
	
	IF @@ROWCOUNT  = 0
	BEGIN
		SELECT  @AgentId = AgentId
		FROM Agents
		WHERE CodeName =@CodeName 
	END
	ELSE
		SELECT  @AgentId  = SCOPE_IDENTITY()
		
		--Insert Country
		INSERT INTO Countries
		(
			CountryName
		)
		SELECT @CountryName
		WHERE NOT EXISTS 
		(
			SELECT  1
			FROM Countries
			WHERE CountryName =@CountryName 
		) 
	
	IF @@ROWCOUNT  = 0
	BEGIN
		SELECT  @CountryId = CountryId
		FROM Countries
		WHERE  CountryName =@CountryName 
	END
	ELSE
		SELECT  @CountryId  = SCOPE_IDENTITY()
	--Mission
	INSERT INTO Missions
	(
		  AgentId
		 , CountryId
		 , Address
		 , DateStart
		 , Latitude
		 , Longitude
	)
	SELECT @AgentId
		, @CountryId
		, @Address
		, @DateStart
		, @Latitude 
		, @Longitude 
		WHERE NOT EXISTS 
		(
		SELECT 1
		FROM Missions
		WHERE  AgentId = @AgentId
		 AND CountryId =@CountryId
		 AND Address= @Address
		)
		IF @@ROWCOUNT  = 0
		BEGIN 
		UPDATE Missions
		 SET DateStart = @DateStart
	  , Latitude = @Latitude 
	  , Longitude = @Longitude 
		WHERE  AgentId = @AgentId
		 AND CountryId =@CountryId
		 AND Address= @Address
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountryByIsolation]    Script Date: 1/16/2021 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ella Kamenetsky
-- Create date: 15 Jan 2021 
-- Description:	Get most isolated country 
-- =============================================
CREATE PROCEDURE [dbo].[GetCountryByIsolation]
	
AS
BEGIN
	SET NOCOUNT ON;

	
SELECT  TOP 1  cnt.CountryName
			 , COUNT(agnt.CountryId) OVER( PARTITION BY agnt.CountryId) IsolationCount
FROM (
	SELECT CountryId
		  , COUNT(AgentId) OVER (PARTITION BY AgentId) m
	FROM Missions
	) agnt  
	JOIN Countries cnt  ON agnt.CountryId = cnt.CountryId 
WHERE agnt.m = 1
ORDER BY IsolationCount DESC

END
GO
/****** Object:  StoredProcedure [dbo].[GetCountryByIsolationAggrigate]    Script Date: 1/16/2021 5:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ella Kamenetsky
-- Create date: 15 Jan 2021 
-- Description:	Get most isolated country with aggrigate sql methods
-- =============================================
CREATE PROCEDURE [dbo].[GetCountryByIsolationAggrigate]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1 cnt.CountryName 
				, IsolationCount
	FROM (
		SELECT CountryId 
		,COUNT(CountryId)  IsolationCount
		FROM(
				SELECT  AgentId
						, MAX(CountryId) CountryID
				FROM Missions
				GROUP BY   AgentId
				HAVING COUNT(MissionId) = 1
			) agnt
		GROUP BY CountryId
		) cntMax  
		JOIN Countries cnt ON cntMax.CountryID = cnt.CountryId 
END
GO
USE [master]
GO
ALTER DATABASE [AlignDB] SET  READ_WRITE 
GO
