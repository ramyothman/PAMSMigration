CREATE PROCEDURE [dbo].[InsertNewInquiryTypes]
    @InquiryType nvarchar(50),
    @InquiryDescription nvarchar(100)
AS
INSERT INTO [dbo].[InquiryTypes] (
    [InquiryType],
    [InquiryDescription])
Values (
    @InquiryType,
    @InquiryDescription)
IF @@ROWCOUNT > 0
Select * from InquiryTypes
Where [ID] = @@IDENTITY
