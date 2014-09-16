CREATE PROCEDURE [dbo].[InsertNewLostReasons]
    @ReasonCode nvarchar(50),
    @ReasonName nvarchar(50)
AS
INSERT INTO [dbo].[LostReasons] (
    [ReasonCode],
    [ReasonName])
Values (
    @ReasonCode,
    @ReasonName)
IF @@ROWCOUNT > 0
Select * from LostReasons
Where [ID] = @@IDENTITY
