﻿CREATE TABLE [dbo].[InquiriesYearlyHistory] (
    [InquiryNumber]           NVARCHAR (50)   NOT NULL,
    [ResponsibleEngineerID]   INT             NULL,
    [CustomerID]              INT             NULL,
    [CustomerInquiryNumber]   NVARCHAR (100)  NULL,
    [ProductID]               INT             NULL,
    [InquiryDate]             DATETIME        NULL,
    [BidDueDate]              DATETIME        NULL,
    [SupplierID]              INT             NULL,
    [SupplierQuotationNumber] NVARCHAR (100)  NULL,
    [QuotationPrice]          MONEY           NULL,
    [RateToEuro]              DECIMAL (18, 2) NULL,
    [ONDate]                  DATETIME        NULL,
    [QuotationPriceInEuro]    MONEY           NULL,
    [Comment]                 NTEXT           NULL,
    [UserName]                NVARCHAR (100)  NULL,
    [ModifiedDate]            DATETIME        NULL,
    [ProductDescription]      VARCHAR (150)   NULL,
    [ShotecNo]                VARCHAR (50)    NULL,
    [OnHold]                  BIT             NULL,
    [InquiryStatusID]         INT             NULL,
    [OrderPercentage]         DECIMAL (18, 2) NULL,
    [ProjectTypeID]           INT             NULL,
    [IsSubOffer]              BIT             NULL,
    [ParentInquiryNumber]     NVARCHAR (100)  NULL,
    [OfferDate]               DATETIME        NULL,
    [ProductTypeID]           INT             NULL,
    [LostPercentage]          DECIMAL (18, 4) NULL,
    [CancelledPercentage]     DECIMAL (18, 4) NULL,
    [LateResponsePercentage]  DECIMAL (18, 4) NULL,
    [OrderChanceID]           INT             NULL,
    [HasGuarantee]            BIT             NULL,
    [ProjectID]               INT             NULL,
    [InquiryTypeID]           INT             NULL,
    [CurrencyID]              INT             NULL,
    [Year]                    INT             NULL,
    [BranchID]                INT             NULL,
    CONSTRAINT [PK_InquiriesYearlyHistory] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC),
    CONSTRAINT [FK_InquiriesYearlyHistory_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID]),
    CONSTRAINT [FK_InquiriesYearlyHistory_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_InquiriesYearlyHistory_InquiryTypes] FOREIGN KEY ([InquiryTypeID]) REFERENCES [dbo].[InquiryTypes] ([ID]),
    CONSTRAINT [FK_InquiriesYearlyHistory_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE CASCADE ON UPDATE CASCADE
);
