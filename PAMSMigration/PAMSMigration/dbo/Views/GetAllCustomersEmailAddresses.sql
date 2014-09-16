CREATE VIEW [dbo].[GetAllCustomersEmailAddresses]
AS
SELECT     dbo.CustomersEmailAddress.CustomerEmailAddressID, dbo.CustomersEmailAddress.CustomerID, dbo.CustomersEmailAddress.EmailAddressTypeId, 
                      dbo.CustomersEmailAddress.Email, dbo.CustomersEmailAddress.MainEmailAddress, Person.EmailAddressType.Name AS EmailTypeName
FROM         dbo.CustomersEmailAddress INNER JOIN
                      Person.EmailAddressType ON dbo.CustomersEmailAddress.EmailAddressTypeId = Person.EmailAddressType.EmailAddressTypeId
