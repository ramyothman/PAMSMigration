CREATE PROCEDURE [dbo].[DeleteInquiries]
    @InquiryNumber nvarchar(50)
AS
Begin
 Delete [dbo].[Inquiries] where     [InquiryNumber] = @InquiryNumber
End
