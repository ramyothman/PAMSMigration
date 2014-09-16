CREATE PROCEDURE [dbo].[InsertNewCustomerFields]
    @CustomerFieldName nvarchar(50)
AS
INSERT INTO [dbo].[CustomerFields] (
    [CustomerFieldName])
Values (
    @CustomerFieldName)
IF @@ROWCOUNT > 0
Select * from CustomerFields
Where [CustomerFieldID] = @@identity
