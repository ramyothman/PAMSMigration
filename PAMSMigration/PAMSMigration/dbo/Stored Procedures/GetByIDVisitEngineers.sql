CREATE PROCEDURE [dbo].[GetByIDVisitEngineers]
    @ID int
AS
BEGIN
SELECT *
  FROM [dbo].[VisitEngineers]
  WHERE [ID] = @ID
END
