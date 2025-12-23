-- =============================================
-- Database: SkinCare
-- =============================================

USE [SkinCare]
GO

-- =============================================
-- Table: SkinProblems
-- =============================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SkinProblems] (
    [ProblemID] INT NOT NULL,
    [ProblemName] VARCHAR(50) NULL,
    [HomeRemedy] VARCHAR(MAX) NULL,
    [Readymade] NVARCHAR(MAX) NULL,
    CONSTRAINT [PK_SkinProblems] PRIMARY KEY CLUSTERED
    (
        [ProblemID] ASC
    )
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
