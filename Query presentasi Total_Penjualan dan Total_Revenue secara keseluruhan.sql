(SELECT 
V, SUM(quantity) Total_Penjualan, SUM(quantity*priceeach) Total_Revenue 
FROM 
(SELECT *, 'Quarter 1' V FROM pesanan_1
UNION
SELECT *, 'Quarter 2' V FROM pesanan_2 
ORDER BY orderDate ASC) tabel_1
WHERE status='Shipped' 
Group By V)
Union
(SELECT 
'Pertumbuhan (%)',
ROUND(((Tabel_2.Total_Penjualan-Tabel_1.Total_Penjualan)/Tabel_1.Total_Penjualan ) * 100,2) 'Pertumbuhan_Total_Penjualan_(%)',
ROUND(((Tabel_2.Total_Revenue-Tabel_1.Total_Revenue)/Tabel_1.Total_Revenue ) * 100,2) 'Pertumbuhan_Total_Revenue_(%)'
FROM
(SELECT 
0 V, sum(quantity) Total_Penjualan, 
sum(quantity*priceeach) Total_Revenue
FROM 
`(project)_customer_report`.pesanan_1
where 
status = 'Shipped' ) Tabel_1
INNER JOIN
(SELECT 
0 V, sum(quantity) Total_Penjualan, 
sum(quantity*priceeach) Total_Revenue
FROM 
`(project)_customer_report`.pesanan_2
where 
status = 'Shipped' ) Tabel_2
ON Tabel_1.V=Tabel_2.V);