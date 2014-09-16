-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSumJobCommissionTransactions]
(
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SumTransactions decimal(18,2)
	select @SumTransactions =	SUM(PaidCommissionAmountInEuro)
	FROM   CommissionPayments
    WHERE  InquiryNumber = @InquiryNumber
    
	-- Return the result of the function
	RETURN IsNULL(@SumTransactions,0)
END
