CREATE PROCEDURE [dbo].[UpdatePaymentTermType]
    @Name nvarchar(50),
    @OldPaymentTermTypeID int
AS
UPDATE [dbo].[PaymentTermType]
SET
    Name = @Name
WHERE [PaymentTermTypeID] = @OLDPaymentTermTypeID
IF @@ROWCOUNT > 0
Select * From PaymentTermType 
Where [PaymentTermTypeID] = @OLDPaymentTermTypeID
