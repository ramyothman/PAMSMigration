-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetTotalGoodsPaid]
(
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
Declare @Result Decimal(18,2)
Declare @PaidAmount decimal(18,2)
Declare @DeductionAmount decimal(18,2)
SELECT    @PaidAmount = sum(PaidAmountInEuro),@DeductionAmount = Sum(DeductionAmountInEuro)
FROM         CustomerPayments
where  InquiryNumber = @InquiryNumber
if (@PaidAmount is null)
   set @PaidAmount = 0
if(@DeductionAmount is null)
   set @DeductionAmount = 0
   
set @Result = @PaidAmount - @DeductionAmount
Return @Result
END
