/****** Object:  View [dbo].[GetAllPersonsMails]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonsMails]
AS
SELECT     Person.EmailAddress.EmailAddressId, Person.EmailAddress.BusinessEntityId, Person.EmailAddress.EmailAddressTypeId, Person.EmailAddress.Email, 
                      Person.EmailAddress.EmailVerified, Person.EmailAddress.EmailVerificationHash, Person.EmailAddress.MainEmailAddress, 
                      Person.EmailAddressType.Name AS EmailAddressTypeName
FROM         Person.EmailAddress INNER JOIN
                      Person.EmailAddressType ON Person.EmailAddress.EmailAddressTypeId = Person.EmailAddressType.EmailAddressTypeId
