CREATE VIEW [dbo].[ViewFullEmployeeWorkLoadOfferBudget]
AS
SELECT     dbo.ViewEmployeeWorkLoadOfferBudget.ResponsibleEngineerID, dbo.ViewEmployeeWorkLoadOfferBudget.InquiryType, 
                      dbo.ViewEmployeeWorkLoadOfferBudget.InquiryNumbers, dbo.ViewEmployeeWorkLoadOfferBudget.PointsInquiry, 
                      dbo.ViewEmployeeWorkLoadOfferBudget.InquiryQuotationPriceSum, dbo.ViewEmployeeWorkLoadOfferBudget.PointsValueSum, 
                      dbo.ViewEmployeeWorkLoadOfferBudget.PointsSum * 100 AS PointsSum, 
                      Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      Person.PersonLanguages.LanguageId, Person.PersonLanguages.DisplayName, dbo.ViewEmployeeWorkLoadOfferBudget.BranchID
FROM         dbo.ViewEmployeeWorkLoadOfferBudget INNER JOIN
                      Person.PersonLanguages ON dbo.ViewEmployeeWorkLoadOfferBudget.ResponsibleEngineerID = Person.PersonLanguages.PersonId
WHERE     (Person.PersonLanguages.LanguageId = 1)
