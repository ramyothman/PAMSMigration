CREATE VIEW [dbo].[GRTotalInquiryInqStatus]
AS
SELECT     InquiryStatus, Year, StatusCount, CustomerID, SupplierID, SupplierName, CompanyName, BranchID
FROM         dbo.GRTotalInquiriesLists
WHERE     (InquiryStatus = N'Inquiry')
