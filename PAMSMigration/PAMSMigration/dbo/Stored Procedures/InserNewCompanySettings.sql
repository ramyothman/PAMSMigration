-- =============================================
-- Author:		@Author,,Name>
-- Alter date: @Alter Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InserNewCompanySettings]
	        @CompanyNameFL nvarchar(200)
           ,@CompanyNameSL nvarchar(200)
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
           ,@CompanyStatment nvarchar(1000)
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
           ,@BranchID int
           ,@SupplierID int 
	AS
BEGIN
	INSERT INTO [dbo].[CompanySettings]
           ([CompanyNameFL]
           ,[CompanyNameSL]
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
           ,[CompanyStatment]
           ,[Logo]
           ,[CurrencyExchangeLink]
           ,[UserName]
           ,[ModifiedDate]
           ,[FinancialYearStart]
           ,[FinancialYearEnd]
           ,[DueDateNumOfDays]
           ,[DeliveryTimeNumOfDays]
           ,[ExpiredGuaranteesNumOfDays]
           ,[PastProjectsNumOfDays]
           ,[BaseCurrencyID]
           ,[ConvertToCompletedProcess]
           ,[NumOfMinutesPerDay]
           ,[BranchID]
           ,[SupplierID])
     VALUES
           (@CompanyNameFL
           ,@CompanyNameSL
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
           ,@CompanyStatment
           ,@Logo
           ,@CurrencyExchangeLink
           ,@UserName
           ,@ModifiedDate
           ,@FinancialYearStart
           ,@FinancialYearEnd
           ,@DueDateNumOfDays
           ,@DeliveryTimeNumOfDays
           ,@ExpiredGuaranteesNumOfDays
           ,@PastProjectsNumOfDays
           ,@BaseCurrencyID
           ,@ConvertToCompletedProcess
           ,@NumOfMinutesPerDay
           ,@BranchID
           ,@SupplierID)
END
