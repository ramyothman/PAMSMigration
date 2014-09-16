CREATE PROCEDURE [dbo].[DeleteVisitPurposes]
    @ID int
AS
Begin
 Delete [dbo].[VisitPurposes] where     [ID] = @ID
End
