CREATE TABLE [dbo].[DocumentsJobsVersionsYearlyHistory] (
    [ID]           INT             NOT NULL,
    [DocID]        INT             NULL,
    [FileName]     NVARCHAR (100)  NULL,
    [DocumentData] VARBINARY (MAX) NULL,
    [VersionNo]    INT             NULL,
    [UserName]     NVARCHAR (100)  NULL,
    [ModifiedDate] DATETIME        NULL
);

