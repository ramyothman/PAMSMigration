-- =============================================
-- Author:		@Author,,Name>
-- Alter date: @Alter Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InserNewCompanyBranches]
            @ID int out
	       ,@BranchNameFL nvarchar(200)
           ,@BranchNameSL nvarchar(200)
           ,@StreetFL nvarchar(500)
           ,@StateFL nvarchar(500)          
           ,@CityFL nvarchar(50)
           ,@CountryFL nvarchar(150)
           ,@StreetSL nvarchar(500)
           ,@StateSL nvarchar(500)          
           ,@CitySL nvarchar(50)
           ,@CountrySL nvarchar(150)
           ,@ZipCode nvarchar(50)
           ,@PostalCode nvarchar(50)
           ,@Email nvarchar(50)
           ,@CommercialRecord nvarchar(100)
           ,@TaxCard nvarchar(50)
           ,@TaxFile nvarchar(50)
           ,@Phone nvarchar(50)
           ,@Mobile nvarchar(50)
           ,@Fax nvarchar(50)
           ,@WebSite nvarchar(50)
           ,@Slogen nvarchar(200)
           ,@BranchStatment nvarchar(1000)
           ,@Logo varbinary(MAX)
           ,@CurrencyExchangeLink nvarchar(500)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@FinancialYearEnd int
           ,@FinancialYearStart int
           ,@DueDateNumOfDays int
           ,@DeliveryTimeNumOfDays int
           ,@ExpiredGuaranteesNumOfDays int 
           ,@PastProjectsNumOfDays int
           ,@BaseCurrencyID int
           ,@ConvertToCompletedProcess int
           ,@NumOfMinutesPerDay int
           ,@CountryID int
           ,@SupplierID int = 1
	AS
BEGIN
INSERT INTO [dbo].[CompanyBranches]
           ([BranchNameFL]
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
     VALUES
           (@BranchNameFL
           ,@BranchNameSL
           ,@StreetFL
           ,@StateFL
           ,@CityFL
           ,@CountryFL
           ,@StreetSL
           ,@StateSL
           ,@CitySL
           ,@CountrySL
           ,@ZipCode
           ,@PostalCode
           ,@Email
           ,@CommercialRecord
           ,@TaxCard
           ,@TaxFile
           ,@Phone
           ,@Mobile
           ,@Fax
           ,@WebSite
           ,@Slogen
           ,@BranchStatment
           ,@Logo
           ,@UserName
           ,@ModifiedDate
           ,@CurrencyExchangeLink
           ,@FinancialYearStart
           ,@FinancialYearEnd
           ,@DueDateNumOfDays
           ,@DeliveryTimeNumOfDays
           ,@ExpiredGuaranteesNumOfDays
           ,@PastProjectsNumOfDays
           ,@BaseCurrencyID
           ,@ConvertToCompletedProcess
           ,@NumOfMinutesPerDay
           ,@CountryID
           ,@SupplierID)
           
  set @ID = SCOPE_IDENTITY()
END
