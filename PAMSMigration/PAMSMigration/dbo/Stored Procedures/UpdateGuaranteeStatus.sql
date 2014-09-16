CREATE PROCEDURE [dbo].[UpdateGuaranteeStatus]
    @GuaranteeStatusID int,
    @OldGuaranteeStatusID int,
    @Name nvarchar(50)
AS
UPDATE [dbo].[GuaranteeStatus]
SET
    GuaranteeStatusID = @GuaranteeStatusID,
    Name = @Name
WHERE [GuaranteeStatusID] = @OLDGuaranteeStatusID
IF @@ROWCOUNT > 0
Select * From GuaranteeStatus 
Where [GuaranteeStatusID] = @GuaranteeStatusID
