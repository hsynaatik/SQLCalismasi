USE ETradeDB
SELECT*
FROM
CUSTOMERS

/* tabloya veri ekleme*/
INSERT INTO CUSTOMERS VALUES('Hakký Öðren','Gaziantep','1986-04-12','ÞehitKamil','E')

/* Tabloda veri güncelleme*/
UPDATE CUSTOMERS SET Nation='TR',Age=DATEDIFF(YEAR,BirthDate,GETDATE())

/*Tablodaki Verileri Siler yeni veri eklendiðinde otomatik artan ýd i kaldýðý yerden baslar*/
DELETE FROM CUSTOMERS
/*Tablodaki tüm verileri siler yeni veri eklendiðinde ýd i 1den baslar*/
TRUNCATE TABLE CUSTOMERS


SELECT * FROM CUSTOMERS
WHERE Age>=40

SELECT *FROM CUSTOMERS
WHERE BirthDate BETWEEN '1990' AND '1999'
/*AND iki þartýda karþýlamalý 
  OR operatorü en az tek bir þartý karþýlamalý
  */


  /*DISTINCT tekrar eden satýrlarý tekileþtirir.*/
  SELECT DISTINCT Age From CUSTOMERS


  /*ORDER BY sýralma komutu
    ASC KÜCÜK TEN BÜYÜÐE SIRALAMA
	DESC BÜYÜKTEN KÜÇÜÐE SIRLAMA
    */
  SELECT *FROM CUSTOMERS ORDER BY CustomerName asc
   
   /*AGGREGATE FUNCTIONS*/
   /*SELECT 
     SUM,COUNT, MIN, MAX, AVG FROM TABLOADI
	 AVG =ortalama
	 */

/*ASCII*/
SELECT ASCII('B')
/*CHAR FONKSIYONLARI*/
SELECT CHAR(66)

/*concat*/
SELECT CONCAT('HÜSEYİN','ATIK')