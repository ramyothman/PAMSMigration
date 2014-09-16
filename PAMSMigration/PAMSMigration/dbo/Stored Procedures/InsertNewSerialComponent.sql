Create PROCEDURE [dbo].[InsertNewSerialComponent]
    @Description nvarchar(50)
  
AS
INSERT INTO [Serial].[SerialComponent] (
 
    [Description])
Values (
    @Description )
IF @@ROWCOUNT > 0
Select * from [Serial].[SerialComponent]
Where [SerialComponentID] = @@identity
