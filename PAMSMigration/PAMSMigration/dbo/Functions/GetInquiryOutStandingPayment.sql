-- used in getting the jobs when need to see outstanding payments
CREATE FUNCTION [dbo].[GetInquiryOutStandingPayment]
(
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
Declare @Result Decimal(18,2)
Declare @PaymentAmount decimal(18,2)
Declare @ShipmentAmount decimal(18,2)
Declare @DeductionAmount decimal(18,2)
select @PaymentAmount =  Sum(PaidAmountInEuro) from [dbo].[CustomerPayments]
where [InquiryNumber] = @InquiryNumber and PaidAmountInEuro is not null
select @DeductionAmount =  Sum(DeductionAmountInEuro) from [dbo].[CustomerPayments]
where [InquiryNumber] = @InquiryNumber and DeductionAmountInEuro is not null
SELECT @ShipmentAmount = Sum([PriceInEuro])      
  FROM [dbo].[PartialShipment]
where [InquiryNumber] = @InquiryNumber
if (@PaymentAmount is null)
set @PaymentAmount = 0
if (@ShipmentAmount is null)
set @ShipmentAmount = 0
if(@DeductionAmount is null)
 set @DeductionAmount = 0
set @Result = @ShipmentAmount - (@PaymentAmount + @DeductionAmount)
Return @Result
END
