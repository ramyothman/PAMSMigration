CREATE VIEW [dbo].[GetAllCities]
AS
SELECT     Person.CountryRegion.CountryRegionCode, Person.CountryRegion.Name, dbo.Cities.ID, dbo.Cities.City, dbo.Cities.UserName, dbo.Cities.ModifiedDate
FROM         dbo.Cities INNER JOIN
                      Person.CountryRegion ON dbo.Cities.CountryRegionCode = Person.CountryRegion.CountryRegionCode
