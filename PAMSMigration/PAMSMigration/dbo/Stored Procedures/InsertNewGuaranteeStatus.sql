CREATE PROCEDURE [dbo].[InsertNewGuaranteeStatus]
    @GuaranteeStatusID int,
    @Name nvarchar(50)
AS
INSERT INTO [dbo].[GuaranteeStatus] (
    [GuaranteeStatusID],
    [Name])
Values (
    @GuaranteeStatusID,
    @Name)
IF @@ROWCOUNT > 0
Select * from GuaranteeStatus
Where [GuaranteeStatusID] = @GuaranteeStatusID
