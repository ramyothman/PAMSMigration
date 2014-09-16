CREATE TABLE [dbo].[ProductTypes] (
    [ProductTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [ProductType]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED ([ProductTypeID] ASC)
);

