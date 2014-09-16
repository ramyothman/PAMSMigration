CREATE PROCEDURE [dbo].[InsertNewProjectsGuarantees]
            @GuaranteeNumber nvarchar(50)
           ,@InquiryNumber nvarchar(50)
           ,@GuaranteeTypeID int
           ,@PercentageFromOffer decimal(18,4)
           ,@Amount decimal(18,4)
           ,@CurrencyID int
           ,@IssuingBy int
           ,@IssuingDate datetime
           ,@ExpiryDate datetime
           ,@BankID int
           ,@BankBranch nvarchar(50)
           ,@Remarks nvarchar(max)
           ,@GuaranteeCopy image
           ,@NextStepID int
           ,@GuaranteeCurrentLocationID int
           ,@IsActive bit
           ,@InActiveDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@CalculationMethod nvarchar(50)
           ,@RatetoEuro decimal(18,4)
           ,@AmountinEuro decimal(18,4)
		   ,@GuaranteeStatusID int
		   ,@Validity int
		   ,@TimePeriodID int
AS
INSERT INTO [dbo].[ProjectsGuarantee]
           ([GuaranteeNumber]
           ,[InquiryNumber]
           ,[GuaranteeTypeID]
           ,[PercentageFromOffer]
           ,[Amount]
           ,[CurrencyID]
           ,[IssuingBy]
           ,[IssuingDate]
           ,[ExpiryDate]
           ,[BankID]
           ,[BankBranch]
           ,[Remarks]
           ,[GuaranteeCopy]
           ,[NextStepID]
           ,[GuaranteeCurrentLocationID]
           ,[IsActive]
           ,[InActiveDate]
           ,[UserName]
           ,[ModifiedDate]
           ,[CalculationMethod]
           ,[RatetoEuro] 
           ,[AmountinEuro]
		   ,GuaranteeStatusID
		   ,Validity
		   ,TimePeriodID
           )
     VALUES
           (@GuaranteeNumber
           ,@InquiryNumber
           ,@GuaranteeTypeID
           ,@PercentageFromOffer
           ,@Amount
           ,@CurrencyID
           ,@IssuingBy
           ,@IssuingDate
           ,@ExpiryDate
           ,@BankID
           ,@BankBranch
           ,@Remarks
           ,@GuaranteeCopy
           ,@NextStepID
           ,@GuaranteeCurrentLocationID
           ,@IsActive
           ,@InActiveDate
           ,@UserName
           ,@ModifiedDate
           ,@CalculationMethod
           ,@RatetoEuro 
           ,@AmountinEuro
		   ,@GuaranteeStatusID
		   ,@Validity
		   ,@TimePeriodID
           )
IF @@ROWCOUNT > 0
Select * from [dbo].[ProjectsGuarantee]
Where [ID] = @@identity
