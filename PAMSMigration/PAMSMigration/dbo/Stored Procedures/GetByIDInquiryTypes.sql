CREATE PROCEDURE [dbo].[GetByIDInquiryTypes]
    @ID int
AS
BEGIN
Select *
From [dbo].[InquiryTypes]
WHERE [ID] = @ID
END
