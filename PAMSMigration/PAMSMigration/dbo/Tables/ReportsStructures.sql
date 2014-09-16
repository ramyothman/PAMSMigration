CREATE TABLE [dbo].[ReportsStructures] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [ReportName]  NVARCHAR (100)  NOT NULL,
    [ItemName]    NVARCHAR (50)   NOT NULL,
    [Path]        NVARCHAR (3000) NOT NULL,
    [Structure]   NTEXT           NULL,
    [DisplayName] NVARCHAR (100)  NULL,
    [BranchID]    INT             NULL,
    [IsGeneral]   BIT             NULL,
    CONSTRAINT [PK_ReportsStructures] PRIMARY KEY CLUSTERED ([ID] ASC)
);

