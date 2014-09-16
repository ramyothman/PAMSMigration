CREATE VIEW [dbo].[GetAllPaymentTypes]
AS
SELECT     PaymentType, PaymentTypeDescription, ID
FROM         dbo.PaymentTypes
