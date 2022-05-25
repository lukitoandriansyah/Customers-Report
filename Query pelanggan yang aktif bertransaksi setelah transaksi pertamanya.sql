SELECT 
Tabel_1.Quarter,
Tabel_1.Pelanggan_Q1 Pelanggan_Q1,
Tabel_2.Pelanggan_Q2 Pelanggan_Q1_di_Q2,
Round((Pelanggan_Q2 / Pelanggan_Q1)*100,2) 'Persentase_Pelanggan_Setia_(%)'
FROM
( SELECT 1 Quarter , 
COUNT(DISTINCT(customerID)) Pelanggan_Q1 FROM `(project)_customer_report`.pesanan_1 ) Tabel_1
INNER JOIN
( SELECT 1 Quarter , 
COUNT(DISTINCT(customerID)) Pelanggan_Q2 FROM `(project)_customer_report`.pesanan_1
WHERE customerID IN ( SELECT DISTINCT customerID FROM `(project)_customer_report`.pesanan_2 ) )
Tabel_2
ON Tabel_1.Quarter = Tabel_2.Quarter
;