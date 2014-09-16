CREATE PROCEDURE [dbo].[GetByIDAddress]
    @AddressId int
AS
BEGIN
Select * From [Person].[Address]
WHERE [AddressId] = @AddressId
END
