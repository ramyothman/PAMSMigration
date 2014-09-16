CREATE PROCEDURE [dbo].[GetByIDPaymentTypes]
    @ID nvarchar(50)
AS
BEGIN
Select *
From [dbo].[PaymentTypes]
WHERE [ID] = @ID
END
