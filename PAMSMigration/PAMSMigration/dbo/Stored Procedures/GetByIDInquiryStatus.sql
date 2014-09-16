CREATE PROCEDURE [dbo].[GetByIDInquiryStatus]
    @ID int
AS
BEGIN
Select *
From [dbo].[InquiryStatus]
WHERE [ID] = @ID
END
