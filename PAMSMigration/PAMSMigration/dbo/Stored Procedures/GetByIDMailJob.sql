CREATE PROCEDURE [dbo].[GetByIDMailJob]
    @ID nvarchar(50)
AS
BEGIN
Select *
From [dbo].[JobsMails]
WHERE [ID] = @ID
END
