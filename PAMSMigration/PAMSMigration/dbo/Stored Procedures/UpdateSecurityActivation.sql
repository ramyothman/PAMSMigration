CREATE PROCEDURE [dbo].[UpdateSecurityActivation]
    @OldSecurityActivationId int,
    @ProcessorId nvarchar(50),
    @ActivationCode nvarchar(50),
    @IsActivated bit,
    @Inside bit,
    @Outside bit,
    @EndDate datetime
AS
UPDATE [dbo].[SecurityActivation]
SET
    ProcessorId = @ProcessorId,
    ActivationCode = @ActivationCode,
    IsActivated = @IsActivated,
    Inside = @Inside,
    Outside = @Outside,
    EndDate=@EndDate
WHERE [SecurityActivationId] = @OLDSecurityActivationId
IF @@ROWCOUNT > 0
Select * From SecurityActivation 
Where [SecurityActivationId] = @OLDSecurityActivationId
