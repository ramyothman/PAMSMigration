CREATE PROCEDURE [dbo].[DeleteSecurityActivation]
    @SecurityActivationId int
AS
Begin
 Delete [dbo].[SecurityActivation] where     [SecurityActivationId] = @SecurityActivationId
End
