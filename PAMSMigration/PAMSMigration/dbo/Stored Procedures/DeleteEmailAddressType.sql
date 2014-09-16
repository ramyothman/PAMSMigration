CREATE PROCEDURE [dbo].[DeleteEmailAddressType]
    @EmailAddressTypeId int
AS
Begin
 Delete [Person].[EmailAddressType] where     [EmailAddressTypeId] = @EmailAddressTypeId
End
