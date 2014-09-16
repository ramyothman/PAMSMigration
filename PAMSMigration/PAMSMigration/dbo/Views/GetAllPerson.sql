/****** Object:  View [dbo].[GetAllPerson]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPerson]
AS
SELECT     Person.Person.BusinessEntityId, Person.Person.NameStyle, Person.Person.EmailPromotion, Person.Person.RowGuid, Person.Person.ModifiedDate, 
                      Person.Person.CreatedDate, Person.Person.PersonImage, Person.Person.IsActive, dbo.PersonsBranches.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM dbo.CompanyCountries INNER JOIN dbo.CompanyBranches 
	 ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
	 INNER JOIN Person.Person INNER JOIN Person.BusinessEntity 
	 ON Person.Person.BusinessEntityId = Person.BusinessEntity.BusinessEntityId 
	 inner join dbo.PersonsBranches 
	 on Person.BusinessEntity.BusinessEntityId = dbo.PersonsBranches.BranchID
     ON dbo.CompanyBranches.ID = dbo.PersonsBranches.BranchID
