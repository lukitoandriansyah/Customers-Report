SELECT 
Quarter, COUNT(DISTINCT(customerID)) Total_Pelanggan 
FROM
(SELECT 
*, quarter(createDate) Quarter 
FROM `(project)_customer_report`.pelanggan 
WHERE createDate 
BETWEEN '2004-01-01' AND '2004-06-30') Tabel_b
WHERE customerID 
IN (SELECT DISTINCT(customerID) 
FROM `(project)_customer_report`.pesanan_1
UNION SELECT DISTINCT(customerID) 
FROM `(project)_customer_report`.pesanan_2) 
GROUP BY Quarter; 