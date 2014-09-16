Create PROCEDURE [dbo].[GetByIDSerialCombination]
    @SerialCombinationID int
AS
BEGIN
Select *
From [serial].[SerialCombination]
WHERE [SerialCombinationID] = @SerialCombinationID
END
