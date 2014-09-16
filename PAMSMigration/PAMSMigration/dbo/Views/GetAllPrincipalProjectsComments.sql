/****** Object:  View [dbo].[GetAllPrincipalProjectsComments]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPrincipalProjectsComments]
AS
SELECT     dbo.PrincipalProjectsComments.ID, dbo.PrincipalProjectsComments.InquiryNumber, dbo.PrincipalProjectsComments.Comment, 
                      dbo.PrincipalProjectsComments.ModifiedDate, dbo.PrincipalProjectsComments.UserName, dbo.Suppliers.SupplierName, dbo.Inquiries.ShotecNo, 
                      dbo.PrincipalProjectsComments.CommentedByID, dbo.Inquiries.SupplierID, Person.PersonLanguages.DisplayName AS CommentedByName
FROM         dbo.PrincipalProjectsComments INNER JOIN
                      dbo.Inquiries ON dbo.PrincipalProjectsComments.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      Person.PersonLanguages ON dbo.PrincipalProjectsComments.CommentedByID = Person.PersonLanguages.PersonId
