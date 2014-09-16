CREATE PROCEDURE [dbo].[GetByIDSecurityActivationCodes]
    @SecurityActivationCodeId int
AS
BEGIN
Select *
From [dbo].[SecurityActivationCodes]
WHERE [SecurityActivationCodeId] = @SecurityActivationCodeId
END
