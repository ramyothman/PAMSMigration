CREATE TABLE [dbo].[SuppliersTargets] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [SupplierID]   INT             NULL,
    [Year]         INT             NULL,
    [Value]        DECIMAL (18, 2) NULL,
    [UserName]     NVARCHAR (50)   NULL,
    [ModifiedDate] DATETIME        NULL,
    [BranchID]     INT             NULL,
    CONSTRAINT [PK_SuppliersTargets] PRIMARY KEY CLUSTERED ([ID] ASC)
);

