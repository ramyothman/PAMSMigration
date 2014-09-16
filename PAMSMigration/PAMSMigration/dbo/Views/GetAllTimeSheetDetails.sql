CREATE VIEW [dbo].[GetAllTimeSheetDetails]
AS
SELECT     dbo.TimeSheetDetails.SheetDetailsID, dbo.TimeSheetDetails.InquiryNumber, dbo.TimeSheetDetails.Minutes, dbo.TimeSheetDetails.SupplierID, ISNULL
                          ((SELECT     dbo.Suppliers.SupplierName
                              FROM          dbo.Inquiries AS I INNER JOIN
                                                     dbo.Suppliers ON I.SupplierID = dbo.Suppliers.SupplierID
                              WHERE      (dbo.Inquiries.InquiryNumber = I.InquiryNumber)), Suppliers_1.SupplierName) AS SupplierName, dbo.Inquiries.ShotecNo, 
                      dbo.TimeSheetDetails.TimePercentage, dbo.TimeSheetDetails.SheetID, dbo.TimeSheetDetails.Cost
FROM         dbo.TimeSheetDetails LEFT OUTER JOIN
                      dbo.Inquiries ON dbo.TimeSheetDetails.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.Inquiries.InquiryNumber LEFT OUTER JOIN
                      dbo.Suppliers AS Suppliers_1 ON dbo.TimeSheetDetails.SupplierID = Suppliers_1.SupplierID
