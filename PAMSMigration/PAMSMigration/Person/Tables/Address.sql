﻿CREATE TABLE [Person].[Address] (
    [AddressId]         INT              IDENTITY (1, 1) NOT NULL,
    [Address]           NVARCHAR (MAX)   NULL,
    [CountryRegionCode] CHAR (3)         NOT NULL,
    [CityID]            INT              NULL,
    [StateProvinceId]   INT              NULL,
    [PostalCode]        NVARCHAR (15)    NULL,
    [ZipCode]           NVARCHAR (15)    NULL,
    [SpatialLocation]   NVARCHAR (60)    NULL,
    [RowGuid]           UNIQUEIDENTIFIER CONSTRAINT [DF_Address_RowGuid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]      DATETIME         CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [EgyptID]           INT              NULL,
    [RPEID]             INT              NULL,
    [QatarID]           INT              NULL,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([AddressId] ASC),
    CONSTRAINT [FK_Address_CountryRegion] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode]),
    CONSTRAINT [FK_Address_StateProvince] FOREIGN KEY ([StateProvinceId]) REFERENCES [Person].[StateProvince] ([StateProvinceId])
);


GO
ALTER TABLE [Person].[Address] NOCHECK CONSTRAINT [FK_Address_StateProvince];

