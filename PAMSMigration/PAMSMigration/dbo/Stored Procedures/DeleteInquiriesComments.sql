CREATE PROCEDURE [dbo].[DeleteInquiriesComments]
    @ID int
AS
Begin
 Delete [dbo].[InquiriesComments] where     ID = @ID
End
