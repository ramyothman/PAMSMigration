/****** Object:  View [dbo].[GetAllConcurrentUsers]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllConcurrentUsers]
AS
SELECT     dbo.ConcurrentUsers.ID, dbo.ConcurrentUsers.UserID, Person.Credential.Username AS LoggedInUserName, Person.Credential.IsActive, 
                      dbo.ConcurrentUsers.IPAddress, dbo.ConcurrentUsers.IsIn, dbo.ConcurrentUsers.IsSuspended, dbo.ConcurrentUsers.PulseDate, dbo.ConcurrentUsers.UserName, 
                      dbo.ConcurrentUsers.ModifiedDate, dbo.ConcurrentUsers.LoginDate, dbo.ConcurrentUsers.SuspensionDate, dbo.ConcurrentUsers.LogoutDate, 
                      dbo.ConcurrentUsers.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.ConcurrentUsers INNER JOIN
                      Person.Credential ON dbo.ConcurrentUsers.UserID = Person.Credential.BusinessEntityId ON dbo.CompanyBranches.ID = dbo.ConcurrentUsers.BranchID
