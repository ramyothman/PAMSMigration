CREATE TABLE [dbo].[SuppliersPhones] (
    [SupplierPhoneID]   INT            IDENTITY (1, 1) NOT NULL,
    [SupplierID]        INT            NULL,
    [PhoneNumber]       NVARCHAR (25)  NULL,
    [PhoneNumberTypeId] INT            NULL,
    [ModifiedDate]      DATETIME       CONSTRAINT [DF_SuppliersPhones_ModifiedDate] DEFAULT (getdate()) NULL,
    [MainPhone]         BIT            NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [ContactName]       NVARCHAR (250) NULL,
    CONSTRAINT [PK_SuppliersPhones] PRIMARY KEY CLUSTERED ([SupplierPhoneID] ASC)
);

