CREATE TABLE [dbo].[SuppliersProducts] (
    [SupplierProductID]  INT            IDENTITY (1, 1) NOT NULL,
    [SupplierID]         INT            NULL,
    [ProductDescription] NVARCHAR (MAX) NULL,
    [ProductID]          INT            NULL,
    [ProductTypeID]      INT            NULL,
    [CategoryID]         INT            NULL,
    [UserName]           NVARCHAR (50)  NULL,
    [ModifiedDate]       DATETIME       NULL,
    [IsActive]           BIT            NULL,
    CONSTRAINT [PK_SuppliersProducts] PRIMARY KEY CLUSTERED ([SupplierProductID] ASC)
);

