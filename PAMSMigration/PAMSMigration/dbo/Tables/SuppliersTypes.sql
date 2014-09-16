CREATE TABLE [dbo].[SuppliersTypes] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [SupplierType] NVARCHAR (50) NULL,
    [UserName]     NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL,
    CONSTRAINT [PK_SuppliersTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

