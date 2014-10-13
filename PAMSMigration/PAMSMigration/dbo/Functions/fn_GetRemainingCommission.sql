-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fn_GetRemainingCommission] 
(
	@InquiryNumber  nvarchar(50) 
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Paid decimal(18,4)
	Declare @Amount decimal(18,4)
	Declare @Result decimal(18,2)
	Declare @CommPercent decimal(18,4)
	
	select @Amount = PriceCommissionBase * RateToEuro from dbo.Commissions where InquiryNumber = @InquiryNumber
	Select @CommPercent = CommissionPercent from dbo.Commissions where InquiryNumber = @InquiryNumber
	
	if(@Amount is null)
	begin
		Set @Amount = 0
	end
	Set @Amount = @Amount * @CommPercent
	select @Paid = SUM(PaidCommissionAmountInEuro) from dbo.CommissionPayments where InquiryNumber = @InquiryNumber
	if (@Paid is null)
	begin
		set @Paid = 0
	end
	-- Add the T-SQL statements to compute the return value here
	Set @Result = @Amount - @Paid

	-- Return the result of the function
	RETURN @Result

END