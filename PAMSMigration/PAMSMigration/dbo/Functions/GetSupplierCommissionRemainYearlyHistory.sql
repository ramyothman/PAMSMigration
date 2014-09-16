-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSupplierCommissionRemainYearlyHistory]
(
	@SupplierID int,
	 @Year int,
	 @BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
	
	declare @RemianCommission decimal(18,2)
	 
SELECT  @RemianCommission =   
           SUM(ISNULL(OrdersYearlyHistory.PriceInEuro,0) * ISNULL(OrdersYearlyHistory.PercentPriceCommissionBase,0) *
            ISNULL(CommissionsYearlyHistory.CommissionPercent,0) - dbo.GetSumJobCommissionTransactionsYearlyHistory(OrdersYearlyHistory.InquiryNumber))            
FROM         OrdersYearlyHistory INNER JOIN
                      CommissionsYearlyHistory ON OrdersYearlyHistory.InquiryNumber = CommissionsYearlyHistory.InquiryNumber INNER JOIN
                      InquiriesYearlyHistory ON OrdersYearlyHistory.InquiryNumber = InquiriesYearlyHistory.InquiryNumber INNER JOIN
                      Inquiries ON InquiriesYearlyHistory.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = Inquiries.InquiryNumber
WHERE     (InquiriesYearlyHistory.SupplierID = @SupplierID) AND (CommissionsYearlyHistory.Paid = 'False') 
          AND (InquiriesYearlyHistory.Year  = @Year) and  InquiriesYearlyHistory.BranchID = @BranchID
	--set @RemianCommission = ISNULL(@RemianCommission,0) - dbo.GetSupplierCommissionDue(@SupplierID)
	
	return ISNULL(@RemianCommission,0)
END
