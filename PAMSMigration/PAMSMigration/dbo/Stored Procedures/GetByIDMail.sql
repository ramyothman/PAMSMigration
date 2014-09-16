CREATE PROCEDURE [dbo].[GetByIDMail]
    @ID nvarchar(50)
AS
BEGIN
Select *
From [dbo].[Mails]
WHERE [ID] = @ID
END
