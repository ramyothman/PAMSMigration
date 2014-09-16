CREATE VIEW [dbo].[GetAllCustomersAddresses]
AS
SELECT     dbo.CustomerAddress.CustomerAddressID, dbo.CustomerAddress.CustomerID, dbo.CustomerAddress.Address, ISNULL(dbo.CustomerAddress.CountryRegionCode, '') 
                      AS CountryRegionCode, ISNULL(dbo.CustomerAddress.PostalCode, '') AS PostalCode, ISNULL(dbo.CustomerAddress.ZipCode, '') AS ZipCode, 
                      dbo.CustomerAddress.UserName, dbo.CustomerAddress.ModifiedDate, dbo.CustomerAddress.MainAddress, ISNULL(dbo.CustomerAddress.CityID, 0) AS CityID, 
                      ISNULL(dbo.Cities.City, '') AS CityName, ISNULL(Person.CountryRegion.Name, '') AS CountryName, dbo.CustomerAddress.AddressTypeID, 
                      Person.AddressType.Name AS AddressTypeName
FROM         dbo.CustomerAddress LEFT OUTER JOIN
                      Person.AddressType ON dbo.CustomerAddress.AddressTypeID = Person.AddressType.AddressTypeId LEFT OUTER JOIN
                      dbo.Cities ON dbo.CustomerAddress.CityID = dbo.Cities.ID LEFT OUTER JOIN
                      Person.CountryRegion ON dbo.CustomerAddress.CountryRegionCode = Person.CountryRegion.CountryRegionCode
