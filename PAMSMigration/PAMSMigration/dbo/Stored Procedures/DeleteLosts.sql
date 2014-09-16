CREATE PROCEDURE [dbo].[DeleteLosts]
    @InquiryNumber nvarchar(50)
AS
Begin
 Delete [dbo].[Losts] where     [InquiryNumber] = @InquiryNumber
End
