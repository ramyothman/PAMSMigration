CREATE PROCEDURE [dbo].[DeleteOrders]
    @InquiryNumber nvarchar(50)
AS
Begin
 Delete [dbo].[Orders] where     [InquiryNumber] = @InquiryNumber
End
