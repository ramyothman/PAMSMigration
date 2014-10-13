-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION  fn_GetCommissionBranchID
(
	-- Add the parameters for the function here
	@InquiryNumber nvarchar(50)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @BranchID int
	select @BranchID = BranchID From dbo.Commissions where InquiryNumber = @InquiryNumber
	-- Add the T-SQL statements to compute the return value here
	

	-- Return the result of the function
	RETURN @BranchID

END