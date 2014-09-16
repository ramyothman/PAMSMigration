CREATE PROCEDURE [dbo].[InsertNewSecurityActivation]
    @ProcessorId nvarchar(50),
    @ActivationCode nvarchar(50),
    @IsActivated bit,
    @Inside bit,
    @Outside bit,
    @EndDate datetime
AS
INSERT INTO [dbo].[SecurityActivation] (
    [ProcessorId],
    [ActivationCode],
    [IsActivated],
    [Inside],
    [Outside],
    [EndDate])
Values (
    @ProcessorId,
    @ActivationCode,
    @IsActivated,
    @Inside,
    @Outside,
    @EndDate)
IF @@ROWCOUNT > 0
Select * from SecurityActivation
Where [SecurityActivationId] = @@identity
