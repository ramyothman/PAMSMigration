CREATE VIEW [dbo].[GetAllSuppliersPhones]
AS
SELECT     dbo.SuppliersPhones.SupplierPhoneID, dbo.SuppliersPhones.SupplierID, dbo.SuppliersPhones.PhoneNumber, dbo.SuppliersPhones.PhoneNumberTypeId, 
                      dbo.SuppliersPhones.ModifiedDate, dbo.SuppliersPhones.MainPhone, Person.PhoneNumberType.Name AS PhoneTypeName, dbo.SuppliersPhones.UserName, 
                      dbo.SuppliersPhones.ContactName
FROM         dbo.SuppliersPhones LEFT OUTER JOIN
                      Person.PhoneNumberType ON dbo.SuppliersPhones.PhoneNumberTypeId = Person.PhoneNumberType.PhoneNumberTypeId
