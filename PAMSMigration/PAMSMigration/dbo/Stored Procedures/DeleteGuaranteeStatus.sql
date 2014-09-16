CREATE PROCEDURE [dbo].[DeleteGuaranteeStatus]
    @GuaranteeStatusID int
AS
Begin
 Delete [dbo].[GuaranteeStatus] where     [GuaranteeStatusID] = @GuaranteeStatusID
End
