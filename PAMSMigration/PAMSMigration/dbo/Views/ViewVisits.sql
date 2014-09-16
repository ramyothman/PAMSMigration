CREATE VIEW [dbo].[ViewVisits]
AS
SELECT     dbo.Visits.VisitId, dbo.Visits.VisitNo, dbo.Visits.CustomerId, dbo.Visits.Finalized, dbo.Visits.StartDateTime, dbo.Visits.EndDateTime, dbo.Visits.Accomplishment, 
                      dbo.Visits.PendingTasks, dbo.Visits.VisitComments, dbo.VisitDetails.SupplierId, dbo.VisitDetails.ReferencedShotecNumbers, dbo.VisitDetails.CustomerNotes, 
                      dbo.VisitDetails.EngineerNotes, dbo.VisitDetails.Satisfied, dbo.VisitDetails.Reason AS DetailsReason, dbo.Visits.Place, dbo.Visits.Reason, dbo.Visits.ReportDate, 
                      dbo.Visits.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName
FROM         dbo.VisitDetails RIGHT OUTER JOIN
                      dbo.Visits INNER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON dbo.Visits.BranchID = dbo.CompanyBranches.ID ON dbo.VisitDetails.VisitId = dbo.Visits.VisitId
