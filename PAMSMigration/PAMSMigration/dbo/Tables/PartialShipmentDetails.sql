CREATE TABLE [dbo].[PartialShipmentDetails] (
    [PartialShipmentDetailsID]   INT             IDENTITY (1, 1) NOT NULL,
    [PartialDeliveryID]          INT             NULL,
    [PartialShipmentID]          INT             NULL,
    [PartialShipmentTypeID]      INT             NULL,
    [PartialShipmentDescription] NVARCHAR (MAX)  NULL,
    [Quantity]                   INT             NULL,
    [PriceInEuro]                DECIMAL (18, 4) NULL,
    [UserName]                   NVARCHAR (50)   NULL,
    [ModifiedDate]               DATETIME        NULL,
    CONSTRAINT [PK_PartialShipmentDetails] PRIMARY KEY CLUSTERED ([PartialShipmentDetailsID] ASC),
    CONSTRAINT [FK_PartialShipmentDetails_ParitalShipment] FOREIGN KEY ([PartialShipmentID]) REFERENCES [dbo].[PartialShipment] ([PartialShipmentID]),
    CONSTRAINT [FK_PartialShipmentDetails_PartialDelivery] FOREIGN KEY ([PartialDeliveryID]) REFERENCES [dbo].[PartialOrder] ([PartialOrderID])
);

