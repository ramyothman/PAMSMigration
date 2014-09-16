CREATE PROCEDURE [dbo].[GetByIDCustomerFields]
    @CustomerFieldID int
AS
BEGIN
Select *
From [dbo].[CustomerFields]
WHERE [CustomerFieldID] = @CustomerFieldID
END
