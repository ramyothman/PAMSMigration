CREATE PROCEDURE [dbo].[UpdatePaymentTypes]
    @PaymentType nvarchar(50),
    @OldID int,
    @PaymentTypeDescription ntext
AS
UPDATE [dbo].[PaymentTypes]
SET
    PaymentType = @PaymentType,
    PaymentTypeDescription = @PaymentTypeDescription
WHERE [ID] = @OldID
IF @@ROWCOUNT > 0
Select * From PaymentTypes 
Where [ID] = @OldID
