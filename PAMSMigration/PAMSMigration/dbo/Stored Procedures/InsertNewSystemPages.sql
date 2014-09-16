CREATE PROCEDURE [dbo].[InsertNewSystemPages]
    @ModCode nvarchar(50),
    @PageName nvarchar(50),
    @Path nvarchar(200),
    @IsActive bit
AS
INSERT INTO [dbo].[SystemPages] (
    [ModCode],
    [PageName],
    [Path],
    [IsActive])
Values (
    @ModCode,
    @PageName,
    @Path,
    @IsActive)
IF @@ROWCOUNT > 0
Select * from SystemPages
Where [ID] = @@identity
