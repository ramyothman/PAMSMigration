CREATE PROCEDURE [dbo].[UpdateProductCustoms]
    @CustomValue decimal(18,2),
    @IsPercent bit,
    @Name nvarchar(50),
    @ProductCustomID int,
    @OldProductCustomID int
AS
UPDATE [dbo].[ProductCustoms]
SET
    CustomValue = @CustomValue,
    IsPercent = @IsPercent,
    Name = @Name,
    ProductCustomID = @ProductCustomID
WHERE [ProductCustomID] = @OLDProductCustomID
IF @@ROWCOUNT > 0
Select * From ProductCustoms 
Where [ProductCustomID] = @ProductCustomID
