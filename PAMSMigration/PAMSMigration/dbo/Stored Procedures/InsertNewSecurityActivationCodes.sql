CREATE PROCEDURE [dbo].[InsertNewSecurityActivationCodes]
    @Code nvarchar(50),
    @IsActive bit
AS
INSERT INTO [dbo].[SecurityActivationCodes] (
    [Code],
    [IsActive])
Values (
    @Code,
    @IsActive)
IF @@ROWCOUNT > 0
Select * from SecurityActivationCodes
Where [SecurityActivationCodeId] = @@identity
