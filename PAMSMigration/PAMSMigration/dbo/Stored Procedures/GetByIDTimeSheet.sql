CREATE PROCEDURE [dbo].[GetByIDTimeSheet]
    @ID nvarchar(50)
AS
BEGIN
SELECT *
  FROM [dbo].[TimeSheet]
where ID = @ID
END
