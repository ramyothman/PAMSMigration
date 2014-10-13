-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSupplierCommissionRemain]
(
	@SupplierID int,
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
	
	declare @RemianCommission decimal(18,2)
	 
SELECT  @RemianCommission =   
            SUM(Orders.CommissionAmountInEuro - dbo.GetSumJobCommissionTransactions(Orders.InquiryNumber))            
FROM         Orders INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber
WHERE     (Inquiries.SupplierID = @SupplierID) and Inquiries.BranchID = @BranchID 
	--set @RemianCommission = ISNULL(@RemianCommission,0) - dbo.GetSupplierCommissionDue(@SupplierID)
	
	return @RemianCommission
END
