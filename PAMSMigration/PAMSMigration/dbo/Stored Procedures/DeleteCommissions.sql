CREATE PROCEDURE [dbo].[DeleteCommissions]
    @InquiryNumber nvarchar(50)
AS
Begin
 Delete [dbo].[Commissions] where     [InquiryNumber] = @InquiryNumber
End
