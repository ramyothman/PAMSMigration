CREATE TABLE [dbo].[PurchaseOrder] (
    [PurchaseOrderID]    INT             IDENTITY (1, 1) NOT NULL,
    [SupplierID]         INT             NULL,
    [SupplierNo]         NVARCHAR (50)   NULL,
    [PurchaseNo]         NVARCHAR (50)   NULL,
    [TotalPrice]         DECIMAL (18, 2) NULL,
    [RateToEuro]         DECIMAL (18, 2) NULL,
    [TotalPriceInEuro]   DECIMAL (18, 2) NULL,
    [Deduction]          DECIMAL (18, 2) NULL,
    [DeductionInEuro]    DECIMAL (18, 2) NULL,
    [CurrencyID]         INT             NULL,
    [CreationDate]       DATETIME        NULL,
    [PurchaseDate]       DATETIME        NULL,
    [CalculationSheetID] INT             NULL,
    [IsRFQ]              BIT             NULL,
    [IsPOConvert]        BIT             CONSTRAINT [DF_PurchaseOrder_IsPOConvert] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED ([PurchaseOrderID] ASC),
    CONSTRAINT [FK_PurchaseOrder_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
);

