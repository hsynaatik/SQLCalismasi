
DECLARE @ITEMID AS INT
DECLARE @DATE AS DATETIME
DECLARE @AMOUNT AS INT
DECLARE @IOTTYPE AS SMALLINT

SET @ITEMID=ROUND(RAND()*4,0)
IF @ITEMID=0
   SET @ITEMID=1

   SET @DATE =DATEADD(DAY,-ROUND(RAND()*365,0),GETDATE())
   SET @AMOUNT=ROUND(RAND()*9,0)+1
   SET @IOTTYPE=ROUND(RAND()*1,0)+1

INSERT INTO ITEMTRANSACTIONS
VALUES(@ITEMID,@DATE,@AMOUNT,@IOTTYPE)
SELECT *FROM ITEMTRANSACTIONS

TRUNCATE TABLE ITEMTRANSACTIONS

/*TRIGGER LOGLAMA*/
CREATE DATABASE LOGDB
CREATE TABLE [dbo].[ITEMS_LOG](
	[ID] [int] NULL,
	[ITEMCODE] [varchar](50) NULL,
	[ITEMNAME] [varchar](100) NULL,
	[UNITPRICE] [float] NULL,
	[CATEGORY1] [varchar](50) NULL,
	[CATEGORY2] [varchar](50) NULL,
	[CATEGORY3] [varchar](50) NULL,
	[CATEGORY4] [varchar](50) NULL,
	[BRAND] [varchar](50) NULL,
	[LOG_ACTIONTYPE] [varchar](20) NULL,
	[LOG_DATE] [datetime] NULL,
	[LOG_USERNAME] [varchar](50) NULL,
	[LOG_PROGRAMNAME] [varchar](50) NULL,
	[LOG_HOSTNAME] [varchar](50) NULL
) ON [PRIMARY]

CREATE TRIGGER TRG_ITEMS_UPDATE
ON ITEMS
AFTER UPDATE
AS
BEGIN
INSERT INTO ITEMS_LOG
(ID, ITEMCODE, ITEMNAME, UNITPRICE, CATEGORY1, CATEGORY2, CATEGORY3, CATEGORY4, BRAND, LOG_ACTIONTYPE, LOG_DATE, LOG_USERNAME, LOG_PROGRAMNAME, LOG_HOSTNAME)
SELECT ID,ITEMCODE,ITEMNAME,UNITPRICE,CATEGORY1,CATEGORY2,CATEGORY3,CATEGORY4,BRAND,'UPDATE',GETDATE(),SUSER_NAME(),PROGRAM_NAME(),HOST_NAME()
FROM DELETED 
END

UPDATE [OrnekDB].[dbo].[ITEMS] SET ITEMNAME ='SORT' WHERE ID=1 

SELECT*FROM ITEMS_LOG
