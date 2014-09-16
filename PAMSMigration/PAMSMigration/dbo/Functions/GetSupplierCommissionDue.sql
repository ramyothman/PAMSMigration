-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSupplierCommissionDue]
(
	@SupplierID int,
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
	
	declare @DueCommission decimal(18,2)
	
SELECT  @DueCommission =  sum((dbo.GetSumJobCustomerPayment(Orders.InquiryNumber) * ISNULL(Orders.PercentPriceCommissionBase,0)
                            * IsNUll(Commissions.CommissionPercent,0)) - dbo.GetSumJobCommissionTransactions(Orders.InquiryNumber))  
FROM         Orders INNER JOIN
                      Commissions ON Orders.InquiryNumber = Commissions.InquiryNumber INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber
WHERE     (Inquiries.SupplierID = @SupplierID) AND (Commissions.Paid = 'False') and Inquiries.BranchID = @BranchID
	
	return ISNULL(@DueCommission,0)
END
