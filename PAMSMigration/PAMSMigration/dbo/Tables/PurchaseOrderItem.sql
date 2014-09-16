CREATE TABLE [dbo].[PurchaseOrderItem] (
    [PurchaseOrderItemID] INT             IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderID]     INT             NULL,
    [ItemOrder]           INT             NULL,
    [ItemID]              INT             NULL,
    [UnitPrice]           DECIMAL (18, 2) NULL,
    [Quantity]            INT             NULL,
    [RateToEuro]          DECIMAL (18, 2) NULL,
    [UnitPriceInEuro]     DECIMAL (18, 2) NULL,
    [TotalPrice]          DECIMAL (18, 2) NULL,
    [TotalPriceInEuro]    DECIMAL (18, 2) NULL,
    [RecievedQuantity]    INT             NULL,
    [IsRecieved]          BIT             CONSTRAINT [DF_PurchaseOrderItem_IsRecieved] DEFAULT ((0)) NULL,
    [ItemDescription]     NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_PurchaseOrderItem] PRIMARY KEY CLUSTERED ([PurchaseOrderItemID] ASC),
    CONSTRAINT [FK_PurchaseOrderItem_Product] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[Product] ([ProductID]),
    CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID]) ON DELETE CASCADE ON UPDATE CASCADE
);

