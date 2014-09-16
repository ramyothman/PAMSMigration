/*WHERE     (CategoryID <> 0)*/
CREATE VIEW [dbo].[GetAllCategory]
AS
SELECT     CategoryID, Category2ID, Name, ISNULL(Col1, 'false') AS Col1, ISNULL(Col2, 'false') AS Col2, ISNULL(Col3, 'false') AS Col3, ISNULL(Col4, 'false') AS Col4, 
                      ISNULL(Col5, 'false') AS Col5, ISNULL(Col6, 'false') AS Col6, ISNULL(Col7, 'false') AS Col7, ISNULL(Col8, 'false') AS Col8, ISNULL(Col9, 'false') AS Col9, ISNULL(Col10, 
                      'false') AS Col10, ISNULL(Col11, 'false') AS Col11, ISNULL(Col12, 'false') AS Col12, ISNULL(Col13, 'false') AS Col13, ISNULL(Col14, 'false') AS Col14, ISNULL(Col15, 
                      'false') AS Col15, ISNULL(Col16, 'false') AS Col16, ISNULL(Col17, 'false') AS Col17, ISNULL(Col18, 'false') AS Col18, ISNULL(Col19, 'false') AS Col19, ISNULL(Col20, 
                      'false') AS Col20, ISNULL(Col21, 'false') AS Col21, ISNULL(Col22, 'false') AS Col22, ISNULL(Col23, 'false') AS Col23, ISNULL(Col24, 'false') AS Col24, ISNULL(Col25, 
                      'false') AS Col25, ISNULL(Col26, 'false') AS Col26, ISNULL(Col27, 'false') AS Col27, ISNULL(Col28, 'false') AS Col28, ISNULL(Col29, 'false') AS Col29, ISNULL(Col30, 
                      'false') AS Col30, EgyptID, RPEID, QatarID
FROM         dbo.Category
