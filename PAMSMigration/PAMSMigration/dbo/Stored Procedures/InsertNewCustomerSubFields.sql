CREATE PROCEDURE [dbo].[InsertNewCustomerSubFields]
    @Name nvarchar(50)
AS
INSERT INTO [dbo].[CustomerSubFields] (
    [Name])
Values (
    @Name)
IF @@ROWCOUNT > 0
Select * from CustomerSubFields
Where [ID] = @@identity
