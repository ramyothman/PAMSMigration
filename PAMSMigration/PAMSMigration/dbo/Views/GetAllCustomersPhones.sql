CREATE VIEW [dbo].[GetAllCustomersPhones]
AS
SELECT     dbo.CustomersPhones.CustomerPhoneID, dbo.CustomersPhones.CustomerID, dbo.CustomersPhones.PhoneNumber, dbo.CustomersPhones.PhoneNumberTypeId, 
                      dbo.CustomersPhones.ModifiedDate, dbo.CustomersPhones.MainPhone, Person.PhoneNumberType.Name AS PhoneTypeName, dbo.CustomersPhones.ContactName, 
                      dbo.CustomersPhones.UserName
FROM         Person.PhoneNumberType INNER JOIN
                      dbo.CustomersPhones ON Person.PhoneNumberType.PhoneNumberTypeId = dbo.CustomersPhones.PhoneNumberTypeId
