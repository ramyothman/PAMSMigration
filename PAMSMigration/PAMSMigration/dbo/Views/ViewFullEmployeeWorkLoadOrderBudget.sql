CREATE VIEW [dbo].[ViewFullEmployeeWorkLoadOrderBudget]
AS
SELECT     dbo.ViewEmployeeWorkLoadOrderBudget.ResponsibleEngineerID, dbo.ViewEmployeeWorkLoadOrderBudget.InquiryType, 
                      dbo.ViewEmployeeWorkLoadOrderBudget.InquiryNumbers, dbo.ViewEmployeeWorkLoadOrderBudget.PointsInquiry, 
                      dbo.ViewEmployeeWorkLoadOrderBudget.InquiryQuotationPriceSum, dbo.ViewEmployeeWorkLoadOrderBudget.PointsValueSum, 
                      dbo.ViewEmployeeWorkLoadOrderBudget.PointsSum * 100 AS PointsSum, Person.PersonLanguages.LanguageId, Person.PersonLanguages.DisplayName, 
                      Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      dbo.ViewEmployeeWorkLoadOrderBudget.BranchID
FROM         dbo.ViewEmployeeWorkLoadOrderBudget INNER JOIN
                      Person.PersonLanguages ON dbo.ViewEmployeeWorkLoadOrderBudget.ResponsibleEngineerID = Person.PersonLanguages.PersonId
