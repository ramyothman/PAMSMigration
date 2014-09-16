CREATE PROCEDURE [dbo].[GetByIDVisitPurposes]
    @ID int
AS
BEGIN
SELECT *
  FROM [dbo].[VisitPurposes]
   WHERE [ID] = @ID
END
