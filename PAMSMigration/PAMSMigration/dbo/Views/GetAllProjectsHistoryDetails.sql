CREATE VIEW [dbo].[GetAllProjectsHistoryDetails]
AS
SELECT     dbo.ProjectsHistoryDetails.ID, dbo.ProjectsHistoryDetails.ProjectHistoryID, dbo.ProjectsHistoryDetails.OrderStatusID, dbo.ProjectsHistoryDetails.InquiryStatusID, 
                      dbo.ProjectsHistoryDetails.UserName, dbo.ProjectsHistoryDetails.ModifiedDate, dbo.OrderStatus.Name AS OrderStatusName, 
                      dbo.InquiryStatus.Name AS InquiryStatusName
FROM         dbo.ProjectsHistoryDetails LEFT OUTER JOIN
                      dbo.InquiryStatus ON dbo.ProjectsHistoryDetails.InquiryStatusID = dbo.InquiryStatus.ID LEFT OUTER JOIN
                      dbo.OrderStatus ON dbo.ProjectsHistoryDetails.OrderStatusID = dbo.OrderStatus.ID
