CREATE PROCEDURE [dbo].[GetByIDCommissions]
    @InquiryNumber nvarchar(50),
    @CustomerPaymentID int = 0 
AS
BEGIN
if(@CustomerPaymentID <> 0)
Select * From [dbo].[Commissions]
WHERE [InquiryNumber] = @InquiryNumber and CustomerPaymentID = @CustomerPaymentID
else
Select * From [dbo].[Commissions]
WHERE [InquiryNumber] = @InquiryNumber 
END
