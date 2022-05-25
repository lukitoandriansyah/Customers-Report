SELECT 
categoryID, SUM(orderNumber) Total_Order,
SUM(quantity) Total_Penjualan 
FROM
( SELECT 
*, LEFT(productCode,3) categoryID 
FROM pesanan_1
WHERE status = "Shipped" ) Tabel_c 
GROUP BY categoryID
ORDER BY Total_Order 
DESC;