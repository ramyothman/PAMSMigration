CREATE PROCEDURE [dbo].[GetByIDBanks]
    @ID nvarchar(50)
AS
BEGIN
Select *
From [dbo].[GetAllBanks]
WHERE [ID] = @ID
END
