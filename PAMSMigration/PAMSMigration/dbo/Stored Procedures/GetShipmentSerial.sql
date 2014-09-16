--='OD125130001'
CREATE Procedure [dbo].[GetShipmentSerial] (@OrderNumber nvarchar(50))
as 
--declare @OrderNumber nvarchar(50)='OD125130001'
declare @ShipmentNumber nvarchar(50)
declare @Serial nvarchar(50)=''
declare @SerialInt int  = 0 
--select  ShipmentNumber 
--FROM    PartialShipment INNER JOIN
--        Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber                       
--        where ShipmentNumber like @OrderNumber 
        
 DECLARE cur CURSOR Fast_Forward  FOR  
select  isnull(max( cast( SUBSTRING(  ShipmentNumber , len(@OrderNumber) + 2   , LEN(ShipmentNumber) - 1 )  as int ) ),0)
FROM    PartialShipment INNER JOIN
        Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber                       
        where ShipmentNumber like @OrderNumber +'%'
       -- order by ShipmentNumber
        
OPEN cur
FETCH NEXT FROM cur 
INTO  @SerialInt 
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM cur 
INTO  @SerialInt 
END
CLOSE cur;
DEALLOCATE cur;
if(@Serial = '' )
set @Serial = @OrderNumber + '-' +  CAST( (@SerialInt + 1) as nvarchar(10))
else
begin
--set @ShipmentNumber = 'OD125130001-1'
set @Serial = SUBSTRING(@ShipmentNumber  , 0,  LEN(@ShipmentNumber) - 1  )+ '-' +  CAST(  CAST( SUBSTRING(@ShipmentNumber  ,  CHARINDEX('-', @ShipmentNumber)+1 ,LEN(@ShipmentNumber)-1 ) as int ) + 1   as nvarchar(50))
end
select  @Serial
