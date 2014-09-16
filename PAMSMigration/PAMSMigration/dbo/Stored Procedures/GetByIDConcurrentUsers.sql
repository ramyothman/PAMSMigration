CREATE PROCEDURE [dbo].[GetByIDConcurrentUsers]
    @ID int
AS
BEGIN
Select * From ConcurrentUsers
WHERE [ID] = @ID
END
