SELECT 
Tabel_1.categoryID,
Tabel_1.Total_Order Total_Order_Quarter_2,
Tabel_2.Total_Order Total_Order_Quarter_1,
SUM(Tabel_1.Total_Penjualan) Total_Penjualan_Quarter_2,
SUM(Tabel_2.Total_Penjualan) Total_Penjualan_Quarter_1
FROM
( SELECT 
categoryID, COUNT(DISTINCT(orderNumber)) Total_Order,
SUM(quantity) Total_Penjualan 
FROM
( SELECT 
*, LEFT(productCode,3) categoryID 
FROM pesanan_2
WHERE status = "Shipped" ) Tabel_c 
GROUP BY categoryID
ORDER BY Total_Order 
DESC ) Tabel_1
INNER JOIN  
( SELECT 
categoryID, COUNT(DISTINCT(orderNumber)) Total_Order,
SUM(quantity) Total_Penjualan 
FROM
( SELECT 
*, LEFT(productCode,3) categoryID 
FROM pesanan_1
WHERE status = "Shipped" ) Tabel_c 
GROUP BY categoryID
ORDER BY Total_Order 
DESC ) Tabel_2
ON Tabel_1.categoryID = Tabel_2.categoryID
GROUP BY tabel_1.categoryID
ORDER BY Total_Order_Quarter_2 DESC;