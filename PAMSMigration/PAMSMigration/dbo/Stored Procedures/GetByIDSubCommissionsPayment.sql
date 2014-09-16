CREATE PROCEDURE [dbo].[GetByIDSubCommissionsPayment]
    @SubCommissionID int,
    @SubCommissionPaymentNumber int
AS
BEGIN
Select * From [dbo].[SubCommissionsPayment]
WHERE [SubCommissionID] = @SubCommissionID
 AND [SubCommissionPaymentNumber] = @SubCommissionPaymentNumber
END
