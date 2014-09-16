CREATE PROCEDURE [dbo].[DeleteSerialStatus]
    @SerialStatusID int
AS
Begin
 Delete [Serial].[SerialStatus] where     [SerialStatusID] = @SerialStatusID
End
