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
-- Table structure for table `APClerkVendor`
--

DROP TABLE IF EXISTS `APClerkVendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APClerkVendor` (
  `APClerkId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VendorId` int NOT NULL,
  PRIMARY KEY (`APClerkId`,`VendorId`),
  UNIQUE KEY `APClerkId` (`APClerkId`),
  KEY `FK_APClerkVendor_Vendor` (`VendorId`),
  CONSTRAINT `FK_APClerkVendor_User` FOREIGN KEY (`APClerkId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_APClerkVendor_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APclerkSetting`
--

DROP TABLE IF EXISTS `APclerkSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APclerkSetting` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IsModified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_APclerkSetting_Order` (`OrderId`),
  CONSTRAINT `FK_APclerkSetting_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_APclerkSetting_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AWFByCustomer`
--

DROP TABLE IF EXISTS `AWFByCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWFByCustomer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int DEFAULT NULL,
  `StateId` int DEFAULT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Title` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_AWFByCustomer_Customer` (`CustomerId`),
  KEY `FK_AWFByCustomer_State` (`StateId`),
  CONSTRAINT `FK_AWFByCustomer_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `FK_AWFByCustomer_State` FOREIGN KEY (`StateId`) REFERENCES `State` (`StateId`),
  CONSTRAINT `FK_AWFByCustomer_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ActionSecurity`
--

DROP TABLE IF EXISTS `ActionSecurity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActionSecurity` (
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Controller` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Action` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ParentController` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ParentAction` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`,`Controller`,`Action`),
  UNIQUE KEY `UserId` (`UserId`),
  CONSTRAINT `FK_User_ActionSecurity` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `AddressId` int NOT NULL AUTO_INCREMENT,
  `StateId` int DEFAULT NULL,
  `ZipCode` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `StreetName` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CityName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Address1` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Address2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Address3` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Address4` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Country` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AddressId`),
  KEY `FK_Address_State` (`StateId`),
  CONSTRAINT `FK_Address_State` FOREIGN KEY (`StateId`) REFERENCES `State` (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=65559 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=81;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApClerkAlphabtes`
--

DROP TABLE IF EXISTS `ApClerkAlphabtes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApClerkAlphabtes` (
  `UserID` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Alphabtes` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID` (`UserID`),
  CONSTRAINT `FK_ApClerkAlphabtes_User` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalHistory`
--

DROP TABLE IF EXISTS `ApprovalHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalHistory` (
  `ApprovalHistoryID` int NOT NULL,
  `OrderId` int NOT NULL,
  `ApproverId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GLCodeId` int NOT NULL,
  `AmountAppoved` decimal(19,4) NOT NULL,
  `StateChangedDate` datetime(6) NOT NULL,
  `CustomerId` int DEFAULT NULL,
  `Recoverabletax` int DEFAULT NULL,
  `SpecialNote` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  `DepartmentId` int DEFAULT NULL,
  `TaxCodeId` int DEFAULT NULL,
  `TaxableAmount` decimal(19,4) DEFAULT NULL,
  `TaxAmount` decimal(19,4) DEFAULT NULL,
  `WithholdingTaxId` int DEFAULT NULL,
  `PurchaseNum` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ImportDoc` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RecoverableTaxAmout` decimal(19,4) DEFAULT NULL,
  `ProjectId` int DEFAULT NULL,
  `SubProjectId` int DEFAULT NULL,
  `CompanyCode` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ApprovalHistoryID`),
  UNIQUE KEY `ApproverId` (`ApproverId`),
  KEY `IX_ApprovalHistory` (`OrderId`,`ApproverId`,`GLCodeId`),
  KEY `FK_ApprovalHistory_Category` (`CategoryId`),
  KEY `FK_ApprovalHistory_Customer` (`CustomerId`),
  KEY `FK_ApprovalHistory_Department` (`DepartmentId`),
  KEY `FK_ApprovalHistory_GLCode` (`GLCodeId`),
  KEY `FK_ApprovalHistory_ProjectType` (`ProjectId`),
  KEY `FK_ApprovalHistory_SubProjectType` (`SubProjectId`),
  KEY `FK_ApprovalHistory_Tax` (`TaxCodeId`),
  KEY `FK_ApprovalHistory_WithHoldingTax` (`WithholdingTaxId`),
  CONSTRAINT `FK_ApprovalHistory_Category` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`Id`),
  CONSTRAINT `FK_ApprovalHistory_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `FK_ApprovalHistory_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_ApprovalHistory_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_ApprovalHistory_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_ApprovalHistory_ProjectType` FOREIGN KEY (`ProjectId`) REFERENCES `ProjectType` (`Id`),
  CONSTRAINT `FK_ApprovalHistory_SubProjectType` FOREIGN KEY (`SubProjectId`) REFERENCES `SubProjectType` (`Id`),
  CONSTRAINT `FK_ApprovalHistory_Tax` FOREIGN KEY (`TaxCodeId`) REFERENCES `Tax` (`Id`),
  CONSTRAINT `FK_ApprovalHistory_User` FOREIGN KEY (`ApproverId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalHistory_WithHoldingTax` FOREIGN KEY (`WithholdingTaxId`) REFERENCES `WithHoldingTax` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalStatusIdForReport`
--

DROP TABLE IF EXISTS `ApprovalStatusIdForReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalStatusIdForReport` (
  `Id` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=3276;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalStep`
--

DROP TABLE IF EXISTS `ApprovalStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalStep` (
  `ApprovalStepId` int NOT NULL AUTO_INCREMENT,
  `StepName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ClientId` int NOT NULL,
  `ClientCompanyId` int DEFAULT NULL,
  `OrderNo` tinyint unsigned NOT NULL,
  `ApprovalStepRule` tinyint unsigned DEFAULT NULL,
  `IsPO` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ApprovalStepId`),
  UNIQUE KEY `IX_ClientCompanyApprovalStep` (`StepName`,`ClientId`,`ClientCompanyId`),
  KEY `FK_ClientCompany_ApprovalStep` (`ClientCompanyId`),
  CONSTRAINT `FK_ClientCompany_ApprovalStep` FOREIGN KEY (`ClientCompanyId`) REFERENCES `ClientCompany` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStep`
--

DROP TABLE IF EXISTS `ApprovalSubStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStep` (
  `ApprovalSubStepId` int NOT NULL AUTO_INCREMENT,
  `ApprovalStepId` int NOT NULL,
  `SubStepName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OrderNo` tinyint unsigned NOT NULL,
  `MaxAllowedAmount` decimal(18,2) DEFAULT NULL,
  `ApprovalForwardingRule` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`ApprovalSubStepId`),
  KEY `FK_ApprovalSubStep_ApprovalStep` (`ApprovalStepId`),
  CONSTRAINT `FK_ApprovalSubStep_ApprovalStep` FOREIGN KEY (`ApprovalStepId`) REFERENCES `ApprovalStep` (`ApprovalStepId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepOrganization`
--

DROP TABLE IF EXISTS `ApprovalSubStepOrganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepOrganization` (
  `ApprovalSubStepId` int NOT NULL,
  `OrganizationId` int NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`OrganizationId`),
  KEY `FK_ApprovalSubStepOrganization_OrgData` (`OrganizationId`),
  CONSTRAINT `FK_ApprovalSubStepOrganization_ApprovalSubStep` FOREIGN KEY (`ApprovalSubStepId`) REFERENCES `ApprovalSubStep` (`ApprovalSubStepId`),
  CONSTRAINT `FK_ApprovalSubStepOrganization_OrgData` FOREIGN KEY (`OrganizationId`) REFERENCES `OrgData` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUser`
--

DROP TABLE IF EXISTS `ApprovalSubStepUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUser` (
  `ApprovalSubStepId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ManualAssignmentOnly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ApprovalSubStepId`,`UserId`),
  UNIQUE KEY `UserId` (`UserId`),
  CONSTRAINT `FK_ApprovalSubStepUser_ApprovalSubStep` FOREIGN KEY (`ApprovalSubStepId`) REFERENCES `ApprovalSubStep` (`ApprovalSubStepId`),
  CONSTRAINT `FK_ApprovalSubStepUser_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=910;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUserCustomer`
--

DROP TABLE IF EXISTS `ApprovalSubStepUserCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUserCustomer` (
  `ApprovalSubStepId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CustomerId` int NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`UserId`,`CustomerId`),
  KEY `FK_ApprovalSubStepUserCustomer_ClientCustomer` (`CustomerId`),
  CONSTRAINT `FK_ApprovalSubStepUserCustomer_ApprovalSubStep` FOREIGN KEY (`ApprovalSubStepId`, `UserId`) REFERENCES `ApprovalSubStepUser` (`ApprovalSubStepId`, `UserId`),
  CONSTRAINT `FK_ApprovalSubStepUserCustomer_ClientCustomer` FOREIGN KEY (`CustomerId`) REFERENCES `ClientCustomer` (`ClientCustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=79;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUserDepartment`
--

DROP TABLE IF EXISTS `ApprovalSubStepUserDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUserDepartment` (
  `ApprovalSubStepId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DepartmentId` int NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`UserId`,`DepartmentId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_ApprovalSubStepUserDepartment_Department` (`DepartmentId`),
  CONSTRAINT `FK_ApprovalSubStepUserDepartment_ApprovalSubStepUser` FOREIGN KEY (`ApprovalSubStepId`, `UserId`) REFERENCES `ApprovalSubStepUser` (`ApprovalSubStepId`, `UserId`),
  CONSTRAINT `FK_ApprovalSubStepUserDepartment_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUserFilter`
--

DROP TABLE IF EXISTS `ApprovalSubStepUserFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUserFilter` (
  `ApprovalSubStepId` int NOT NULL,
  `ApprovalStepUserFilterType` tinyint unsigned NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`ApprovalStepUserFilterType`),
  CONSTRAINT `FK_ApprovalSubStepUserFilter_ApprovalSubStep` FOREIGN KEY (`ApprovalSubStepId`) REFERENCES `ApprovalSubStep` (`ApprovalSubStepId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUserGL`
--

DROP TABLE IF EXISTS `ApprovalSubStepUserGL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUserGL` (
  `ApprovalSubStepId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GLCodeId` int NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`UserId`,`GLCodeId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_ApprovalSubStepUserGL_GLCode` (`GLCodeId`),
  CONSTRAINT `FK_ApprovalSubStepUserGL_ApprovalSubStepUser` FOREIGN KEY (`ApprovalSubStepId`, `UserId`) REFERENCES `ApprovalSubStepUser` (`ApprovalSubStepId`, `UserId`),
  CONSTRAINT `FK_ApprovalSubStepUserGL_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUserVendor`
--

DROP TABLE IF EXISTS `ApprovalSubStepUserVendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUserVendor` (
  `ApprovalSubStepId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VendorId` int NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`UserId`,`VendorId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_ApprovalSubStepVendor_Vendor` (`VendorId`),
  CONSTRAINT `FK_ApprovalSubStepUserVendor_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalSubStepVendor_ApprovalSubStep` FOREIGN KEY (`ApprovalSubStepId`) REFERENCES `ApprovalSubStep` (`ApprovalSubStepId`),
  CONSTRAINT `FK_ApprovalSubStepVendor_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalSubStepUserVendorAlphabet`
--

DROP TABLE IF EXISTS `ApprovalSubStepUserVendorAlphabet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalSubStepUserVendorAlphabet` (
  `ApprovalSubStepId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Alphabets` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ApprovalSubStepId`,`UserId`),
  UNIQUE KEY `UserId` (`UserId`),
  CONSTRAINT `FK_ApprovalSubStepUser_ApprovalSubStepUserVendorAlphabet` FOREIGN KEY (`ApprovalSubStepId`, `UserId`) REFERENCES `ApprovalSubStepUser` (`ApprovalSubStepId`, `UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApprovalWorkFlow`
--

DROP TABLE IF EXISTS `ApprovalWorkFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApprovalWorkFlow` (
  `VendorId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Title` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FirstEscalationManagerId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SeondEscalationManagerId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ThirdEscalationManagerId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ExceptionHandlerId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CurrentLevelUserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Duration` int NOT NULL,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`VendorId`,`UserId`,`Title`),
  UNIQUE KEY `UserId` (`UserId`),
  UNIQUE KEY `CurrentLevelUserId` (`CurrentLevelUserId`),
  UNIQUE KEY `ExceptionHandlerId` (`ExceptionHandlerId`),
  UNIQUE KEY `FirstEscalationManagerId` (`FirstEscalationManagerId`),
  UNIQUE KEY `SeondEscalationManagerId` (`SeondEscalationManagerId`),
  UNIQUE KEY `ThirdEscalationManagerId` (`ThirdEscalationManagerId`),
  CONSTRAINT `FK_ApprovalWorkFlow_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalWorkFlow_User1` FOREIGN KEY (`FirstEscalationManagerId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalWorkFlow_User2` FOREIGN KEY (`SeondEscalationManagerId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalWorkFlow_User3` FOREIGN KEY (`ThirdEscalationManagerId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalWorkFlow_User4` FOREIGN KEY (`ExceptionHandlerId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalWorkFlow_User5` FOREIGN KEY (`CurrentLevelUserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApprovalWorkFlow_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApproverByAmount`
--

DROP TABLE IF EXISTS `ApproverByAmount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApproverByAmount` (
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MaximumAllowedAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `SecondApproverId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AuthCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `SecondApproverId` (`SecondApproverId`),
  UNIQUE KEY `UserId` (`UserId`),
  CONSTRAINT `FK_ApproverByAmount_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ApproverByAmount_User1` FOREIGN KEY (`SecondApproverId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApproverGLCode`
--

DROP TABLE IF EXISTS `ApproverGLCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApproverGLCode` (
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GLCodeId` int NOT NULL,
  `Id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_ApproverGLCode_GLCode` (`GLCodeId`),
  CONSTRAINT `FK_ApproverGLCode_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_ApproverGLCode_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApproverSetting`
--

DROP TABLE IF EXISTS `ApproverSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApproverSetting` (
  `OrderId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DateIssued` datetime(6) NOT NULL,
  `IsDelegated` tinyint(1) NOT NULL DEFAULT '0',
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsEscalated` tinyint(1) NOT NULL DEFAULT '0',
  `OrderNo` int NOT NULL DEFAULT '1',
  `IsHold` tinyint(1) NOT NULL DEFAULT '0',
  `RecoveryDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`OrderId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_ApproverSetting_Order` (`OrderId`),
  CONSTRAINT `FK_ApproverSetting_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_ApproverSetting_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuditorAssigment`
--

DROP TABLE IF EXISTS `AuditorAssigment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditorAssigment` (
  `AssigmentId` bigint NOT NULL,
  `AssignedBy` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AssigmentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AuditorID` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OrderID` int NOT NULL,
  `IsAudited` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AssigmentId`),
  UNIQUE KEY `AssignedBy` (`AssignedBy`),
  UNIQUE KEY `AuditorID` (`AuditorID`),
  KEY `FK_AuditorAssigment_Order` (`OrderID`),
  CONSTRAINT `FK_AuditorAssigment_AssignedByUser` FOREIGN KEY (`AssignedBy`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_AuditorAssigment_AuditorUser` FOREIGN KEY (`AuditorID`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_AuditorAssigment_Order` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuditorsComments`
--

DROP TABLE IF EXISTS `AuditorsComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditorsComments` (
  `commentID` bigint NOT NULL,
  `EntryDate` datetime NOT NULL,
  `AuditorID` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OrderID` int NOT NULL,
  `Comment` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`commentID`),
  UNIQUE KEY `AuditorID` (`AuditorID`),
  KEY `FK_AuditorsComments_Order` (`OrderID`),
  CONSTRAINT `FK_AuditorsComments_Order` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_AuditorsComments_User` FOREIGN KEY (`AuditorID`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Batch`
--

DROP TABLE IF EXISTS `Batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Batch` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BatchName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CapturedBatchID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BatchType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `Source` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientID` int DEFAULT NULL,
  `Sender` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=77532 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=169;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BillTo`
--

DROP TABLE IF EXISTS `BillTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BillTo` (
  `BillToId` int NOT NULL AUTO_INCREMENT,
  `ClientCustomerId` int NOT NULL,
  `BillToCode` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BillToMailingName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressId` int NOT NULL,
  `BusUnit` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `Overs` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Unders` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ConversionRate` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BillToId`),
  KEY `FK_Address_BillTo` (`AddressId`),
  KEY `FK_ClientCustomer_BillTo` (`ClientCustomerId`),
  CONSTRAINT `FK_Address_BillTo` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_ClientCustomer_BillTo` FOREIGN KEY (`ClientCustomerId`) REFERENCES `ClientCustomer` (`ClientCustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4881 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=105;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CaptureActiveUser`
--

DROP TABLE IF EXISTS `CaptureActiveUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CaptureActiveUser` (
  `APSmartUserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `WindowUserId` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OrderId` int NOT NULL,
  PRIMARY KEY (`APSmartUserId`,`WindowUserId`,`OrderId`),
  UNIQUE KEY `APSmartUserId` (`APSmartUserId`),
  CONSTRAINT `FK_CaptureActiveUser_User` FOREIGN KEY (`APSmartUserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ClientId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `CategoryName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CategoryNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Category_Customer` (`CustomerId`),
  CONSTRAINT `FK_Category_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `City` (
  `StateId` int NOT NULL,
  `CityId` int NOT NULL AUTO_INCREMENT,
  `CityName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CityId`,`StateId`),
  KEY `FK_City_State` (`StateId`),
  CONSTRAINT `FK_City_State` FOREIGN KEY (`StateId`) REFERENCES `State` (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `ClientId` int NOT NULL,
  `CustomerName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ContactPerson` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressId` int NOT NULL,
  `Telephone` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Fax` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Email` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `InBoundFTP` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OutBoundFTP` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ImagePath` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Logo` longblob,
  `ElementSeparator` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SegmentSeparator` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SubElementSeparator` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ReceiverId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Indicator` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Source` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BackupFolder` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WebSiteAddress` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ParentId` int DEFAULT NULL,
  `ClientInBoundFTP` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientOutBoundFTP` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FtpUserName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FtpPassword` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClosingDate` int DEFAULT NULL,
  `EnableEscalationService` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClientId`),
  KEY `FK_Customer_Address` (`AddressId`),
  CONSTRAINT `FK_Customer_Address` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientBankAccount`
--

DROP TABLE IF EXISTS `ClientBankAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientBankAccount` (
  `ClientId` int NOT NULL,
  `BankAccount` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`BankAccount`,`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientCompany`
--

DROP TABLE IF EXISTS `ClientCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientCompany` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ClientId` int NOT NULL,
  `CompanyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=963;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientCustomer`
--

DROP TABLE IF EXISTS `ClientCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientCustomer` (
  `ClientCustomerId` int NOT NULL AUTO_INCREMENT,
  `ClientId` int NOT NULL,
  `AlphaName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EDIId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ClientCustomerId`),
  KEY `FK_Client_ClientCustomer` (`ClientId`),
  CONSTRAINT `FK_Client_ClientCustomer` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB AUTO_INCREMENT=60971 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=68;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientExceptionRule`
--

DROP TABLE IF EXISTS `ClientExceptionRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientExceptionRule` (
  `ClientId` int NOT NULL,
  `ConfigurableExceptionType` tinyint unsigned NOT NULL,
  `Task` tinyint unsigned NOT NULL,
  PRIMARY KEY (`ClientId`,`ConfigurableExceptionType`,`Task`),
  CONSTRAINT `FK_ClientExceptionRule_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientLineItemTotalExtraField`
--

DROP TABLE IF EXISTS `ClientLineItemTotalExtraField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientLineItemTotalExtraField` (
  `ClientOrderAttributeRuleId` int NOT NULL,
  `OrderAttributeId` int NOT NULL,
  `GroupNumber` int DEFAULT NULL,
  `GroupOperator` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientOrderAttributeRuleId`,`OrderAttributeId`),
  KEY `FK_ClientLineItemTotalExtraField_InvoiceAttribute1` (`OrderAttributeId`),
  CONSTRAINT `FK_ClientLineItemTotalExtraField_ClientInvoiceAttributeRule` FOREIGN KEY (`ClientOrderAttributeRuleId`) REFERENCES `ClientOrderAttributeRule` (`ClientOrderAttributeRuleId`),
  CONSTRAINT `FK_ClientLineItemTotalExtraField_InvoiceAttribute1` FOREIGN KEY (`OrderAttributeId`) REFERENCES `OrderAttribute` (`OrderAttributeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientOrderAttribute`
--

DROP TABLE IF EXISTS `ClientOrderAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientOrderAttribute` (
  `ClientID` int NOT NULL,
  `OrderAttributeID` int NOT NULL,
  `Task` tinyint unsigned NOT NULL,
  `EditorType` tinyint unsigned DEFAULT NULL,
  `ParentOrderAttributeName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsCritical` tinyint(1) NOT NULL DEFAULT '0',
  `IsRequred` tinyint(1) NOT NULL,
  `IsReadonly` tinyint(1) NOT NULL,
  `OrderNo` tinyint unsigned NOT NULL,
  `DisplayName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DisplayFormat` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Regex` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsHiddenByDefault` tinyint(1) DEFAULT NULL,
  `IsTaxRow` tinyint(1) DEFAULT NULL,
  `CheckDuplicate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClientID`,`OrderAttributeID`,`Task`),
  KEY `FK_ClientInvoiceAttribute_InvoiceAttribute` (`OrderAttributeID`),
  CONSTRAINT `FK_ClientInvoiceAttribute_InvoiceAttribute` FOREIGN KEY (`OrderAttributeID`) REFERENCES `OrderAttribute` (`OrderAttributeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=215;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientOrderAttributeRule`
--

DROP TABLE IF EXISTS `ClientOrderAttributeRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientOrderAttributeRule` (
  `ClientOrderAttributeRuleId` int NOT NULL AUTO_INCREMENT,
  `ClientId` int NOT NULL,
  `Task` tinyint unsigned NOT NULL,
  `RuleType` tinyint unsigned NOT NULL,
  `IsAndDetailGroupConditionalOperator` tinyint(1) NOT NULL,
  `IsCritical` tinyint(1) DEFAULT NULL,
  `Message` varchar(440) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ClientOrderAttributeRuleId`),
  KEY `FK_ClientInvoiceAttributeRule_Client` (`ClientId`),
  CONSTRAINT `FK_ClientInvoiceAttributeRule_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientOrderAttributeRuleDetail`
--

DROP TABLE IF EXISTS `ClientOrderAttributeRuleDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientOrderAttributeRuleDetail` (
  `ClientOrderAttributeRuleDetailId` int NOT NULL AUTO_INCREMENT,
  `ClientOrderAttributeRuleId` int NOT NULL,
  `CustomQuery` longtext COLLATE utf8mb3_unicode_ci,
  `ComparingValue` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Operator` tinyint unsigned NOT NULL,
  `OrderAttributeID` int NOT NULL,
  `IsAndGroupConditionalOperator` tinyint(1) NOT NULL,
  `GroupNumber` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`ClientOrderAttributeRuleDetailId`),
  KEY `FK_ClientInvoiceAttributeRuleDetail_ClientInvoiceAttributeRule` (`ClientOrderAttributeRuleId`),
  KEY `FK_ClientInvoiceAttributeRuleDetail_InvoiceAttribute` (`OrderAttributeID`),
  CONSTRAINT `FK_ClientInvoiceAttributeRuleDetail_ClientInvoiceAttributeRule` FOREIGN KEY (`ClientOrderAttributeRuleId`) REFERENCES `ClientOrderAttributeRule` (`ClientOrderAttributeRuleId`),
  CONSTRAINT `FK_ClientInvoiceAttributeRuleDetail_InvoiceAttribute` FOREIGN KEY (`OrderAttributeID`) REFERENCES `OrderAttribute` (`OrderAttributeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientOrderType`
--

DROP TABLE IF EXISTS `ClientOrderType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientOrderType` (
  `ClientId` int NOT NULL,
  `OrderTypeName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientId`,`OrderTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=114;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientPONumberMatching`
--

DROP TABLE IF EXISTS `ClientPONumberMatching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientPONumberMatching` (
  `ClientId` int NOT NULL,
  `Length` int NOT NULL,
  `StringToAppend` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientId`,`Length`),
  CONSTRAINT `FK_PONumberMatchingLength_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientPONumberSplitter`
--

DROP TABLE IF EXISTS `ClientPONumberSplitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientPONumberSplitter` (
  `ClientId` int NOT NULL,
  `SplitterCharacter` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientId`,`SplitterCharacter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientSpecificConfig`
--

DROP TABLE IF EXISTS `ClientSpecificConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientSpecificConfig` (
  `ClientId` int NOT NULL,
  `ClientSpecificConfigType` int NOT NULL,
  PRIMARY KEY (`ClientId`,`ClientSpecificConfigType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientUnacceptedLIDescription`
--

DROP TABLE IF EXISTS `ClientUnacceptedLIDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientUnacceptedLIDescription` (
  `ClientId` int NOT NULL,
  `Description` varchar(300) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ExceptionMessage` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientId`,`Description`),
  CONSTRAINT `FK_ClientUnacceptedLIDescription_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientWorkFlow`
--

DROP TABLE IF EXISTS `ClientWorkFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientWorkFlow` (
  `ClientId` int NOT NULL,
  `AddGuidToFileName` tinyint(1) NOT NULL,
  PRIMARY KEY (`ClientId`),
  CONSTRAINT `FK_ClientWorkFlow_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClientWorkFlowFolder`
--

DROP TABLE IF EXISTS `ClientWorkFlowFolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientWorkFlowFolder` (
  `ClientID` int NOT NULL,
  `PickupFolderName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BatchType` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TiffQueueFolderPath` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `SplitTiffDropOffFolderPath` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `SplitTiffDestinationFolderPath` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `BackupFolderPath` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `ApprovalRequired` tinyint(1) NOT NULL DEFAULT '0',
  `IsOrderPOType` tinyint(1) NOT NULL DEFAULT '0',
  `OrgID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CountryCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CompanyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Source` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsSinglePage` tinyint(1) NOT NULL DEFAULT '0',
  `TiffOCRDropOfFolder` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`ClientID`,`PickupFolderName`),
  CONSTRAINT `FK_ClientWorkFlowFolder_Client` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LineNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PostWithNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EquipmentNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `No` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WasteMaterialCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UnitOfMeasurement` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UnitPrice` decimal(19,4) DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `ContractHeaderId` int DEFAULT NULL,
  `IsFrenchise` tinyint(1) NOT NULL DEFAULT '0',
  `ServiceDate` datetime(6) DEFAULT NULL,
  `OrderDate` datetime(6) DEFAULT NULL,
  `LineType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Frequency` int NOT NULL DEFAULT '1',
  `FrequencyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FrequencyCodeDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Contract_ContractHeader` (`ContractHeaderId`),
  CONSTRAINT `FK_Contract_ContractHeader` FOREIGN KEY (`ContractHeaderId`) REFERENCES `ContractHeader` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=743409 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=211;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContractHeader`
--

DROP TABLE IF EXISTS `ContractHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContractHeader` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ContractNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ServiceAddessCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ServiceAddressName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BusinessWithNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorInternalID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=317485 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=103;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `CountryId` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `ClientId` int NOT NULL,
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ContactPerson` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  `Telephone` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Fax` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Email` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CustomerNo` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CompanyCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SearchName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PaymentTerms` int DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerId`),
  KEY `FK_Customer_Address2` (`AddressId`),
  KEY `FK_Customer_Client` (`ClientId`),
  CONSTRAINT `FK_Customer_Address2` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Customer_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CustomerMasterInfo`
--

DROP TABLE IF EXISTS `CustomerMasterInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerMasterInfo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ShipToNo` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipToAlphaName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipToMailingName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressLine1` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `StoreSCACCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `City` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `State` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ZipCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COUNTRY` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SearchType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RespBusUnit` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CRR` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SalesRep` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Processed` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54643 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=282;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CustomerSite`
--

DROP TABLE IF EXISTS `CustomerSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerSite` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int DEFAULT NULL,
  `Code` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Name` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CustomerSite_Address` (`AddressId`),
  KEY `FK_CustomerSite_Customer` (`CustomerId`),
  CONSTRAINT `FK_CustomerSite_Address` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_CustomerSite_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DashboardActiveActors`
--

DROP TABLE IF EXISTS `DashboardActiveActors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DashboardActiveActors` (
  `ValidActorID` int NOT NULL AUTO_INCREMENT,
  `ActorName` longtext COLLATE utf8mb3_unicode_ci,
  `WorkingHoursPerDay` int NOT NULL DEFAULT '8',
  PRIMARY KEY (`ValidActorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DashboardActiveClients`
--

DROP TABLE IF EXISTS `DashboardActiveClients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DashboardActiveClients` (
  `ValidClientID` int NOT NULL AUTO_INCREMENT,
  `ClientName` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`ValidClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataEntryUserAssociation`
--

DROP TABLE IF EXISTS `DataEntryUserAssociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataEntryUserAssociation` (
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AssociatedUserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`UserId`,`AssociatedUserId`),
  UNIQUE KEY `AssociatedUserId` (`AssociatedUserId`),
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DateRangeForReport`
--

DROP TABLE IF EXISTS `DateRangeForReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DateRangeForReport` (
  `Id` int NOT NULL,
  `DateRange` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=2340;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DelegationHistory`
--

DROP TABLE IF EXISTS `DelegationHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DelegationHistory` (
  `DelegatId` int NOT NULL AUTO_INCREMENT,
  `DelegatedFrom` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DelegatedTo` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OrderId` int NOT NULL,
  `DateDelegated` datetime(6) NOT NULL,
  `DurationLeft` int NOT NULL,
  `Comment` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsDelegate` tinyint(1) NOT NULL DEFAULT '0',
  `IsEscalated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DelegatId`),
  UNIQUE KEY `DelegatedFrom` (`DelegatedFrom`),
  UNIQUE KEY `DelegatedTo` (`DelegatedTo`),
  KEY `FK_Delegate_Order` (`OrderId`),
  CONSTRAINT `FK_Delegate_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_Delegate_User2` FOREIGN KEY (`DelegatedFrom`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_Delegate_User3` FOREIGN KEY (`DelegatedTo`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientId` int DEFAULT NULL,
  `VendorId` int DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RemitToAddressId` int DEFAULT NULL,
  `ClientCompanyId` int DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Department_Address` (`AddressId`),
  KEY `FK_Department_Address1` (`RemitToAddressId`),
  KEY `FK_Department_Client` (`ClientId`),
  KEY `FK_Department_ClientCompany` (`ClientCompanyId`),
  KEY `FK_Department_Vendor` (`VendorId`),
  CONSTRAINT `FK_Department_Address` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Department_Address1` FOREIGN KEY (`RemitToAddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Department_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_Department_ClientCompany` FOREIGN KEY (`ClientCompanyId`) REFERENCES `ClientCompany` (`Id`),
  CONSTRAINT `FK_Department_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DepartmentGLCode`
--

DROP TABLE IF EXISTS `DepartmentGLCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DepartmentGLCode` (
  `DepartmentId` int NOT NULL,
  `GLCodeId` int NOT NULL,
  PRIMARY KEY (`DepartmentId`,`GLCodeId`),
  KEY `FK_DepartmentGLCode_GLCode` (`GLCodeId`),
  CONSTRAINT `FK_DepartmentGLCode_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_DepartmentGLCode_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmailHistory`
--

DROP TABLE IF EXISTS `EmailHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmailHistory` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=205;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmailTemplates`
--

DROP TABLE IF EXISTS `EmailTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmailTemplates` (
  `EmailTemplateType` tinyint unsigned NOT NULL,
  `Subject` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `Body` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`EmailTemplateType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=2048;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EscalationHistory`
--

DROP TABLE IF EXISTS `EscalationHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EscalationHistory` (
  `OrderId` int NOT NULL,
  `EscalatedFromId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EscalatedToId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DateEscalated` datetime(6) NOT NULL,
  `Comment` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsDelegated` tinyint(1) NOT NULL DEFAULT '0',
  `IsEscalated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderId`,`EscalatedFromId`,`EscalatedToId`),
  UNIQUE KEY `EscalatedFromId` (`EscalatedFromId`),
  UNIQUE KEY `EscalatedToId` (`EscalatedToId`),
  CONSTRAINT `FK_EscalationHistory_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_EscalationHistory_User` FOREIGN KEY (`EscalatedFromId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_EscalationHistory_User1` FOREIGN KEY (`EscalatedToId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExHandlersManager`
--

DROP TABLE IF EXISTS `ExHandlersManager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExHandlersManager` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ManagerId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ManagerId` (`ManagerId`),
  UNIQUE KEY `UserId` (`UserId`),
  CONSTRAINT `FK_ExHandlersManager_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_ExHandlersManager_User1` FOREIGN KEY (`ManagerId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Exception`
--

DROP TABLE IF EXISTS `Exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exception` (
  `OrderId` int NOT NULL,
  `ExceptionTypeId` tinyint unsigned NOT NULL,
  `Comment` varchar(440) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`,`ExceptionTypeId`,`Comment`),
  KEY `FK_ExceptionDetail_ExceptionType` (`ExceptionTypeId`),
  CONSTRAINT `FK_Exception_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_ExceptionDetail_ExceptionType` FOREIGN KEY (`ExceptionTypeId`) REFERENCES `ExceptionType` (`ExceptionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=112;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExceptionHistory`
--

DROP TABLE IF EXISTS `ExceptionHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExceptionHistory` (
  `ExceptionId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `ExceptionTypeId` tinyint unsigned DEFAULT NULL,
  `ExceptionHandlerId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ExceptionHandledDate` datetime(6) DEFAULT NULL,
  `Comment` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`ExceptionId`),
  KEY `FK_ExceptionHistory_User_idx` (`ExceptionHandlerId`),
  KEY `FK_ExceptionHistory_ExceptionType` (`ExceptionTypeId`),
  KEY `FK_ExceptionHistory_Order` (`OrderId`),
  CONSTRAINT `FK_ExceptionHistory_ExceptionType` FOREIGN KEY (`ExceptionTypeId`) REFERENCES `ExceptionType` (`ExceptionId`),
  CONSTRAINT `FK_ExceptionHistory_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_ExceptionHistory_User` FOREIGN KEY (`ExceptionHandlerId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=84023 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=126;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExceptionType`
--

DROP TABLE IF EXISTS `ExceptionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExceptionType` (
  `ExceptionId` tinyint unsigned NOT NULL,
  `Name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ExceptionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=496;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExportList`
--

DROP TABLE IF EXISTS `ExportList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExportList` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ClientId` int DEFAULT NULL,
  `OrderId` int DEFAULT NULL,
  `OutPutFileName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DateCreated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ExportList_Client` (`ClientId`),
  KEY `FK_ExportList_Order` (`OrderId`),
  CONSTRAINT `FK_ExportList_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_ExportList_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Frequency`
--

DROP TABLE IF EXISTS `Frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Frequency` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FrequencyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FrequencyDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Code` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=364;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GLCode`
--

DROP TABLE IF EXISTS `GLCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GLCode` (
  `ClientId` int NOT NULL,
  `GLCodeId` int NOT NULL,
  `GLCodeName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Desccription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityRequired` tinyint(1) NOT NULL DEFAULT '0',
  `SubAccount` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsProjectTypeRequred` tinyint(1) DEFAULT NULL,
  `IsSubProjectTypeRequired` tinyint(1) DEFAULT NULL,
  `ProjectType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SubProjectType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientCompanyId` int DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`GLCodeId`),
  UNIQUE KEY `IX_GLCode` (`GLCodeId`,`ClientId`),
  KEY `FK_GLCode_Client` (`ClientId`),
  KEY `FK_GLCode_ClientCompany` (`ClientCompanyId`),
  CONSTRAINT `FK_GLCode_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_GLCode_ClientCompany` FOREIGN KEY (`ClientCompanyId`) REFERENCES `ClientCompany` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GLSegements`
--

DROP TABLE IF EXISTS `GLSegements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GLSegements` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Segment1` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Segment2` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Segment3` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Segment4` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Segment5` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Segment6` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15448 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=37;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LineItemDetail`
--

DROP TABLE IF EXISTS `LineItemDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LineItemDetail` (
  `OrderId` int NOT NULL,
  `LineItemDetailId` int NOT NULL AUTO_INCREMENT,
  `ActualQty` double DEFAULT NULL,
  `ProductId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProductDescription` longtext COLLATE utf8mb3_unicode_ci,
  `Description` longtext COLLATE utf8mb3_unicode_ci,
  `UnitPrice` double DEFAULT NULL,
  `CalculatedUnitPrice` double DEFAULT NULL,
  `CalculatedExtAmt` double DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `ItemNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UnitOfPurchase` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LineNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POHeaderId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POLineId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POLineLocationId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RecievedTransactionId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GLCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsExpense` tinyint(1) NOT NULL DEFAULT '0',
  `OrderQuantity` double DEFAULT NULL,
  `ClientCompanyId` int DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Container` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField1` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField2` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField3` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField4` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField5` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField6` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField7` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField8` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField9` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField10` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Size` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Color` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DepartmentCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MasterItemId` int DEFAULT NULL,
  `CustomerProductId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CustomerProductDescription` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UnitCost` double DEFAULT NULL,
  `UOM` double DEFAULT NULL,
  `PONumber` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipToId` int DEFAULT NULL,
  `BillToId` int DEFAULT NULL,
  `Notes` longtext COLLATE utf8mb3_unicode_ci,
  `CalculatedQty` double DEFAULT NULL,
  `CalculatedPrice` double DEFAULT NULL,
  `ImagePageNumber` int DEFAULT NULL,
  PRIMARY KEY (`LineItemDetailId`,`OrderId`),
  KEY `FK_BillTo_LineItemDetail` (`BillToId`),
  KEY `FK_LineItemDetail_ClientCompany` (`ClientCompanyId`),
  KEY `FK_LineItemDetail_Order` (`OrderId`),
  KEY `FK_MasterItem_LineItemDetail` (`MasterItemId`),
  KEY `FK_ShipTo_LineItemDetail` (`ShipToId`),
  CONSTRAINT `FK_BillTo_LineItemDetail` FOREIGN KEY (`BillToId`) REFERENCES `BillTo` (`BillToId`),
  CONSTRAINT `FK_LineItemDetail_ClientCompany` FOREIGN KEY (`ClientCompanyId`) REFERENCES `ClientCompany` (`Id`),
  CONSTRAINT `FK_LineItemDetail_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_MasterItem_LineItemDetail` FOREIGN KEY (`MasterItemId`) REFERENCES `MasterItem` (`MasterItemId`),
  CONSTRAINT `FK_ShipTo_LineItemDetail` FOREIGN KEY (`ShipToId`) REFERENCES `ShipTo` (`ShipToId`)
) ENGINE=InnoDB AUTO_INCREMENT=196770 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=161;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LocationCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorId` int DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Location_Address` (`AddressId`),
  KEY `FK_Location_Vendor` (`VendorId`),
  CONSTRAINT `FK_Location_Address` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Location_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterBillToExcelData`
--

DROP TABLE IF EXISTS `MasterBillToExcelData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MasterBillToExcelData` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `BillToCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToAlphaName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToMailingName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressLine1` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Store/SCACCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `City` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `State` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ZipCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Country` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SearchType` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RespBusUnit` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CRR` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SalesRep` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=225;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterItem`
--

DROP TABLE IF EXISTS `MasterItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MasterItem` (
  `MasterItemId` int NOT NULL AUTO_INCREMENT,
  `ClientId` int NOT NULL,
  `Supplier` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Brand` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SupplierSKU` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CatalogSCC` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OzCap` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GTIN` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UPCA` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PriceUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `L` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `W` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `H` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DimUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUBE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CubUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Weight` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NetWeight` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WeightUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COO` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Trade` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemNo` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CADZCONV` double DEFAULT NULL,
  `CASTCONV` double DEFAULT NULL,
  `CAPCCONV` double DEFAULT NULL,
  `EDIID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MasterItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=419891 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=336;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterItemExcelData`
--

DROP TABLE IF EXISTS `MasterItemExcelData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MasterItemExcelData` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Supplier` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Brand` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SupplierSKU` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CatalogSCC` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Oz_Cap/Inches` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GTIN (SCC-14)` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UPCA` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PriceUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `L` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `W` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `H` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DimUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUBE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CubUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Weight` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NetWeight` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WeightUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COO` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Trade` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5613 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=284;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterItemExcelDataNew`
--

DROP TABLE IF EXISTS `MasterItemExcelDataNew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MasterItemExcelDataNew` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Supplier` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Brand` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SupplierSKU` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CatalogSCC` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Oz_Cap/Inches` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GTIN` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UPCA` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PriceUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `L` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `W` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `H` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DimUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CUBE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CubUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Weight` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NetWeight` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WeightUOM` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COO` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Trade` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CasesPerPallet` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CasesPerTier` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CADZCONV` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CASTCONV` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CAPCCONV` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CAIPCONV` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IPDZCONV` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TiersPerPallet` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5761 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=282;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterPrice`
--

DROP TABLE IF EXISTS `MasterPrice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MasterPrice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `masterItemId` int DEFAULT NULL,
  `rangeFrom` double DEFAULT NULL,
  `rangeTo` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterItemId` (`masterItemId`),
  CONSTRAINT `MasterPrice_ibfk_1` FOREIGN KEY (`masterItemId`) REFERENCES `MasterItem` (`MasterItemId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MasterShipToExcelData`
--

DROP TABLE IF EXISTS `MasterShipToExcelData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MasterShipToExcelData` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ShipToCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipToAlphaName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShipToMailingName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressLine1` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressLine2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Store/SCACCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `City` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `State` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ZipCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Country` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SearchType` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RespBusUnit` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CRR` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SalesRep` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53600 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=274;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MultipleSubmission_OrderCustomer`
--

DROP TABLE IF EXISTS `MultipleSubmission_OrderCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MultipleSubmission_OrderCustomer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `Amount` decimal(19,4) NOT NULL,
  `CustomerId` int DEFAULT NULL,
  `CustomerSiteId` int DEFAULT NULL,
  `ContractNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorId` int DEFAULT NULL,
  `VendorSiteId` int DEFAULT NULL,
  `DateRange` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_MultipleSubmission_InvoiceCustomer_Customer` (`CustomerId`),
  KEY `FK_MultipleSubmission_InvoiceCustomer_CustomerSite` (`CustomerSiteId`),
  KEY `FK_MultipleSubmission_InvoiceCustomer_Department` (`VendorSiteId`),
  KEY `FK_MultipleSubmission_InvoiceCustomer_Vendor` (`VendorId`),
  KEY `FK_MultipleSubmission_OrderCustomer_Order` (`OrderId`),
  CONSTRAINT `FK_MultipleSubmission_InvoiceCustomer_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `FK_MultipleSubmission_InvoiceCustomer_CustomerSite` FOREIGN KEY (`CustomerSiteId`) REFERENCES `CustomerSite` (`Id`),
  CONSTRAINT `FK_MultipleSubmission_InvoiceCustomer_Department` FOREIGN KEY (`VendorSiteId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_MultipleSubmission_InvoiceCustomer_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`),
  CONSTRAINT `FK_MultipleSubmission_OrderCustomer_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MultipleSubmission_OrderCustomerLineItem`
--

DROP TABLE IF EXISTS `MultipleSubmission_OrderCustomerLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MultipleSubmission_OrderCustomerLineItem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LineNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PostWithNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EquipementNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ServiceId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WasteMaterialCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UnitOfMeasurement` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UnitPrice` decimal(19,4) DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `IsFrenchise` tinyint(1) NOT NULL DEFAULT '0',
  `ServiceDate` datetime(6) DEFAULT NULL,
  `OrderDate` datetime(6) DEFAULT NULL,
  `LineType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FrequencyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FrequencyDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MultipleSubmissionId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_MultipleSubmission_InvoiceCustomerLineItem_MultipleSubmissi3` (`MultipleSubmissionId`),
  CONSTRAINT `FK_MultipleSubmission_InvoiceCustomerLineItem_MultipleSubmissi3` FOREIGN KEY (`MultipleSubmissionId`) REFERENCES `MultipleSubmission_OrderCustomer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notification` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `NotificationFromId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FromApprovalSubStepId` int DEFAULT NULL,
  `NotificationToId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ToApprovalSubStepId` int DEFAULT NULL,
  `AmountApproved` decimal(19,4) NOT NULL,
  `DateApproved` datetime(6) NOT NULL,
  `IsAccepted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0=pending, 1=accepted,2=rejected',
  `Type` smallint NOT NULL DEFAULT '0',
  `IsRejected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `NotificationFromId` (`NotificationFromId`),
  UNIQUE KEY `NotificationToId` (`NotificationToId`),
  KEY `FK_Notification_Order` (`OrderId`),
  CONSTRAINT `FK_Notification_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_Notification_User` FOREIGN KEY (`NotificationFromId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_Notification_User1` FOREIGN KEY (`NotificationToId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Operation`
--

DROP TABLE IF EXISTS `Operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Operation` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OperationName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OperationRole`
--

DROP TABLE IF EXISTS `OperationRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OperationRole` (
  `OperationId` int NOT NULL,
  `RoleId` int NOT NULL,
  `CanView` tinyint(1) NOT NULL DEFAULT '0',
  `CanAdd` tinyint(1) NOT NULL DEFAULT '0',
  `CanUpdate` tinyint(1) NOT NULL DEFAULT '0',
  `CanDelete` tinyint(1) NOT NULL DEFAULT '0',
  `AllowAll` tinyint(1) NOT NULL DEFAULT '0',
  `DenyAll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OperationId`,`RoleId`),
  KEY `FK_OperationRole_Role` (`RoleId`),
  CONSTRAINT `FK_OperationRole_Operation` FOREIGN KEY (`OperationId`) REFERENCES `Operation` (`Id`),
  CONSTRAINT `FK_OperationRole_Role` FOREIGN KEY (`RoleId`) REFERENCES `Role` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `ClientId` int NOT NULL,
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `VendorId` int DEFAULT NULL,
  `OrderNo` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorNumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrderDate` datetime(6) DEFAULT NULL,
  `PaymentDueDate` datetime(6) DEFAULT NULL,
  `OrderTotal` decimal(19,4) DEFAULT '0.0000',
  `ApprovalRequired` tinyint(1) NOT NULL,
  `ApprovalStatusId` tinyint unsigned NOT NULL,
  `AprovedDate` datetime(6) DEFAULT NULL,
  `IsPaused` tinyint(1) NOT NULL DEFAULT '0',
  `IsExceptionRaised` tinyint(1) NOT NULL DEFAULT '0',
  `ShippedToAddressId` int DEFAULT '260',
  `ApproverId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsPOOrder` tinyint(1) NOT NULL,
  `ScannedDate` datetime(6) NOT NULL,
  `PONumber` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShippingDate` datetime(6) DEFAULT NULL,
  `NetTermDate` datetime(6) DEFAULT NULL,
  `NetTermDiscount` decimal(19,4) DEFAULT NULL,
  `Tax` decimal(19,4) DEFAULT NULL,
  `FreightCharges` decimal(19,4) DEFAULT NULL,
  `OrderType` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CheckNumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsModified` tinyint(1) NOT NULL DEFAULT '0',
  `BillToAddressId` int DEFAULT NULL,
  `RemitToAddressId` int DEFAULT NULL,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Currency` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CountryCode` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CompanyCode` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ModifiedDate` datetime(6) DEFAULT NULL,
  `Comment` longtext COLLATE utf8mb3_unicode_ci,
  `ShipToName` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToName` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BatchID` int DEFAULT NULL,
  `OrderName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CaptureCompletedDate` datetime(6) DEFAULT NULL,
  `LastActionDate` datetime(6) DEFAULT NULL,
  `GLDate` datetime(6) DEFAULT NULL,
  `LastActionBy` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `LocationId` int DEFAULT NULL,
  `IsOutPutPending` tinyint(1) NOT NULL DEFAULT '0',
  `CaptureBatchId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CaptureDocumentNumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AdjustmentAmount` decimal(19,4) DEFAULT NULL,
  `SubCategoryType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorSiteId` int DEFAULT NULL,
  `PayImmediate` tinyint(1) NOT NULL DEFAULT '0',
  `VerifierId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TaxGLCodeId` int DEFAULT NULL,
  `AccountCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `StoreNumber` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ServiceMonth` datetime(6) DEFAULT NULL,
  `IsMultipleSubmission` tinyint(1) NOT NULL DEFAULT '0',
  `OpenTaskTime` datetime(6) DEFAULT NULL,
  `CompletedTaskTime` datetime(6) DEFAULT NULL,
  `RecognitionCompleteTime` datetime(6) DEFAULT NULL,
  `ABBYYBatchName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VerifierName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsValidated` tinyint(1) DEFAULT '0',
  `DeliveryNumber` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsBigAirSyncComplete` tinyint(1) DEFAULT NULL,
  `IsLocked` tinyint(1) NOT NULL DEFAULT '0',
  `LockedAt` datetime(6) DEFAULT NULL,
  `LockedBy` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Container` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POLookup` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POReverseLookup` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POReverseLookupVariance` int DEFAULT NULL,
  `LineItemsQuantityFilterVariance` int DEFAULT NULL,
  `OtherCharges` decimal(18,2) DEFAULT NULL,
  `CustomerNumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DepartmentNumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CancelDate` date DEFAULT NULL,
  `Terms` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToId` int DEFAULT NULL,
  `ShipToId` int DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `FK_Order_User_idx` (`ApproverId`),
  KEY `FK_Order_User1_idx` (`VerifierId`),
  KEY `IX_invoice_ClientId_BatchId_InvoiceId` (`ClientId`,`BatchID`,`OrderId`),
  KEY `FK_BillTo_Order` (`BillToId`),
  KEY `FK_Order_Address` (`ShippedToAddressId`),
  KEY `FK_Order_Batch` (`BatchID`),
  KEY `FK_Order_BillToAddress` (`BillToAddressId`),
  KEY `FK_Order_Department` (`VendorSiteId`),
  KEY `FK_Order_Location` (`LocationId`),
  KEY `FK_Order_OrderStatus` (`ApprovalStatusId`),
  KEY `FK_Order_RemitToAdress` (`RemitToAddressId`),
  KEY `FK_Order_Vendor` (`VendorId`),
  KEY `FK_ShipTo_Order` (`ShipToId`),
  CONSTRAINT `FK_BillTo_Order` FOREIGN KEY (`BillToId`) REFERENCES `BillTo` (`BillToId`),
  CONSTRAINT `FK_Order_Address` FOREIGN KEY (`ShippedToAddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Order_Batch` FOREIGN KEY (`BatchID`) REFERENCES `Batch` (`ID`),
  CONSTRAINT `FK_Order_BillToAddress` FOREIGN KEY (`BillToAddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Order_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_Order_Department` FOREIGN KEY (`VendorSiteId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_Order_Location` FOREIGN KEY (`LocationId`) REFERENCES `Location` (`Id`),
  CONSTRAINT `FK_Order_OrderStatus` FOREIGN KEY (`ApprovalStatusId`) REFERENCES `OrderStatus` (`StateId`),
  CONSTRAINT `FK_Order_RemitToAdress` FOREIGN KEY (`RemitToAddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_Order_User` FOREIGN KEY (`ApproverId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_Order_User1` FOREIGN KEY (`VerifierId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_Order_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`),
  CONSTRAINT `FK_ShipTo_Order` FOREIGN KEY (`ShipToId`) REFERENCES `ShipTo` (`ShipToId`)
) ENGINE=InnoDB AUTO_INCREMENT=15174 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=280;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderAttribute`
--

DROP TABLE IF EXISTS `OrderAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderAttribute` (
  `OrderAttributeID` int NOT NULL AUTO_INCREMENT,
  `OrderAttributeName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EditorType` tinyint unsigned DEFAULT NULL,
  `DefaultDisplayName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DefaultDisplayFormat` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DefaultRegex` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsDefaultCritical` tinyint(1) NOT NULL DEFAULT '0',
  `IsDefaultRequred` tinyint(1) NOT NULL DEFAULT '0',
  `IsDefaultReadonly` tinyint(1) NOT NULL DEFAULT '0',
  `IsPOApprovalDefault` tinyint(1) NOT NULL DEFAULT '0',
  `IsNoPOApprovalDefault` tinyint(1) NOT NULL DEFAULT '0',
  `IsPOExceptionDefault` tinyint(1) NOT NULL DEFAULT '0',
  `IsNoPOExceptionDefault` tinyint(1) NOT NULL DEFAULT '0',
  `IsValidationDefault` tinyint(1) NOT NULL DEFAULT '0',
  `IsGlSlideDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderAttributeID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=348;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderCustomer`
--

DROP TABLE IF EXISTS `OrderCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderCustomer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `CustomerSiteId` int DEFAULT NULL,
  `ContractNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorId` int DEFAULT NULL,
  `VendorSiteId` int DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `DateRange` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_InvoiceCustomer_Customer` (`CustomerId`),
  KEY `FK_InvoiceCustomer_CustomerSite` (`CustomerSiteId`),
  KEY `FK_InvoiceCustomer_Department` (`VendorSiteId`),
  KEY `FK_InvoiceCustomer_Vendor` (`VendorId`),
  KEY `FK_OrderCustomer_Order` (`OrderId`),
  CONSTRAINT `FK_InvoiceCustomer_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `FK_InvoiceCustomer_CustomerSite` FOREIGN KEY (`CustomerSiteId`) REFERENCES `CustomerSite` (`Id`),
  CONSTRAINT `FK_InvoiceCustomer_Department` FOREIGN KEY (`VendorSiteId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_InvoiceCustomer_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`),
  CONSTRAINT `FK_OrderCustomer_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderCustomerLineItem`
--

DROP TABLE IF EXISTS `OrderCustomerLineItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderCustomerLineItem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderCustomerId` int DEFAULT NULL,
  `LineNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PostWithNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EquipementNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ServiceId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WasteMaterialCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description2` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `UnitOfMeasurement` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UnitPrice` decimal(19,4) DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `IsFrenchise` tinyint(1) NOT NULL DEFAULT '0',
  `ServiceDate` datetime(6) DEFAULT NULL,
  `OrderDate` datetime(6) DEFAULT NULL,
  `LineType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FrequencyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FrequencyDescription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsSelected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK_InvoiceCustomerLineItem_InvoiceCustomer` (`OrderCustomerId`),
  CONSTRAINT `FK_InvoiceCustomerLineItem_InvoiceCustomer` FOREIGN KEY (`OrderCustomerId`) REFERENCES `OrderCustomer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderDocs`
--

DROP TABLE IF EXISTS `OrderDocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDocs` (
  `OrderId` int NOT NULL,
  `Url` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`,`Url`),
  UNIQUE KEY `IX_InvoiceDocs` (`OrderId`,`Url`),
  CONSTRAINT `FK_OrderDocs_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=100;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderGLCode`
--

DROP TABLE IF EXISTS `OrderGLCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderGLCode` (
  `ItemId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `GLCodeId` int NOT NULL,
  `GLAmount` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`ItemId`,`OrderId`,`GLCodeId`),
  KEY `FK_InvoiceGLCode_GLCode` (`GLCodeId`),
  KEY `FK_OrderGLCode_Order1` (`OrderId`),
  CONSTRAINT `FK_InvoiceGLCode_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_OrderGLCode_Order1` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderHistory`
--

DROP TABLE IF EXISTS `OrderHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderHistory` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `Actor` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Action` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActionDate` datetime(6) DEFAULT NULL,
  `PreviousData` longtext COLLATE utf8mb3_unicode_ci,
  `NewData` longtext COLLATE utf8mb3_unicode_ci,
  `Field` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `InitialStatus` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CurrentStatus` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_OrderHistory_Order` (`OrderId`),
  CONSTRAINT `FK_OrderHistory_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=1333075 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=116;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderStatus` (
  `StateId` tinyint unsigned NOT NULL,
  `StateName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=1820;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrderTemplate`
--

DROP TABLE IF EXISTS `OrderTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderTemplate` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VendorId` int NOT NULL,
  `TemplateName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrderAmount` decimal(19,4) DEFAULT NULL,
  `Tax` decimal(19,4) DEFAULT NULL,
  `FreightCharges` decimal(19,4) DEFAULT NULL,
  `OrderType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CompanyCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CountryCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrderId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_InvoiceTemplate_Vendor` (`VendorId`),
  KEY `FK_OrderTemplate_Order` (`OrderId`),
  CONSTRAINT `FK_InvoiceTemplate_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`),
  CONSTRAINT `FK_OrderTemplate_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrgData`
--

DROP TABLE IF EXISTS `OrgData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrgData` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrgName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientId` int NOT NULL DEFAULT '4',
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `FK_OrgData_Client` (`ClientId`),
  CONSTRAINT `FK_OrgData_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PO`
--

DROP TABLE IF EXISTS `PO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PO` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VendorId` int DEFAULT NULL,
  `PONumber` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `POType` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POStatus` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ItemNumber` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorCatNumber` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UnitOfPurchase` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrderQty` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UnitCost` double DEFAULT NULL,
  `ExtCost` double DEFAULT NULL,
  `RcvdQty` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientId` int DEFAULT NULL,
  `IsMatched` int DEFAULT NULL,
  `LineNo` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POHeaderId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POLineId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POLineLocationId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RecievedTransactionId` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GLCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsExpense` tinyint(1) NOT NULL DEFAULT '0',
  `ClientCompanyId` int DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Container` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PurchaserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Currency` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField1` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField2` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField3` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField4` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField5` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField6` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField7` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField8` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField9` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserField10` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `PurchaserId` (`PurchaserId`),
  KEY `FK_PO_Client` (`ClientId`),
  KEY `FK_PO_ClientCompany` (`ClientCompanyId`),
  KEY `FK_PO_Vendor` (`VendorId`),
  CONSTRAINT `FK_PO_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_PO_ClientCompany` FOREIGN KEY (`ClientCompanyId`) REFERENCES `ClientCompany` (`Id`),
  CONSTRAINT `FK_PO_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `POOrder`
--

DROP TABLE IF EXISTS `POOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POOrder` (
  `POIDetailId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `PONumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ShippingDate` datetime(6) DEFAULT NULL,
  `NetTermDate` datetime(6) DEFAULT NULL,
  `NetTermDiscount` decimal(19,4) DEFAULT NULL,
  `Tax` decimal(19,4) DEFAULT NULL,
  `FreightCharges` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`POIDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PausedOrder`
--

DROP TABLE IF EXISTS `PausedOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PausedOrder` (
  `OrderId` int NOT NULL,
  `PauseBy` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PausedDate` datetime(6) NOT NULL,
  `Comment` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  CONSTRAINT `FK_PausedOrder_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=1638;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaymentDateRangeForReport`
--

DROP TABLE IF EXISTS `PaymentDateRangeForReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentDateRangeForReport` (
  `Id` int NOT NULL,
  `DateRange` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=2048;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PendingApprovalHistory`
--

DROP TABLE IF EXISTS `PendingApprovalHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PendingApprovalHistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `ApproverId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GLCodeId` int NOT NULL,
  `AmountAppoved` decimal(19,4) NOT NULL,
  `CustomerId` int DEFAULT NULL,
  `Recoverabletax` int DEFAULT NULL,
  `SpecialNote` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GLCodeType` smallint NOT NULL DEFAULT '0' COMMENT '0=default GL, 1= temp GL',
  `SiteId` int DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  `DepartmentId` int DEFAULT NULL,
  `TaxCodeId` int DEFAULT NULL,
  `TaxableAmount` decimal(19,4) DEFAULT NULL,
  `TaxAmount` decimal(19,4) DEFAULT NULL,
  `RecorableTaxAmount` decimal(19,4) DEFAULT NULL,
  `ProjectId` int DEFAULT NULL,
  `SubProjectId` int DEFAULT NULL,
  `CompanyCode` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ApproverId` (`ApproverId`),
  KEY `FK_PendingApprovalHistory_Category` (`CategoryId`),
  KEY `FK_PendingApprovalHistory_Customer` (`CustomerId`),
  KEY `FK_PendingApprovalHistory_Department` (`DepartmentId`),
  KEY `FK_PendingApprovalHistory_GLCode` (`GLCodeId`),
  KEY `FK_PendingApprovalHistory_ProjectType` (`ProjectId`),
  KEY `FK_PendingApprovalHistory_SubProjectType` (`SubProjectId`),
  KEY `FK_PendingApprovalHistory_Tax` (`TaxCodeId`),
  CONSTRAINT `FK_PendingApprovalHistory_Category` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`Id`),
  CONSTRAINT `FK_PendingApprovalHistory_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `FK_PendingApprovalHistory_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_PendingApprovalHistory_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_PendingApprovalHistory_ProjectType` FOREIGN KEY (`ProjectId`) REFERENCES `ProjectType` (`Id`),
  CONSTRAINT `FK_PendingApprovalHistory_SubProjectType` FOREIGN KEY (`SubProjectId`) REFERENCES `SubProjectType` (`Id`),
  CONSTRAINT `FK_PendingApprovalHistory_Tax` FOREIGN KEY (`TaxCodeId`) REFERENCES `Tax` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlaceHolder`
--

DROP TABLE IF EXISTS `PlaceHolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlaceHolder` (
  `OrderID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=66;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectType`
--

DROP TABLE IF EXISTS `ProjectType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProjectType` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=221;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReportOutPut`
--

DROP TABLE IF EXISTS `ReportOutPut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReportOutPut` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OutFileName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DateCreated` datetime(6) NOT NULL,
  `ClientId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=116;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reports`
--

DROP TABLE IF EXISTS `Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reports` (
  `ReportID` int NOT NULL AUTO_INCREMENT,
  `ReportName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ReportQuery` varchar(750) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ClientID` int NOT NULL,
  PRIMARY KEY (`ReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=372;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `RoleId` int NOT NULL,
  `RoleName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=2048;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SalseforceMapField`
--

DROP TABLE IF EXISTS `SalseforceMapField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SalseforceMapField` (
  `SalseforceMapFieldID` int NOT NULL AUTO_INCREMENT,
  `SalseforceMapTableID` int NOT NULL,
  `APSmartColumnName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SalesForceAPIFieldName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`SalseforceMapFieldID`),
  KEY `FK_SalseforceMapField_SalesForceMapTable` (`SalseforceMapTableID`),
  CONSTRAINT `FK_SalseforceMapField_SalesForceMapTable` FOREIGN KEY (`SalseforceMapTableID`) REFERENCES `SalseforceMapTable` (`SalseforceMapTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SalseforceMapTable`
--

DROP TABLE IF EXISTS `SalseforceMapTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SalseforceMapTable` (
  `SalseforceMapTableID` int NOT NULL AUTO_INCREMENT,
  `APSmartTableName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SalesForceAPICustomObjectName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`SalseforceMapTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SavedReportFilter`
--

DROP TABLE IF EXISTS `SavedReportFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SavedReportFilter` (
  `SavedReportFilterId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Task` tinyint unsigned NOT NULL,
  `FilterQueryString` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`SavedReportFilterId`),
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ShipTo`
--

DROP TABLE IF EXISTS `ShipTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShipTo` (
  `ShipToId` int NOT NULL AUTO_INCREMENT,
  `ClientCustomerId` int NOT NULL,
  `ShipToCode` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ShipToMailingName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressId` int NOT NULL,
  `BusUnit` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BillToClientCustomerId` int DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ShipToId`),
  KEY `FK_Address_ShipTo` (`AddressId`),
  KEY `FK_ShipToClientCustomer_ShipTo` (`ClientCustomerId`),
  CONSTRAINT `FK_Address_ShipTo` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `FK_ClientCustomer_ShipTo` FOREIGN KEY (`ClientCustomerId`) REFERENCES `ClientCustomer` (`ClientCustomerId`),
  CONSTRAINT `FK_ShipToClientCustomer_ShipTo` FOREIGN KEY (`ClientCustomerId`) REFERENCES `ClientCustomer` (`ClientCustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=61576 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=91;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteName`
--

DROP TABLE IF EXISTS `SiteName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SiteName` (
  `Id` int NOT NULL,
  `VendorId` int DEFAULT NULL,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SiteName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `InternalId` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_SiteName_Vendor` (`VendorId`),
  CONSTRAINT `FK_SiteName_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteNameGLCode`
--

DROP TABLE IF EXISTS `SiteNameGLCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SiteNameGLCode` (
  `SiteId` int NOT NULL,
  `GLCodeId` int NOT NULL,
  PRIMARY KEY (`SiteId`,`GLCodeId`),
  KEY `FK_SiteNameGLCode_GLCode` (`GLCodeId`),
  CONSTRAINT `FK_SiteNameGLCode_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_SiteNameGLCode_SiteName` FOREIGN KEY (`SiteId`) REFERENCES `SiteName` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SsoTest`
--

DROP TABLE IF EXISTS `SsoTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SsoTest` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SamlText` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `State`
--

DROP TABLE IF EXISTS `State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `State` (
  `StateId` int NOT NULL AUTO_INCREMENT,
  `StateName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `StateNameShort` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CountryId` int NOT NULL,
  PRIMARY KEY (`StateId`),
  KEY `FK_Country_State` (`CountryId`),
  CONSTRAINT `FK_Country_State` FOREIGN KEY (`CountryId`) REFERENCES `Country` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=282;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SubProjectType`
--

DROP TABLE IF EXISTS `SubProjectType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubProjectType` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SubProjectName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=372;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SupportedCulture`
--

DROP TABLE IF EXISTS `SupportedCulture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SupportedCulture` (
  `SupportedCultureID` int NOT NULL AUTO_INCREMENT,
  `CultureName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LanguageCode` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CountryOrRegionCode` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`SupportedCultureID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_GLCode`
--

DROP TABLE IF EXISTS `T_GLCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_GLCode` (
  `ClientId` int NOT NULL,
  `GLCodeId` int NOT NULL AUTO_INCREMENT,
  `GLCodeName` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Desccription` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SiteId` int DEFAULT NULL,
  PRIMARY KEY (`GLCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7444 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=101;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tax`
--

DROP TABLE IF EXISTS `Tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tax` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TaxCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DepartmentId` int DEFAULT NULL,
  `TaxRate` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Tax_Client` (`ClientId`),
  KEY `FK_Tax_Department` (`DepartmentId`),
  CONSTRAINT `FK_Tax_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_Tax_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TempApprovalHistory`
--

DROP TABLE IF EXISTS `TempApprovalHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TempApprovalHistory` (
  `ApprovalHistoryID` int NOT NULL,
  `OrderId` int NOT NULL,
  `ApproverId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GLCodeId` int NOT NULL,
  `AmountApproved` decimal(19,4) NOT NULL,
  `StateChangedDate` datetime(6) NOT NULL,
  `CustomerId` int DEFAULT NULL,
  `Recoverabletax` int DEFAULT NULL,
  `SpecialNote` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WithholdingTaxId` int DEFAULT NULL,
  `PurchaseNum` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ImportDoc` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RecoverableTaxAmout` decimal(19,4) DEFAULT NULL,
  `TaxAmount` decimal(19,4) DEFAULT NULL,
  `TaxCodeId` int DEFAULT NULL,
  PRIMARY KEY (`ApprovalHistoryID`),
  UNIQUE KEY `ApproverId` (`ApproverId`),
  KEY `FK_TempApprovalHistory_Order` (`OrderId`),
  KEY `FK_TempApprovalHistory_T_GLCode` (`GLCodeId`),
  KEY `FK_TempApprovalHistory_Tax` (`TaxCodeId`),
  KEY `FK_TempApprovalHistory_WithHoldingTax` (`WithholdingTaxId`),
  CONSTRAINT `FK_TempApprovalHistory_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`),
  CONSTRAINT `FK_TempApprovalHistory_T_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `T_GLCode` (`GLCodeId`),
  CONSTRAINT `FK_TempApprovalHistory_Tax` FOREIGN KEY (`TaxCodeId`) REFERENCES `Tax` (`Id`),
  CONSTRAINT `FK_TempApprovalHistory_User` FOREIGN KEY (`ApproverId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_TempApprovalHistory_WithHoldingTax` FOREIGN KEY (`WithholdingTaxId`) REFERENCES `WithHoldingTax` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TimerSetting`
--

DROP TABLE IF EXISTS `TimerSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimerSetting` (
  `ClientId` int NOT NULL,
  `Hour` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ClientId`),
  CONSTRAINT `FK_TimerSetting_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `ClientId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `UserName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FirstName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LastName` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LoggedIn` tinyint(1) DEFAULT '0',
  `IsActive` tinyint(1) DEFAULT '1',
  `AddressId` int DEFAULT NULL,
  `Telephone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UserIdCard` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EnableEscalation` tinyint(1) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `LimitMailPerDay` int DEFAULT NULL,
  `DefaultUI` int DEFAULT NULL,
  `ShowApprovedForHandler` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `IX_User` (`UserId`,`ClientId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_User_Address` (`AddressId`),
  KEY `FK_User_Client` (`ClientId`),
  CONSTRAINT `FK_User_Address` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`) ON DELETE CASCADE,
  CONSTRAINT `FK_User_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=819;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserDepartment`
--

DROP TABLE IF EXISTS `UserDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserDepartment` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DepartmentId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_UserDepartment_Department` (`DepartmentId`),
  CONSTRAINT `FK_UserDepartment_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_UserDepartment_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserOrderAssignment`
--

DROP TABLE IF EXISTS `UserOrderAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserOrderAssignment` (
  `OrderId` int NOT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Type` tinyint unsigned NOT NULL,
  `State` tinyint unsigned NOT NULL,
  `ApprovalSubStepId` int DEFAULT NULL,
  `HoldStartDate` date DEFAULT NULL,
  `HoldEndDate` date DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderId`,`UserId`),
  KEY `FK_UserInvoiceAssignment_User_idx` (`UserId`),
  CONSTRAINT `FK_UserInvoiceAssignment_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_UserOrderAssignment_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserOrderAssignmentHistory`
--

DROP TABLE IF EXISTS `UserOrderAssignmentHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserOrderAssignmentHistory` (
  `UserOrderAssignmentHistoryId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `FromApprovalSubStepId` int DEFAULT NULL,
  `FromApprovalSubStepUserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ToApprovalSubStepId` int NOT NULL,
  `ToApprovalSubStepUserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ApprovedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AmountApproved` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`UserOrderAssignmentHistoryId`),
  KEY `FK_UserInvoiceAssignmentHistory_FromApprovalSubStepUser_idx` (`FromApprovalSubStepUserId`),
  KEY `FK_UserInvoiceAssignmentHistory_ToApprovalSubStepUser_idx` (`ToApprovalSubStepUserId`),
  KEY `FK_UserInvoiceAssignmentHistory_FromApprovalSubStep` (`FromApprovalSubStepId`),
  KEY `FK_UserInvoiceAssignmentHistory_ToApprovalSubStep` (`ToApprovalSubStepId`),
  KEY `FK_UserOrderAssignmentHistory_Order` (`OrderId`),
  CONSTRAINT `FK_UserInvoiceAssignmentHistory_FromApprovalSubStep` FOREIGN KEY (`FromApprovalSubStepId`) REFERENCES `ApprovalSubStep` (`ApprovalSubStepId`),
  CONSTRAINT `FK_UserInvoiceAssignmentHistory_FromApprovalSubStepUser` FOREIGN KEY (`FromApprovalSubStepUserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_UserInvoiceAssignmentHistory_ToApprovalSubStep` FOREIGN KEY (`ToApprovalSubStepId`) REFERENCES `ApprovalSubStep` (`ApprovalSubStepId`),
  CONSTRAINT `FK_UserInvoiceAssignmentHistory_ToApprovalSubStepUser` FOREIGN KEY (`ToApprovalSubStepUserId`) REFERENCES `User` (`UserId`),
  CONSTRAINT `FK_UserOrderAssignmentHistory_Order` FOREIGN KEY (`OrderId`) REFERENCES `Order` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=114457 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=83;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserOrderAssignmentTriggerExcludedClients`
--

DROP TABLE IF EXISTS `UserOrderAssignmentTriggerExcludedClients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserOrderAssignmentTriggerExcludedClients` (
  `ClientId` int NOT NULL,
  PRIMARY KEY (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=2730;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserRoles`
--

DROP TABLE IF EXISTS `UserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserRoles` (
  `UserId` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RoleId` int NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `FK_UserRoles_Role` (`RoleId`),
  CONSTRAINT `FK_UserRoles_Role` FOREIGN KEY (`RoleId`) REFERENCES `Role` (`RoleId`),
  CONSTRAINT `FK_UserRoles_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=356;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor` (
  `ClientId` int NOT NULL,
  `VendorId` int NOT NULL AUTO_INCREMENT,
  `VendorName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ContactPerson` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  `Telephone` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Fax` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Email` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VendorNo` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DefaultGlCodeId` int DEFAULT NULL,
  `UserId` char(36) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TaxCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FreightGLCodeId` int DEFAULT NULL,
  `TaxGLCodeId` int DEFAULT NULL,
  `Currency` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `orgDataId` int DEFAULT NULL,
  `AuthCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityRequired` tinyint(1) NOT NULL DEFAULT '0',
  `DefaultAuthCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AccountStatus` tinyint unsigned DEFAULT NULL,
  `First_Net_Days` int DEFAULT NULL,
  `Discount_Day_01` int DEFAULT NULL,
  `NetDisPer` double DEFAULT NULL,
  `TaxLevel` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DefaultTaxCodeId` int DEFAULT NULL,
  `IsPoVendor` tinyint(1) NOT NULL DEFAULT '0',
  `ClientVendorID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AccountCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `CompanyCode` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SearchName` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ClientCompanyId` int DEFAULT NULL,
  `VendorType` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'MERCHANDISE',
  PRIMARY KEY (`VendorId`),
  UNIQUE KEY `IX_Vendor` (`VendorId`,`ClientId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `FK_Vendor_Address` (`AddressId`),
  KEY `FK_Vendor_Client` (`ClientId`),
  KEY `FK_Vendor_ClientCompany` (`ClientCompanyId`),
  KEY `FK_Vendor_FreightGLCode` (`FreightGLCodeId`),
  KEY `FK_Vendor_GLCode` (`DefaultGlCodeId`,`ClientId`),
  KEY `FK_Vendor_OrgData` (`orgDataId`),
  KEY `FK_Vendor_Tax` (`DefaultTaxCodeId`),
  KEY `FK_Vendor_TaxGLCode` (`TaxGLCodeId`),
  CONSTRAINT `FK_Vendor_Address` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`) ON DELETE CASCADE,
  CONSTRAINT `FK_Vendor_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_Vendor_ClientCompany` FOREIGN KEY (`ClientCompanyId`) REFERENCES `ClientCompany` (`Id`),
  CONSTRAINT `FK_Vendor_FreightGLCode` FOREIGN KEY (`FreightGLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_Vendor_GLCode` FOREIGN KEY (`DefaultGlCodeId`, `ClientId`) REFERENCES `GLCode` (`GLCodeId`, `ClientId`),
  CONSTRAINT `FK_Vendor_OrgData` FOREIGN KEY (`orgDataId`) REFERENCES `OrgData` (`Id`),
  CONSTRAINT `FK_Vendor_Tax` FOREIGN KEY (`DefaultTaxCodeId`) REFERENCES `Tax` (`Id`),
  CONSTRAINT `FK_Vendor_TaxGLCode` FOREIGN KEY (`TaxGLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_Vendor_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VendorDepartment`
--

DROP TABLE IF EXISTS `VendorDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VendorDepartment` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VendorId` int NOT NULL,
  `DepartmentId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_VendorDepartment_Department` (`DepartmentId`),
  KEY `FK_VendorDepartment_Vendor` (`VendorId`),
  CONSTRAINT `FK_VendorDepartment_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_VendorDepartment_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VendorGlDefault`
--

DROP TABLE IF EXISTS `VendorGlDefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VendorGlDefault` (
  `Id` int NOT NULL,
  `AuthCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DepartmentId` int DEFAULT NULL,
  `GlCodeId` int DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `ClientId` int DEFAULT NULL,
  `SpecialNote` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_VendorGlDefault_Client` (`ClientId`),
  KEY `FK_VendorGlDefault_Department` (`DepartmentId`),
  KEY `FK_VendorGlDefault_GLCode` (`GlCodeId`),
  CONSTRAINT `FK_VendorGlDefault_Client` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`ClientId`),
  CONSTRAINT `FK_VendorGlDefault_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_VendorGlDefault_GLCode` FOREIGN KEY (`GlCodeId`) REFERENCES `GLCode` (`GLCodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VendorTaxCode`
--

DROP TABLE IF EXISTS `VendorTaxCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VendorTaxCode` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VendorId` int DEFAULT NULL,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TaxCode` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WithHoldingTaxGroup` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_VendorTaxCode_Vendor` (`VendorId`),
  CONSTRAINT `FK_VendorTaxCode_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor_Department_GL`
--

DROP TABLE IF EXISTS `Vendor_Department_GL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor_Department_GL` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VendorId` int NOT NULL,
  `DepartmentId` int NOT NULL,
  `GLCodeId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Vendor_Department_GL_Department` (`DepartmentId`),
  KEY `FK_Vendor_Department_GL_GLCode` (`GLCodeId`),
  KEY `FK_Vendor_Department_GL_Vendor` (`VendorId`),
  CONSTRAINT `FK_Vendor_Department_GL_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`Id`),
  CONSTRAINT `FK_Vendor_Department_GL_GLCode` FOREIGN KEY (`GLCodeId`) REFERENCES `GLCode` (`GLCodeId`),
  CONSTRAINT `FK_Vendor_Department_GL_Vendor` FOREIGN KEY (`VendorId`) REFERENCES `Vendor` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WithHoldingTax`
--

DROP TABLE IF EXISTS `WithHoldingTax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WithHoldingTax` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrgId` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WithHoldingTax` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=1489;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_mitem`
--

DROP TABLE IF EXISTS `old_mitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `old_mitem` (
  `oldMID` int DEFAULT NULL,
  `suppliersku` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `newMID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci AVG_ROW_LENGTH=96;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2025-01-26 20:07:44
