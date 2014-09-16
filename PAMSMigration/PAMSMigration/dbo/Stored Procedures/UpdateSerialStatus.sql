CREATE PROCEDURE [dbo].[UpdateSerialStatus]
(
   @oldSerialStatusID int,
   @BranchID int,
   @SerialTypeID int ,
   @IsActive bit,
   @SerialDate datetime,
   @UserName nvarchar(50))
AS
declare @CheckAutoserial int
UPDATE [Serial].[SerialStatus]
SET
  BranchID = @BranchID ,
  SerialTypeID = @SerialTypeID  ,
  IsActive= @IsActive ,
  SerialDate = @SerialDate ,
  UserName = @UserName 
   
WHERE [SerialStatusID] = @oldSerialStatusID
IF @@ROWCOUNT > 0
Select * From [Serial].[SerialStatus] 
Where [SerialStatusID] = @oldSerialStatusID
select @CheckAutoserial = count(*) from  Serial.SerialCombination
where SerialComponentID = 6 and SerialStatusID = @oldSerialStatusID
if(@CheckAutoserial = 0)
begin
INSERT INTO Serial.SerialCombination
                      ( SerialStatusID, SerialComponentID, SerialComponentOrder, CharsNo, SerialDataType, IsAutoIncrement, AutoIncrementValue, DefaultValue)
VALUES     (@oldSerialStatusID,6,1,2,null,1,1,null)
end
