-- =============================================
-- Author:		@Author,,Name>
-- Alter date: @Alter Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCompanySettings]
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
           ,@Logo image --varbinary(MAX)
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
           ,@OldID int
           ,@SupplierID int 
	AS
BEGIN
	UPDATE [dbo].[CompanySettings]
   SET [CompanyNameFL] = @CompanyNameFL
      ,[CompanyNameSL] = @CompanyNameSL
      ,[StreetFL] = @StreetFL
      ,[StateFL] = @StateFL 
      ,[CityFL] = @CityFL
      ,[CountryFL] = @CountryFL
      ,[StreetSL] = @StreetSL
      ,[StateSL] = @StateSL 
      ,[CitySL] = @CitySL
      ,[CountrySL] = @CountrySL
      ,[ZipCode] = @ZipCode
      ,[PostalCode] = @PostalCode
      ,[Email] = @Email
      ,[CommercialRecord] = @CommercialRecord
      ,[TaxCard] = @TaxCard
      ,[TaxFile] = @TaxFile
      ,[Phone] = @Phone
      ,[Mobile] = @Mobile
      ,[Fax] = @Fax
      ,[WebSite] = @WebSite
      ,[Slogen] = @Slogen
      ,[CompanyStatment] = @CompanyStatment
      ,[Logo] = @Logo
      ,[CurrencyExchangeLink] = @CurrencyExchangeLink
      ,[FinancialYearEnd] = @FinancialYearEnd
      ,[FinancialYearStart] = @FinancialYearStart
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[DueDateNumOfDays] = @DueDateNumOfDays
      ,[DeliveryTimeNumOfDays] = @DeliveryTimeNumOfDays
      ,[ExpiredGuaranteesNumOfDays] = @ExpiredGuaranteesNumOfDays
      ,[PastProjectsNumOfDays] = @PastProjectsNumOfDays
      ,[BaseCurrencyID] = @BaseCurrencyID
      ,[ConvertToCompletedProcess] = @ConvertToCompletedProcess
      ,[NumOfMinutesPerDay] = @NumOfMinutesPerDay
      ,[BranchID] = @BranchID 
      ,[SupplierID] = @SupplierID
      
 WHERE ID = @OldID
END
