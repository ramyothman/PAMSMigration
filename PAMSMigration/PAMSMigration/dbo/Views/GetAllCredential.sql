/****** Object:  View [dbo].[GetAllCredential]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllCredential]
AS
SELECT     Person.Credential.BusinessEntityId, Person.Credential.Username, Person.Credential.PasswordHash, Person.Credential.PasswordSalt, 
Person.Credential.ActivationCode, Person.Credential.IsActivated, Person.Credential.IsActive, Person.Credential.RowGuid, Person.Credential.ModifiedDate, 
dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         
dbo.CompanyCountries INNER JOIN dbo.CompanyBranches 
ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
Person.Credential INNER JOIN
PersonsBranches ON Person.Credential.BusinessEntityId = PersonsBranches.PersonID 
ON dbo.CompanyBranches.ID = PersonsBranches.BranchID
