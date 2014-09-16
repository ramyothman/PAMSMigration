CREATE VIEW [dbo].[GetAllSuppliers]
AS
SELECT DISTINCT 
                      dbo.Suppliers.SupplierID, dbo.Suppliers.SupplierName, dbo.Suppliers.SupplierWebSite, dbo.Suppliers.ContactTitle, dbo.Suppliers.ContactName, 
                      dbo.Suppliers.ContactDisplayName, dbo.Suppliers.ContactHomePhone, dbo.Suppliers.ContactWorkPhone, dbo.Suppliers.ContactMobile, dbo.Suppliers.ContactEmail, 
                      dbo.Suppliers.ContactAddress, dbo.Suppliers.ContactCountry, dbo.Suppliers.ContactCity, dbo.Suppliers.ContactZip, dbo.Suppliers.ContactFax, 
                      dbo.Suppliers.UserName, dbo.Suppliers.ModifiedDate, dbo.Suppliers.HasSubSuppliers, dbo.Suppliers.IsPrincipale, dbo.Suppliers.CurrentCompany, 
                      dbo.Suppliers.SupplierTypeID, dbo.SuppliersTypes.SupplierType, dbo.SuppliersEmailAddress.SupplierEmailAddressID, 
                      dbo.SuppliersEmailAddress.EmailAddressTypeId, dbo.SuppliersEmailAddress.Email, dbo.SuppliersEmailAddress.MainEmailAddress, 
                      Person.EmailAddressType.Name AS EmailAddressTypeName, Person.AddressType.Name AS AddressTypeName, dbo.SupplierAddress.AddressTypeID, 
                      dbo.SupplierAddress.SupplierAddressID, dbo.SupplierAddress.Address, dbo.SupplierAddress.CountryRegionCode, dbo.SupplierAddress.PostalCode, 
                      dbo.SupplierAddress.ZipCode, dbo.SupplierAddress.MainAddress, dbo.Cities.City, Person.PhoneNumberType.Name AS PhoneNumberTypeName, 
                      dbo.SuppliersPhones.SupplierPhoneID, dbo.SuppliersPhones.PhoneNumber, dbo.SuppliersPhones.PhoneNumberTypeId, dbo.SuppliersPhones.MainPhone, 
                      dbo.SuppliersPhones.ContactName AS PhoneContactName, dbo.SupplierBranch.BranchID AS Expr1, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.Suppliers.IsGeneral, 
                      dbo.SupplierBranch.BranchID
FROM         dbo.Suppliers INNER JOIN
                      dbo.SupplierBranch ON dbo.Suppliers.SupplierID = dbo.SupplierBranch.SupplierID LEFT OUTER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON 
                      dbo.SupplierBranch.BranchID = dbo.CompanyBranches.ID AND dbo.SupplierBranch.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.SuppliersTypes ON dbo.Suppliers.SupplierTypeID = dbo.SuppliersTypes.ID LEFT OUTER JOIN
                      dbo.Cities RIGHT OUTER JOIN
                      dbo.SupplierAddress ON dbo.Cities.ID = dbo.SupplierAddress.CityID LEFT OUTER JOIN
                      Person.AddressType ON dbo.SupplierAddress.AddressTypeID = Person.AddressType.AddressTypeId ON 
                      dbo.Suppliers.SupplierID = dbo.SupplierAddress.SupplierID LEFT OUTER JOIN
                      Person.EmailAddressType RIGHT OUTER JOIN
                      dbo.SuppliersEmailAddress ON Person.EmailAddressType.EmailAddressTypeId = dbo.SuppliersEmailAddress.EmailAddressTypeId ON 
                      dbo.Suppliers.SupplierID = dbo.SuppliersEmailAddress.SupplierID LEFT OUTER JOIN
                      Person.PhoneNumberType RIGHT OUTER JOIN
                      dbo.SuppliersPhones ON Person.PhoneNumberType.PhoneNumberTypeId = dbo.SuppliersPhones.PhoneNumberTypeId ON 
                      dbo.Suppliers.SupplierID = dbo.SuppliersPhones.SupplierID
WHERE     (dbo.SuppliersEmailAddress.MainEmailAddress = 'True' OR
                      dbo.SuppliersEmailAddress.MainEmailAddress IS NULL) AND (dbo.SupplierAddress.MainAddress = 'True' OR
                      dbo.SupplierAddress.MainAddress IS NULL) AND (dbo.SuppliersPhones.MainPhone = 'True' OR
                      dbo.SuppliersPhones.MainPhone IS NULL)
