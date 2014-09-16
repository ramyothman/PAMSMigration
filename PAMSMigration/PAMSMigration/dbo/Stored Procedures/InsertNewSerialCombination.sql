CREATE PROCEDURE [dbo].[InsertNewSerialCombination]
(
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

declare   @CheckAutoSerialExistence int = 0 


INSERT INTO [Serial].[SerialCombination] ( SerialStatusID , SerialComponentID, SerialComponentOrder
,CharsNo ,SerialDataType , IsAutoIncrement , AutoIncrementValue, DefaultValue  )
Values ( @SerialStatusID ,@SerialComponentID,@SerialComponentOrder  , @CharsNo ,
 @SerialDataType,@IsAutoIncrement,@AutoIncrementValue , @DefaultValue  )
 
 
 select @CheckAutoSerialExistence = COUNT(SerialComponentID) from [Serial].[SerialCombination] where  SerialComponentID = 6 and SerialStatusID = @SerialStatusID
 
 if(@CheckAutoSerialExistence >0)
 update [Serial].[SerialCombination]
set SerialComponentOrder =  (select MAX(SerialComponentOrder) + 1 from [Serial].[SerialCombination]  where SerialStatusID = @SerialStatusID and  SerialComponentID <> 6 )
where  SerialComponentID = 6 and SerialStatusID = @SerialStatusID

else
INSERT INTO [Serial].[SerialCombination] ( SerialStatusID , SerialComponentID, SerialComponentOrder
,CharsNo ,SerialDataType , IsAutoIncrement , AutoIncrementValue, DefaultValue  )
Values ( @SerialStatusID ,6,(select MAX(SerialComponentOrder) + 1 from [Serial].[SerialCombination]  where SerialStatusID = @SerialStatusID and  SerialComponentID <> 6 )  , @CharsNo ,
 @SerialDataType,1,1 , 0  )

 
 
IF @@ROWCOUNT > 0
Select * from [Serial].[SerialCombination]
Where [SerialCombinationID] = @@identity
