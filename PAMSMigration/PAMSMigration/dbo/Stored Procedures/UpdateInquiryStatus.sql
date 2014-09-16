CREATE PROCEDURE [dbo].[UpdateInquiryStatus]
    @OldID int,
    @Name nvarchar(50),
    @IsActive bit
AS
UPDATE [dbo].[InquiryStatus]
SET
    Name = @Name,
    IsActive = @IsActive
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From InquiryStatus 
Where [ID] = @OLDID
