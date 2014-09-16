CREATE PROCEDURE [dbo].[GetByIDSuppliersTypes]
    @ID int
AS
BEGIN
SELECT *
  FROM [dbo].[SuppliersTypes]
WHERE [ID] = @ID
END
