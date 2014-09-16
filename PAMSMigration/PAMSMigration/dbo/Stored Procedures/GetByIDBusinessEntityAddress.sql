CREATE PROCEDURE [dbo].[GetByIDBusinessEntityAddress]
    @BusinessEntityAddressId int
AS
BEGIN
Select *
From GetAllBusinessEntityAddress
WHERE [BusinessEntityAddressId] = @BusinessEntityAddressId
END
