CREATE VIEW [dbo].[ViewFullEmployeeWorkLoadOfferAll]
AS
SELECT     dbo.ViewEmployeeWorkLoadOfferAll.ResponsibleEngineerID, dbo.ViewEmployeeWorkLoadOfferAll.InquiryType, dbo.ViewEmployeeWorkLoadOfferAll.InquiryNumbers, 
                      dbo.ViewEmployeeWorkLoadOfferAll.PointsInquiry, dbo.ViewEmployeeWorkLoadOfferAll.InquiryQuotationPriceSum, 
                      dbo.ViewEmployeeWorkLoadOfferAll.PointsValueSum, dbo.ViewEmployeeWorkLoadOfferAll.PointsSum * 100 AS PointsSum, Person.PersonLanguages.LanguageId, 
                      Person.PersonLanguages.DisplayName, 
                      Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      dbo.ViewEmployeeWorkLoadOfferAll.BranchID
FROM         dbo.ViewEmployeeWorkLoadOfferAll INNER JOIN
                      Person.PersonLanguages ON dbo.ViewEmployeeWorkLoadOfferAll.ResponsibleEngineerID = Person.PersonLanguages.PersonId
WHERE     (Person.PersonLanguages.LanguageId = 1)
