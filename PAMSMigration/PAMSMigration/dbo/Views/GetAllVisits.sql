/****** Object:  View [dbo].[GetAllVisits]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllVisits]
AS
SELECT        dbo.Visits.VisitId, dbo.Visits.VisitNo, dbo.GetVisitEngineers(dbo.Visits.VisitId) AS ResponsibleEngineers, dbo.Visits.CustomerId, dbo.Visits.Finalized, dbo.Visits.StartDateTime, dbo.Visits.EndDateTime, 
                         dbo.Visits.Accomplishment, dbo.Visits.PendingTasks, dbo.Visits.VisitComments, dbo.Visits.Place, dbo.Customers.CompanyName, dbo.Customers.CompanyCode, dbo.Visits.Reason, dbo.Visits.ReportDate, 
                         dbo.Visits.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM            dbo.CompanyCountries INNER JOIN
                         dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                         dbo.Visits ON dbo.CompanyBranches.ID = dbo.Visits.BranchID INNER JOIN
                         dbo.Customers ON dbo.Visits.CustomerId = dbo.Customers.CustomerID
