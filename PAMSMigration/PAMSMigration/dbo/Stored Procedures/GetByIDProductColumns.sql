CREATE PROCEDURE [dbo].[GetByIDProductColumns]
    @ID int
AS
BEGIN
Select ID, Name, Caption, TypeName
From [dbo].[ProductColumns]
WHERE [ID] = @ID
END
