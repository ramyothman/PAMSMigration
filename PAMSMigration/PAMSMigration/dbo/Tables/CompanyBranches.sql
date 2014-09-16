﻿CREATE TABLE [dbo].[CompanyBranches] (
    [ID]                         INT             IDENTITY (1, 1) NOT NULL,
    [BranchNameFL]               NVARCHAR (200)  NULL,
    [BranchNameSL]               NVARCHAR (200)  NULL,
    [StreetFL]                   NVARCHAR (500)  NULL,
    [StateFL]                    NVARCHAR (500)  NULL,
    [CityFL]                     NVARCHAR (50)   NULL,
    [CountryFL]                  NVARCHAR (150)  NULL,
    [StreetSL]                   NVARCHAR (500)  NULL,
    [StateSL]                    NVARCHAR (500)  NULL,
    [CitySL]                     NVARCHAR (50)   NULL,
    [CountrySL]                  NVARCHAR (150)  NULL,
    [ZipCode]                    NVARCHAR (50)   NULL,
    [PostalCode]                 NVARCHAR (50)   NULL,
    [Email]                      NVARCHAR (50)   NULL,
    [CommercialRecord]           NVARCHAR (100)  NULL,
    [TaxCard]                    NVARCHAR (50)   NULL,
    [TaxFile]                    NVARCHAR (50)   NULL,
    [Phone]                      NVARCHAR (50)   NULL,
    [Mobile]                     NVARCHAR (50)   NULL,
    [Fax]                        NVARCHAR (50)   NULL,
    [WebSite]                    NVARCHAR (50)   NULL,
    [Slogen]                     NVARCHAR (200)  NULL,
    [BranchStatment]             NVARCHAR (1000) NULL,
    [Logo]                       IMAGE           NULL,
    [UserName]                   NVARCHAR (50)   NULL,
    [ModifiedDate]               DATETIME        NULL,
    [CurrencyExchangeLink]       NVARCHAR (500)  NULL,
    [FinancialYearStart]         INT             NULL,
    [FinancialYearEnd]           INT             NULL,
    [DueDateNumOfDays]           INT             NULL,
    [DeliveryTimeNumOfDays]      INT             NULL,
    [ExpiredGuaranteesNumOfDays] INT             NULL,
    [PastProjectsNumOfDays]      INT             NULL,
    [BaseCurrencyID]             INT             NULL,
    [ConvertToCompletedProcess]  INT             NULL,
    [NumOfMinutesPerDay]         INT             NULL,
    [CountryID]                  INT             NULL,
    [SupplierID]                 INT             NULL,
    CONSTRAINT [PK_CompanyBranches] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CompanyBranches_Currencies] FOREIGN KEY ([BaseCurrencyID]) REFERENCES [dbo].[Currencies] ([ID])
);

