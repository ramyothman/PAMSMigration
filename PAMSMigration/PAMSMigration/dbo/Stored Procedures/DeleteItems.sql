CREATE PROCEDURE [dbo].[DeleteItems]
    @ItemID int
AS
Begin
 Delete [dbo].[Items] where     [ItemID] = @ItemID
End
