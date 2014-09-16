/****** Object:  View [dbo].[GetAllVisitAttendeesDetails]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllVisitAttendeesDetails]
AS
SELECT     VisitAttendeesDetailsId, VisitId, Attendees, Position
FROM         dbo.VisitsAttendeesDetails
