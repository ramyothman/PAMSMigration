CREATE TABLE [dbo].[SuppliersEmailAddress] (
    [SupplierEmailAddressID] INT           IDENTITY (1, 1) NOT NULL,
    [SupplierID]             INT           NULL,
    [EmailAddressTypeId]     INT           NULL,
    [Email]                  NVARCHAR (60) NULL,
    [ModifiedDate]           DATETIME      CONSTRAINT [DF_SuppliersEmailAddress_ModifiedDate] DEFAULT (getdate()) NULL,
    [UserName]               NVARCHAR (50) NULL,
    [MainEmailAddress]       BIT           NULL,
    CONSTRAINT [PK_SuppliersEmailAddress] PRIMARY KEY CLUSTERED ([SupplierEmailAddressID] ASC)
);

