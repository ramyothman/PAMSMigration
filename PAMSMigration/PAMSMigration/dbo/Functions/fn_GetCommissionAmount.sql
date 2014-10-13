-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fn_GetCommissionAmount]
(
	-- Add the parameters for the function here
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result decimal(18,2)
	Declare @Amount decimal(18,4)
	Declare @CommPercent decimal(18,4)

	-- Add the T-SQL statements to compute the return value here
	select @Amount = PriceCommissionBase * RateToEuro from dbo.Commissions where InquiryNumber = @InquiryNumber
	Select @CommPercent = CommissionPercent from dbo.Commissions where InquiryNumber = @InquiryNumber
	if(@CommPercent is null)
	begin
		Set @CommPercent = 0
	end
	Set @Result = @Amount * @CommPercent
	-- Return the result of the function
	RETURN @Result

END