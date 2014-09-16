CREATE PROCEDURE [dbo].[UpdatePaymentTerms]
    @Description nvarchar(500),
    @InquiryNumber nvarchar(50),
    @IsJobCompleted bit,
    @IsJobDownPayment bit,
    @IsJobInProgress bit,
    @IsPaid bit,
    @IsReached bit,
    @OldPaymentTermID int,
    @PaymentTermTypeID int,
    @PercentageValue decimal(18,2)
AS
UPDATE [dbo].[PaymentTerms]
SET
    Description = @Description,
    InquiryNumber = @InquiryNumber,
    IsJobCompleted = @IsJobCompleted,
    IsJobDownPayment = @IsJobDownPayment,
    IsJobInProgress = @IsJobInProgress,
    IsPaid = @IsPaid,
    IsReached = @IsReached,
    PaymentTermTypeID = @PaymentTermTypeID,
    PercentageValue = @PercentageValue
WHERE [PaymentTermID] = @OLDPaymentTermID
IF @@ROWCOUNT > 0
Select * From PaymentTerms 
Where [PaymentTermID] = @OLDPaymentTermID
