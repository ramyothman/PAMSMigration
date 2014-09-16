Create PROCEDURE [dbo].[InsertNewSerialTypes]
    @Description nvarchar(50)
  
AS
INSERT INTO [Serial].[SerialType] (
 
    [Description])
Values (
    @Description )
IF @@ROWCOUNT > 0
Select * from [Serial].[SerialType]
Where [SerialTypeID] = @@identity
