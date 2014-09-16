CREATE PROCEDURE [dbo].[GetByIDBussinessTwitter]
    @ID int
AS
BEGIN
SELECT *
  FROM [dbo].[BussinessTwitter]
   where ID = @ID
END
