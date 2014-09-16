/****** Object:  View [dbo].[GetAllVisitPurposes]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllVisitPurposes]
AS
SELECT     dbo.VisitPurposes.ID, dbo.VisitPurposes.VisitID, dbo.VisitPurposes.Reason, dbo.VisitPurposes.AchivmentID, dbo.VisitPurposes.UserName, 
                      dbo.VisitPurposes.ModifiedDate, dbo.VisitsAchievments.Achievment
FROM         dbo.VisitPurposes INNER JOIN
                      dbo.VisitsAchievments ON dbo.VisitPurposes.AchivmentID = dbo.VisitsAchievments.ID
