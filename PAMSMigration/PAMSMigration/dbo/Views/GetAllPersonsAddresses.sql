/****** Object:  View [dbo].[GetAllPersonsAddresses]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonsAddresses]
AS
SELECT     Person.BusinessEntityAddress.BusinessEntityAddressId, Person.BusinessEntityAddress.BusinessEntityId, Person.BusinessEntityAddress.AddressId, 
                      Person.Address.Address, Person.Address.CountryRegionCode, ISNULL(Person.Address.CityID, 0) AS CityID, Person.Address.StateProvinceId, 
                      Person.Address.PostalCode, Person.Address.ZipCode, Person.Address.SpatialLocation, Person.StateProvince.StateProvinceCode, 
                      Person.StateProvince.Name AS StateProvinceName, Person.BusinessEntityAddress.AddressTypeId, Person.AddressType.Name AS AddressTypeName, 
                      Person.BusinessEntityAddress.MainAddress, ISNULL(dbo.Cities.City, N'') AS City
FROM         Person.BusinessEntityAddress INNER JOIN
                      Person.AddressType ON Person.BusinessEntityAddress.AddressTypeId = Person.AddressType.AddressTypeId INNER JOIN
                      Person.Address ON Person.BusinessEntityAddress.AddressId = Person.Address.AddressId LEFT OUTER JOIN
                      dbo.Cities ON Person.Address.CityID = dbo.Cities.ID LEFT OUTER JOIN
                      Person.StateProvince ON Person.Address.StateProvinceId = Person.StateProvince.StateProvinceId
