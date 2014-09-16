CREATE TABLE [dbo].[DocumentsJobsVersions] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [DocID]        INT             NULL,
    [FileName]     NVARCHAR (50)   NULL,
    [DocumentData] VARBINARY (MAX) NULL,
    [VersionNo]    INT             NULL,
    [UserName]     NVARCHAR (50)   NULL,
    [ModifiedDate] DATETIME        NULL,
    CONSTRAINT [PK_DocumentsJobsVersions] PRIMARY KEY CLUSTERED ([ID] ASC)
);

