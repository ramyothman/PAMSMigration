-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fn_GetPaidCommission] 
(
	@InquiryNumber  nvarchar(50) 
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	Declare @Paid decimal(18,4)
	
	
	select @Paid = SUM(PaidCommissionAmountInEuro) from dbo.CommissionPayments where InquiryNumber = @InquiryNumber
	if (@Paid is null)
	begin
		set @Paid = 0
	end
	Set @Paid = ROUND(@Paid,2)
	-- Return the result of the function
	RETURN @Paid

END