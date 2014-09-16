CREATE PROCEDURE [dbo].[DeleteVisitDetails]
    @VisitDetailsId int
AS
Begin
 Delete [dbo].[VisitDetails] where     [VisitDetailsId] = @VisitDetailsId
End
