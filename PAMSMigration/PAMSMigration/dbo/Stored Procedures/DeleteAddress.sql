CREATE PROCEDURE [dbo].[DeleteAddress]
    @AddressId int
AS
Begin
 Delete [Person].[Address] where     [AddressId] = @AddressId
End
