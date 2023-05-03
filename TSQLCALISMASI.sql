/*TIP DONUSTURME FONKSIYONLARI*/
/*
   CONVERT= SELECT CONVERT(DATE,'2022-06-25') AS DATE_
   CAST = SELECT CAST('2022-06-25' AS DATE) AS DATE_
   PARSE
   TRY_CAST= SELECT TRY_CAST('2022-06-25' AS DATE) AS DATE_
   TRY_CONVERT=SELECT TRY_CONVERT(DATE,'2022-06-25') AS DATE_
   TRY_PARSE
*/

SELECT CAST('20020525' AS DATE)/* STRING IFADE TARIHE DONUSTURULDU.*/
SELECT CONVERT(DATE,'20080612') /*STRING IFADE TARIH E DONUSTURULDU*/
SELECT CONVERT(INT,65.25) /*FLOAT DEGER INT E DONUSTURULDU*/

SELECT 'BUGUNUN TARIHI: '+CONVERT(VARCHAR,CONVERT(DATE,GETDATE()))
SELECT 'SUANDA SAAT: '+CONVERT(VARCHAR,CONVERT(TIME,GETDATE()))

SELECT 'BUGUNUN TARIHI: '+CONVERT(VARCHAR,GETDATE(),103)
SELECT 'SUANDA SAAT: '+CONVERT(VARCHAR,GETDATE(),108)

SELECT TRY_CAST('251612' AS DATE)/*HATA VERMEDI AMA NULL DONDU*/
SELECT TRY_CONVERT(DATE,'20051812')/*HATAYI YAKALADI VE NULL DEGER DONDURDU*/

/*MATEMATIK FONKSIYONLAR*/

/*ABS MUTLAK DEGER FONKSIYONU: BIR SAYININ MUTLAK DEGERINI GETIRIR.
  SIGN ISARET FONKSIYONU: BIR SAYININ ISARETINI(POZATIF MI NEGATIF MI) GETIRIR.
*/
SELECT ABS(-56) ABS_
SELECT SIGN(-15) SIGN_
SELECT SIGN(69.00) SIGN2_

/*
   ROUND: VIRGULE KADAR YUVARLIYOR VIRGULDEN SONRA BIZ KARAR VERIYORUZ
   FLOOR: ASAGI YUVARLAR INT DEGER ELDE EDILIR
   CEILING: YUKARI YUVARLAR INT DEGER ELDE EDILIR
*/

SELECT ROUND(136.5658,2) ROUND_,
FLOOR(12.96) FLOOR_,
CEILING(25.48) CEILING_

/*
  RAND() FANKSIYONU: 0-1 ARASINDA RASTGELE FLOT DEGER SAYI URETIR
*/
SELECT RAND() AS RANDOMDEGER

/*1-100 ARASI TAM SAYI URET*/
SELECT CONVERT(INT,RAND()*100)

/*T-SQL PROGRAMLAMA*/
/*
  -DEGISKENLER
  -SART BLOKLARI
  -DONGULER
  -HATA YONETIMI
  -CURSOR KAVRAMI
*/

/*1.DEGISKENLER
 DEGISKENLER DECLARE ILE TANIMLANIR @ ISARETI ILE BASLAR DAHA SONRA VERI TIPI BELIRLENIR
 DEGISKENE SET ILE DEGER ATANIR
*/

DECLARE @SAYI INT
 SET @SAYI=36
DECLARE @SAYI1 INT
 SET @SAYI1=18
DECLARE @TOPLAM INT
SET @TOPLAM=@SAYI+@SAYI1
SELECT @TOPLAM TOPLAM


/*28 AY ONCEKI YAS*/
DECLARE @DOGUMTARIHI AS DATE
DECLARE @TARIH AS DATE
SET @TARIH=DATEADD(MONTH,-28,GETDATE())
DECLARE @YAS AS INT
SET @DOGUMTARIHI='2002-05-25'
SELECT @YAS= DATEDIFF(YEAR,@DOGUMTARIHI,@TARIH)
SELECT @YAS  YAS,@TARIH _28AYONCE

/*SART BLOKLARI
  
  1.IF
  2.CASE WHEN
  3.IiF

*/

/* IF ORNEK */
DECLARE @VIZE FLOAT
SET @VIZE=45.5
DECLARE @FINAL FLOAT
SET @FINAL=60.25
DECLARE @ORT FLOAT
SET @ORT=@VIZE*0.3+@FINAL*0.7

DECLARE @DURUM VARCHAR(50)
IF(@ORT<50)
   SET @DURUM='BASARISIZ'
ELSE
  SET @DURUM='BASARILI'
SELECT @DURUM NOTDURUMU

/*CASE WHEN*/

USE OrnekDB
SELECT 
CASE 
  WHEN GENDER='E' THEN 'ERKEK'
  WHEN GENDER='K' THEN 'KADIN'
END AS GENDERGROUP,*FROM USERS

/*IIF*/

SELECT IIF(GENDER='E','ERKEK','KADIN') AS GENDERGROUP,
*FROM USERS

/*TSQL DONGULER*/
/*1.GO KOMUTU*/

INSERT INTO DATES (DATE_)VALUES (GETDATE())
GO 15

SELECT*FROM DATES

/*2.WHILE KOMUTU*/

DECLARE @I AS INT=0
WHILE @I<10
BEGIN
     INSERT INTO DATES (DATE_)VALUES (GETDATE())
	 SET @I=@I+1
END



