/****** Object:  View [dbo].[GetAllProjectsJobs]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllProjectsJobs]
AS
SELECT     TOP (100) PERCENT dbo.Inquiries.InquiryNumber, Person.PersonLanguages.DisplayName, dbo.Inquiries.ResponsibleEngineerID, 
                      Person.PersonLanguages.LanguageId, dbo.ProjectTypes.ProjectType, dbo.Inquiries.ProjectID, dbo.Inquiries.ProjectTypeID, dbo.Projects.ProjectCode, 
                      dbo.Projects.ProjectName, dbo.ProjectTypes.OrderByType, dbo.Inquiries.ShotecNo, dbo.Inquiries.IsSubOffer, dbo.Suppliers.SupplierName, 
                      dbo.Inquiries.SupplierID
FROM         dbo.Inquiries INNER JOIN
                      dbo.ProjectTypes ON dbo.Inquiries.ProjectTypeID = dbo.ProjectTypes.ID INNER JOIN
                      dbo.Projects ON dbo.Inquiries.ProjectID = dbo.Projects.ID INNER JOIN
                      Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID AND dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID
ORDER BY dbo.ProjectTypes.OrderByType
