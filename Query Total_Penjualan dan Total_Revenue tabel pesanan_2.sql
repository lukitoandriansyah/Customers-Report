SELECT 
sum(quantity) Total_Penjualan, 
sum(quantity*priceeach) Total_Revenue
FROM 
`(project)_customer_report`.pesanan_2
where 
status = 'Shipped';