/****** Object:  View [dbo].[GetAllCustomers]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllCustomers]
AS
SELECT DISTINCT 
dbo.Customers.CustomerID, dbo.Customers.CompanyName, dbo.Customers.CompanyWebSite
, dbo.Customers.ContactTitle, dbo.Customers.ContactName
, dbo.Customers.ContactDisplayName, dbo.Customers.ContactHomePhone
, dbo.Customers.ContactWorkPhone, dbo.Customers.ContactMobile
, dbo.Customers.ContactEmail, dbo.Customers.ContactAddress, dbo.Customers.ContactCountry
, dbo.Customers.ContactCity, dbo.Customers.ContactZip
,dbo.Customers.ContactFax, dbo.Customers.UserName, dbo.Customers.ModifiedDate
, dbo.Customers.CompanyCode, dbo.Customers.CustomerTypeID ,dbo.Customers.CustomerMarketID
, dbo.CustomersTypes.CustomerType, dbo.CustomerMarkets.CustomerMarket, dbo.CustomersPhones.CustomerPhoneID
,dbo.CustomersPhones.PhoneNumber, dbo.CustomersPhones.PhoneNumberTypeId, dbo.CustomersPhones.MainPhone
,Person.PhoneNumberType.Name AS PhoneNumberTypeName, dbo.CustomersEmailAddress.CustomerEmailAddressID
,dbo.CustomersEmailAddress.EmailAddressTypeId, dbo.CustomersEmailAddress.Email, dbo.CustomersEmailAddress.MainEmailAddress
,Person.EmailAddressType.Name AS EmailAddressTypeName, dbo.CustomerAddress.CustomerAddressID, dbo.CustomerAddress.AddressTypeID
,dbo.CustomerAddress.Address, dbo.CustomerAddress.CountryRegionCode, dbo.CustomerAddress.CityID, dbo.CustomerAddress.PostalCode
,dbo.CustomerAddress.ZipCode, dbo.CustomerAddress.MainAddress, dbo.Cities.City, Person.AddressType.Name AS AddressTypeName
,dbo.CustomersPhones.ContactName AS PhoneContactName, dbo.Customers.CountryID, dbo.CompanyCountries.CountryName, dbo.CustomerBranches.BranchID
,dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID AS BranchCountryID
,CompanyCountries_1.CountryName AS BranchCountryName, dbo.CustomerBranches.BranchID AS Expr1
FROM  dbo.Customers INNER JOIN
dbo.CustomerBranches 
INNER JOIN dbo.CompanyBranches INNER JOIN
dbo.CompanyCountries AS CompanyCountries_1 
ON dbo.CompanyBranches.CountryID = CompanyCountries_1.ID AND 
dbo.CompanyBranches.CountryID = CompanyCountries_1.ID AND dbo.CompanyBranches.CountryID = CompanyCountries_1.ID AND 
dbo.CompanyBranches.CountryID = CompanyCountries_1.ID AND dbo.CompanyBranches.CountryID = CompanyCountries_1.ID AND 
dbo.CompanyBranches.CountryID = CompanyCountries_1.ID 
ON dbo.CustomerBranches.BranchID = dbo.CompanyBranches.ID ON 
dbo.CustomerBranches.CustomerID = dbo.Customers.CustomerID 
AND dbo.CustomerBranches.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
dbo.CompanyCountries ON dbo.Customers.CountryID = dbo.CompanyCountries.ID LEFT OUTER JOIN
dbo.Cities RIGHT OUTER JOIN
dbo.CustomerAddress ON dbo.Cities.ID = dbo.CustomerAddress.CityID ON dbo.Customers.CustomerID = dbo.CustomerAddress.CustomerID LEFT OUTER JOIN
Person.EmailAddressType RIGHT OUTER JOIN
dbo.CustomersEmailAddress ON Person.EmailAddressType.EmailAddressTypeId = dbo.CustomersEmailAddress.EmailAddressTypeId ON 
dbo.Customers.CustomerID = dbo.CustomersEmailAddress.CustomerID LEFT OUTER JOIN
Person.PhoneNumberType RIGHT OUTER JOIN
dbo.CustomersPhones ON Person.PhoneNumberType.PhoneNumberTypeId = dbo.CustomersPhones.PhoneNumberTypeId ON 
dbo.Customers.CustomerID = dbo.CustomersPhones.CustomerID LEFT OUTER JOIN
dbo.CustomerMarkets ON dbo.Customers.CustomerMarketID = dbo.CustomerMarkets.ID LEFT OUTER JOIN
dbo.CustomersTypes ON dbo.Customers.CustomerTypeID = dbo.CustomersTypes.ID LEFT OUTER JOIN
Person.AddressType ON dbo.CustomerAddress.AddressTypeID = Person.AddressType.AddressTypeId
WHERE     
(dbo.CustomerAddress.MainAddress = 'True' OR dbo.CustomerAddress.MainAddress IS NULL) 
AND (dbo.CustomersPhones.MainPhone = 'True' OR dbo.CustomersPhones.MainPhone IS NULL) 
AND (dbo.CustomersEmailAddress.MainEmailAddress = 'True' OR  dbo.CustomersEmailAddress.MainEmailAddress IS NULL)
