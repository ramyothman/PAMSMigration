
CREATE VIEW [dbo].[GetAllSerialCombination]
AS
SELECT     Serial.SerialCombination.SerialCombinationID, Serial.SerialCombination.SerialStatusID, Serial.SerialCombination.SerialComponentID, Serial.SerialStatus.IsActive, Serial.SerialStatus.SerialDate, 
                      Serial.SerialStatus.UserName, Serial.SerialComponent.Description AS ComponentDescription, Serial.SerialType.Description AS TypeDescription, Serial.SerialCombination.SerialComponentOrder, 
                      Serial.SerialCombination.CharsNo, Serial.SerialCombination.SerialDataType, Serial.SerialCombination.IsAutoIncrement, Serial.SerialCombination.AutoIncrementValue, 
                      Serial.SerialCombination.DefaultValue, Serial.SerialType.SerialTypeID, Serial.SerialStatus.BranchID
FROM         Serial.SerialCombination INNER JOIN
                      Serial.SerialStatus ON Serial.SerialCombination.SerialStatusID = Serial.SerialStatus.SerialStatusID INNER JOIN
                      Serial.SerialComponent ON Serial.SerialCombination.SerialComponentID = Serial.SerialComponent.SerialComponentID INNER JOIN
                      Serial.SerialType ON Serial.SerialStatus.SerialTypeID = Serial.SerialType.SerialTypeID

