-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSumJobCustomerPaymentYearlyHistory]
(
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SumCustomerPayment decimal(18,2)
	select @SumCustomerPayment =	SUM(PaidAmountInEuro)
	FROM         GetAllCustomerPaymentsYearlyHistory
    WHERE     InquiryNumber = @InquiryNumber
    
	-- Return the result of the function
	RETURN ISNULL(@SumCustomerPayment,0)
END
