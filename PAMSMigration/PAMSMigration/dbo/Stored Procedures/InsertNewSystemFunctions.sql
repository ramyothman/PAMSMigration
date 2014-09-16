CREATE PROCEDURE [dbo].[InsertNewSystemFunctions]
    @Name nvarchar(50),
    @IsActive bit
AS
INSERT INTO [dbo].[SystemFunctions] (
    [Name],
    [IsActive])
Values (
    @Name,
    @IsActive)
IF @@ROWCOUNT > 0
Select * from SystemFunctions
Where [ID] = @@identity
