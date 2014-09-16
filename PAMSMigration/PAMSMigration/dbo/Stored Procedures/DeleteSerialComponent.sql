Create PROCEDURE [dbo].[DeleteSerialComponent]
    @SerialComponentID int
AS
Begin
 Delete [Serial].[SerialComponent] where     [SerialComponentID] = @SerialComponentID
End
