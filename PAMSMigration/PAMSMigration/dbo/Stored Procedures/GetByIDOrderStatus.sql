CREATE PROCEDURE [dbo].[GetByIDOrderStatus]
    @ID int
AS
BEGIN
Select *
From [dbo].[OrderStatus]
WHERE [ID] = @ID
END
