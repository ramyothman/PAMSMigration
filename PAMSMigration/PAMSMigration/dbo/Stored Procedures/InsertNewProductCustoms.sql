CREATE PROCEDURE [dbo].[InsertNewProductCustoms]
    @CustomValue decimal(18,2),
    @IsPercent bit,
    @Name nvarchar(50),
    @ProductCustomID int
AS
INSERT INTO [dbo].[ProductCustoms] (
    [CustomValue],
    [IsPercent],
    [Name],
    [ProductCustomID])
Values (
    @CustomValue,
    @IsPercent,
    @Name,
    @ProductCustomID)
IF @@ROWCOUNT > 0
Select * from ProductCustoms
Where [ProductCustomID] = @ProductCustomID
