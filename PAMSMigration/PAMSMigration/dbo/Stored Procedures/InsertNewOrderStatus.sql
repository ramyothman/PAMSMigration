CREATE PROCEDURE [dbo].[InsertNewOrderStatus]
    @Name nvarchar(50)
AS
INSERT INTO [dbo].[OrderStatus] (
    [Name])
Values (
    @Name)
IF @@ROWCOUNT > 0
Select * from OrderStatus
Where [ID] = @@identity
