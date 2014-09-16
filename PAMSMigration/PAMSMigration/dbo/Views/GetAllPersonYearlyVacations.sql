CREATE VIEW [dbo].[GetAllPersonYearlyVacations]
AS
SELECT     dbo.PersonYearlyVacations.ID, dbo.PersonYearlyVacations.Year, ISNULL(dbo.PersonYearlyVacations.NumOfVacationsAnnual, 0) AS NumOfVacationsAnnual, 
                      ISNULL(dbo.PersonYearlyVacations.NumOfVacationsCasual, 0) AS NumOfVacationsCasual, Person.PersonLanguages.DisplayName, 
                      Person.PersonLanguages.PersonId, dbo.CompanyBranches.BranchNameFL, dbo.PersonsBranches.BranchID, Person.Person.IsActive
FROM         dbo.PersonsBranches INNER JOIN
                      Person.PersonLanguages ON dbo.PersonsBranches.PersonID = Person.PersonLanguages.PersonId INNER JOIN
                      dbo.CompanyBranches ON dbo.PersonsBranches.BranchID = dbo.CompanyBranches.ID AND dbo.PersonsBranches.BranchID = dbo.CompanyBranches.ID INNER JOIN
                      Person.Person ON Person.PersonLanguages.PersonId = Person.Person.BusinessEntityId AND 
                      Person.PersonLanguages.PersonId = Person.Person.BusinessEntityId AND Person.PersonLanguages.PersonId = Person.Person.BusinessEntityId LEFT OUTER JOIN
                      dbo.PersonYearlyVacations ON Person.PersonLanguages.PersonId = dbo.PersonYearlyVacations.PersonID
WHERE     (Person.Person.IsActive = 1)
