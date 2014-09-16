CREATE PROCEDURE [dbo].[InsertNewSerialStatus]
(
    @BranchID int,
    @SerialTypeID int ,
    @IsActive bit,
    @SerialDate datetime,
    @UserName nvarchar(50)
)
  
AS
declare @CheckAutoserial int
INSERT INTO [Serial].[SerialStatus] (BranchID , SerialTypeID, IsActive,SerialDate ,UserName )
Values ( @BranchID ,@SerialTypeID,@IsActive  , @SerialDate , @UserName )
IF @@ROWCOUNT > 0
Select * from [Serial].[SerialStatus]
Where [SerialStatusID] = @@identity
select @CheckAutoserial = count(*) from  Serial.SerialCombination
where SerialComponentID = 6 and SerialStatusID = @@identity
if(@CheckAutoserial = 0)
begin
INSERT INTO Serial.SerialCombination
                      ( SerialStatusID, SerialComponentID, SerialComponentOrder, CharsNo, SerialDataType, IsAutoIncrement, AutoIncrementValue, DefaultValue)
VALUES     (@@identity,6,1,2,null,1,1,null)
end
