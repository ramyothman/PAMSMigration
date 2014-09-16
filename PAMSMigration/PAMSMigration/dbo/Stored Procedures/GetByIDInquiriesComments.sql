CREATE PROCEDURE [dbo].[GetByIDInquiriesComments]
    @ID int
AS
BEGIN
SELECT *
  FROM [dbo].[GetAllInquiriesComments]
WHERE  ID = @ID
END
