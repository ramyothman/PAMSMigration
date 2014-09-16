CREATE PROCEDURE [dbo].[GetByIDVisitDetails]
    @VisitDetailsId int
AS
BEGIN
Select *
From [dbo].[VisitDetails]
WHERE [VisitDetailsId] = @VisitDetailsId
END
