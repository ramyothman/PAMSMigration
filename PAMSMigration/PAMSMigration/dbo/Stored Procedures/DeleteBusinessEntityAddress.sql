CREATE PROCEDURE [dbo].[DeleteBusinessEntityAddress]
    @BusinessEntityAddressId int
AS
Begin
 Delete [Person].[BusinessEntityAddress] where     [BusinessEntityAddressId] = @BusinessEntityAddressId
End
