CREATE PROCEDURE [dbo].[DeleteCompletedProjects]
    @InquiryNumber nvarchar(50)
AS
Begin
 Delete [dbo].[CompletedProjects] where     [InquiryNumber] = @InquiryNumber
End
