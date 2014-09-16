CREATE PROCEDURE [dbo].[DeleteCalculationSheetDetail]
    @CalculationSheetDetailID int
AS
Begin
Delete [dbo].[CalculationSheetDetailCustoms] where     [CalculationSheetDetailID] = @CalculationSheetDetailID
Delete [dbo].[CalculationSheetDetailFreight] where     [CalculationSheetDetailID] = @CalculationSheetDetailID
Delete [dbo].[CalculationSheetDetailTaxes] where     [CalculationSheetDetailID] = @CalculationSheetDetailID
 Delete [dbo].[CalculationSheetDetail] where     [CalculationSheetDetailID] = @CalculationSheetDetailID
 
 delete  from CalculationSheetDetail
where CalculationSheetDetailID  in (
 (
SELECT  
                    detail4.CalculationSheetDetailID AS Detail4
FROM         CalculationSheetDetail AS masterdetail LEFT OUTER JOIN
                      CalculationSheetDetail AS detail1 ON masterdetail.ParentID = detail1.CalculationSheetDetailID LEFT OUTER JOIN
                      CalculationSheetDetail AS detail3 LEFT OUTER JOIN
                      CalculationSheetDetail AS detail4 ON detail3.CalculationSheetDetailID = detail4.ParentID RIGHT OUTER JOIN
                      CalculationSheetDetail AS detail2 ON detail3.ParentID = detail2.CalculationSheetDetailID ON detail1.CalculationSheetDetailID = detail2.ParentID
WHERE     (masterdetail.CalculationSheetDetailID = @CalculationSheetDetailID) OR
                      (masterdetail.ParentID = @CalculationSheetDetailID)))
 
 
 
 
  delete  from CalculationSheetDetail
where CalculationSheetDetailID  in (
 (
SELECT  
                    detail3.CalculationSheetDetailID AS Detail3
FROM         CalculationSheetDetail AS masterdetail LEFT OUTER JOIN
                      CalculationSheetDetail AS detail1 ON masterdetail.ParentID = detail1.CalculationSheetDetailID LEFT OUTER JOIN
                      CalculationSheetDetail AS detail3 LEFT OUTER JOIN
                      CalculationSheetDetail AS detail4 ON detail3.CalculationSheetDetailID = detail4.ParentID RIGHT OUTER JOIN
                      CalculationSheetDetail AS detail2 ON detail3.ParentID = detail2.CalculationSheetDetailID ON detail1.CalculationSheetDetailID = detail2.ParentID
WHERE     (masterdetail.CalculationSheetDetailID = @CalculationSheetDetailID) OR
                      (masterdetail.ParentID = @CalculationSheetDetailID)))
 
 
 
 
   delete  from CalculationSheetDetail
where CalculationSheetDetailID  in (
 (
SELECT  
                    detail2.CalculationSheetDetailID AS Detail2
FROM         CalculationSheetDetail AS masterdetail LEFT OUTER JOIN
                      CalculationSheetDetail AS detail1 ON masterdetail.ParentID = detail1.CalculationSheetDetailID LEFT OUTER JOIN
                      CalculationSheetDetail AS detail3 LEFT OUTER JOIN
                      CalculationSheetDetail AS detail4 ON detail3.CalculationSheetDetailID = detail4.ParentID RIGHT OUTER JOIN
                      CalculationSheetDetail AS detail2 ON detail3.ParentID = detail2.CalculationSheetDetailID ON detail1.CalculationSheetDetailID = detail2.ParentID
WHERE     (masterdetail.CalculationSheetDetailID = @CalculationSheetDetailID) OR
                      (masterdetail.ParentID = @CalculationSheetDetailID)))
 
 
 
   delete  from CalculationSheetDetail
where CalculationSheetDetailID  in (
 (
SELECT  
                    detail1.CalculationSheetDetailID AS Detail1
FROM         CalculationSheetDetail AS masterdetail LEFT OUTER JOIN
                      CalculationSheetDetail AS detail1 ON masterdetail.ParentID = detail1.CalculationSheetDetailID LEFT OUTER JOIN
                      CalculationSheetDetail AS detail3 LEFT OUTER JOIN
                      CalculationSheetDetail AS detail4 ON detail3.CalculationSheetDetailID = detail4.ParentID RIGHT OUTER JOIN
                      CalculationSheetDetail AS detail2 ON detail3.ParentID = detail2.CalculationSheetDetailID ON detail1.CalculationSheetDetailID = detail2.ParentID
WHERE     (masterdetail.CalculationSheetDetailID = @CalculationSheetDetailID) OR
                      (masterdetail.ParentID = @CalculationSheetDetailID)))
                      
                      
                      
   delete  from CalculationSheetDetail
where CalculationSheetDetailID  in (
 (
SELECT  
                    masterdetail.CalculationSheetDetailID AS masterdetail
FROM         CalculationSheetDetail AS masterdetail LEFT OUTER JOIN
                      CalculationSheetDetail AS detail1 ON masterdetail.ParentID = detail1.CalculationSheetDetailID LEFT OUTER JOIN
                      CalculationSheetDetail AS detail3 LEFT OUTER JOIN
                      CalculationSheetDetail AS detail4 ON detail3.CalculationSheetDetailID = detail4.ParentID RIGHT OUTER JOIN
                      CalculationSheetDetail AS detail2 ON detail3.ParentID = detail2.CalculationSheetDetailID ON detail1.CalculationSheetDetailID = detail2.ParentID
WHERE     (masterdetail.CalculationSheetDetailID = @CalculationSheetDetailID) OR
                      (masterdetail.ParentID = @CalculationSheetDetailID)))
 
 
 
End
