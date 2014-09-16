CREATE PROCEDURE [dbo].[DeleteVisitEngineers]
    @ID int
AS
Begin
 Delete [dbo].[VisitEngineers] where     [ID] = @ID
End
