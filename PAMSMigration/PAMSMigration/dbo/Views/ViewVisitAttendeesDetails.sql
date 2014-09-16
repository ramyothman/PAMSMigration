CREATE VIEW [dbo].[ViewVisitAttendeesDetails]
AS
SELECT     dbo.Visits.VisitId, dbo.Visits.VisitNo, dbo.Visits.CustomerId, dbo.Visits.Finalized, dbo.Visits.StartDateTime, dbo.Visits.EndDateTime, dbo.Visits.Accomplishment, 
                      dbo.Visits.PendingTasks, dbo.Visits.VisitComments, dbo.Visits.Place, dbo.VisitsAttendeesDetails.VisitAttendeesDetailsId, dbo.VisitsAttendeesDetails.Attendees, 
                      dbo.VisitsAttendeesDetails.Position, dbo.Visits.BranchID
FROM         dbo.Visits INNER JOIN
                      dbo.VisitsAttendeesDetails ON dbo.Visits.VisitId = dbo.VisitsAttendeesDetails.VisitId
