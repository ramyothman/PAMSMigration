CREATE PROCEDURE [dbo].[UpdateCustomerSubFields]
    @OldID int,
    @Name nvarchar(50)
AS
UPDATE [dbo].[CustomerSubFields]
SET
    Name = @Name
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From CustomerSubFields 
Where [ID] = @OLDID
