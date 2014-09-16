/****** Object:  View [dbo].[GetAllProjectsComments]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllProjectsComments]
AS
SELECT     dbo.ProjectsComments.ProjectCommentID, dbo.ProjectsComments.ProjectID, dbo.ProjectsComments.Comment, dbo.ProjectsComments.UserName, 
                      dbo.ProjectsComments.ModifiedDate, dbo.Projects.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.Projects.IsGeneral, dbo.ProjectsComments.ProjectStatusID, 
                      dbo.ProjectsStatuses.ProjectStatus
FROM         dbo.ProjectsStatuses INNER JOIN
                      dbo.ProjectsComments INNER JOIN
                      dbo.Projects ON dbo.ProjectsComments.ProjectID = dbo.Projects.ID ON dbo.ProjectsStatuses.ID = dbo.Projects.ProjectStatusID LEFT OUTER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON 
                      dbo.Projects.BranchID = dbo.CompanyBranches.ID
