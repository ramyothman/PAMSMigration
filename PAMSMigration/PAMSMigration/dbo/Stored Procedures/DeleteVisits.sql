CREATE PROCEDURE [dbo].[DeleteVisits]
    @VisitId int
AS
Begin
 Delete [dbo].[VisitDetails] where     [VisitId] = @VisitId 
Delete [dbo].[VisitEngineers] where     [VisitId] = @VisitId 
Delete [dbo].[VisitPurposes]  where     [VisitId] = @VisitId 
 Delete [dbo].[Visits] where     [VisitId] = @VisitId
End
