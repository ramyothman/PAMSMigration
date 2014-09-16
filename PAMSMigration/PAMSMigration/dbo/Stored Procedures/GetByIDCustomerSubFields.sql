CREATE PROCEDURE [dbo].[GetByIDCustomerSubFields]
    @ID int
AS
BEGIN
Select *
From [dbo].[CustomerSubFields]
WHERE [ID] = @ID
END
