CREATE PROCEDURE [dbo].[GetByIDLostReasons]
  @ID int
AS
BEGIN
Select *
From [dbo].[LostReasons]
WHERE [ID] = @ID
END
