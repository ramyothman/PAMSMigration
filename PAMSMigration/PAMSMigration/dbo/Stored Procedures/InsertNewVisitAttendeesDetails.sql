CREATE PROCEDURE [dbo].[InsertNewVisitAttendeesDetails]
    @VisitId int,    
    @Attendees nvarchar(150),
    @Position nvarchar(150)
AS
INSERT INTO [dbo].[VisitsAttendeesDetails] (
    [VisitId],    
    [Attendees],   
    [Position])
Values (
    @VisitId,   
    @Attendees,  
    @Position
    )
IF @@ROWCOUNT > 0
Select * from VisitsAttendeesDetails
Where VisitAttendeesDetailsId = @@identity
