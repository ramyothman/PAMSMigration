CREATE PROCEDURE [dbo].[GetByIDLosts]
    @InquiryNumber nvarchar(50),
    @LostReasonID int = 0,
    @LostComment  nvarchar(MAX)= null
AS
BEGIN
if( @LostComment is null)
if(@LostReasonID is not null and 
 @LostReasonID > 0)
SELECT *   
From [dbo].[Losts]
WHERE [InquiryNumber] = @InquiryNumber and LostReasonID = @LostReasonID
else
SELECT *
From [dbo].[Losts]
WHERE [InquiryNumber] = @InquiryNumber 
else
if(@LostReasonID is not null and 
 @LostReasonID > 0)
SELECT *   
From [dbo].[Losts]
WHERE [InquiryNumber] = @InquiryNumber and LostReasonID = @LostReasonID
else
SELECT *
From [dbo].[Losts]
WHERE [InquiryNumber] = @InquiryNumber and LostComment = @LostComment
END
