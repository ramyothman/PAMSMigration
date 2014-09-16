CREATE PROCEDURE [dbo].[UpdateCredential]
    @BusinessEntityId int,
    @OldBusinessEntityId int,
    @Username nvarchar(60),
    @PasswordHash nvarchar(128),
    @PasswordSalt nvarchar(10),
    @ActivationCode nvarchar(128),
    @IsActivated bit,
    @IsActive bit,
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime
AS
UPDATE [Person].[Credential]
SET
    BusinessEntityId = @BusinessEntityId,
    Username = @Username,
    PasswordHash = @PasswordHash,
    PasswordSalt = @PasswordSalt,
    ActivationCode = @ActivationCode,
    IsActivated = @IsActivated,
    IsActive = @IsActive,
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate
WHERE [BusinessEntityId] = @OLDBusinessEntityId
IF @@ROWCOUNT > 0
Select * From Person.Credential 
Where [BusinessEntityId] = @BusinessEntityId
