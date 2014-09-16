CREATE VIEW [dbo].[GetAllSuppliersAddresses]
AS
SELECT     dbo.SupplierAddress.SupplierAddressID, dbo.SupplierAddress.SupplierID, dbo.SupplierAddress.Address, ISNULL(dbo.SupplierAddress.CountryRegionCode, '') 
                      AS CountryRegionCode, ISNULL(dbo.SupplierAddress.CityID, 0) AS CityID, ISNULL(dbo.SupplierAddress.PostalCode, '') AS PostalCode, 
                      ISNULL(dbo.SupplierAddress.ZipCode, '') AS ZipCode, dbo.SupplierAddress.UserName, dbo.SupplierAddress.ModifiedDate, dbo.SupplierAddress.MainAddress, 
                      ISNULL(dbo.Cities.City, '') AS CityName, ISNULL(Person.CountryRegion.Name, '') AS CountryRegionName, dbo.SupplierAddress.AddressTypeID, 
                      Person.AddressType.Name AS AddressTypeName
FROM         dbo.SupplierAddress LEFT OUTER JOIN
                      Person.AddressType ON dbo.SupplierAddress.AddressTypeID = Person.AddressType.AddressTypeId LEFT OUTER JOIN
                      dbo.Cities ON dbo.SupplierAddress.CityID = dbo.Cities.ID LEFT OUTER JOIN
                      Person.CountryRegion ON dbo.SupplierAddress.CountryRegionCode = Person.CountryRegion.CountryRegionCode
