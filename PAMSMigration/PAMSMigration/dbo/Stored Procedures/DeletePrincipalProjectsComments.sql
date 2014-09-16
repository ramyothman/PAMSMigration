CREATE PROCEDURE [dbo].[DeletePrincipalProjectsComments]
    @ID int
AS
Begin
 Delete [dbo].[PrincipalProjectsComments] where     [ID] = @ID
End
