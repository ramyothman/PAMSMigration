CREATE TABLE [dbo].[PartialShipmentYearlyHistory] (
    [PartialShipmentYearlyHistoryID] INT             NOT NULL,
    [ShipmentNumber]                 NVARCHAR (50)   NULL,
    [InvoiceNumber]                  NVARCHAR (150)  NULL,
    [InquiryNumber]                  NVARCHAR (50)   NULL,
    [ShipmentDate]                   DATETIME        NULL,
    [ItemDescription]                NVARCHAR (250)  NULL,
    [Price]                          DECIMAL (18, 4) NULL,
    [RateToEuro]                     DECIMAL (18, 2) NULL,
    [RateDate]                       DATETIME        NULL,
    [PriceInEuro]                    DECIMAL (18, 4) NULL,
    [Remarks]                        NVARCHAR (MAX)  NULL,
    [UserName]                       NVARCHAR (50)   NULL,
    [ModifiedDate]                   DATETIME        NULL,
    [CurrencyID]                     INT             NULL,
    [ShotecNoTemp]                   NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ParitalShipmentYearlyHistory] PRIMARY KEY CLUSTERED ([PartialShipmentYearlyHistoryID] ASC),
    CONSTRAINT [FK_ParitalShipment_InquiriesYearlyHistory] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[InquiriesYearlyHistory] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_PartialShipmentYearlyHistory_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

