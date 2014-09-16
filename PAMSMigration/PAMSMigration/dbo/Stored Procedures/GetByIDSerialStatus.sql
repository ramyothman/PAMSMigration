Create PROCEDURE [dbo].[GetByIDSerialStatus]
    @SerialStatusID int
AS
BEGIN
Select *
From [serial].[SerialStatus]
WHERE [SerialStatusID] = @SerialStatusID
END
