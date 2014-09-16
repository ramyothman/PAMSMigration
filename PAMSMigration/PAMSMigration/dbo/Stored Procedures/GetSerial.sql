CREATE procedure [dbo].[GetSerial]( 
  @ResponsEngID as nvarchar(50),
  @SerialStatusID as int ,
  @SerialTypeID as int = 1 ,
  @SupplierID as int = 12,
  @BranchID as int = 1 
)
as
declare @SerialComponentID int ,
@CharsNo int,
@Serial nvarchar(50)='' , 
@DefaultValue nvarchar(50)='',
@AcronymName nvarchar(50) =''

select @AcronymName = Person.PersonLanguages.AcronymName from Person.PersonLanguages where Person.PersonLanguages.PersonId = @ResponsEngID

DECLARE cur CURSOR Fast_Forward  FOR  
SELECT     SerialComponentID , CharsNo ,  DefaultValue                 
FROM         GetAllSerialCombination
where IsActive=1 and SerialTypeID = @SerialTypeID   and  BranchID =  @BranchID--and SerialStatusID = @SerialStatusID
ORDER BY SerialComponentOrder

OPEN cur

FETCH NEXT FROM cur 
INTO @SerialComponentID, @CharsNo,@DefaultValue

WHILE @@FETCH_STATUS = 0
BEGIN
   
 if (@SerialTypeID = 1 ) --- INQUIRY SERIAL
    begin
     Print @SerialComponentID
   
   set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 5 and @ResponsEngID <> 0  then @AcronymName  
                                   -- then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial ) + 1 , case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial )+ 1 , case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) )


   else 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial ) + 1, case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial ) + 1, case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) )
   
    end
                                          
 else @DefaultValue end   as nvarchar(50))

 Print @Serial
end

 if (@SerialTypeID = 3 ) --- ORDER SERIAL
    begin
    
   
   set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                     when  @SerialComponentID = 5 and @ResponsEngID <> 0  then @AcronymName  
                                   -- then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   --when  @SerialComponentID = 5 and @ResponsEngID <> 0   then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   --when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   --when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( OrderNumber ,len(@Serial ) + 1 , case when ( len(OrderNumber)- len(@Serial) ) < 0 then 0 else  len(OrderNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Orders INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber WHERE     (OrderNumber LIKE  @Serial +'%'  and SupplierID = @SupplierID  ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( OrderNumber ,len(@Serial )+ 1 , case when ( len(OrderNumber)- len(@Serial) ) < 0 then 0 else  len(OrderNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Orders INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber WHERE     (OrderNumber LIKE  @Serial +'%' and SupplierID = @SupplierID  ) )


   else 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( OrderNumber ,len(@Serial ) + 1, case when ( len(OrderNumber)- len(@Serial) ) < 0 then 0 else  len(OrderNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Orders INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber WHERE     (OrderNumber LIKE  @Serial +'%' and SupplierID = @SupplierID  ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( OrderNumber ,len(@Serial ) + 1, case when ( len(OrderNumber)- len(@Serial) ) < 0 then 0 else  len(OrderNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Orders INNER JOIN
                      Inquiries ON Orders.InquiryNumber = Inquiries.InquiryNumber WHERE     (OrderNumber LIKE  @Serial +'%' and SupplierID = @SupplierID  ) )
   
    end
                                          
 else @DefaultValue end   as nvarchar(50))
end

 if (@SerialTypeID = 2 ) --- OFFER SERIAL
    begin
    
   
   set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                     when  @SerialComponentID = 5 and @ResponsEngID <> 0  then @AcronymName  
                                   -- then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   --when  @SerialComponentID = 5 and @ResponsEngID <> 0   then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   --when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   --when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial ) + 1 , case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'  ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial )+ 1 , case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) )


   else 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial ) + 1, case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Serial ) + 1, case when ( len(ShotecNo)- len(@Serial) ) < 0 then 0 else  len(ShotecNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Serial +'%'   ) )
   
    end
                                          
 else @DefaultValue end   as nvarchar(50))
end

 if (@SerialTypeID = 6 ) --- SHIPMENT SERIAL
    begin
    
   
set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 5 and @ResponsEngID <> 0   then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShipmentNumber ,len(@Serial ) + 1 , case when ( len(ShipmentNumber)- len(@Serial) ) < 0 then 0 else  len(ShipmentNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         PartialShipment INNER JOIN
                      Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber

WHERE     (ShipmentNumber LIKE  @Serial +'%' ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShipmentNumber ,len(@Serial )+ 1 , case when ( len(ShipmentNumber)- len(@Serial) ) < 0 then 0 else  len(ShipmentNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         PartialShipment INNER JOIN
                      Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber

WHERE     (ShipmentNumber LIKE  @Serial +'%'   ) )


 else 
 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShipmentNumber ,len(@Serial ) + 1, case when ( len(ShipmentNumber)- len(@Serial) ) < 0 then 0 else  len(ShipmentNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         PartialShipment INNER JOIN
                      Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber
WHERE     (ShipmentNumber LIKE  @Serial +'%' ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( ShipmentNumber ,len(@Serial ) + 1, case when ( len(ShipmentNumber)- len(@Serial) ) < 0 then 0 else  len(ShipmentNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         PartialShipment INNER JOIN
                      Inquiries ON PartialShipment.InquiryNumber = Inquiries.InquiryNumber
WHERE     (ShipmentNumber LIKE  @Serial +'%' ) )  

 
end
                                          
else @DefaultValue end   as nvarchar(50))
end

 if (@SerialTypeID = 7 ) --- INVOICE SERIAL
    begin
    
   
set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                     when  @SerialComponentID = 5 and @ResponsEngID <> 0  then @AcronymName  
                                   -- then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   --when  @SerialComponentID = 5 and @ResponsEngID <> 0   then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   --when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   --when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( InvoiceNumber ,len(@Serial ) + 1 , case when ( len(InvoiceNumber)- len(@Serial) ) < 0 then 0 else  len(InvoiceNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         CustomerPayments INNER JOIN
                      Inquiries ON CustomerPayments.InquiryNumber = Inquiries.InquiryNumber
                      
                      
WHERE     (InvoiceNumber LIKE  @Serial +'%'  and SupplierID = @SupplierID ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( InvoiceNumber ,len(@Serial )+ 1 , case when ( len(InvoiceNumber)- len(@Serial) ) < 0 then 0 else  len(InvoiceNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         CustomerPayments INNER JOIN
                      Inquiries ON CustomerPayments.InquiryNumber = Inquiries.InquiryNumber
WHERE     (InvoiceNumber LIKE  @Serial +'%'  and SupplierID = @SupplierID ) )


 else 
 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( InvoiceNumber ,len(@Serial ) + 1, case when ( len(InvoiceNumber)- len(@Serial) ) < 0 then 0 else  len(InvoiceNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         CustomerPayments INNER JOIN
                      Inquiries ON CustomerPayments.InquiryNumber = Inquiries.InquiryNumber
WHERE     (InvoiceNumber LIKE  @Serial +'%' ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( InvoiceNumber ,len(@Serial ) + 1, case when ( len(InvoiceNumber)- len(@Serial) ) < 0 then 0 else  len(InvoiceNumber)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         CustomerPayments INNER JOIN
                      Inquiries ON CustomerPayments.InquiryNumber = Inquiries.InquiryNumber
WHERE     (InvoiceNumber LIKE  @Serial +'%' ) )  

 
end
                                          
else @DefaultValue end   as nvarchar(50))
end

 if (@SerialTypeID = 5 ) --- P.O SERIAL
    begin
    
   
   set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                     when  @SerialComponentID = 5 and @ResponsEngID <> 0  then @AcronymName  
                                   -- then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   --when  @SerialComponentID = 5 and @ResponsEngID <> 0   then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   --when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   --when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial ) + 1 , case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      
                       WHERE     (PurchaseNo LIKE  @Serial +'%'  and IsRFQ = 0 ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial )+ 1 , case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      
                      WHERE     (PurchaseNo LIKE  @Serial +'%' and IsRFQ = 0  ) )


   else 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial ) + 1, case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      WHERE     (PurchaseNo LIKE  @Serial +'%'  and IsRFQ = 0 ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial ) + 1, case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      
                      WHERE     (PurchaseNo LIKE  @Serial +'%'  and IsRFQ = 0  ) )
   
    end
                                          
 else @DefaultValue end   as nvarchar(50))
end

 if (@SerialTypeID = 4 ) --- RFQ SERIAL
    begin
    
   
   set @Serial = @Serial  +  cast (case when  @SerialComponentID = 2  then  SUBSTRING( cast(datepart(YEAR , Getdate()) AS nvarchar(4)),5 -@CharsNo ,@CharsNo ) 
                                   when  @SerialComponentID = 3  then  case when datepart(mm , Getdate()) < 10 then '0' else '' end  +  cast(datepart(mm , Getdate() )  AS nvarchar(2))  
                                   when  @SerialComponentID = 4  then  case when datepart(dd , Getdate()) < 10 then '0' else '' end  +  cast(datepart(dd , Getdate() )  AS nvarchar(2))  
                                     when  @SerialComponentID = 5 and @ResponsEngID <> 0  then @AcronymName  
                                   -- then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   when @SerialComponentID = 6 then   
                                   --when  @SerialComponentID = 5 and @ResponsEngID <> 0   then    case when  @CharsNo =  LEN(@ResponsEngID ) then  @ResponsEngID  
                                   --else  dbo.ZeroAdds(@CharsNo -  LEN(@ResponsEngID ))+ @ResponsEngID     end 
                                   --when  @SerialComponentID = 5 and @ResponsEngID = 0   then  '' 
                                   --when @SerialComponentID = 6 then   
                                   
                               case when    len(  (SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial ) + 1 , case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      
                       WHERE     (PurchaseNo LIKE  @Serial +'%'  and IsRFQ = 1 ) ) ) = @CharsNo then 

(SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial )+ 1 , case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      
                      WHERE     (PurchaseNo LIKE  @Serial +'%' and IsRFQ = 1  ) )


   else 
  dbo.zeroadds (@CharsNo - LEN((SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial ) + 1, case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      WHERE     (PurchaseNo LIKE  @Serial +'%'  and IsRFQ = 1 ) )) )  + (SELECT   	 	CAST( ISNULL(  max ( cast( substring( PurchaseNo ,len(@Serial ) + 1, case when ( len(PurchaseNo)- len(@Serial) ) < 0 then 0 else  len(PurchaseNo)- len(@Serial) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries INNER JOIN
                      CalculationSheet ON Inquiries.InquiryNumber = CalculationSheet.InquiryNumber AND Inquiries.InquiryNumber = CalculationSheet.InquiryNumber INNER JOIN
                      PurchaseOrder ON CalculationSheet.CalculationSheetID = PurchaseOrder.CalculationSheetID
                      
                      WHERE     (PurchaseNo LIKE  @Serial +'%'  and IsRFQ = 1  ) )
   
    end
                                          
 else @DefaultValue end   as nvarchar(50))
end






                                   
FETCH NEXT FROM cur 
INTO @SerialComponentID, @CharsNo,@DefaultValue
END


CLOSE cur;
DEALLOCATE cur;
select  @Serial


--SELECT     SerialCombinationID, SerialStatusID, SerialComponentID, IsActive, ComponentDescription,  SerialComponentOrder, CharsNo, 
--                      SerialDataType, IsAutoIncrement, AutoIncrementValue, DefaultValue
--FROM         GetAllSerialCombination
--where IsActive=1
--ORDER BY SerialComponentOrder