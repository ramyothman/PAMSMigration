CREATE PROCEDURE [dbo].[DeleteEmailAddress]
    @EmailAddressId int
AS
Begin
 Delete [Person].[EmailAddress] where     [EmailAddressId] = @EmailAddressId
End
