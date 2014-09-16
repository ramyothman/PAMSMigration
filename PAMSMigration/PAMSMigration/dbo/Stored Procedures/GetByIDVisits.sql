CREATE PROCEDURE [dbo].[GetByIDVisits]
    @VisitId int
AS
BEGIN
SELECT *
  FROM [dbo].[Visits]
   WHERE [VisitId] = @VisitId
END
