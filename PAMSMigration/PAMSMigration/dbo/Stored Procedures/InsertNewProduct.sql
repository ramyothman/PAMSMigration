﻿CREATE PROCEDURE [dbo].[InsertNewProduct]
    @CategoryID int,
    @Name nvarchar(MAX),
    @Col1 decimal(18,2),
    @Col2 decimal(18,2),
    @Col3 decimal(18,2),
    @Col4 decimal(18,2),
    @Col5 decimal(18,2),
    @Col6 decimal(18,2),
    @Col7 decimal(18,2),
    @Col8 decimal(18,2),
    @Col9 decimal(18,2),
    @Col10 decimal(18,2),
    @Col11 bit,
    @Col12 bit,
    @Col13 bit,
    @Col14 bit,
    @Col15 bit,
    @Col16 bit,
    @Col17 bit,
    @Col18 bit,
    @Col19 bit,
    @Col20 bit,
    @Col21 nvarchar(MAX),
    @Col22 nvarchar(MAX),
    @Col23 nvarchar(MAX),
    @Col24 nvarchar(MAX),
    @Col25 nvarchar(MAX),
    @Col26 nvarchar(MAX),
    @Col27 nvarchar(MAX),
    @Col28 nvarchar(MAX),
    @Col29 nvarchar(MAX),
    @Col30 nvarchar(MAX),
    @ProductTypeID int = 1  , 
    @CostPrice decimal(18,2) = 0 , 
    @CurrencyID int  = 1 , 
    @RateToEuro decimal(18,2) = 0 , 
    @CostPriceInEuro decimal(18,2) = 0 
AS
INSERT INTO [dbo].[Product] (
    [CategoryID],
    [Name],
    [Col1],
    [Col2],
    [Col3],
    [Col4],
    [Col5],
    [Col6],
    [Col7],
    [Col8],
    [Col9],
    [Col10],
    [Col11],
    [Col12],
    [Col13],
    [Col14],
    [Col15],
    [Col16],
    [Col17],
    [Col18],
    [Col19],
    [Col20],
    [Col21],
    [Col22],
    [Col23],
    [Col24],
    [Col25],
    [Col26],
    [Col27],
    [Col28],
    [Col29],
    [Col30] ,
    [CostPrice],
    [CostPriceInEuro],
    [CurrencyID],
    [ProductTypeID],
    [RateToEuro]
    )
Values (
    @CategoryID,
    @Name,
    @Col1,
    @Col2,
    @Col3,
    @Col4,
    @Col5,
    @Col6,
    @Col7,
    @Col8,
    @Col9,
    @Col10,
    @Col11,
    @Col12,
    @Col13,
    @Col14,
    @Col15,
    @Col16,
    @Col17,
    @Col18,
    @Col19,
    @Col20,
    @Col21,
    @Col22,
    @Col23,
    @Col24,
    @Col25,
    @Col26,
    @Col27,
    @Col28,
    @Col29,
    @Col30 ,
    @CostPrice,
    @CostPriceInEuro,
    @CurrencyID,
    @ProductTypeID,
    @RateToEuro
    )
IF @@ROWCOUNT > 0
Select * from Product
Where [ProductID] = @@identity
