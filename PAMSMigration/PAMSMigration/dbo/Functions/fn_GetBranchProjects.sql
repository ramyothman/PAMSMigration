-------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[fn_GetBranchProjects]
(@BranchID int)
RETURNS TABLE 
AS
RETURN 
(	
SELECT     dbo.Projects.ID, dbo.Projects.ProjectCode, dbo.Projects.ProjectName, dbo.Projects.ProjectLocation, dbo.Projects.ProjectDescription, dbo.Projects.ContactTitle, 
                      dbo.Projects.ContactName, dbo.Projects.ContactHomePhone, dbo.Projects.ContactWorkPhone, dbo.Projects.ContactMobile, dbo.Projects.ContactEmail, 
                      dbo.Projects.ContactAddress, dbo.Projects.ContactCountry, dbo.Projects.ContactCity, dbo.Projects.ContactZip, dbo.Projects.ContactFax, dbo.Projects.UserName, 
                      dbo.Projects.ModifiedDate, dbo.Projects.FinalProduct, dbo.Projects.StartDate, dbo.Projects.EstimatedCost, dbo.Projects.EstimatedCostCurrencyID, 
                      dbo.Projects.Shareholders, dbo.Projects.LicenseBy, dbo.Projects.EngineeringBy, dbo.Projects.ProcurementBy, dbo.Projects.Contractor, dbo.Projects.EPC, 
                      dbo.Projects.VendorlistBy, dbo.Currencies.CurrencyCode, dbo.Currencies.CurrencyName, dbo.Projects.ProjectStatusID, dbo.ProjectsStatuses.ProjectStatus, 
                      dbo.Projects.ContactPosition, dbo.Projects.ContactCompany, dbo.Projects.OwnerID
                      ,BC.CompanyCode,BC.CompanyWebSite,BC.Address
					  ,BC.CountryRegionCode,BC.MainAddress,BC.City,BC.AddressTypeName
					  ,BC.ZipCode,BC.PostalCode,0 AS InquiryCount, 0 AS OfferCount, 0 AS OrderCount, 
                      0 AS GoodsDeliveredCount, 0 AS GoodsPaidCount, 0 AS CompletedCount, 0 AS LostCount, 0 AS RegretCount, 0 AS CancelledCount, 0 AS LateResponseCount, 
                      dbo.Projects.EngineeringByID, Customers_1.CompanyCode AS EngineeringByCode, Customers_1.CompanyName AS EngineeringByName, 
                      dbo.Projects.ProcurementByID, dbo.Customers.CompanyCode AS ProcurementByCode, dbo.Customers.CompanyName AS ProcurementName, 
                      dbo.Projects.ContractorID, Customers_2.CompanyCode AS ContractorByCode, Customers_2.CompanyName AS ContractorByName, dbo.Projects.BranchID, 
                      dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
                      dbo.Projects.IsGeneral
FROM         
dbo.Customers AS Customers_2 RIGHT OUTER JOIN
dbo.Projects INNER JOIN
dbo.ProjectsStatuses ON dbo.Projects.ProjectStatusID = dbo.ProjectsStatuses.ID LEFT OUTER JOIN
dbo.CompanyCountries INNER JOIN
dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
ON dbo.Projects.BranchID = dbo.CompanyBranches.ID 
ON Customers_2.CustomerID = dbo.Projects.ContractorID LEFT OUTER JOIN
dbo.Customers ON dbo.Projects.ProcurementByID = dbo.Customers.CustomerID LEFT OUTER JOIN
dbo.Customers AS Customers_1 
ON dbo.Projects.EngineeringByID = Customers_1.CustomerID 
left outer join dbo.fn_GetBranchCustomers(@BranchID) as BC
ON dbo.Projects.OwnerID = BC.CustomerID 
LEFT OUTER JOIN dbo.Currencies 
ON dbo.Projects.EstimatedCostCurrencyID = dbo.Currencies.ID
)
