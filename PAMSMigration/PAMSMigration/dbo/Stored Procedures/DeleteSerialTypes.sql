Create PROCEDURE [dbo].[DeleteSerialTypes]
    @SerialTypeID int
AS
Begin
 Delete [Serial].[SerialType] where     [SerialTypeID] = @SerialTypeID
End
