﻿CREATE PROCEDURE [dbo].[GetByIDCategory]
    @CategoryID int
AS
BEGIN
Select CategoryID, Category2ID, Name, Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15, Col16, Col17, Col18, Col19, Col20, Col21, Col22, Col23, Col24, Col25, Col26, Col27, Col28, Col29, Col30
From [dbo].[Category]
WHERE [CategoryID] = @CategoryID
END
