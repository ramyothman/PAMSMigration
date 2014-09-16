CREATE PROCEDURE [dbo].[UpdateAddress]
    @OldAddressId int,
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
UPDATE [Person].[Address]
SET
    [Address] = @Address,
    CountryRegionCode = @CountryRegionCode,
    CityID = @CityID,
    StateProvinceId = @StateProvinceId,
    PostalCode = @PostalCode,
    ZipCode = @ZipCode,
    SpatialLocation = @SpatialLocation,
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate
WHERE [AddressId] = @OLDAddressId
IF @@ROWCOUNT > 0
Select * From Person.Address 
Where [AddressId] = @OLDAddressId
