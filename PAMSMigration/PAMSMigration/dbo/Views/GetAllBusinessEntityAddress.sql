CREATE VIEW [dbo].[GetAllBusinessEntityAddress]
AS
SELECT     Person.BusinessEntityAddress.BusinessEntityAddressId, Person.BusinessEntityAddress.BusinessEntityId, Person.BusinessEntityAddress.AddressId, 
                      Person.BusinessEntityAddress.AddressTypeId, Person.BusinessEntityAddress.RowGuid, Person.BusinessEntityAddress.ModifiedDate, Person.Address.Address, 
                      Person.Address.CountryRegionCode, Person.Address.CityID, Person.Address.StateProvinceId, Person.Address.PostalCode, Person.Address.ZipCode, 
                      Person.Address.SpatialLocation, Person.CountryRegion.Name AS CountryName, dbo.Cities.City
FROM         Person.BusinessEntityAddress INNER JOIN
                      Person.Address ON Person.BusinessEntityAddress.AddressId = Person.Address.AddressId INNER JOIN
                      Person.CountryRegion ON Person.Address.CountryRegionCode = Person.CountryRegion.CountryRegionCode LEFT OUTER JOIN
                      dbo.Cities ON Person.Address.CityID = dbo.Cities.ID
