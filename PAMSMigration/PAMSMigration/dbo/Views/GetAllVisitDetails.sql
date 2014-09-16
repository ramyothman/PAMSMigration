/****** Object:  View [dbo].[GetAllVisitDetails]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllVisitDetails]
AS
SELECT     dbo.VisitDetails.VisitDetailsId, dbo.VisitDetails.VisitId, dbo.VisitDetails.SupplierId, dbo.VisitDetails.ReferencedShotecNumbers, 
                      dbo.VisitDetails.CustomerNotes, dbo.VisitDetails.EngineerNotes, dbo.VisitDetails.Satisfied, dbo.VisitDetails.Reason, 
                      dbo.Suppliers.SupplierName
FROM         dbo.VisitDetails INNER JOIN
                      dbo.Suppliers ON dbo.VisitDetails.SupplierId = dbo.Suppliers.SupplierID
