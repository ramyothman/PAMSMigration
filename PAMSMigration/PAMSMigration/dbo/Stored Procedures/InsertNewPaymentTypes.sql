CREATE PROCEDURE [dbo].[InsertNewPaymentTypes]
    @PaymentType nvarchar(50),
    @PaymentTypeDescription ntext
AS
INSERT INTO [dbo].[PaymentTypes] (
    [PaymentType],
    [PaymentTypeDescription])
Values (
    @PaymentType,
    @PaymentTypeDescription)
IF @@ROWCOUNT > 0
Select * from PaymentTypes
Where [ID] = @@IDENTITY
