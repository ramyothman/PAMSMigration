CREATE PROCEDURE [dbo].[InsertNewPaymentTerms]
    @Description nvarchar(500),
    @InquiryNumber nvarchar(50),
    @IsJobCompleted bit,
    @IsJobDownPayment bit,
    @IsJobInProgress bit,
    @IsPaid bit,
    @IsReached bit,
    @PaymentTermTypeID int,
    @PercentageValue decimal(18,2)
AS
INSERT INTO [dbo].[PaymentTerms] (
    [Description],
    [InquiryNumber],
    [IsJobCompleted],
    [IsJobDownPayment],
    [IsJobInProgress],
    [IsPaid],
    [IsReached],
    [PaymentTermTypeID],
    [PercentageValue])
Values (
    @Description,
    @InquiryNumber,
    @IsJobCompleted,
    @IsJobDownPayment,
    @IsJobInProgress,
    @IsPaid,
    @IsReached,
    @PaymentTermTypeID,
    @PercentageValue)
IF @@ROWCOUNT > 0
Select * from PaymentTerms
Where [PaymentTermID] = @@identity
