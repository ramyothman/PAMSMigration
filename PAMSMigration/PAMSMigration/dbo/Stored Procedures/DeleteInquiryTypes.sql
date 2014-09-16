CREATE PROCEDURE [dbo].[DeleteInquiryTypes]
    @ID nvarchar(50)
AS
Begin
 Delete [dbo].[InquiryTypes] where     [ID] = @ID
End
