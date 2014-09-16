CREATE PROCEDURE [dbo].[DeleteSecurityActivationCodes]
    @SecurityActivationCodeId int
AS
Begin
 Delete [dbo].[SecurityActivationCodes] where     [SecurityActivationCodeId] = @SecurityActivationCodeId
End
