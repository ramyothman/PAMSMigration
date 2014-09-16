CREATE TABLE [dbo].[PartialShipmentDetailsYearlyHistory] (
    [PartialShipmentDetailsYearlyHistoryID] INT             NOT NULL,
    [PartialDeliveryID]                     INT             NULL,
    [PartialShipmentYearlyHistoryID]        INT             NULL,
    [PartialShipmentTypeID]                 INT             NULL,
    [PartialShipmentDescription]            NVARCHAR (MAX)  NULL,
    [Quantity]                              INT             NULL,
    [PriceInEuro]                           DECIMAL (18, 4) NULL,
    [UserName]                              NVARCHAR (50)   NULL,
    [ModifiedDate]                          DATETIME        NULL
);

