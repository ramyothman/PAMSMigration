CREATE PROCEDURE [dbo].[GetByIDSubCommissions]
    @SubCommissionID int
AS
BEGIN
Select * From [dbo].[SubCommissions]
WHERE [SubCommissionID] = @SubCommissionID
END
