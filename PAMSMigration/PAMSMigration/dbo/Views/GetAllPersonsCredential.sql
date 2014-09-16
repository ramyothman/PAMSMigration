/****** Object:  View [dbo].[GetAllPersonsCredential]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonsCredential]
AS
SELECT     Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      Person.Credential.BusinessEntityId, Person.Credential.Username, Person.Credential.PasswordHash, Person.Credential.IsActive, 
                      Person.PersonPersonTypes.Name AS PersonType, Person.PersonType.PersonTypeId, Person.PersonType.PersonPersonTypesId, Person.PersonType.ModifiedDate, 
                      Person.PersonLanguages.LanguageId, Person.PersonLanguages.DisplayName, dbo.GetUserRoles(Person.Credential.BusinessEntityId) AS UserLevels, 
                      dbo.PersonsBranches.ID, dbo.PersonsBranches.BranchID, dbo.CompanyCountries.CountryName, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID
FROM         Person.PersonLanguages RIGHT OUTER JOIN
                      dbo.CompanyBranches INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID INNER JOIN
                      dbo.PersonsBranches ON dbo.CompanyBranches.ID = dbo.PersonsBranches.BranchID RIGHT OUTER JOIN
                      Person.PersonType INNER JOIN
                      Person.Credential ON Person.PersonType.BusinessEntityId = Person.Credential.BusinessEntityId INNER JOIN
                      Person.PersonPersonTypes ON Person.PersonType.PersonPersonTypesId = Person.PersonPersonTypes.PersonPersonTypesId AND 
                      Person.PersonType.PersonPersonTypesId = Person.PersonPersonTypes.PersonPersonTypesId AND 
                      Person.PersonType.PersonPersonTypesId = Person.PersonPersonTypes.PersonPersonTypesId AND 
                      Person.PersonType.PersonPersonTypesId = Person.PersonPersonTypes.PersonPersonTypesId ON 
                      dbo.PersonsBranches.PersonID = Person.Credential.BusinessEntityId ON Person.PersonLanguages.PersonId = Person.Credential.BusinessEntityId
