CREATE PROCEDURE [dbo].[GetByIDIDS]
    @ID int
AS
BEGIN
Select *
From [dbo].[IDS]
WHERE [ID] = @ID
END
