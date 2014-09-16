CREATE PROCEDURE [dbo].[GetByIDTwitterFollowers]
    @ID int
AS
BEGIN
SELECT *
  FROM [dbo].[TwitterFollowers]
 where ID = @ID
END
