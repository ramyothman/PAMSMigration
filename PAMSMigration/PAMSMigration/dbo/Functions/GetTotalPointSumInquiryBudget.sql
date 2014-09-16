CREATE FUNCTION [dbo].[GetTotalPointSumInquiryBudget]
(
	@BranchID int
)
RETURNS decimal(26,10)
AS
BEGIN
Declare @Result Decimal(26,10)
	-- Declare the return variable here
	Select @Result = SUM(PointsSum) From (
Select ResponsibleEngineerID,InquiryNumbers,PointsInquiry,InquiryQuotationPriceSum,PointsValueSum,PointsInquiry + PointsValueSum as PointsSum from
(Select ResponsibleEngineerID,COUNT(InquiryNumber) as InquiryNumbers,COUNT(InquiryNumber) * dbo.GetGeneralPointsInquiries() as PointsInquiry,SUM(QuotationPriceInEuro) as InquiryQuotationPriceSum,SUM(PointsValue) as PointsValueSum From 
(Select ResponsibleEngineerID,InquiryNumber,InquiryType,QuotationPriceInEuro,QuotationPriceInEuro /  dbo.GetGeneralPointsValue() as PointsValue
from (Select ResponsibleEngineerID,InquiryNumber,InquiryType,CAST(QuotationPriceInEuro as decimal(26,10)) as QuotationPriceInEuro From GetAllInquiries
Where BranchID = @BranchID and InquiryStatus = 'INQUIRY' AND InquiryType IN('Budget')) as a
) as b
Group By ResponsibleEngineerID) as c) as d
Return @Result
END
