CREATE VIEW [dbo].[ViewUsers]
AS
SELECT     Person.Credential.Username, Person.Credential.PasswordHash, Person.Credential.IsActive, dbo.GetUserRoles(Person.PersonLanguages.PersonId) AS UserLevels, 
                      Person.Credential.BusinessEntityId AS ID, Person.PersonType.PersonTypeId AS UserType, 
                      (CASE WHEN Person.PersonType.PersonTypeId = 1 THEN Person.PersonLanguages.FirstName + ' ' + Person.PersonLanguages.MiddleName + ' ' + Person.PersonLanguages.LastName
                       END) AS Name, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName, dbo.PersonsBranches.BranchID
FROM         Person.PersonLanguages RIGHT OUTER JOIN
                      Person.PersonType RIGHT OUTER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.PersonsBranches ON dbo.CompanyBranches.ID = dbo.PersonsBranches.BranchID RIGHT OUTER JOIN
                      Person.Credential ON dbo.PersonsBranches.PersonID = Person.Credential.BusinessEntityId ON 
                      Person.PersonType.BusinessEntityId = Person.Credential.BusinessEntityId LEFT OUTER JOIN
                      dbo.Suppliers ON Person.Credential.BusinessEntityId = dbo.Suppliers.SupplierID LEFT OUTER JOIN
                      dbo.Customers ON Person.Credential.BusinessEntityId = dbo.Customers.CustomerID ON Person.PersonLanguages.PersonId = Person.Credential.BusinessEntityId
