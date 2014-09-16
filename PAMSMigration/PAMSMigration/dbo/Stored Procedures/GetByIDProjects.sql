CREATE PROCEDURE [dbo].[GetByIDProjects]
    @ProjectID int
AS
BEGIN
Select * From [dbo].[Projects]
WHERE ID = @ProjectID
END
