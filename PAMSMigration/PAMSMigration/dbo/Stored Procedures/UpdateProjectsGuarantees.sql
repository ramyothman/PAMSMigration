-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProjectsGuarantees]
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
           ,@oldID int 
           ,@RatetoEuro decimal(18,4)
           ,@AmountinEuro decimal(18,4)
		   ,@GuaranteeStatusID int
		   ,@Validity int
		   ,@TimePeriodID int
AS
BEGIN
UPDATE [dbo].[ProjectsGuarantee]
   SET [GuaranteeNumber] = @GuaranteeNumber
      ,[InquiryNumber] = @InquiryNumber
      ,[GuaranteeTypeID] = @GuaranteeTypeID
      ,[PercentageFromOffer] = @PercentageFromOffer
      ,[Amount] = @Amount
      ,[CurrencyID] = @CurrencyID
      ,[IssuingBy] = @IssuingBy
      ,[IssuingDate] = @IssuingDate
      ,[ExpiryDate] = @ExpiryDate
      ,[BankID] = @BankID
      ,[BankBranch] = @BankBranch
      ,[Remarks] = @Remarks
      ,[GuaranteeCopy] = @GuaranteeCopy
      ,[NextStepID] = @NextStepID
      ,[IsActive] = @IsActive
      ,[InActiveDate] = @InActiveDate      
      ,[GuaranteeCurrentLocationID] = @GuaranteeCurrentLocationID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[CalculationMethod] = @CalculationMethod
      ,[RatetoEuro] = @RatetoEuro
      ,[AmountinEuro] = @AmountinEuro 
	  ,GuaranteeStatusID = @GuaranteeStatusID 
	  ,Validity = @Validity 
	  ,TimePeriodID = @TimePeriodID
 where ID = @oldID
END
