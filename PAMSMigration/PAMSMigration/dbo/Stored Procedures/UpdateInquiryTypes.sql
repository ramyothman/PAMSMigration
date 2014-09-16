CREATE PROCEDURE [dbo].[UpdateInquiryTypes]
    @InquiryType nvarchar(50),
    @OldID int,
    @InquiryDescription nvarchar(100)
AS
UPDATE [dbo].[InquiryTypes]
SET
    InquiryType = @InquiryType,
    InquiryDescription = @InquiryDescription
WHERE [ID] = @OldID
IF @@ROWCOUNT > 0
Select * From InquiryTypes 
Where [ID] = @OldID
