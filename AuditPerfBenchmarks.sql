CREATE SCHEMA [History]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track_Triggers](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL,
	[Age]  AS (DATEDIFF(year,[Birthday],GETDATE())),
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[LastUpdatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]

GO


-- This is how it looks in source and would be executed in target

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track_Proc](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL,
	[Age]  AS (DATEDIFF(year,[Birthday],GETDATE())),
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[LastUpdatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO


-- This is how it looks in source and would be executed in target

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[Track_Triggers](
	[HistID] [bigint] IDENTITY(1,1) NOT NULL,
	[LastUpdatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PersonID] [int] NOT NULL,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL
) ON [PRIMARY]

GO


-- This is how it looks in source and would be executed in target

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[Track_Proc](
	[PersonID] [int] NOT NULL,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL,
	[LastUpdatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[RowExpiryDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]

GO


-- This is how it looks in source and would be executed in target

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track_Temporal](
	[PersonID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Birthday] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[Age]  AS (DATEDIFF(year,[Birthday],GETDATE())),
	[LastUpdatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastUpdatedDate] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[RowExpiryDate] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([LastUpdatedDate], [RowExpiryDate])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[MSSQL_TemporalHistoryFor_825822054_FE6517D8] )
)

GO


-- This is how it looks in source and would be executed in target

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track_ProcNoAudit](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL,
	[Age]  AS (DATEDIFF(year,[Birthday],GETDATE()))
) ON [PRIMARY]

GO


-- This is how it looks in source and would be executed in target

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[Track_ProcNoAudit](
	[PersonID] [int] NOT NULL,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL,
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[RowExpiryDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]

GO


-- This is how it looks in source and would be executed in target
/****** Object:  Index [PK__Track_Tr__AA2FFB85F3C773BE]    Script Date: 8/18/2018 10:36:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Track_Triggers]') AND NAME = N'PK__Track_Tr__AA2FFB85F3C773BE')
ALTER TABLE [dbo].[Track_Triggers] ADD  CONSTRAINT [PK__Track_Tr__AA2FFB85F3C773BE] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



-- This is how it looks in source and would be executed in target
/****** Object:  Index [PK__Track_Pr__AA2FFB852C731762]    Script Date: 8/18/2018 10:36:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Track_Proc]') AND NAME = N'PK__Track_Pr__AA2FFB852C731762')
ALTER TABLE [dbo].[Track_Proc] ADD  CONSTRAINT [PK__Track_Pr__AA2FFB852C731762] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



-- This is how it looks in source and would be executed in target
/****** Object:  Index [PK_Track_Triggers_History]    Script Date: 8/18/2018 10:36:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID(N'[History].[Track_Triggers]') AND NAME = N'PK_Track_Triggers_History')
ALTER TABLE [History].[Track_Triggers] ADD  CONSTRAINT [PK_Track_Triggers_History] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[LastUpdatedDate] ASC,
	[HistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



-- This is how it looks in source and would be executed in target
/****** Object:  Index [PK__Track_Pr__AA2FFB854FE70073]    Script Date: 8/18/2018 10:36:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Track_ProcNoAudit]') AND NAME = N'PK__Track_Pr__AA2FFB854FE70073')
ALTER TABLE [dbo].[Track_ProcNoAudit] ADD  CONSTRAINT [PK__Track_Pr__AA2FFB854FE70073] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_Proc_FullName_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_Proc_FullName_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[FullName] AS [FullNameBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[FullName] ELSE NULL END) AS [FullNameAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[LastUpdatedBy] ELSE NULL END) AS [LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
	JOIN [History].[Track_Proc] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_Proc] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[FullName] <> h2.[FullName])
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [FullNameBefore]
	, h1.[FullName] AS [FullNameAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
	, h1.[LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_Proc] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_Proc_Username_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_Proc_Username_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[Username] AS [UsernameBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[Username] ELSE NULL END) AS [UsernameAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[LastUpdatedBy] ELSE NULL END) AS [LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
	JOIN [History].[Track_Proc] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_Proc] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[Username] <> h2.[Username])
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [UsernameBefore]
	, h1.[Username] AS [UsernameAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
	, h1.[LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_Proc] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_Proc_IsActive_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_Proc_IsActive_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[IsActive] AS [IsActiveBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[IsActive] ELSE NULL END) AS [IsActiveAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[LastUpdatedBy] ELSE NULL END) AS [LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
	JOIN [History].[Track_Proc] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_Proc] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[IsActive] <> h2.[IsActive])
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [IsActiveBefore]
	, h1.[IsActive] AS [IsActiveAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
	, h1.[LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_Proc] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_Proc_Birthday_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_Proc_Birthday_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[Birthday] AS [BirthdayBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[Birthday] ELSE NULL END) AS [BirthdayAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[LastUpdatedBy] ELSE NULL END) AS [LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
	JOIN [History].[Track_Proc] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_Proc] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[Birthday] <> h2.[Birthday] OR (h1.[Birthday] IS NULL AND h2.[Birthday] IS NOT NULL) OR (h1.[Birthday] IS NOT NULL AND h2.[Birthday] IS NULL))
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [BirthdayBefore]
	, h1.[Birthday] AS [BirthdayAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
	, h1.[LastUpdatedBy]
FROM
	[History].[Track_Proc] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_Proc] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_Proc] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_ProcNoAudit_FullName_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_ProcNoAudit_FullName_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[FullName] AS [FullNameBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[FullName] ELSE NULL END) AS [FullNameAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
	JOIN [History].[Track_ProcNoAudit] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_ProcNoAudit] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[FullName] <> h2.[FullName])
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [FullNameBefore]
	, h1.[FullName] AS [FullNameAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_ProcNoAudit] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_ProcNoAudit_Username_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_ProcNoAudit_Username_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[Username] AS [UsernameBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[Username] ELSE NULL END) AS [UsernameAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
	JOIN [History].[Track_ProcNoAudit] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_ProcNoAudit] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[Username] <> h2.[Username])
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [UsernameBefore]
	, h1.[Username] AS [UsernameAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_ProcNoAudit] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_ProcNoAudit_IsActive_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_ProcNoAudit_IsActive_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[IsActive] AS [IsActiveBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[IsActive] ELSE NULL END) AS [IsActiveAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
	JOIN [History].[Track_ProcNoAudit] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_ProcNoAudit] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[IsActive] <> h2.[IsActive])
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [IsActiveBefore]
	, h1.[IsActive] AS [IsActiveAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_ProcNoAudit] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [History].[uv_Track_ProcNoAudit_Birthday_Changes]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [History].[uv_Track_ProcNoAudit_Birthday_Changes]
AS
-- Updates and deletes
SELECT
	h1.[PersonID]
	, h1.[Birthday] AS [BirthdayBefore]
	, (CASE WHEN h2.[IsDeleted] = 0 THEN h2.[Birthday] ELSE NULL END) AS [BirthdayAfter]
	, h2.[IsDeleted]
	, h2.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
	JOIN [History].[Track_ProcNoAudit] h2
		ON (h1.[PersonID] = h2.[PersonID])
		AND h2.[LastUpdatedDate] =
			(SELECT MIN(h3.[LastUpdatedDate])
			FROM [History].[Track_ProcNoAudit] h3
			WHERE (h1.[PersonID] = h3.[PersonID])
			AND h3.[LastUpdatedDate] > h1.[LastUpdatedDate])
WHERE
	h1.[IsDeleted] = 0
AND	((h1.[Birthday] <> h2.[Birthday] OR (h1.[Birthday] IS NULL AND h2.[Birthday] IS NOT NULL) OR (h1.[Birthday] IS NOT NULL AND h2.[Birthday] IS NULL))
OR	h2.[IsDeleted] = 1)
UNION ALL
-- Insertions
SELECT
	h1.[PersonID]
	, NULL AS [BirthdayBefore]
	, h1.[Birthday] AS [BirthdayAfter]
	, h1.[IsDeleted]
	, h1.[LastUpdatedDate]
FROM
	[History].[Track_ProcNoAudit] h1
WHERE
	h1.[IsDeleted] = 0
AND	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_ProcNoAudit] h2
	WHERE (h1.[PersonID] = h2.[PersonID])
	AND h2.[IsDeleted] = 0
	AND h2.[LastUpdatedDate] =
		(SELECT MAX(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID])
		AND h3.[LastUpdatedDate] < h1.[LastUpdatedDate]))
	AND h1.[LastUpdatedDate] <>
		(SELECT MIN(h3.[LastUpdatedDate])
		FROM [History].[Track_ProcNoAudit] h3
		WHERE (h1.[PersonID] = h3.[PersonID]))
GO


-- This is how it looks in source and would be executed in target
/****** Object:  View [dbo].[Track_Triggers_History]    Script Date: 8/18/2018 10:36:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Track_Triggers_History]
AS

WITH cte AS (
SELECT PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted
FROM [dbo].[Track_Triggers]
UNION ALL
SELECT PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted
FROM [History].[Track_Triggers]
)

SELECT
	PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted
	, ISNULL((SELECT TOP 1 b.LastUpdatedDate
		FROM cte b
		WHERE a.[PersonID] = b.[PersonID]
		AND b.LastUpdatedDate > a.LastUpdatedDate
		ORDER BY b.LastUpdatedDate), '12/31/9999') AS RowExpiryDate
FROM
	cte a
GO


-- This is how it looks in source and would be executed in target

/****** Object:  Index [NDX_Track_TriggersHistory_LastUpdatedDate]    Script Date: 8/18/2018 10:36:25 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_Triggers]') AND c.[name] IN ('LastUpdatedDate'))>=1 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='NDX_Track_TriggersHistory_LastUpdatedDate' AND i.[object_id]=OBJECT_ID(N'[History].[Track_Triggers]'))
CREATE NONCLUSTERED INDEX [NDX_Track_TriggersHistory_LastUpdatedDate] ON [History].[Track_Triggers]
(
	[LastUpdatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target

/****** Object:  Index [IDX_Track_ProcHistory_NK]    Script Date: 8/18/2018 10:36:25 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_Proc]') AND c.[name] IN ('PersonID','RowExpiryDate'))>=2 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='IDX_Track_ProcHistory_NK' AND i.[object_id]=OBJECT_ID(N'[History].[Track_Proc]'))
CREATE UNIQUE CLUSTERED INDEX [IDX_Track_ProcHistory_NK] ON [History].[Track_Proc]
(
	[PersonID] ASC,
	[RowExpiryDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target

/****** Object:  Index [IDX_Track_ProcHistory_RowExp]    Script Date: 8/18/2018 10:36:25 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_Proc]') AND c.[name] IN ('RowExpiryDate','IsDeleted','PersonID'))>=3 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='IDX_Track_ProcHistory_RowExp' AND i.[object_id]=OBJECT_ID(N'[History].[Track_Proc]'))
CREATE NONCLUSTERED INDEX [IDX_Track_ProcHistory_RowExp] ON [History].[Track_Proc]
(
	[RowExpiryDate] ASC,
	[IsDeleted] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target

/****** Object:  Index [IDX_Track_ProcHistory_LUD]    Script Date: 8/18/2018 10:36:25 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_Proc]') AND c.[name] IN ('PersonID','LastUpdatedDate'))>=2 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='IDX_Track_ProcHistory_LUD' AND i.[object_id]=OBJECT_ID(N'[History].[Track_Proc]'))
CREATE NONCLUSTERED INDEX [IDX_Track_ProcHistory_LUD] ON [History].[Track_Proc]
(
	[PersonID] ASC,
	[LastUpdatedDate] ASC
)
INCLUDE ( 	[IsDeleted]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target

/****** Object:  Index [IDX_Track_ProcNoAuditHistory_NK]    Script Date: 8/18/2018 10:36:25 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_ProcNoAudit]') AND c.[name] IN ('PersonID','RowExpiryDate'))>=2 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='IDX_Track_ProcNoAuditHistory_NK' AND i.[object_id]=OBJECT_ID(N'[History].[Track_ProcNoAudit]'))
CREATE UNIQUE CLUSTERED INDEX [IDX_Track_ProcNoAuditHistory_NK] ON [History].[Track_ProcNoAudit]
(
	[PersonID] ASC,
	[RowExpiryDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target

/****** Object:  Index [IDX_Track_ProcNoAuditHistory_RowExp]    Script Date: 8/18/2018 10:36:26 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_ProcNoAudit]') AND c.[name] IN ('RowExpiryDate','IsDeleted','PersonID'))>=3 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='IDX_Track_ProcNoAuditHistory_RowExp' AND i.[object_id]=OBJECT_ID(N'[History].[Track_ProcNoAudit]'))
CREATE NONCLUSTERED INDEX [IDX_Track_ProcNoAuditHistory_RowExp] ON [History].[Track_ProcNoAudit]
(
	[RowExpiryDate] ASC,
	[IsDeleted] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target

/****** Object:  Index [IDX_Track_ProcNoAuditHistory_LUD]    Script Date: 8/18/2018 10:36:25 PM ******/
IF (SELECT COUNT(*) FROM sys.objects o JOIN sys.columns c ON o.[object_id]=c.[object_id] WHERE o.[object_id]=OBJECT_ID(N'[History].[Track_ProcNoAudit]') AND c.[name] IN ('PersonID','LastUpdatedDate'))>=2 AND NOT EXISTS (SELECT 0 FROM sys.indexes i WHERE i.NAME='IDX_Track_ProcNoAuditHistory_LUD' AND i.[object_id]=OBJECT_ID(N'[History].[Track_ProcNoAudit]'))
CREATE NONCLUSTERED INDEX [IDX_Track_ProcNoAuditHistory_LUD] ON [History].[Track_ProcNoAudit]
(
	[PersonID] ASC,
	[LastUpdatedDate] ASC
)
INCLUDE ( 	[IsDeleted]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- This is how it looks in source and would be executed in target
/****** Object:  Trigger [dbo].[tg_Track_Triggers_u]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  TRIGGER tg_Track_Triggers_u ON [dbo].[Track_Triggers] 
AFTER UPDATE 
AS
BEGIN
/*
<UDP><Name>SystemGenerated</Name><Value>True</Value></UDP>
*/
SET NOCOUNT ON;

INSERT [History].[Track_Triggers]
	(PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted)
SELECT
	PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted
FROM
	deleted d;

DELETE t
FROM
	[dbo].[Track_Triggers] t
	JOIN inserted i
		ON t.[PersonID] = i.[PersonID]
		AND i.IsDeleted = 1;

END
GO

ALTER TABLE [dbo].[Track_Triggers] ENABLE TRIGGER [tg_Track_Triggers_u]
GO


-- This is how it looks in source and would be executed in target
/****** Object:  Trigger [dbo].[tg_Track_Triggers_d]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  TRIGGER tg_Track_Triggers_d ON [dbo].[Track_Triggers] 
FOR DELETE
AS
BEGIN
/*
<UDP><Name>SystemGenerated</Name><Value>True</Value></UDP>
*/
SET NOCOUNT ON;

INSERT [History].[Track_Triggers]
	(PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted)
SELECT
	PersonID
	, FullName
	, Username
	, IsActive
	, Birthday, LastUpdatedBy, LastUpdatedDate, IsDeleted
FROM
	deleted d
WHERE
	IsDeleted = 1;

IF @@ROWCOUNT = 0
  IF EXISTS (SELECT 0 FROM deleted)
    RAISERROR('You cannot perform a physical delete on Track_Triggers.', 16, 1);

END
GO

ALTER TABLE [dbo].[Track_Triggers] ENABLE TRIGGER [tg_Track_Triggers_d]
GO


-- This is how it looks in source and would be executed in target

IF NOT EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.default_object_id=o.[object_id] JOIN sys.objects p ON o.parent_object_id=p.[object_id] WHERE p.[object_id]=OBJECT_ID('[dbo].[Track_Triggers]') AND c.[name]='IsActive') AND EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.[object_id]=o.[object_id] AND c.[name]='IsActive' AND o.[object_id]=OBJECT_ID('[dbo].[Track_Triggers]'))
	ALTER TABLE [dbo].[Track_Triggers] ADD CONSTRAINT [DF__Track_Tri__IsAct__0EE3F362] DEFAULT ((1)) FOR [IsActive]
GO

-- This is how it looks in source and would be executed in target

IF NOT EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.default_object_id=o.[object_id] JOIN sys.objects p ON o.parent_object_id=p.[object_id] WHERE p.[object_id]=OBJECT_ID('[dbo].[Track_Triggers]') AND c.[name]='LastUpdatedDate') AND EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.[object_id]=o.[object_id] AND c.[name]='LastUpdatedDate' AND o.[object_id]=OBJECT_ID('[dbo].[Track_Triggers]'))
	ALTER TABLE [dbo].[Track_Triggers] ADD CONSTRAINT [DF__Track_Tri__LastU__0FD8179B] DEFAULT (SYSDATETIME()) FOR [LastUpdatedDate]
GO

-- This is how it looks in source and would be executed in target

IF NOT EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.default_object_id=o.[object_id] JOIN sys.objects p ON o.parent_object_id=p.[object_id] WHERE p.[object_id]=OBJECT_ID('[dbo].[Track_Proc]') AND c.[name]='IsActive') AND EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.[object_id]=o.[object_id] AND c.[name]='IsActive' AND o.[object_id]=OBJECT_ID('[dbo].[Track_Proc]'))
	ALTER TABLE [dbo].[Track_Proc] ADD CONSTRAINT [DF__Track_Pro__IsAct__12B48446] DEFAULT ((1)) FOR [IsActive]
GO

-- This is how it looks in source and would be executed in target

IF NOT EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.default_object_id=o.[object_id] JOIN sys.objects p ON o.parent_object_id=p.[object_id] WHERE p.[object_id]=OBJECT_ID('[dbo].[Track_Proc]') AND c.[name]='LastUpdatedDate') AND EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.[object_id]=o.[object_id] AND c.[name]='LastUpdatedDate' AND o.[object_id]=OBJECT_ID('[dbo].[Track_Proc]'))
	ALTER TABLE [dbo].[Track_Proc] ADD CONSTRAINT [DF__Track_Pro__LastU__13A8A87F] DEFAULT (SYSDATETIME()) FOR [LastUpdatedDate]
GO

-- This is how it looks in source and would be executed in target

IF NOT EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.default_object_id=o.[object_id] JOIN sys.objects p ON o.parent_object_id=p.[object_id] WHERE p.[object_id]=OBJECT_ID('[dbo].[Track_Triggers]') AND c.[name]='IsDeleted') AND EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.[object_id]=o.[object_id] AND c.[name]='IsDeleted' AND o.[object_id]=OBJECT_ID('[dbo].[Track_Triggers]'))
	ALTER TABLE [dbo].[Track_Triggers] ADD CONSTRAINT [DF__Track_Tri__IsDel__186D5D9C] DEFAULT ((0)) FOR [IsDeleted]
GO

-- This is how it looks in source and would be executed in target

IF NOT EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.default_object_id=o.[object_id] JOIN sys.objects p ON o.parent_object_id=p.[object_id] WHERE p.[object_id]=OBJECT_ID('[dbo].[Track_Temporal]') AND c.[name]='IsActive') AND EXISTS (SELECT 0 FROM sys.columns c JOIN sys.objects o ON c.[object_id]=o.[object_id] AND c.[name]='IsActive' AND o.[object_id]=OBJECT_ID('[dbo].[Track_Temporal]'))
	ALTER TABLE [dbo].[Track_Temporal] ADD CONSTRAINT [DF__Track_Tem__IsAct__332153D8] DEFAULT ((1)) FOR [IsActive]
GO

-- This is how it looks in source and would be executed in target
/****** Object:  StoredProcedure [History].[up_Track_Temporal_Benchmark]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE History.up_Track_Temporal_Benchmark
AS
BEGIN
SET NOCOUNT ON;

ALTER TABLE [dbo].[Track_Temporal] SET (SYSTEM_VERSIONING = OFF);

TRUNCATE TABLE [dbo].[Track_Temporal];

ALTER TABLE [dbo].[Track_Temporal] SET (SYSTEM_VERSIONING = ON);

DECLARE @start datetime2;
DECLARE @cnt int;
SET @cnt = 1;

WHILE @cnt <= 100000
BEGIN
	INSERT [dbo].[Track_Temporal] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt)
		, 'U' + STR(@cnt)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 20000
BEGIN
	INSERT [dbo].[Track_Temporal] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt + 100000)
		, 'U' + STR(@cnt + 100000)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

PRINT 'Temporal-based insert: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 6000
BEGIN
	UPDATE t
	SET
		IsActive = 0, LastUpdatedBy = 'updater'
	FROM dbo.Track_Temporal t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

WHILE @cnt <= 12000
BEGIN
	UPDATE t
	SET
		Birthday = DATEADD(yyyy, 1, Birthday), LastUpdatedBy = 'updater'
	FROM dbo.Track_Temporal t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Temporal-based update: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 12000
BEGIN
	DELETE t
	FROM dbo.Track_Temporal t
	WHERE t.PersonID = @cnt + 104000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Temporal-based delete: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

DECLARE @result bigint;
SET @start = SYSDATETIME();
SET @cnt = 1
SET @result = 0;

WHILE @cnt <= 20
BEGIN
	SELECT @result = @result + SUM(h1.PersonID)
	FROM dbo.Track_Temporal FOR SYSTEM_TIME ALL h1
		JOIN dbo.Track_Temporal FOR SYSTEM_TIME ALL h2
			ON h1.PersonID = h2.PersonID
	WHERE h2.LastUpdatedDate =
		(SELECT MIN(h3.LastUpdatedDate)
		FROM dbo.Track_Temporal FOR SYSTEM_TIME ALL h3
		WHERE h3.PersonID = h1.PersonID
		AND h3.LastUpdatedDate > h1.LastUpdatedDate)
	AND h2.Birthday <> h1.Birthday;
	
	SET @cnt = @cnt + 1;
END

IF @result <> 13080060000
	RAISERROR('Assert failed: incorrect query data.', 16, 1);

PRINT 'Counting birthdate changes: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

END
GO


-- This is how it looks in source and would be executed in target
/****** Object:  StoredProcedure [History].[up_Track_Proc_Load]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [History].[up_Track_Proc_Load]
AS
BEGIN

DECLARE @exp datetime2;
SET @exp = SYSDATETIME();

-- Expire old records
-- When have a source mod date field, rely on it to provide date ranges
UPDATE h
SET RowExpiryDate = ISNULL(c.[LastUpdatedDate], @exp)
FROM
	[History].[Track_Proc] h
	LEFT OUTER JOIN [dbo].[Track_Proc] c
		ON h.[PersonID] = c.[PersonID]
WHERE
	h.RowExpiryDate = '1/1/3000'
AND	((h.IsDeleted = 1 AND c.[PersonID] IS NOT NULL) OR (h.IsDeleted = 0 AND c.[PersonID] IS NULL) OR
	-- Trust the change in modified date from the source!
	(h.IsDeleted = 0 AND ISNULL(c.[LastUpdatedDate], @exp) <> h.[LastUpdatedDate]));


PRINT 'Expired ' + STR(@@rowcount);

-- Insert new/changed records
INSERT [History].[Track_Proc] (
	[PersonID]
	, [FullName]
	, [Username]
	, [IsActive]
	, [Birthday]
	, [LastUpdatedBy]
	, [LastUpdatedDate]
	, [RowExpiryDate]
	, [IsDeleted] )
SELECT
	c.[PersonID]
	, c.[FullName]
	, c.[Username]
	, c.[IsActive]
	, c.[Birthday]
	, c.[LastUpdatedBy]
	, c.[LastUpdatedDate]
	, '1/1/3000'
	, 0
FROM
	[dbo].[Track_Proc] c
WHERE
	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_Proc] h
	WHERE h.[PersonID] = c.[PersonID]
	AND h.[IsDeleted] = 0
	AND h.[LastUpdatedDate] = c.[LastUpdatedDate]);

PRINT 'Insert/update ' + STR(@@rowcount);

-- Identify deleted records
INSERT [History].[Track_Proc]
	(
	[PersonID]
	, [FullName]
	, [Username]
	, [IsActive]
	, [Birthday]
	, [LastUpdatedBy]
	, [IsDeleted]
	, [LastUpdatedDate]
	, [RowExpiryDate])
SELECT
	h.[PersonID]
	, h.[FullName]
	, h.[Username]
	, h.[IsActive]
	, h.[Birthday]
	, h.[LastUpdatedBy]
	, 1
	, @exp
	, '1/1/3000'	
FROM
	[History].[Track_Proc] h
WHERE
	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_Proc] c
	WHERE h.[PersonID] = c.[PersonID]
	AND c.[IsDeleted] = 1
	AND c.[RowExpiryDate] = '1/1/3000')
AND	NOT EXISTS
	(SELECT 0
	FROM [dbo].[Track_Proc] c
	WHERE h.[PersonID] = c.[PersonID])
AND	h.[LastUpdatedDate] =
	(SELECT MAX(h2.[LastUpdatedDate])
	FROM [History].[Track_Proc] h2
	WHERE h.[PersonID] = h2.[PersonID]
	AND h2.IsDeleted = 0);

PRINT 'Deleted ' + STR(@@rowcount);

END
GO


-- This is how it looks in source and would be executed in target
/****** Object:  StoredProcedure [History].[up_Track_ProcNoAudit_Load]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [History].[up_Track_ProcNoAudit_Load]
AS
BEGIN

DECLARE @exp datetime2;
SET @exp = SYSDATETIME();

-- Expire old records
-- When do not have a source mod date, need to rely on current datetime to provide date ranges
UPDATE h
SET RowExpiryDate = @exp
FROM
	[History].[Track_ProcNoAudit] h
	LEFT OUTER JOIN [dbo].[Track_ProcNoAudit] c
		ON h.[PersonID] = c.[PersonID]
WHERE
	h.RowExpiryDate = '1/1/3000'
AND	((h.IsDeleted = 1 AND c.[PersonID] IS NOT NULL) OR (h.IsDeleted = 0 AND c.[PersonID] IS NULL) OR
	-- Must detect a material change in underlying data, other than key columns
	(h.IsDeleted = 0 AND NOT (h.[FullName] = c.[FullName]
		AND h.[Username] = c.[Username]
		AND h.[IsActive] = c.[IsActive]
		AND (h.[Birthday] = c.[Birthday] OR (h.[Birthday] IS NULL AND c.[Birthday] IS NULL))
)));

PRINT 'Expired ' + STR(@@rowcount);

-- Insert new/changed records
INSERT [History].[Track_ProcNoAudit] (
	[PersonID]
	, [FullName]
	, [Username]
	, [IsActive]
	, [Birthday]
	, [LastUpdatedDate]
	, [RowExpiryDate]
	, [IsDeleted] )
SELECT
	c.[PersonID]
	, c.[FullName]
	, c.[Username]
	, c.[IsActive]
	, c.[Birthday]
	, @exp
	, '1/1/3000'
	, 0
FROM
	[dbo].[Track_ProcNoAudit] c
WHERE
	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_ProcNoAudit] h
	WHERE h.[PersonID] = c.[PersonID]
		AND h.[FullName] = c.[FullName]
		AND h.[Username] = c.[Username]
		AND h.[IsActive] = c.[IsActive]
		AND (h.[Birthday] = c.[Birthday] OR (h.[Birthday] IS NULL AND c.[Birthday] IS NULL))
	AND h.[RowExpiryDate] IN ('1/1/3000', @exp)
	AND h.[IsDeleted] = 0);

PRINT 'Insert/update ' + STR(@@rowcount);

-- Identify deleted records
INSERT [History].[Track_ProcNoAudit]
	(
	[PersonID]
	, [FullName]
	, [Username]
	, [IsActive]
	, [Birthday]
	, [IsDeleted]
	, [LastUpdatedDate]
	, [RowExpiryDate])
SELECT
	h.[PersonID]
	, h.[FullName]
	, h.[Username]
	, h.[IsActive]
	, h.[Birthday]
	, 1
	, @exp
	, '1/1/3000'	
FROM
	[History].[Track_ProcNoAudit] h
WHERE
	NOT EXISTS
	(SELECT 0
	FROM [History].[Track_ProcNoAudit] c
	WHERE h.[PersonID] = c.[PersonID]
	AND c.[IsDeleted] = 1
	AND c.[RowExpiryDate] = '1/1/3000')
AND	NOT EXISTS
	(SELECT 0
	FROM [dbo].[Track_ProcNoAudit] c
	WHERE h.[PersonID] = c.[PersonID])
AND	h.[LastUpdatedDate] =
	(SELECT MAX(h2.[LastUpdatedDate])
	FROM [History].[Track_ProcNoAudit] h2
	WHERE h.[PersonID] = h2.[PersonID]
	AND h2.IsDeleted = 0);

PRINT 'Deleted ' + STR(@@rowcount);

END
GO


-- This is how it looks in source and would be executed in target
/****** Object:  StoredProcedure [History].[up_Track_Triggers_Benchmark]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC History.up_Track_Triggers_Benchmark
AS
BEGIN
SET NOCOUNT ON;

TRUNCATE TABLE [History].[Track_Triggers];
TRUNCATE TABLE [dbo].[Track_Triggers];

DECLARE @start datetime2;
DECLARE @cnt int;
SET @cnt = 1;

WHILE @cnt <= 100000
BEGIN
	INSERT [dbo].[Track_Triggers] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedDate]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt)
		, 'U' + STR(@cnt)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, GETUTCDATE()
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 20000
BEGIN
	INSERT [dbo].[Track_Triggers] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedDate]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt + 100000)
		, 'U' + STR(@cnt + 100000)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, GETUTCDATE()
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

PRINT 'Trigger-based insert: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 6000
BEGIN
	UPDATE t
	SET
		IsActive = 0, LastUpdatedBy = 'updater', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_Triggers t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

WHILE @cnt <= 12000
BEGIN
	UPDATE t
	SET
		Birthday = DATEADD(yyyy, 1, Birthday), LastUpdatedBy = 'updater', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_Triggers t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Trigger-based update: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 12000
BEGIN
	UPDATE t
	SET
		IsDeleted = 1, LastUpdatedBy = 'deleter', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_Triggers t
	WHERE t.PersonID = @cnt + 104000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Trigger-based delete: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

DECLARE @result bigint;
SET @start = SYSDATETIME();
SET @cnt = 1
SET @result = 0;

WHILE @cnt <= 20
BEGIN
	SELECT @result = @result + SUM(h1.PersonID)
	FROM Track_Triggers_History h1
		JOIN Track_Triggers_History h2
			ON h1.PersonID = h2.PersonID
	WHERE h2.LastUpdatedDate =
		(SELECT MIN(h3.LastUpdatedDate)
		FROM Track_Triggers_History h3
		WHERE h3.PersonID = h1.PersonID
		AND h3.LastUpdatedDate > h1.LastUpdatedDate)
	AND h2.IsDeleted = 0
	AND h2.Birthday <> h1.Birthday;
	
	SET @cnt = @cnt + 1;
END

IF @result <> 13080060000
	RAISERROR('Assert failed: incorrect query data.', 16, 1);

PRINT 'Counting birthdate changes: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

END
GO


-- This is how it looks in source and would be executed in target
/****** Object:  StoredProcedure [History].[up_Track_Proc_Benchmark]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE History.up_Track_Proc_Benchmark
AS
BEGIN
SET NOCOUNT ON;

TRUNCATE TABLE [History].[Track_Proc];
TRUNCATE TABLE [dbo].[Track_Proc];

DECLARE @start datetime2;
DECLARE @cnt int;
SET @cnt = 1;

WHILE @cnt <= 100000
BEGIN
	INSERT [dbo].[Track_Proc] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedDate]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt)
		, 'U' + STR(@cnt)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, SYSDATETIME()
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

EXEC History.up_Track_Proc_Load;

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 20000
BEGIN
	INSERT [dbo].[Track_Proc] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedDate]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt + 100000)
		, 'U' + STR(@cnt + 100000)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, SYSDATETIME()
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

PRINT 'Procedure-based insert: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @start = SYSDATETIME();
EXEC History.up_Track_Proc_Load;

PRINT 'Procedure-based load pass 1: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 6000
BEGIN
	UPDATE t
	SET
		IsActive = 0, LastUpdatedBy = 'updater', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_Proc t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

WHILE @cnt <= 12000
BEGIN
	UPDATE t
	SET
		Birthday = DATEADD(yyyy, 1, Birthday), LastUpdatedBy = 'updater', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_Proc t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Procedure-based update: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @start = SYSDATETIME();
EXEC History.up_Track_Proc_Load;

PRINT 'Procedure-based load pass 2: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 12000
BEGIN
	DELETE t
	FROM dbo.Track_Proc t
	WHERE t.PersonID = @cnt + 104000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Procedure-based delete: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @start = SYSDATETIME();
EXEC History.up_Track_Proc_Load;

PRINT 'Procedure-based load pass 3: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

DECLARE @result bigint;
SET @start = SYSDATETIME();
SET @cnt = 1
SET @result = 0;

WHILE @cnt <= 20
BEGIN
	SELECT @result = @result + SUM(b.PersonID)
	FROM History.uv_Track_Proc_Birthday_Changes b
	WHERE b.IsDeleted = 0;

	SET @cnt = @cnt + 1;
END

PRINT @result;

IF @result <> 13080060000
	RAISERROR('Assert failed: incorrect query data.', 16, 1);

PRINT 'Counting birthdate changes: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

END
GO


-- This is how it looks in source and would be executed in target
/****** Object:  StoredProcedure [History].[up_Track_ProcNoAudit_Benchmark]    Script Date: 8/18/2018 10:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE History.up_Track_ProcNoAudit_Benchmark
AS
BEGIN
SET NOCOUNT ON;

TRUNCATE TABLE [History].[Track_ProcNoAudit];
TRUNCATE TABLE [dbo].[Track_ProcNoAudit];

DECLARE @start datetime2;
DECLARE @cnt int;
SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 20000
BEGIN
	INSERT [dbo].[Track_ProcNoAudit] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday] )
	VALUES (
		'P' + STR(@cnt)
		, 'U' + STR(@cnt)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960'))

	SET @cnt = @cnt + 1;	
END

PRINT 'Procedure (no audit)-based insert: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @start = SYSDATETIME();
EXEC History.up_Track_ProcNoAudit_Load;

PRINT 'Procedure (no audit)-based load pass 1: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 6000
BEGIN
	UPDATE t
	SET
		IsActive = 0
	FROM dbo.Track_ProcNoAudit t
	WHERE t.PersonID = @cnt;

	SET @cnt = @cnt + 1;	
END

WHILE @cnt <= 12000
BEGIN
	UPDATE t
	SET
		Birthday = DATEADD(yyyy, 1, Birthday)
	FROM dbo.Track_ProcNoAudit t
	WHERE t.PersonID = @cnt;

	SET @cnt = @cnt + 1;	
END

PRINT 'Procedure (no audit)-based update: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @start = SYSDATETIME();
EXEC History.up_Track_ProcNoAudit_Load;

PRINT 'Procedure (no audit)-based load pass 2: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 12000
BEGIN
	DELETE t
	FROM dbo.Track_ProcNoAudit t
	WHERE t.PersonID = @cnt + 4000;

	SET @cnt = @cnt + 1;	
END

PRINT 'Procedure (no audit)-based delete: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @start = SYSDATETIME();
EXEC History.up_Track_ProcNoAudit_Load;

PRINT 'Procedure (no audit)-based load pass 3: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

DECLARE @result bigint;
SET @start = SYSDATETIME();
SET @cnt = 1
SET @result = 0;

WHILE @cnt <= 20
BEGIN
	SELECT @result = @result + SUM(b.PersonID)
	FROM History.uv_Track_ProcNoAudit_Birthday_Changes b
	WHERE b.IsDeleted = 0;
	
	SET @cnt = @cnt + 1;
END

IF @result <> 1080060000
	RAISERROR('Assert failed: incorrect query data.', 16, 1);

PRINT 'Counting birthdate changes: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

END
GO

EXEC History.up_Track_Proc_Benchmark;
GO
EXEC History.up_Track_ProcNoAudit_Benchmark;
GO
EXEC History.up_Track_Triggers_Benchmark;
GO
EXEC History.up_Track_Temporal_Benchmark;
GO

EXECUTE sys.sp_cdc_enable_db;
go

IF OBJECT_ID('[dbo].[Track_CDC]') IS NOT NULL
	DROP TABLE [dbo].[Track_CDC]
GO

CREATE TABLE [dbo].[Track_CDC](
	[PersonID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Birthday] [date] NULL,
	[Age]  AS (DATEDIFF(year,[Birthday],GETDATE())),
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[LastUpdatedBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO

EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'Track_CDC',
@role_name     = NULL,
@supports_net_changes = 1
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('History.up_Track_CDC_Benchmark') IS NOT NULL
	DROP PROC History.up_Track_CDC_Benchmark
GO

CREATE PROC History.up_Track_CDC_Benchmark
AS
BEGIN
SET NOCOUNT ON;

DECLARE @start datetime2;
DECLARE @cnt int;
SET @cnt = 1;

WHILE @cnt <= 100000
BEGIN
	INSERT [dbo].[Track_CDC] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedDate]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt)
		, 'U' + STR(@cnt)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, GETUTCDATE()
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 20000
BEGIN
	INSERT [dbo].[Track_CDC] (
		[FullName]
		, [Username]
		, [IsActive]
		, [Birthday]
		, [LastUpdatedDate]
		, [LastUpdatedBy] )
	VALUES (
		'P' + STR(@cnt + 100000)
		, 'U' + STR(@cnt + 100000)
		, 1
		, DATEADD(dd, (@cnt % 2000), '1/1/1960')
		, GETUTCDATE()
		, 'inserter' )

	SET @cnt = @cnt + 1;	
END

PRINT 'CDC insert: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 6000
BEGIN
	UPDATE t
	SET
		IsActive = 0, LastUpdatedBy = 'updater', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_CDC t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

WHILE @cnt <= 12000
BEGIN
	UPDATE t
	SET
		Birthday = DATEADD(yyyy, 1, Birthday), LastUpdatedBy = 'updater', LastUpdatedDate = SYSDATETIME()
	FROM dbo.Track_CDC t
	WHERE t.PersonID = @cnt + 100000;

	SET @cnt = @cnt + 1;	
END

PRINT 'CDC update: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

SET @cnt = 1;
SET @start = SYSDATETIME();

WHILE @cnt <= 12000
BEGIN
	DELETE t
	FROM dbo.Track_CDC t
	WHERE t.PersonID = @cnt + 104000;

	SET @cnt = @cnt + 1;	
END

PRINT 'CDC delete: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

DECLARE @result bigint;
SET @start = SYSDATETIME();
SET @cnt = 1
SET @result = 0;

WHILE @cnt <= 20
BEGIN
	SELECT @result = @result + SUM(h1.PersonID)
	FROM cdc.dbo_track_cdc_ct h1
		JOIN cdc.dbo_track_cdc_ct h2
			ON h1.PersonID = h2.PersonID
	WHERE h2.LastUpdatedDate =
		(SELECT MIN(h3.LastUpdatedDate)
		FROM cdc.dbo_track_cdc_ct h3
		WHERE h3.PersonID = h1.PersonID
		AND h3.LastUpdatedDate > h1.LastUpdatedDate)
	AND h2.__$operation not in (1, 3)
	AND h1.__$operation not in (1, 3)
	AND h2.Birthday <> h1.Birthday;
	
	SET @cnt = @cnt + 1;
END

IF @result <> 13080060000
	RAISERROR('Assert failed: incorrect query data.', 16, 1);

PRINT 'Counting birthdate changes: ' + STR(DATEDIFF(ms, @start, SYSDATETIME()))

END
GO

EXEC History.up_Track_CDC_Benchmark
GO

EXEC sys.sp_cdc_disable_table
@source_schema = N'dbo',
@source_name   = N'Track_CDC',
@capture_instance = 'dbo_Track_CDC'
GO
