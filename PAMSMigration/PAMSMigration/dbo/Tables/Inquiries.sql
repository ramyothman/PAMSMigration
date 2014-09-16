﻿CREATE TABLE [dbo].[Inquiries] (
    [InquiryNumber]           NVARCHAR (50)   NOT NULL,
    [ResponsibleEngineerID]   INT             NULL,
    [InquiryTypeID]           INT             NULL,
    [CustomerID]              INT             NULL,
    [CustomerInquiryNumber]   NVARCHAR (50)   NULL,
    [ProductID]               INT             NULL,
    [InquiryDate]             DATETIME        NULL,
    [BidDueDate]              DATETIME        NULL,
    [SupplierID]              INT             NULL,
    [SupplierQuotationNumber] NVARCHAR (50)   NULL,
    [QuotationPrice]          MONEY           NULL,
    [CurrencyID]              INT             NULL,
    [RateToEuro]              DECIMAL (18, 2) NULL,
    [ONDate]                  DATETIME        NULL,
    [QuotationPriceInEuro]    MONEY           NULL,
    [Comment]                 NTEXT           NULL,
    [UserName]                NVARCHAR (50)   NULL,
    [ModifiedDate]            DATETIME        NULL,
    [ProductDescription]      VARCHAR (150)   NULL,
    [ShotecNo]                VARCHAR (50)    NULL,
    [OnHold]                  BIT             NULL,
    [InquiryStatusID]         INT             NULL,
    [OrderPercentage]         DECIMAL (18, 2) NULL,
    [ProjectTypeID]           INT             NULL,
    [IsSubOffer]              BIT             NULL,
    [ParentInquiryNumber]     NVARCHAR (50)   NULL,
    [OfferDate]               DATETIME        NULL,
    [ProductTypeID]           INT             NULL,
    [LostPercentage]          DECIMAL (18, 4) NULL,
    [CancelledPercentage]     DECIMAL (18, 4) NULL,
    [LateResponsePercentage]  DECIMAL (18, 4) NULL,
    [OrderChanceID]           INT             NULL,
    [HasGuarantee]            BIT             NULL,
    [ProjectID]               INT             NULL,
    [BranchID]                INT             NULL,
    [EgyptID]                 NVARCHAR (50)   NULL,
    [RPEID]                   NVARCHAR (50)   NULL,
    [QatarID]                 NVARCHAR (50)   NULL,
    [PriceBaseID]             INT             NULL,
    [PaymentBaseID]           INT             NULL,
    [FileNo]                  NVARCHAR (50)   NULL,
    CONSTRAINT [PK_Inquiries] PRIMARY KEY CLUSTERED ([InquiryNumber] ASC),
    CONSTRAINT [FK_Inquiries_CompanyBranches] FOREIGN KEY ([BranchID]) REFERENCES [dbo].[CompanyBranches] ([ID]),
    CONSTRAINT [FK_Inquiries_Currencies] FOREIGN KEY ([CurrencyID]) REFERENCES [dbo].[Currencies] ([ID]),
    CONSTRAINT [FK_Inquiries_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Inquiries_InquiryTypes] FOREIGN KEY ([InquiryTypeID]) REFERENCES [dbo].[InquiryTypes] ([ID]),
    CONSTRAINT [FK_Inquiries_Projects] FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[Projects] ([ID]),
    CONSTRAINT [FK_Inquiries_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE CASCADE ON UPDATE CASCADE
);
