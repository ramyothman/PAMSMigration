Create PROCEDURE [dbo].[DeleteSerialCombination]
    @SerialCombinationID int
AS
Begin
 Delete [Serial].[SerialCombination] where     [SerialCombinationID] = @SerialCombinationID
End
