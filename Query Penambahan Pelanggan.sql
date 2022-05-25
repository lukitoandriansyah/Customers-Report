	SELECT Quarter, COUNT(DISTINCT(customerID)) Total_Pelanggan FROM (SELECT 
    customerID, createDate, quarter(createDate) Quarter 
    FROM 
    pelanggan
    WHERE createDate BETWEEN '2004-01-01' AND '2004-06-30') Tabel_b 
    GROUP BY Quarter; 