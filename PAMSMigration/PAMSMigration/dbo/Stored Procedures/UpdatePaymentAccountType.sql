CREATE PROCEDURE [dbo].[UpdatePaymentAccountType]
    @OldPaymentAccountTypeID int,
    @Name nvarchar(Max)
AS
UPDATE [dbo].[PaymentAccountType]
SET
    Name = @Name
WHERE [PaymentAccountTypeID] = @OLDPaymentAccountTypeID
IF @@ROWCOUNT > 0
Select * From PaymentAccountType 
Where [PaymentAccountTypeID] = @OLDPaymentAccountTypeID
