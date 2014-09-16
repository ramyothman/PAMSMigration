CREATE PROCEDURE [dbo].[GetByIDGuaranteeStatus]
    @GuaranteeStatusID int
AS
BEGIN
Select GuaranteeStatusID, Name
From [dbo].[GuaranteeStatus]
WHERE [GuaranteeStatusID] = @GuaranteeStatusID
END
