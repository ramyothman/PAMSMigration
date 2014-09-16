-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSupplierCommissionDueYearlyHistory]
(
	@SupplierID int,
	@Year int,
	@BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
	
	declare @DueCommission decimal(18,2)
	
SELECT  @DueCommission =  sum((dbo.GetSumJobCustomerPaymentYearlyHistory(OrdersYearlyHistory.InquiryNumber) * ISNULL(OrdersYearlyHistory.PercentPriceCommissionBase,0)
                            * IsNUll(CommissionsYearlyHistory.CommissionPercent,0)) - dbo.GetSumJobCommissionTransactionsYearlyHistory(OrdersYearlyHistory.InquiryNumber))  
FROM         OrdersYearlyHistory INNER JOIN
                      CommissionsYearlyHistory ON OrdersYearlyHistory.InquiryNumber = CommissionsYearlyHistory.InquiryNumber INNER JOIN
                      InquiriesYearlyHistory ON OrdersYearlyHistory.InquiryNumber = InquiriesYearlyHistory.InquiryNumber INNER JOIN
                      Inquiries ON InquiriesYearlyHistory.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = Inquiries.InquiryNumber
WHERE     (InquiriesYearlyHistory.SupplierID = @SupplierID) AND (CommissionsYearlyHistory.Paid = 'False')
	       AND (InquiriesYearlyHistory.Year  = @Year) and InquiriesYearlyHistory.BranchID = @BranchID
	       
	return ISNULL(@DueCommission,0)
END
