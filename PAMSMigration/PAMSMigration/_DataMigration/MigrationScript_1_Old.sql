-- Migration Script 16/9/2014 --
-- Tables with No Dependencies --

-- Company Countries --
SET IDENTITY_INSERT [dbo].[CompanyCountries] ON;
INSERT INTO [dbo].[CompanyCountries]
           ([ID]
		   ,[CountryName]
           ,[UserName]
           ,[ModifiedDate])
Select ID,[CountryName], [UserName], [ModifiedDate]
From [KTR111].[dbo].[CompanyCountries]
SET IDENTITY_INSERT [dbo].[CompanyCountries] OFF;
GO

-- Company Branches --
SET IDENTITY_INSERT [dbo].[CompanyBranches] ON;
INSERT INTO [dbo].[CompanyBranches]
           ([ID]
		   ,[BranchNameFL]
           ,[BranchNameSL]
           ,[StreetFL]
           ,[StateFL]
           ,[CityFL]
           ,[CountryFL]
           ,[StreetSL]
           ,[StateSL]
           ,[CitySL]
           ,[CountrySL]
           ,[ZipCode]
           ,[PostalCode]
           ,[Email]
           ,[CommercialRecord]
           ,[TaxCard]
           ,[TaxFile]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[WebSite]
           ,[Slogen]
           ,[BranchStatment]
           ,[Logo]
           ,[UserName]
           ,[ModifiedDate]
           ,[CurrencyExchangeLink]
           ,[FinancialYearStart]
           ,[FinancialYearEnd]
           ,[DueDateNumOfDays]
           ,[DeliveryTimeNumOfDays]
           ,[ExpiredGuaranteesNumOfDays]
           ,[PastProjectsNumOfDays]
           ,[BaseCurrencyID]
           ,[ConvertToCompletedProcess]
           ,[NumOfMinutesPerDay]
           ,[CountryID]
           ,[SupplierID])
     
Select [ID]
		   ,[BranchNameFL]
           ,[BranchNameSL]
           ,[StreetFL]
           ,[StateFL]
           ,[CityFL]
           ,[CountryFL]
           ,[StreetSL]
           ,[StateSL]
           ,[CitySL]
           ,[CountrySL]
           ,[ZipCode]
           ,[PostalCode]
           ,[Email]
           ,[CommercialRecord]
           ,[TaxCard]
           ,[TaxFile]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[WebSite]
           ,[Slogen]
           ,[BranchStatment]
           ,[Logo]
           ,[UserName]
           ,[ModifiedDate]
           ,[CurrencyExchangeLink]
           ,[FinancialYearStart]
           ,[FinancialYearEnd]
           ,[DueDateNumOfDays]
           ,[DeliveryTimeNumOfDays]
           ,[ExpiredGuaranteesNumOfDays]
           ,[PastProjectsNumOfDays]
           ,[BaseCurrencyID]
           ,[ConvertToCompletedProcess]
           ,[NumOfMinutesPerDay]
           ,[CountryID]
           ,[SupplierID]
From [KTR111].[dbo].[CompanyBranches]

SET IDENTITY_INSERT [dbo].[CompanyBranches] OFF;

GO
-- Currencies --
insert into dbo.Currencies(CurrencyCode,CurrencyName,CurrencyNameSL,EgyptID,RPEID,QatarID)
select CurrencyCode,CurrencyName,CurrencyNameSL,ID,0,0
from ShotecEgypt.dbo.Currencies

-- TODO Add Another Database Currencies Script --


-- Banks --
SET IDENTITY_INSERT [dbo].[Banks] ON;
INSERT INTO [dbo].[Banks]
           ([ID]
		   ,[BankCode]
           ,[BankName]
           ,[CurrencyID]
           ,[SwiftCode]
           ,[EgyptID]
           ,[RPEID]
           ,[QatarID])

Select [ID],[BankCode],[BankName], 3 as CurrencyID,[BankAccountNumber] as SwiftCode,ID as EgyptID,0 as RPEID, 0 as QatarID
From [ShotecEgypt].[dbo].[Banks]

SET IDENTITY_INSERT [dbo].[Banks] OFF;

-- TODO Add Another Database Banks Script --






