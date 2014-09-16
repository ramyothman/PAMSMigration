﻿CREATE TABLE [dbo].[OffersTemplates] (
    [ID]                       INT             IDENTITY (1, 1) NOT NULL,
    [InquiryNumber]            NVARCHAR (50)   NULL,
    [HeaderName]               NVARCHAR (50)   NULL,
    [ClientContactPerson]      NVARCHAR (50)   NULL,
    [ClientAddress]            NVARCHAR (500)  NULL,
    [ClientCity]               NVARCHAR (50)   NULL,
    [ClientPhone]              NVARCHAR (50)   NULL,
    [ClientFax]                NVARCHAR (50)   NULL,
    [HeaderDate]               DATETIME        NULL,
    [ValidUntil]               DATETIME        NULL,
    [HeaderText]               NVARCHAR (MAX)  NULL,
    [HeaderTemplate]           NVARCHAR (MAX)  NULL,
    [DeliveryTime]             NVARCHAR (MAX)  NULL,
    [PaymentTerms]             NVARCHAR (MAX)  NULL,
    [DeliveryTerms]            NVARCHAR (MAX)  NULL,
    [Taxes]                    NVARCHAR (MAX)  NULL,
    [OfferValidity]            INT             NULL,
    [EndTemplate]              NVARCHAR (MAX)  NULL,
    [TotalItemsValue]          DECIMAL (18, 4) NULL,
    [ItemsCurrencyID]          INT             NULL,
    [ItemsComments]            NVARCHAR (MAX)  NULL,
    [ItemsNotes]               NVARCHAR (MAX)  NULL,
    [RevisionNumber]           INT             NULL,
    [IsFirstLanguage]          BIT             NULL,
    [UserName]                 NVARCHAR (50)   NULL,
    [ModifiedDate]             DATETIME        NULL,
    [ClientContactPersonTitle] NVARCHAR (100)  NULL,
    [OfferValidityPeriod]      NVARCHAR (50)   NULL,
    [PreparedByEmpID]          INT             NULL,
    [ApprovedByEmpID]          INT             NULL,
    [BranchID]                 INT             NULL,
    [OfferValidityText]        NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_OffersTemplates] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OffersTemplates_Inquiries] FOREIGN KEY ([InquiryNumber]) REFERENCES [dbo].[Inquiries] ([InquiryNumber]) ON DELETE CASCADE ON UPDATE CASCADE
);

