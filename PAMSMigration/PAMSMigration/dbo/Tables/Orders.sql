﻿CREATE TABLE [dbo].[Orders] (
    [InquiryNumber]              NVARCHAR (50)   NOT NULL,
    [OrderNumber]                NVARCHAR (50)   NOT NULL,
    [CustomerOrderNumber]        NVARCHAR (50)   NULL,
    [SupplierOrderNumber]        NVARCHAR (50)   NULL,
    [OrderDate]                  DATETIME        NULL,
    [DeliveryTime]               INT             NULL,
    [ExpansionDeliveryDate]      DATETIME        NULL,
    [PaymentTypeID]              INT             NULL,
    [PriceBaseID]                INT             NULL,
    [Price]                      MONEY           NULL,
    [CurrencyID]                 INT             NULL,
    [RateToEuro]                 DECIMAL (18, 2) NULL,
    [ONDate]                     DATETIME        NULL,
    [PriceInEuro]                MONEY           NULL,
    [DeliveredON]                DATETIME        NULL,
    [Delivered]                  BIT             NULL,
    [Comment]                    NTEXT           NULL,
    [UserName]                   NVARCHAR (50)   NULL,
    [ModifiedDate]               DATETIME        NULL,
    [PriceCommissionBase]        MONEY           NULL,
    [PercentPriceCommissionBase] DECIMAL (18, 4) NULL,
    [OrderStatusID]              INT             NULL,
    [IsSubOrder]                 BIT             NULL,
    [ParentOrderNumber]          NVARCHAR (50)   NULL,
    [BackLog]                    DECIMAL (18, 4) NULL,
    [CompletedGoodsPaidON]       DATETIME        NULL,
    [IsCompletedGoodsPaid]       BIT             NULL,
    [HasGuarantee]               BIT             NULL,
    [EgyptID]                    NVARCHAR (50)   NULL,
    [RPEID]                      NVARCHAR (50)   NULL,
    [QatarID]                    NVARCHAR (50)   NULL,
    [DeliveryTimePeriodID]       INT             NULL,
    [DiscountValue]              DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC),
    CONSTRAINT [FK_Orders_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Orders_PaymentTypes] FOREIGN KEY ([PaymentTypeID]) REFERENCES [dbo].[PaymentTypes] ([ID]),
    CONSTRAINT [FK_Orders_PriceBase] FOREIGN KEY ([PriceBaseID]) REFERENCES [dbo].[PriceBase] ([ID])
);

