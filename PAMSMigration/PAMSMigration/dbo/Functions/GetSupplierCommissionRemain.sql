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
           SUM(ISNULL(Orders.PriceInEuro,0) * ISNULL(Orders.PercentPriceCommissionBase,0) *
            ISNULL(Commissions.CommissionPercent,0) - dbo.GetSumJobCommissionTransactions(Orders.InquiryNumber))            
FROM         Orders INNER JOIN
                      Commissions ON Orders.InquiryNumber = Commissions.InquiryNumber INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber
WHERE     (Inquiries.SupplierID = @SupplierID) AND (Commissions.Paid = 'False') and Inquiries.BranchID = @BranchID 
	--set @RemianCommission = ISNULL(@RemianCommission,0) - dbo.GetSupplierCommissionDue(@SupplierID)
	
	return @RemianCommission
END
