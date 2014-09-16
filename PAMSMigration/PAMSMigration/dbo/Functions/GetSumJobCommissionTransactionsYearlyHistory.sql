﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSumJobCommissionTransactionsYearlyHistory]
(
	@InquiryNumber nvarchar(50)
)
RETURNS decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SumTransactions decimal(18,2)
    SELECT  @SumTransactions =	SUM([PaidCommissionAmountInEuro])     
	  FROM [dbo].[CommissionPaymentsYearlyHistory]
	 where [InquiryNumber] = @InquiryNumber
	-- Return the result of the function
	RETURN ISNULL(@SumTransactions,0)
END
