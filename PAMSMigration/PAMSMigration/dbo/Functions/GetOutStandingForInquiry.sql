-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[GetOutStandingForInquiry]
(
	-- Add the parameters for the function here
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @deducation decimal(18,2)
	Declare @price decimal(18,2)
	Declare @outstanding decimal(18,2)
	Declare @Result decimal(18,2)
	-- Add the T-SQL statements to compute the return value here
	
	select @deducation = Sum(DeductionAmountInEuro) From CustomerPayments as cp
	where cp.[InquiryNumber] = @InquiryNumber
	if(@deducation is null)
		Set @deducation = 0
	select @price = Sum(PaidAmountInEuro) From CustomerPayments as cp
	where cp.[InquiryNumber] = @InquiryNumber
	if(@price is null)
		Set @price = 0
	select @outstanding = Sum(PriceInEuro) from PartialShipment as ps
	where ps.[InquiryNumber] = @InquiryNumber
	if(@outstanding is null)
		Set @outstanding = 0
	Set @Result = @outstanding - (@deducation + @price)
	-- Return the result of the function
	RETURN @Result
END
