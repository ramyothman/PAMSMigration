CREATE PROCEDURE [dbo].[GetByIDSecurityActivation]
    @SecurityActivationId int
AS
BEGIN
Select *
From [dbo].[SecurityActivation]
WHERE [SecurityActivationId] = @SecurityActivationId
END
