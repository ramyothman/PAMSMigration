CREATE PROCEDURE [dbo].[DeleteVisitAttendeesDetails]
    @VisitAttendeesDetailsId int
AS
Begin
 Delete [dbo].[VisitsAttendeesDetails]
  where     VisitAttendeesDetailsId = @VisitAttendeesDetailsId
End
