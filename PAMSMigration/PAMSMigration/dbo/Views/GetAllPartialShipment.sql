/****** Object:  View [dbo].[GetAllPartialShipment]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPartialShipment]
AS
SELECT     dbo.PartialShipment.PartialShipmentID, dbo.PartialShipment.ShipmentNumber, dbo.PartialShipment.InquiryNumber, dbo.PartialShipment.InvoiceNumber, 
                      dbo.PartialShipment.ShipmentDate, dbo.PartialShipment.ItemDescription, dbo.PartialShipment.Price, dbo.PartialShipment.CurrencyID, 
                      dbo.PartialShipment.RateToEuro, dbo.PartialShipment.RateDate, dbo.PartialShipment.PriceInEuro, dbo.PartialShipment.Remarks, dbo.PartialShipment.UserName, 
                      dbo.PartialShipment.ModifiedDate, dbo.Inquiries.OfferDate, dbo.Inquiries.SupplierID, dbo.Inquiries.ProductTypeID, dbo.Inquiries.ProjectTypeID, 
                      dbo.Currencies.CurrencyCode, dbo.Suppliers.SupplierName, dbo.Inquiries.ShotecNo, dbo.Customers.CustomerID, dbo.Customers.CompanyCode, 
                      dbo.Customers.CompanyName, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName, dbo.Inquiries.BranchID, dbo.PartialShipment.InvoiceValue, dbo.PartialShipment.InvoiceValueinEuro
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.PartialShipment INNER JOIN
                      dbo.Inquiries ON dbo.PartialShipment.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      dbo.Currencies ON dbo.PartialShipment.CurrencyID = dbo.Currencies.ID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID ON dbo.CompanyBranches.ID = dbo.Inquiries.BranchID
