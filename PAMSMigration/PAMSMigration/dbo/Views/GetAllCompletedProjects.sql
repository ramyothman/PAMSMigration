/****** Object:  View [dbo].[GetAllCompletedProjects]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllCompletedProjects]
AS
SELECT     dbo.CompletedProjects.InquiryNumber, dbo.CompletedProjects.HasCommission, dbo.CompletedProjects.IsAllGuranteesClosed, 
                      dbo.CompletedProjects.GuaranteesClosedDate, dbo.CompletedProjects.IsAllCommissionPaid, dbo.CompletedProjects.AllCommssionPaidDate, 
                      dbo.CompletedProjects.UserName, dbo.CompletedProjects.ModifiedDate, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.CompletedProjects INNER JOIN
                      dbo.Inquiries ON dbo.CompletedProjects.InquiryNumber = dbo.Inquiries.InquiryNumber ON dbo.CompanyBranches.ID = dbo.Inquiries.BranchID
