/****** Object:  View [dbo].[GetAllAddress]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllAddress]
AS
SELECT     Person.Address.AddressId, Person.Address.Address, Person.Address.CountryRegionCode, Person.Address.CityID, Person.Address.StateProvinceId, 
                      Person.Address.PostalCode, Person.Address.ZipCode, Person.Address.SpatialLocation, Person.Address.RowGuid, Person.Address.ModifiedDate, dbo.Cities.City
FROM         Person.Address INNER JOIN
                      dbo.Cities ON Person.Address.CityID = dbo.Cities.ID
