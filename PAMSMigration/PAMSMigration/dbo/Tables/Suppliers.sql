﻿CREATE TABLE [dbo].[Suppliers] (
    [SupplierID]         INT            IDENTITY (1, 1) NOT NULL,
    [SupplierName]       NVARCHAR (100) NOT NULL,
    [SupplierWebSite]    NVARCHAR (100) NULL,
    [ContactTitle]       NVARCHAR (10)  NULL,
    [ContactName]        NVARCHAR (100) NULL,
    [ContactDisplayName] NVARCHAR (150) NULL,
    [ContactHomePhone]   NVARCHAR (50)  NULL,
    [ContactWorkPhone]   NVARCHAR (50)  NULL,
    [ContactMobile]      NVARCHAR (50)  NULL,
    [ContactEmail]       NVARCHAR (50)  NULL,
    [ContactAddress]     NVARCHAR (255) NULL,
    [ContactCountry]     NVARCHAR (50)  NULL,
    [ContactCity]        NVARCHAR (50)  NULL,
    [ContactZip]         NVARCHAR (50)  NULL,
    [ContactFax]         NVARCHAR (50)  NULL,
    [UserName]           NVARCHAR (50)  NULL,
    [ModifiedDate]       DATETIME       NULL,
    [HasSubSuppliers]    BIT            NULL,
    [Logo]               IMAGE          NULL,
    [IsPrincipale]       BIT            NULL,
    [CurrentCompany]     BIT            NULL,
    [SupplierTypeID]     INT            NULL,
    [IsGeneral]          BIT            NULL,
    [EgyptID]            INT            NULL,
    [RPEID]              INT            NULL,
    [QatarID]            INT            NULL,
    CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID] ASC),
    CONSTRAINT [FK_Suppliers_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID]),
    CONSTRAINT [FK_Suppliers_SuppliersTypes] FOREIGN KEY ([SupplierTypeID]) REFERENCES [dbo].[SuppliersTypes] ([ID])
);
