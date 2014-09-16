CREATE VIEW [dbo].[GetAllSuppliersEmailAddresses]
AS
SELECT     dbo.SuppliersEmailAddress.SupplierEmailAddressID, dbo.SuppliersEmailAddress.SupplierID, dbo.SuppliersEmailAddress.EmailAddressTypeId, 
                      dbo.SuppliersEmailAddress.Email, dbo.SuppliersEmailAddress.ModifiedDate, dbo.SuppliersEmailAddress.MainEmailAddress, dbo.SuppliersEmailAddress.UserName, 
                      Person.EmailAddressType.Name AS EmailAdderssTypeName
FROM         dbo.SuppliersEmailAddress INNER JOIN
                      Person.EmailAddressType ON dbo.SuppliersEmailAddress.EmailAddressTypeId = Person.EmailAddressType.EmailAddressTypeId
