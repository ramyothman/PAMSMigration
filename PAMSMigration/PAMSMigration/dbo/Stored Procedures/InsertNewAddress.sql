CREATE PROCEDURE [dbo].[InsertNewAddress]
    @AddressId int output ,
    @Address nvarchar(MAX),
    @CountryRegionCode char(3),
    @CityID int,
    @StateProvinceId int,
    @PostalCode nvarchar(15),
    @ZipCode nvarchar(15),
    @SpatialLocation nvarchar(60),
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime
AS
INSERT INTO [Person].[Address] (
    [Address],
    [CountryRegionCode],
    [CityID],
    [StateProvinceId],
    [PostalCode],
    [ZipCode],
    [SpatialLocation],
    [RowGuid],
    [ModifiedDate])
Values (
    @Address,
    @CountryRegionCode,
    @CityID,
    @StateProvinceId,
    @PostalCode,
    @ZipCode,
    @SpatialLocation,
    @RowGuid,
    @ModifiedDate)
Set @AddressId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.Address
Where [AddressId] = @@identity
