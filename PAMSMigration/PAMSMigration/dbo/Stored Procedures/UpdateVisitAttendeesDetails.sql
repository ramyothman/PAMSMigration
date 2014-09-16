CREATE PROCEDURE [dbo].[UpdateVisitAttendeesDetails]
    @oldVisitAttendeesDetailsId INT,
    @VisitId int,    
    @Attendees nvarchar(150),
    @Position nvarchar(150)
AS
Update [dbo].[VisitsAttendeesDetails]  SET 
    [VisitId] =  @VisitId,    
    [Attendees] = @Attendees,   
    [Position] = @Position
WHERE VisitAttendeesDetailsId = @oldVisitAttendeesDetailsId
