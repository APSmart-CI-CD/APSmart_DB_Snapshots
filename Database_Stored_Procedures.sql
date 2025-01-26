-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: apsmart-main-db-mysql8.c6jssxf3a4wt.us-east-1.rds.amazonaws.com    Database: OrderSmart
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Dumping routines for database 'OrderSmart'
--
/*!50003 DROP FUNCTION IF EXISTS `AddDays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`cloudxuser`@`%` FUNCTION `AddDays`(dateToadd datetime, numberOfDays int) RETURNS datetime
BEGIN
	DECLARE dt datetime;
	set dt = DATE_ADD(dateToadd,INTERVAL numberOfDays DAY);
	RETURN dt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DiffDays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`cloudxuser`@`%` FUNCTION `DiffDays`(dateFrom datetime, dateTo datetime) RETURNS int
BEGIN
	DECLARE dif int;
	SELECT DATEDIFF(dateTo, dateFrom) into dif;
    RETURN dif;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TruncateTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`cloudxuser`@`%` FUNCTION `TruncateTime`(dateValue DateTime) RETURNS date
BEGIN
	return Date(dateValue);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertOrderHeader` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cloudxuser`@`%` PROCEDURE `InsertOrderHeader`(
	IN ocrCustomerNo varchar(20),
    IN ocrOrderNo varchar(100),
    IN ocrPONum varchar(100),
    IN shipToAddressCode varchar(100),
    IN billToAddressCode varchar(100),
    IN ocrOrderDate varchar(20),
    IN ShipDate varchar(20),
    IN BatchID varchar(100),
    IN DocNum varchar(100),
    IN ocrComment varchar(250),
    IN ocrTerms varchar(50),
    IN Verifier varchar(100),
    IN ocrOrderTotal varchar(50),
    IN ocrOrderID Int,
    IN ocrClientId Int
)
begin
	DECLARE ocrBillToID INT;
    DECLARE ocrShipToID INT;
	If exists (Select * from OrderSmart.`Order` where OrderId = ocrOrderID) Then

		SET ocrBillToID = (SELECT BillToID from OrderSmart.BillTo where BillToCode = billToAddressCode 
        and IsActive = 1 And ClientCustomerId in (select ClientCustomerId from OrderSmart.ClientCustomer
        where ClientId = ocrClientId) Limit 1);
		SET ocrShipToID = (SELECT ShipToID from OrderSmart.ShipTo where ShipToCode = shipToAddressCode 
        and IsActive = 1 And ClientCustomerId in (select ClientCustomerId from OrderSmart.ClientCustomer
        where ClientId = ocrClientId) Limit 1);

		Update OrderSmart.`Order` 
        Set CustomerNumber = ocrCustomerNo,
        OrderNo = ocrOrderNo,
        OrderDate = ocrOrderDate,
        OrderTotal = ocrOrderTotal,
        PONumber = ocrPONum,
        ShippingDate = ShipDate,
        LastActionDate = SYSDATE(),
        CaptureDocumentNumber = DocNum,
        `Comment` = ocrComment,
        Terms = ocrTerms,
        CaptureBatchId = BatchID,
        ABBYYBatchName = BatchID,
        VerifierName = Verifier,
        BillToId = ocrBillToID,
        ShipToId = ocrShipToID
        where OrderId = ocrOrderID;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertOrderLineItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cloudxuser`@`%` PROCEDURE `InsertOrderLineItem`(
	IN ocrOrderNo varchar(100),
    IN ocrPONum varchar(100),
    IN shipToAddressCode varchar(100),
    IN billToAddressCode varchar(100),
    IN ocrProductId varchar(20),
    IN ocrProductDesc varchar(255),
    IN ocrUnitPrice varchar(50),
    IN ocrExtPrice varchar(50),
    IN ocrLineNo varchar(20),
    IN ocrQty varchar(50),
    IN ocrUOM varchar(50),
    IN ocrImagePageNo Int,
    IN ocrOrderID Int,
    IN ocrClientId Int,
    IN ocrIsLastLine Int
)
begin
	DECLARE ocrBillToID INT;
    DECLARE ocrShipToID INT;
    DECLARE otherOrderID INT;
    -- If the Order already exists with other OrderID, insert the line item to that order
    SET otherOrderID = (SELECT OrderID from OrderSmart.`Order` where OrderNo = ocrOrderNo and ClientId = ocrClientId and OrderId <> ocrOrderID);
    If (otherOrderID is not null) Then
		SET ocrOrderID = otherOrderID;		
    End If;
	If exists (Select * from OrderSmart.`Order` where OrderId = ocrOrderID) Then
		If not exists (select * from OrderSmart.LineItemDetail where OrderId = ocrOrderID
		And LineNo = ocrLineNo And ProductId = ocrProductId) Then
			SET ocrBillToID = (SELECT BillToID from OrderSmart.BillTo where BillToCode = billToAddressCode 
			and IsActive = 1 And ClientCustomerId in (select ClientCustomerId from OrderSmart.ClientCustomer
			where ClientId = ocrClientId) Limit 1);
			SET ocrShipToID = (SELECT ShipToID from OrderSmart.ShipTo where ShipToCode = billToAddressCode 
			and IsActive = 1 And ClientCustomerId in (select ClientCustomerId from OrderSmart.ClientCustomer
			where ClientId = ocrClientId) Limit 1);
			Insert Into OrderSmart.LineItemDetail
            (OrderId,ProductId,ProductDescription,UnitPrice,CalculatedUnitPrice,TotalAmount,
            LineNo,Quantity,UnitCost,UnitOfPurchase,PONumber,ShipToId,BillToId,Notes,
            CalculatedQty,CalculatedPrice,ImagePageNumber)
            values(ocrOrderID,ocrProductId,ocrProductDesc,ocrUnitPrice,ocrUnitPrice,
            ocrExtPrice,ocrLineNo,ocrQty,ocrUnitPrice,ocrUOM,ocrPONum,ocrShipToID,
            ocrBillToID,ocrOrderNo,ocrQty,ocrExtPrice,ocrImagePageNo);
		end if;
        If (ocrIsLastLine = '1') Then
			Update OrderSmart.`Order` Set ApprovalStatusId = 3 Where OrderId = ocrOrderID;
        end if;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MonthlyBilling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cloudxuser`@`%` PROCEDURE `MonthlyBilling`(
	IN startDate DateTime,
    IN endDate DateTime
)
begin

select COUNT(*) As Nosco from `Order` where Clientid = 3
and ScannedDate >= startDate and ScannedDate < endDate;

select COUNT(*) As NoscoPages from OrderDocs where OrderId in (select OrderId from `Order` where Clientid =3
and ScannedDate >= startDate and ScannedDate < endDate);

select COUNT(*) As PortJersey from `Order` where Clientid = 4
and ScannedDate >= startDate and ScannedDate < endDate;

select COUNT(*) As PortJerseyPages from OrderDocs where OrderId in (select OrderId from `Order` where Clientid =4
and ScannedDate >= startDate and ScannedDate < endDate);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-26 19:49:00
