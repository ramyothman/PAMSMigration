/****** Object:  View [dbo].[GetAllProjectsHistory]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllProjectsHistory]
AS
SELECT     TOP 100 PERCENT MAX(dbo.ProjectsHistory.ModifiedDate) AS ModifiedDate, MAX(dbo.ProjectsHistory.UserName) AS UserName, dbo.ProjectTypes.ProjectType, 
                      dbo.ProjectsHistory.InquiryNumber, 0.00 AS Percentage, 0 AS ID, dbo.ProjectsHistory.ProjectTypeID
FROM         dbo.ProjectsHistory INNER JOIN
                      dbo.ProjectTypes ON dbo.ProjectsHistory.ProjectTypeID = dbo.ProjectTypes.ID
GROUP BY dbo.ProjectTypes.ProjectType, dbo.ProjectsHistory.InquiryNumber, dbo.ProjectsHistory.ProjectTypeID
ORDER BY ModifiedDate
