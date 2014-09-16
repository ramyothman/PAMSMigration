Create PROCEDURE [dbo].[GetByIDSerialComponent]
    @SerialComponentID int
AS
BEGIN
Select *
From [serial].[SerialComponent]
WHERE [SerialComponentID] = @SerialComponentID
END
