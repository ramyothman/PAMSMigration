CREATE VIEW [dbo].[GRTotalDeliveredInqStatus]
AS
SELECT     InquiryStatus, Year, StatusCount, CustomerID, SupplierID, SupplierName, CompanyName, BranchID
FROM         dbo.GRTotalInquiriesLists
WHERE     (InquiryStatus = N'Delivered')
