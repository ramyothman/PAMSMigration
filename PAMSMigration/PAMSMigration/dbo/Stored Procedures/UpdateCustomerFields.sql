CREATE PROCEDURE [dbo].[UpdateCustomerFields]
    @OldCustomerFieldID int,
    @CustomerFieldName nvarchar(50)
AS
UPDATE [dbo].[CustomerFields]
SET
    CustomerFieldName = @CustomerFieldName
WHERE [CustomerFieldID] = @OLDCustomerFieldID
IF @@ROWCOUNT > 0
Select * From CustomerFields 
Where [CustomerFieldID] = @OLDCustomerFieldID
