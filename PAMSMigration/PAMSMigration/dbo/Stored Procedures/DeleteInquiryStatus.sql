CREATE PROCEDURE [dbo].[DeleteInquiryStatus]
    @ID int
AS
Begin
 Delete [dbo].[InquiryStatus] where     [ID] = @ID
End
