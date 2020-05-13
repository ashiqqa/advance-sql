
--OffSet

SELECT * FROM tblProducts
ORDER BY Id --required
OFFSET 3 ROWS --Starting row number
FETCH NEXT 15 ROWS ONLY --Page size

CREATE PROC sp_getProductByPage
@PageNumber INT=1, @PageSize INT = 20
AS
SELECT * FROM tblProducts
ORDER BY Id
OFFSET (@PageNumber-1)*@PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY

sp_getProductByPage 3000, 100
