CREATE PROCEDURE [dbo].[InsertNewPaymentTermType]
    @Name nvarchar(50)
AS
INSERT INTO [dbo].[PaymentTermType] (
    [Name])
Values (
    @Name)
IF @@ROWCOUNT > 0
Select * from PaymentTermType
Where [PaymentTermTypeID] = @@identity
