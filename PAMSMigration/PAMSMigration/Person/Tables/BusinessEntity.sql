CREATE TABLE [Person].[BusinessEntity] (
    [BusinessEntityId]      INT              IDENTITY (1, 1) NOT NULL,
    [RowGuid]               UNIQUEIDENTIFIER CONSTRAINT [DF_BusinessEntity_RowGuid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]          DATETIME         CONSTRAINT [DF_BusinessEntity_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [EgyptBusinessEntityID] INT              NULL,
    [RPEBusinessEntityID]   INT              NULL,
    [QatarBusinessEntityID] INT              NULL,
    [SupplierEgyptID] INT NULL, 
    [SupplierQatarID] INT NULL, 
    [SupplierRPEID] INT NULL, 
    CONSTRAINT [PK_BusinessEntity] PRIMARY KEY CLUSTERED ([BusinessEntityId] ASC)
);

