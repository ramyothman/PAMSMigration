CREATE TABLE [dbo].[CustomerAddress] (
    [CustomerAddressID] INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]        INT            NULL,
    [AddressTypeID]     INT            NULL,
    [Address]           NVARCHAR (MAX) NULL,
    [CountryRegionCode] CHAR (3)       NULL,
    [CityID]            INT            NULL,
    [PostalCode]        NVARCHAR (15)  NULL,
    [ZipCode]           NVARCHAR (15)  NULL,
    [UserName]          NVARCHAR (50)  NULL,
    [ModifiedDate]      DATETIME       CONSTRAINT [DF_CustomerAddress_ModifiedDate] DEFAULT (getdate()) NULL,
    [MainAddress]       BIT            NULL,
    CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED ([CustomerAddressID] ASC)
);

