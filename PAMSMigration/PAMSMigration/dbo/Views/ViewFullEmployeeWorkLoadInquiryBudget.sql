CREATE VIEW [dbo].[ViewFullEmployeeWorkLoadInquiryBudget]
AS
SELECT     dbo.ViewEmployeeWorkLoadInquiryBudget.ResponsibleEngineerID, dbo.ViewEmployeeWorkLoadInquiryBudget.InquiryType, 
                      dbo.ViewEmployeeWorkLoadInquiryBudget.InquiryNumbers, dbo.ViewEmployeeWorkLoadInquiryBudget.PointsInquiry, 
                      dbo.ViewEmployeeWorkLoadInquiryBudget.InquiryQuotationPriceSum, dbo.ViewEmployeeWorkLoadInquiryBudget.PointsValueSum, 
                      dbo.ViewEmployeeWorkLoadInquiryBudget.PointsSum * 100 AS PointsSum, Person.PersonLanguages.LanguageId, Person.PersonLanguages.DisplayName, 
                      Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      dbo.ViewEmployeeWorkLoadInquiryBudget.BranchID
FROM         dbo.ViewEmployeeWorkLoadInquiryBudget INNER JOIN
                      Person.PersonLanguages ON dbo.ViewEmployeeWorkLoadInquiryBudget.ResponsibleEngineerID = Person.PersonLanguages.PersonId
WHERE     (Person.PersonLanguages.LanguageId = 1)
