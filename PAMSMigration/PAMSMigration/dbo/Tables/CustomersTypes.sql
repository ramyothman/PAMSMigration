CREATE TABLE [dbo].[CustomersTypes] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [CustomerType] NVARCHAR (50) NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    CONSTRAINT [PK_CustomersTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

