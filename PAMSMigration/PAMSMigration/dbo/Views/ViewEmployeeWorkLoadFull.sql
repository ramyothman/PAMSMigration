CREATE VIEW [dbo].[ViewEmployeeWorkLoadFull]
AS
SELECT     dbo.ViewEmployeeWorkLoad.ResponsibleEngineerID, dbo.ViewEmployeeWorkLoad.InquiryType, dbo.ViewEmployeeWorkLoad.InquiryNumbers, 
                      dbo.ViewEmployeeWorkLoad.PointsInquiry, dbo.ViewEmployeeWorkLoad.InquiryQuotationPriceSum, dbo.ViewEmployeeWorkLoad.PointsValueSum, 
                      dbo.ViewEmployeeWorkLoad.PointsSum * 100 AS PointsSum, 
                      Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      Person.PersonLanguages.DisplayName, Person.PersonLanguages.LanguageId, dbo.ViewEmployeeWorkLoad.BranchID
FROM         dbo.ViewEmployeeWorkLoad INNER JOIN
                      Person.PersonLanguages ON dbo.ViewEmployeeWorkLoad.ResponsibleEngineerID = Person.PersonLanguages.PersonId
WHERE     (Person.PersonLanguages.LanguageId = 1)
