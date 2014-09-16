CREATE PROCEDURE [dbo].[UpdateIDS]
    @OldID int,
    @InquiryNumber nvarchar(50),
    @OrderNumber nvarchar(50),
    @TransactionID nvarchar(50)
AS
UPDATE [dbo].[IDS]
SET
    InquiryNumber = @InquiryNumber,
    OrderNumber = @OrderNumber,
    TransactionID = @TransactionID
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From IDS 
Where [ID] = @OLDID
