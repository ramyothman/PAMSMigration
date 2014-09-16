Create PROCEDURE [dbo].[GetByIDSerialType]
    @SerialTypeID int
AS
BEGIN
Select *
From [serial].[SerialType]
WHERE [SerialTypeID] = @SerialTypeID
END
