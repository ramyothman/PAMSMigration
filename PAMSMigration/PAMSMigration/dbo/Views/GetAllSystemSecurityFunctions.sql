CREATE VIEW [dbo].[GetAllSystemSecurityFunctions]
AS
SELECT     dbo.SystemSecurityFunctions.ID, dbo.SystemSecurityFunctions.SecurityFunction, dbo.SystemSecurityFunctions.PageID, dbo.SystemSecurityFunctions.IsActive, 
                      dbo.SystemPages.ModCode, dbo.SystemSecurityFunctions.SecurityFunctionCode
FROM         dbo.SystemSecurityFunctions LEFT OUTER JOIN
                      dbo.SystemPages ON dbo.SystemSecurityFunctions.PageID = dbo.SystemPages.ID
