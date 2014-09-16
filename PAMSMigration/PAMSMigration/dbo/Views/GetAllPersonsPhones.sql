/****** Object:  View [dbo].[GetAllPersonsPhones]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonsPhones]
AS
SELECT     Person.PersonPhone.PersonPhoneId, Person.PersonPhone.BusinessEntityId, Person.PersonPhone.PhoneNumber, Person.PersonPhone.PhoneNumberTypeId, 
                      Person.PersonPhone.PhoneVerified, Person.PersonPhone.PhoneVerificationCode, Person.PhoneNumberType.Name AS PhoneNumberTypeName, 
                      Person.PersonPhone.MainPhone
FROM         Person.PersonPhone INNER JOIN
                      Person.PhoneNumberType ON Person.PersonPhone.PhoneNumberTypeId = Person.PhoneNumberType.PhoneNumberTypeId
