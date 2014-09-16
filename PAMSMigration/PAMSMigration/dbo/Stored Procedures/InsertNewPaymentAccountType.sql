CREATE PROCEDURE [dbo].[InsertNewPaymentAccountType]
    @Name nvarchar(Max)
AS
INSERT INTO [dbo].[PaymentAccountType] (
    [Name])
Values (
    @Name)
IF @@ROWCOUNT > 0
Select * from PaymentAccountType
Where [PaymentAccountTypeID] = @@identity
