CREATE TABLE [dbo].[SupplierAddress] (
    [SupplierAddressID] INT            IDENTITY (1, 1) NOT NULL,
    [SupplierID]        INT            NULL,
    [AddressTypeID]     INT            NULL,
    [Address]           NVARCHAR (MAX) NULL,
    [CountryRegionCode] CHAR (3)       NULL,
    [CityID]            INT            NULL,
    [PostalCode]        NVARCHAR (15)  NULL,
    [ZipCode]           NVARCHAR (15)  NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [ModifiedDate]      DATETIME       CONSTRAINT [DF_SupplierAddress_ModifiedDate] DEFAULT (getdate()) NULL,
    [MainAddress]       BIT            NULL,
    CONSTRAINT [PK_SupplierAddress] PRIMARY KEY CLUSTERED ([SupplierAddressID] ASC)
);

