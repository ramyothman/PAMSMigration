CREATE PROCEDURE [dbo].[UpdateSecurityActivationCodes]
    @OldSecurityActivationCodeId int,
    @Code nvarchar(50),
    @IsActive bit
AS
UPDATE [dbo].[SecurityActivationCodes]
SET
    Code = @Code,
    IsActive = @IsActive
WHERE [SecurityActivationCodeId] = @OLDSecurityActivationCodeId
IF @@ROWCOUNT > 0
Select * From SecurityActivationCodes 
Where [SecurityActivationCodeId] = @OLDSecurityActivationCodeId
