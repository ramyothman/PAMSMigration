﻿CREATE TABLE [dbo].[Customers] (
    [CustomerID]         INT            IDENTITY (1, 1) NOT NULL,
    [CompanyCode]        NVARCHAR (15)  NULL,
    [CompanyName]        NVARCHAR (100) NOT NULL,
    [CustomerTypeID]     INT            NULL,
    [CustomerMarketID]   INT            NULL,
    [CompanyWebSite]     NVARCHAR (100) NULL,
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
    [CountryID]          INT            NULL,
    [EgyptID]            INT            NULL,
    [RPEID]              INT            NULL,
    [QatarID]            INT            NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

