CREATE PROCEDURE [dbo].[InsertNewInquiryStatus]
    @Name nvarchar(50),
    @IsActive bit
AS
INSERT INTO [dbo].[InquiryStatus] (
    [Name],
    [IsActive])
Values (
    @Name,
    @IsActive)
IF @@ROWCOUNT > 0
Select * from InquiryStatus
Where [ID] = @@identity
