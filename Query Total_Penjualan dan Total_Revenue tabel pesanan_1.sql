SELECT 
sum(quantity) Total_Penjualan, 
sum(quantity*priceeach) Total_Revenue
FROM 
`(project)_customer_report`.pesanan_1
where 
status = 'Shipped';