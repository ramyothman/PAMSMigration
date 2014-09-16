CREATE PROCEDURE [dbo].[UpdateSerialCombination]
(
    @oldSerialCombinationID int,
    @SerialStatusID int, 
    @SerialComponentID int, 
    @SerialComponentOrder int,
    @CharsNo int,
    @SerialDataType nvarchar(10) ,
    @IsAutoIncrement bit,
    @AutoIncrementValue int,
    @DefaultValue nvarchar(50)
    )
AS



UPDATE [Serial].[SerialCombination]
SET
  SerialStatusID = @SerialStatusID ,
  SerialComponentID = @SerialComponentID  ,
  SerialComponentOrder = @SerialComponentOrder ,
  CharsNo = @CharsNo ,
  SerialDataType = @SerialDataType,
  IsAutoIncrement  = @IsAutoIncrement ,
  AutoIncrementValue = @AutoIncrementValue ,
  DefaultValue       = @DefaultValue
   
WHERE [SerialCombinationID] = @oldSerialCombinationID

update [Serial].[SerialCombination]
set SerialComponentOrder =  (select MAX(SerialComponentOrder) + 1 from [Serial].[SerialCombination]  where SerialStatusID = @SerialStatusID and  SerialComponentID <> 6 )
where  SerialComponentID = 6 and SerialStatusID = @SerialStatusID
 
IF @@ROWCOUNT > 0
Select * From [Serial].[SerialCombination] 
Where [SerialCombinationID] = @oldSerialCombinationID
