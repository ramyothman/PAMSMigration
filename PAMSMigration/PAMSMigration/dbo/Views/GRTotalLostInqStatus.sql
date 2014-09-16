﻿CREATE VIEW [dbo].[GRTotalLostInqStatus]
AS
SELECT     InquiryStatus, Year, StatusCount, CustomerID, SupplierID, SupplierName, CompanyName, BranchID
FROM         dbo.GRTotalInquiriesLists
WHERE     (InquiryStatus = N'Lost')
