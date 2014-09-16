CREATE PROCEDURE [dbo].[InsertNewIDS]
    @InquiryNumber nvarchar(50),
    @OrderNumber nvarchar(50),
    @TransactionID nvarchar(50)
AS
INSERT INTO [dbo].[IDS] (
    [InquiryNumber],
    [OrderNumber],
    [TransactionID])
Values (
    @InquiryNumber,
    @OrderNumber,
    @TransactionID)
IF @@ROWCOUNT > 0
Select * from IDS
Where [ID] = @@identity
