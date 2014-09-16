CREATE TABLE [dbo].[PruchaseOrderInvoices] (
    [PurchaseOrderInvoiceID]  INT             IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderID]         INT             NULL,
    [RequiredPaidValue]       DECIMAL (18, 2) NULL,
    [RequiredPaidValueInEuro] DECIMAL (18, 2) NULL,
    [RateToEuro]              DECIMAL (18, 2) NULL,
    [IsPaid]                  BIT             NULL,
    [InvoiceDate]             DATETIME        NULL,
    CONSTRAINT [PK_PruchaseOrderInvoices] PRIMARY KEY CLUSTERED ([PurchaseOrderInvoiceID] ASC),
    CONSTRAINT [FK_PruchaseOrderInvoices_PurchaseOrder] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID]) ON DELETE CASCADE ON UPDATE CASCADE
);

