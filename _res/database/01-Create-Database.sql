-- MySQL dump 10.13  Distrib 5.5.59, for Win64 (AMD64)
--
-- Host: localhost    Database: etracs255
-- ------------------------------------------------------
-- Server version	5.5.59

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE etracs255_bohol CHARACTER SET utf8 
; 
USE etracs255_bohol
; 

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `objid` varchar(50) NOT NULL,
  `maingroupid` varchar(50) NULL,
  `code` varchar(100) NULL,
  `title` varchar(255) NULL,
  `groupid` varchar(50) NULL,
  `type` varchar(50) NULL,
  `leftindex` int(11) NULL,
  `rightindex` int(11) NULL,
  `level` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_maingroupid` (`maingroupid`),
  KEY `ix_code` (`code`),
  KEY `ix_title` (`title`),
  KEY `ix_groupid` (`groupid`),
  KEY `uix_account_code` (`maingroupid`,`code`),
  CONSTRAINT `fk_account_groupid` FOREIGN KEY (`groupid`) REFERENCES `account` (`objid`),
  CONSTRAINT `fk_account_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `account_maingroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_incometarget`
--

DROP TABLE IF EXISTS `account_incometarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_incometarget` (
  `objid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemid` (`itemid`),
  KEY `ix_year` (`year`),
  CONSTRAINT `fk_account_incometarget_itemid` FOREIGN KEY (`itemid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_item_mapping`
--

DROP TABLE IF EXISTS `account_item_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_item_mapping` (
  `objid` varchar(50) NOT NULL,
  `maingroupid` varchar(50) NULL,
  `acctid` varchar(50) NULL,
  `itemid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_maingroupid` (`maingroupid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_itemid` (`itemid`),
  CONSTRAINT `fk_account_item_mapping_acctid` FOREIGN KEY (`acctid`) REFERENCES `account` (`objid`),
  CONSTRAINT `fk_account_item_mapping_itemid` FOREIGN KEY (`itemid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_account_item_mapping_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `account_maingroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_maingroup`
--

DROP TABLE IF EXISTS `account_maingroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_maingroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `reporttype` varchar(50) NULL,
  `role` varchar(50) NULL,
  `domain` varchar(50) NULL,
  `system` int(11) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af`
--

DROP TABLE IF EXISTS `af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NULL,
  `usetype` varchar(50) NULL,
  `serieslength` int(11) NULL,
  `system` int(11) NULL,
  `denomination` decimal(10,2) NULL,
  `formtype` varchar(50) NULL,
  `baseunit` varchar(10) NULL,
  `defaultunit` varchar(10) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_allocation`
--

DROP TABLE IF EXISTS `af_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_allocation` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `respcenter_objid` varchar(50) NULL,
  `respcenter_name` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_respcenter_name` (`respcenter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_control`
--

DROP TABLE IF EXISTS `af_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_control` (
  `objid` varchar(50) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `txnmode` varchar(10) NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(50) NULL,
  `startseries` int(11) NOT NULL,
  `currentseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `active` int(11) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(50) NULL,
  `fund_objid` varchar(100) NULL,
  `fund_title` varchar(200) NULL,
  `stubno` int(11) NULL,
  `owner_objid` varchar(50) NULL,
  `owner_name` varchar(255) NULL,
  `prefix` varchar(10) NULL,
  `suffix` varchar(10) NULL,
  `dtfiled` date NULL,
  `state` varchar(50) NULL,
  `unit` varchar(25) NULL,
  `batchno` int(11) NULL,
  `respcenter_objid` varchar(50) NULL,
  `respcenter_name` varchar(100) NULL,
  `cost` decimal(16,2) NULL,
  `currentindexno` int(11) NULL,
  `currentdetailid` varchar(150) NULL,
  `batchref` varchar(50) NULL,
  `lockid` varchar(50) NULL,
  `allocid` varchar(50) NULL,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  `salecost` decimal(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_af_control` (`afid`,`startseries`,`prefix`,`suffix`,`ukey`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_state` (`state`),
  KEY `ix_batchno` (`batchno`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_currentdetailid` (`currentdetailid`),
  KEY `ix_allocid` (`allocid`),
  KEY `ix_ukey` (`ukey`),
  KEY `ix_afid` (`afid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_owner_objid` (`owner_objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  CONSTRAINT `fk_af_control_afid` FOREIGN KEY (`afid`) REFERENCES `af` (`objid`),
  CONSTRAINT `fk_af_control_allocid` FOREIGN KEY (`allocid`) REFERENCES `af_allocation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_control_detail`
--

DROP TABLE IF EXISTS `af_control_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_control_detail` (
  `objid` varchar(150) NOT NULL,
  `state` int(11) NULL,
  `controlid` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `aftxnitemid` varchar(50) NULL,
  `refno` varchar(50) NOT NULL,
  `reftype` varchar(32) NOT NULL,
  `refdate` datetime NOT NULL,
  `txndate` datetime NOT NULL,
  `txntype` varchar(32) NOT NULL,
  `receivedstartseries` int(11) NULL,
  `receivedendseries` int(11) NULL,
  `beginstartseries` int(11) NULL,
  `beginendseries` int(11) NULL,
  `issuedstartseries` int(11) NULL,
  `issuedendseries` int(11) NULL,
  `endingstartseries` int(11) NULL,
  `endingendseries` int(11) NULL,
  `qtyreceived` int(11) NOT NULL,
  `qtybegin` int(11) NOT NULL,
  `qtyissued` int(11) NOT NULL,
  `qtyending` int(11) NOT NULL,
  `qtycancelled` int(11) NOT NULL,
  `remarks` varchar(255) NULL,
  `issuedto_objid` varchar(50) NULL,
  `issuedto_name` varchar(255) NULL,
  `respcenter_objid` varchar(50) NULL,
  `respcenter_name` varchar(255) NULL,
  `prevdetailid` varchar(150) NULL,
  `aftxnid` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_aftxnid` (`aftxnid`),
  KEY `ix_aftxnitemid` (`aftxnitemid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_issuedto_name` (`issuedto_name`),
  KEY `ix_issuedto_objid` (`issuedto_objid`),
  KEY `ix_prevdetailid` (`prevdetailid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refitemid` (`aftxnitemid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txntype` (`txntype`),
  CONSTRAINT `fk_af_control_detail_aftxnid` FOREIGN KEY (`aftxnid`) REFERENCES `aftxn` (`objid`),
  CONSTRAINT `fk_af_control_detail_controlid` FOREIGN KEY (`controlid`) REFERENCES `af_control` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afrequest`
--

DROP TABLE IF EXISTS `afrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afrequest` (
  `objid` varchar(50) NOT NULL,
  `reqno` varchar(20) NULL,
  `state` varchar(25) NULL,
  `dtfiled` datetime NULL,
  `reqtype` varchar(10) NULL,
  `itemclass` varchar(50) NULL,
  `requester_objid` varchar(50) NULL,
  `requester_name` varchar(50) NULL,
  `requester_title` varchar(50) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(50) NULL,
  `vendor` varchar(100) NULL,
  `respcenter_objid` varchar(50) NULL,
  `respcenter_name` varchar(100) NULL,
  `dtapproved` datetime NULL,
  `approvedby_objid` varchar(50) NULL,
  `approvedby_name` varchar(160) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_reqno` (`reqno`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_requester_name` (`requester_name`),
  KEY `ix_requester_objid` (`requester_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_approvedby_name` (`approvedby_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afrequestitem`
--

DROP TABLE IF EXISTS `afrequestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afrequestitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `item_objid` varchar(50) NULL,
  `item_code` varchar(50) NULL,
  `item_title` varchar(255) NULL,
  `unit` varchar(10) NULL,
  `qty` int(11) NULL,
  `qtyreceived` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_item_objid` (`item_objid`),
  CONSTRAINT `fk_afrequestitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `afrequest` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aftxn`
--

DROP TABLE IF EXISTS `aftxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxn` (
  `objid` varchar(100) NOT NULL,
  `state` varchar(50) NULL,
  `request_objid` varchar(50) NULL,
  `request_reqno` varchar(50) NULL,
  `controlno` varchar(50) NULL,
  `dtfiled` datetime NULL,
  `user_objid` varchar(50) NULL,
  `user_name` varchar(100) NULL,
  `issueto_objid` varchar(50) NULL,
  `issueto_name` varchar(100) NULL,
  `issueto_title` varchar(50) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(50) NULL,
  `respcenter_objid` varchar(50) NULL,
  `respcenter_name` varchar(100) NULL,
  `txndate` datetime NOT NULL,
  `cost` decimal(16,2) NULL,
  `txntype` varchar(50) NULL,
  `particulars` varchar(255) NULL,
  `issuefrom_objid` varchar(50) NULL,
  `issuefrom_name` varchar(150) NULL,
  `issuefrom_title` varchar(150) NULL,
  `lockid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_issueno` (`controlno`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_issuefrom_name` (`issuefrom_name`),
  KEY `ix_issuefrom_objid` (`issuefrom_objid`),
  KEY `ix_issueto_objid` (`issueto_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_request_objid` (`request_objid`),
  KEY `ix_request_reqno` (`request_reqno`),
  KEY `ix_user_objid` (`user_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aftxn_type`
--

DROP TABLE IF EXISTS `aftxn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxn_type` (
  `txntype` varchar(50) NOT NULL,
  `formtype` varchar(50) NULL,
  `poststate` varchar(50) NULL,
  `sortorder` int(11) NULL,
  PRIMARY KEY (`txntype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aftxnitem`
--

DROP TABLE IF EXISTS `aftxnitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxnitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(100) NOT NULL,
  `item_objid` varchar(50) NULL,
  `item_code` varchar(50) NULL,
  `item_title` varchar(255) NULL,
  `unit` varchar(20) NULL,
  `qty` int(11) NULL,
  `qtyserved` int(11) NULL,
  `remarks` varchar(255) NULL,
  `txntype` varchar(50) NULL,
  `cost` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_item_objid` (`item_objid`),
  CONSTRAINT `fk_aftxnitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `aftxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afunit`
--

DROP TABLE IF EXISTS `afunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afunit` (
  `objid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `qty` int(11) NULL,
  `saleprice` decimal(16,2) NOT NULL,
  `interval` int(11) DEFAULT '1',
  `cashreceiptprintout` varchar(255) NULL,
  `cashreceiptdetailprintout` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_itemid_unit` (`itemid`,`unit`),
  KEY `ix_itemid` (`itemid`),
  CONSTRAINT `fk_afunit_itemid` FOREIGN KEY (`itemid`) REFERENCES `af` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessmentnotice`
--

DROP TABLE IF EXISTS `assessmentnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmentnotice` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txnno` varchar(15) NULL,
  `txndate` datetime NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayername` varchar(800) NOT NULL,
  `taxpayeraddress` varchar(150) NOT NULL,
  `createdbyid` varchar(50) NULL,
  `createdbyname` varchar(100) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `approvedbyid` varchar(50) NULL,
  `approvedbyname` varchar(100) NULL,
  `approvedbytitle` varchar(50) NULL,
  `dtdelivered` date NULL,
  `receivedby` varchar(150) NULL,
  `remarks` varchar(500) NULL,
  `assessmentyear` int(11) NULL,
  `administrator_name` varchar(150) NULL,
  `administrator_address` varchar(150) NULL,
  `deliverytype_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_txnno_assessmentnotice` (`txnno`),
  KEY `ix_assessmentnotice_receivedby` (`receivedby`),
  KEY `ix_assessmentnotice_state` (`state`),
  KEY `ix_assessmentnotice_taxpayerid` (`taxpayerid`),
  KEY `ix_assessmentnotice_taxpayername` (`taxpayername`(255)),
  KEY `ix_assessmentnotice_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessmentnoticeitem`
--

DROP TABLE IF EXISTS `assessmentnoticeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmentnoticeitem` (
  `objid` varchar(50) NOT NULL,
  `assessmentnoticeid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_assessmentnoticeitem_assessmentnotice` (`assessmentnoticeid`),
  KEY `FK_assessmentnoticeitem_faas` (`faasid`),
  CONSTRAINT `FK_assessmentnoticeitem_assessmentnotice` FOREIGN KEY (`assessmentnoticeid`) REFERENCES `assessmentnotice` (`objid`),
  CONSTRAINT `FK_assessmentnoticeitem_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `address` varchar(255) NULL,
  `manager` varchar(50) NULL,
  `deposittype` varchar(50) NULL,
  `depository` int(11) NULL,
  `depositsliphandler` varchar(50) NULL,
  `cashreport` varchar(255) NULL,
  `checkreport` varchar(255) NULL,
  `_ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bank_name_branch` (`name`,`branchname`),
  UNIQUE KEY `uix_code_branchname` (`code`,`branchname`,`_ukey`),
  KEY `ix_bank_state` (`state`),
  KEY `ix_state` (`state`),
  KEY `ix_code` (`code`),
  KEY `ix_name` (`name`),
  KEY `ix__ukey` (`_ukey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NULL,
  `accttype` varchar(50) NOT NULL,
  `bank_objid` varchar(50) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_code` varchar(50) NOT NULL,
  `fund_title` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `cashreport` varchar(50) NULL,
  `cashbreakdownreport` varchar(50) NULL,
  `checkreport` varchar(50) NULL,
  `forwardbalance` decimal(16,2) NULL,
  `beginbalance` decimal(16,2) NULL,
  `totaldr` decimal(16,2) NULL,
  `totalcr` decimal(16,2) NULL,
  `endbalance` decimal(16,2) NULL,
  `currentlineno` int(11) NULL,
  `checkbreakdownreport` varchar(50) NULL,
  `acctid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `bank_objid` (`bank_objid`),
  KEY `fund_objid` (`fund_objid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_code` (`code`),
  CONSTRAINT `bankaccount_ibfk_1` FOREIGN KEY (`bank_objid`) REFERENCES `bank` (`objid`),
  CONSTRAINT `fk_bankaccount_acctid` FOREIGN KEY (`acctid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_bankaccount_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankaccount_ledger`
--

DROP TABLE IF EXISTS `bankaccount_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NOT NULL,
  `bankacctid` varchar(50) NOT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_itemacctid` (`itemacctid`),
  CONSTRAINT `fk_bankaccount_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barangay` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `indexno` varchar(15) NULL,
  `pin` varchar(15) NULL,
  `name` varchar(50) NULL,
  `previd` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `captain_name` varchar(100) NULL,
  `captain_title` varchar(50) NULL,
  `captain_office` varchar(50) NULL,
  `treasurer_name` varchar(100) NULL,
  `treasurer_title` varchar(50) NULL,
  `treasurer_office` varchar(50) NULL,
  `oldindexno` varchar(15) NULL,
  `oldpin` varchar(15) NULL,
  `fullname` varchar(250) NULL,
  `address` varchar(250) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_pin` (`pin`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_barangay_objid` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchcapture_collection`
--

DROP TABLE IF EXISTS `batchcapture_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txndate` datetime NOT NULL,
  `defaultreceiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `stub` int(11) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `formtype` varchar(10) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `serieslength` int(11) NOT NULL,
  `prefix` varchar(10) NULL,
  `suffix` varchar(10) NULL,
  `startseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `totalamount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `collectiontype_objid` varchar(50) NULL,
  `collectiontype_name` varchar(100) NULL,
  `collector_objid` varchar(50) NULL,
  `collector_name` varchar(100) NULL,
  `collector_title` varchar(50) NULL,
  `capturedby_objid` varchar(50) NULL,
  `capturedby_name` varchar(100) NULL,
  `capturedby_title` varchar(50) NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `postedby_objid` varchar(50) NULL,
  `postedby_name` varchar(100) NULL,
  `postedby_date` datetime NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_defaultreceiptdate` (`defaultreceiptdate`),
  KEY `ix_formno` (`formno`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_capturedby_objid` (`capturedby_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  CONSTRAINT `batchcapture_collection_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchcapture_collection_entry`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection_entry` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `paidby` varchar(100) NOT NULL,
  `paidbyaddress` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `series` int(11) NOT NULL,
  `collectiontype_objid` varchar(50) NULL,
  `collectiontype_name` varchar(100) NULL,
  `remarks` varchar(255) NULL,
  `particulars` longtext,
  `voided` int(11) NULL,
  `paymentitems` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  CONSTRAINT `fk_batchcapture_collection_entry_collectiontype_objid` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `fk_batchcapture_collection_entry_parentid` FOREIGN KEY (`parentid`) REFERENCES `batchcapture_collection` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchcapture_collection_entry_item`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection_entry_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `item_objid` varchar(50) NULL,
  `item_code` varchar(50) NULL,
  `item_title` varchar(255) NULL,
  `fund_objid` varchar(100) NULL,
  `fund_code` varchar(50) NULL,
  `fund_title` varchar(50) NULL,
  `amount` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  CONSTRAINT `batchcapture_collection_entry_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `batchcapture_collection_entry` (`objid`),
  CONSTRAINT `batchcapture_collection_entry_item_ibfk_2` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_batchcapture_collection_entry_item_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr`
--

DROP TABLE IF EXISTS `batchgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `ry` int(11) NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) NOT NULL,
  `rputype` varchar(15) NULL,
  `classification_objid` varchar(50) NULL,
  `section` varchar(10) NULL,
  `count` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `error` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_lgu_objid` (`lgu_objid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_batchgr_barangay_objid` FOREIGN KEY (`barangay_objid`) REFERENCES `barangay` (`objid`),
  CONSTRAINT `fk_batchgr_lgu_objid` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr_error`
--

DROP TABLE IF EXISTS `batchgr_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr_error` (
  `objid` varchar(50) NOT NULL,
  `newry` int(11) NULL,
  `msg` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr_forprocess`
--

DROP TABLE IF EXISTS `batchgr_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr_forprocess` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_batchgr_forprocess_parentid` (`parent_objid`),
  CONSTRAINT `fk_batchgr_forprocess_objid` FOREIGN KEY (`objid`) REFERENCES `batchgr_item` (`objid`),
  CONSTRAINT `fk_batchgr_forprocess_parentid` FOREIGN KEY (`parent_objid`) REFERENCES `batchgr` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr_item`
--

DROP TABLE IF EXISTS `batchgr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr_item` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `tdno` varchar(50) NOT NULL,
  `fullpin` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `suffix` int(11) NOT NULL,
  `newfaasid` varchar(50) NULL,
  `error` longtext,
  PRIMARY KEY (`objid`),
  KEY `fk_batchgr_item_batchgr` (`parent_objid`),
  KEY `fk_batchgr_item_newfaasid` (`newfaasid`),
  KEY `ix_pin` (`pin`),
  KEY `ix_tdno` (`tdno`),
  CONSTRAINT `fk_batchgr_item_batchgr` FOREIGN KEY (`parent_objid`) REFERENCES `batchgr` (`objid`),
  CONSTRAINT `fk_batchgr_item_newfaasid` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `fk_batchgr_item_objid` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batchgr_log`
--

DROP TABLE IF EXISTS `batchgr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchgr_log` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billitem_txntype`
--

DROP TABLE IF EXISTS `billitem_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billitem_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(150) NULL,
  `category` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_title` (`title`),
  KEY `ix_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgadditionalitem`
--

DROP TABLE IF EXISTS `bldgadditionalitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgadditionalitem` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit` varchar(25) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) NULL,
  `type` varchar(30) NULL,
  `addareatobldgtotalarea` int(11) NULL,
  `idx` int(11) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgadditionalitem_settingcode` (`bldgrysettingid`,`code`),
  UNIQUE KEY `ux_bldgadditionalitem_settingname` (`bldgrysettingid`,`name`),
  KEY `FK_bldgadditionalitem` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgadditionalitem` FOREIGN KEY (`previd`) REFERENCES `bldgadditionalitem` (`objid`),
  CONSTRAINT `FK_bldgadditionalitem_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgassesslevel`
--

DROP TABLE IF EXISTS `bldgassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgassesslevel` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgassesslevel_bdlgrysettingid_name` (`bldgrysettingid`,`name`),
  UNIQUE KEY `ux_bldgassesslevel_bldgrysettingid_code` (`bldgrysettingid`,`code`),
  KEY `FK_bldgassesslevel_bldgrysettingid` (`bldgrysettingid`),
  KEY `FK_bldgassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgassesslevel_bldgrysettingid` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgassesslevel_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgassesslevelrange`
--

DROP TABLE IF EXISTS `bldgassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `bldgassesslevelid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(18,2) DEFAULT '0.00',
  `mvto` decimal(18,2) DEFAULT '0.00',
  `rate` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgassesslevelid_mvfrom` (`bldgassesslevelid`,`mvfrom`),
  KEY `FK_bldgassesslevelrange_bldgrysetting` (`bldgrysettingid`),
  CONSTRAINT `FK_bldgassesslevelrange_bldgassesslevel` FOREIGN KEY (`bldgassesslevelid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `FK_bldgassesslevelrange_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgfloor`
--

DROP TABLE IF EXISTS `bldgfloor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgfloor` (
  `objid` varchar(50) NOT NULL,
  `bldguseid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `floorno` varchar(5) NOT NULL,
  `area` decimal(18,2) DEFAULT '0.00',
  `storeyrate` decimal(18,2) DEFAULT '0.00',
  `basevalue` decimal(18,2) DEFAULT '0.00',
  `unitvalue` decimal(18,2) DEFAULT '0.00',
  `basemarketvalue` decimal(18,2) DEFAULT '0.00',
  `adjustment` decimal(18,2) DEFAULT '0.00',
  `marketvalue` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  KEY `FK_bldgfloor_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgfloor_bldguse` (`bldguseid`),
  CONSTRAINT `FK_bldgfloor_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgfloor_bldguse` FOREIGN KEY (`bldguseid`) REFERENCES `bldguse` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgflooradditional`
--

DROP TABLE IF EXISTS `bldgflooradditional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgflooradditional` (
  `objid` varchar(50) NOT NULL,
  `bldgfloorid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `additionalitem_objid` varchar(50) NOT NULL,
  `amount` decimal(18,2) DEFAULT '0.00',
  `expr` varchar(300) NOT NULL,
  `depreciate` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgflooradditional_additionalitem` (`additionalitem_objid`),
  KEY `FK_bldgflooradditional_bldgfloor` (`bldgfloorid`),
  KEY `FK_bldgflooradditional_bldgrpu` (`bldgrpuid`),
  CONSTRAINT `FK_bldgflooradditional_additionalitem` FOREIGN KEY (`additionalitem_objid`) REFERENCES `bldgadditionalitem` (`objid`),
  CONSTRAINT `FK_bldgflooradditional_bldgfloor` FOREIGN KEY (`bldgfloorid`) REFERENCES `bldgfloor` (`objid`),
  CONSTRAINT `FK_bldgflooradditional_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgflooradditionalparam`
--

DROP TABLE IF EXISTS `bldgflooradditionalparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgflooradditionalparam` (
  `objid` varchar(50) NOT NULL,
  `bldgflooradditionalid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `param_objid` varchar(50) NOT NULL,
  `intvalue` int(11) NULL,
  `decimalvalue` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  KEY `FK_bldgflooradditionalparam_bldgflooradditional` (`bldgflooradditionalid`),
  KEY `FK_bldgflooradditionalparam_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgflooradditionalparam_param` (`param_objid`),
  CONSTRAINT `FK_bldgflooradditionalparam_bldgflooradditional` FOREIGN KEY (`bldgflooradditionalid`) REFERENCES `bldgflooradditional` (`objid`),
  CONSTRAINT `FK_bldgflooradditionalparam_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgflooradditionalparam_param` FOREIGN KEY (`param_objid`) REFERENCES `rptparameter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgkind`
--

DROP TABLE IF EXISTS `bldgkind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgkind` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgkind_code` (`code`),
  UNIQUE KEY `ux_bldgkind_name` (`name`),
  KEY `ix_bldgkind_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgkindbucc`
--

DROP TABLE IF EXISTS `bldgkindbucc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgkindbucc` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgkind_objid` varchar(50) NOT NULL,
  `basevaluetype` varchar(25) NOT NULL,
  `basevalue` decimal(16,2) DEFAULT '0.00',
  `minbasevalue` decimal(16,2) DEFAULT '0.00',
  `maxbasevalue` decimal(16,2) DEFAULT '0.00',
  `gapvalue` decimal(16,2) DEFAULT '0.00',
  `minarea` decimal(16,2) DEFAULT '0.00',
  `maxarea` decimal(16,2) DEFAULT '0.00',
  `bldgclass` varchar(50) NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgkindbucc_settingtypekind` (`bldgrysettingid`,`bldgtypeid`,`bldgkind_objid`,`bldgclass`),
  KEY `FK_bldgkindbucc_bldgkind` (`bldgkind_objid`),
  KEY `FK_bldgkindbucc_bldgkindbucc` (`previd`),
  KEY `FK_bldgkindbucc_bldgtype` (`bldgtypeid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgkindbucc_bldgkind` FOREIGN KEY (`bldgkind_objid`) REFERENCES `bldgkind` (`objid`),
  CONSTRAINT `FK_bldgkindbucc_bldgrysettingid` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgkindbucc_bldgtype` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu`
--

DROP TABLE IF EXISTS `bldgrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NULL,
  `houseno` varchar(25) NULL,
  `psic` varchar(20) NULL,
  `permitno` varchar(20) NULL,
  `permitdate` datetime NULL,
  `permitissuedby` varchar(50) NULL,
  `bldgtype_objid` varchar(50) NULL,
  `bldgkindbucc_objid` varchar(50) NULL,
  `basevalue` decimal(18,2) DEFAULT '0.00',
  `dtcompleted` datetime NULL,
  `dtoccupied` datetime NULL,
  `floorcount` int(11) NOT NULL,
  `depreciation` decimal(18,2) DEFAULT '0.00',
  `depreciationvalue` decimal(18,2) DEFAULT '0.00',
  `totaladjustment` decimal(18,2) DEFAULT '0.00',
  `additionalinfo` varchar(255) NULL,
  `bldgage` int(11) NOT NULL,
  `percentcompleted` int(11) NOT NULL,
  `bldgassesslevel_objid` varchar(50) NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `condominium` int(11) NOT NULL,
  `bldgclass` varchar(15) NULL,
  `predominant` int(11) NULL,
  `effectiveage` int(11) NULL,
  `condocerttitle` varchar(50) NULL,
  `dtcertcompletion` date NULL,
  `dtcertoccupancy` date NULL,
  `cdurating` varchar(15) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgrpu_bldgassesslevel` (`bldgassesslevel_objid`),
  KEY `FK_bldgrpu_bldgkindbucc` (`bldgkindbucc_objid`),
  KEY `FK_bldgrpu_bldgtype` (`bldgtype_objid`),
  KEY `FK_bldgrpu_landrpu` (`landrpuid`),
  CONSTRAINT `FK_bldgrpu_bldgassesslevel` FOREIGN KEY (`bldgassesslevel_objid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `FK_bldgrpu_bldgkindbucc` FOREIGN KEY (`bldgkindbucc_objid`) REFERENCES `bldgkindbucc` (`objid`),
  CONSTRAINT `FK_bldgrpu_bldgtype` FOREIGN KEY (`bldgtype_objid`) REFERENCES `bldgtype` (`objid`),
  CONSTRAINT `FK_bldgrpu_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_bldgrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu_assessment`
--

DROP TABLE IF EXISTS `bldgrpu_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu_assessment` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bldgrpuassessment_actualuseid` (`actualuse_objid`),
  KEY `ix_bldgrpuassessment_bldgrpuid` (`bldgrpuid`),
  CONSTRAINT `FK_bldgrpuassessment_bldgassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `FK_bldgrpuassessment_rpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu_land`
--

DROP TABLE IF EXISTS `bldgrpu_land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu_land` (
  `objid` varchar(50) NOT NULL,
  `rpu_objid` varchar(50) NOT NULL,
  `landfaas_objid` varchar(50) NULL,
  `landrpumaster_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bldgrpu_land_bldgrpuid` (`rpu_objid`),
  KEY `ix_bldgrpu_land_landfaasid` (`landfaas_objid`),
  KEY `ix_bldgrpu_land_landrpumasterid` (`landrpumaster_objid`),
  CONSTRAINT `fk_bldgrpu_land_bldgrpu` FOREIGN KEY (`rpu_objid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `fk_bldgrpu_land_landfaas` FOREIGN KEY (`landfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `fk_bldgrpu_land_rpumaster` FOREIGN KEY (`landrpumaster_objid`) REFERENCES `rpumaster` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrpu_structuraltype`
--

DROP TABLE IF EXISTS `bldgrpu_structuraltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrpu_structuraltype` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `bldgtype_objid` varchar(50) NULL,
  `bldgkindbucc_objid` varchar(50) NULL,
  `floorcount` int(11) NOT NULL,
  `basefloorarea` decimal(16,2) NOT NULL,
  `totalfloorarea` decimal(16,2) NOT NULL,
  `basevalue` decimal(16,2) NOT NULL,
  `unitvalue` decimal(16,2) NOT NULL,
  `classification_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgrpu_structuraltype` (`classification_objid`),
  KEY `FK_bldgrpu_structuraltype_bldgkindbucc` (`bldgkindbucc_objid`),
  KEY `FK_bldgrpu_structuraltype_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgrpu_structuraltype_bldgtype` (`bldgtype_objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype_bldgkindbucc` FOREIGN KEY (`bldgkindbucc_objid`) REFERENCES `bldgkindbucc` (`objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgrpu_structuraltype_bldgtype` FOREIGN KEY (`bldgtype_objid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgrysetting`
--

DROP TABLE IF EXISTS `bldgrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `predominant` int(11) NULL,
  `depreciatecoreanditemseparately` int(11) NULL,
  `computedepreciationbasedonschedule` int(11) NULL,
  `straightdepreciation` int(11) NULL,
  `calcbldgagebasedondtoccupied` int(11) NULL,
  `appliedto` longtext,
  `previd` varchar(50) NULL,
  `remarks` varchar(200) NULL,
  `ordinanceno` varchar(25) NULL,
  `ordinancedate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bldgrysetting_previd` (`previd`),
  KEY `ix_bldgrysetting_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgstructure`
--

DROP TABLE IF EXISTS `bldgstructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgstructure` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `structure_objid` varchar(50) NOT NULL,
  `material_objid` varchar(50) NULL,
  `floor` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldgstructure_bldgrpu` (`bldgrpuid`),
  KEY `FK_bldgstructure_material` (`material_objid`),
  KEY `FK_bldgstructure_structure` (`structure_objid`),
  CONSTRAINT `FK_bldgstructure_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`),
  CONSTRAINT `FK_bldgstructure_material` FOREIGN KEY (`material_objid`) REFERENCES `material` (`objid`),
  CONSTRAINT `FK_bldgstructure_structure` FOREIGN KEY (`structure_objid`) REFERENCES `structure` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype`
--

DROP TABLE IF EXISTS `bldgtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `basevaluetype` varchar(10) NOT NULL,
  `residualrate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  `usecdu` int(11) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_bldgrysettingid_code` (`bldgrysettingid`,`code`),
  UNIQUE KEY `ux_bldgtype_bldgrysettingid_name` (`bldgrysettingid`,`name`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_bldgtype_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgtype_bldgtype` FOREIGN KEY (`previd`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype_depreciation`
--

DROP TABLE IF EXISTS `bldgtype_depreciation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype_depreciation` (
  `objid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `agefrom` int(11) NOT NULL,
  `ageto` int(11) NOT NULL,
  `rate` decimal(16,4) NULL,
  `excellent` decimal(16,2) NULL,
  `verygood` decimal(16,2) NULL,
  `good` decimal(16,2) NULL,
  `average` decimal(16,2) NULL,
  `fair` decimal(16,2) NULL,
  `poor` decimal(16,2) NULL,
  `verypoor` decimal(16,2) NULL,
  `unsound` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_depreciation_settingtypeagefrom` (`bldgtypeid`,`bldgrysettingid`,`agefrom`),
  KEY `FK_bldgtype_depreciation_bldgrysetting` (`bldgrysettingid`),
  KEY `ix_bldgtypeid` (`bldgtypeid`),
  CONSTRAINT `FK_bldgtype_depreciation_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgtype_depreciation_bldgtype` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldgtype_storeyadjustment`
--

DROP TABLE IF EXISTS `bldgtype_storeyadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldgtype_storeyadjustment` (
  `objid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `floorno` varchar(10) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bldgtype_storeyadjustment_settingtypefloorno` (`bldgtypeid`,`bldgrysettingid`,`floorno`),
  KEY `FK_bldgtype_storeyadjustment` (`previd`),
  KEY `FK_bldgtype_storeyadjustment_bldgrysetting` (`bldgrysettingid`),
  CONSTRAINT `FK_bldgtype_storeyadjustment` FOREIGN KEY (`previd`) REFERENCES `bldgtype_storeyadjustment` (`objid`),
  CONSTRAINT `FK_bldgtype_storeyadjustment_bldgrysetting` FOREIGN KEY (`bldgrysettingid`) REFERENCES `bldgrysetting` (`objid`),
  CONSTRAINT `FK_bldgtype_storeyadjustment_bldgtype` FOREIGN KEY (`bldgtypeid`) REFERENCES `bldgtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bldguse`
--

DROP TABLE IF EXISTS `bldguse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bldguse` (
  `objid` varchar(50) NOT NULL,
  `bldgrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `basevalue` decimal(18,2) DEFAULT '0.00',
  `area` decimal(18,2) DEFAULT '0.00',
  `basemarketvalue` decimal(18,2) DEFAULT '0.00',
  `depreciationvalue` decimal(18,2) DEFAULT '0.00',
  `adjustment` decimal(18,2) DEFAULT '0.00',
  `marketvalue` decimal(18,2) DEFAULT '0.00',
  `assesslevel` decimal(18,2) DEFAULT '0.00',
  `assessedvalue` decimal(18,2) DEFAULT '0.00',
  `structuraltype_objid` varchar(50) NULL,
  `addlinfo` varchar(255) NULL,
  `adjfordepreciation` decimal(16,2) NULL,
  `taxable` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_bldguse_bldgassesslevel` (`actualuse_objid`),
  KEY `FK_bldguse_bldgrpu` (`bldgrpuid`),
  CONSTRAINT `FK_bldguse_bldgassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `bldgassesslevel` (`objid`),
  CONSTRAINT `FK_bldguse_bldgrpu` FOREIGN KEY (`bldgrpuid`) REFERENCES `bldgrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgy_taxaccount_mapping`
--

DROP TABLE IF EXISTS `brgy_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgy_taxaccount_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) NULL,
  `basicprevacct_objid` varchar(50) NULL,
  `basicprevintacct_objid` varchar(50) NULL,
  `basicprioracct_objid` varchar(50) NULL,
  `basicpriorintacct_objid` varchar(50) NULL,
  `basiccurracct_objid` varchar(50) NULL,
  `basiccurrintacct_objid` varchar(50) NULL,
  PRIMARY KEY (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgyshare`
--

DROP TABLE IF EXISTS `brgyshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshare` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(15) NULL,
  `txndate` datetime NULL,
  `year` int(11) NULL,
  `month` int(11) NULL,
  `totalshare` decimal(10,0) NOT NULL,
  `createdbyid` varchar(50) NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `postedbyid` varchar(50) NULL,
  `postedby` varchar(150) NULL,
  `postedbytitle` varchar(50) NULL,
  `sharetype` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_brgyshare_yqm` (`year`,`month`),
  KEY `ix_brgyshare_state` (`state`),
  KEY `ix_brgyshare_yq` (`year`),
  KEY `ix_brgyshare_yqm` (`year`,`month`),
  KEY `ix_brgyshare_yr` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgyshare_account_mapping`
--

DROP TABLE IF EXISTS `brgyshare_account_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshare_account_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `acct_objid` varchar(50) NOT NULL,
  `penaltyacct_objid` varchar(50) NULL,
  PRIMARY KEY (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brgyshareitem`
--

DROP TABLE IF EXISTS `brgyshareitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshareitem` (
  `objid` varchar(50) NOT NULL,
  `brgyshareid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `basic` decimal(10,0) NOT NULL,
  `basicint` decimal(10,0) NOT NULL,
  `basicdisc` decimal(10,0) NOT NULL,
  `basicshare` decimal(10,0) NOT NULL,
  `basicintshare` decimal(10,0) NOT NULL,
  `commonshare` decimal(10,0) NULL,
  `basiccurrent` decimal(10,0) NULL,
  `basicprevious` decimal(10,0) NULL,
  `basiccollection` decimal(10,0) NULL,
  `basicintcollection` decimal(10,0) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_brgyshareitem_brgyshare_brgy` (`brgyshareid`,`barangayid`),
  CONSTRAINT `FK_brgyshareitem_brgyshare` FOREIGN KEY (`brgyshareid`) REFERENCES `brgyshare` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelannotation`
--

DROP TABLE IF EXISTS `cancelannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelannotation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txnno` varchar(10) NULL,
  `txndate` datetime NULL,
  `annotationid` varchar(50) NOT NULL,
  `fileno` varchar(20) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `orno` varchar(10) NULL,
  `ordate` date NULL,
  `oramount` decimal(16,2) NULL,
  `signedby` varchar(150) NOT NULL,
  `signedbytitle` varchar(50) NOT NULL,
  `dtsigned` datetime NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cancelannotation_faasannotation` (`annotationid`),
  KEY `ix_cancelannotation_fileno` (`fileno`),
  KEY `ix_cancelannotation_txnno` (`txnno`),
  CONSTRAINT `FK_cancelannotation_faasannotation` FOREIGN KEY (`annotationid`) REFERENCES `faasannotation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelledfaas`
--

DROP TABLE IF EXISTS `cancelledfaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelledfaas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `txndate` datetime NOT NULL,
  `faasid` varchar(50) NULL,
  `reason_objid` varchar(50) NULL,
  `remarks` longtext,
  `online` int(11) NULL,
  `lguid` varchar(50) NULL,
  `lasttaxyear` int(11) NULL,
  `txnno` varchar(25) NULL,
  `originlguid` varchar(50) NULL,
  `cancelledbytdnos` varchar(500) NULL,
  `cancelledbypins` varchar(500) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cancelledfaas_faas` (`faasid`),
  KEY `FK_cancelledfaas_reason` (`reason_objid`),
  KEY `ix_cancelledfaas_txnno` (`txnno`),
  CONSTRAINT `FK_cancelledfaas_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_cancelledfaas_reason` FOREIGN KEY (`reason_objid`) REFERENCES `canceltdreason` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelledfaas_signatory`
--

DROP TABLE IF EXISTS `cancelledfaas_signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelledfaas_signatory` (
  `objid` varchar(50) NOT NULL,
  `taxmapper_objid` varchar(50) NULL,
  `taxmapper_name` varchar(100) NULL,
  `taxmapper_title` varchar(50) NULL,
  `taxmapper_dtsigned` datetime NULL,
  `taxmapper_taskid` varchar(50) NULL,
  `taxmapperchief_objid` varchar(50) NULL,
  `taxmapperchief_name` varchar(100) NULL,
  `taxmapperchief_title` varchar(50) NULL,
  `taxmapperchief_dtsigned` datetime NULL,
  `taxmapperchief_taskid` varchar(50) NULL,
  `appraiser_objid` varchar(50) NULL,
  `appraiser_name` varchar(150) NULL,
  `appraiser_title` varchar(50) NULL,
  `appraiser_dtsigned` datetime NULL,
  `appraiser_taskid` varchar(50) NULL,
  `appraiserchief_objid` varchar(50) NULL,
  `appraiserchief_name` varchar(100) NULL,
  `appraiserchief_title` varchar(50) NULL,
  `appraiserchief_dtsigned` datetime NULL,
  `appraiserchief_taskid` varchar(50) NULL,
  `recommender_objid` varchar(50) NULL,
  `recommender_name` varchar(100) NULL,
  `recommender_title` varchar(50) NULL,
  `recommender_dtsigned` datetime NULL,
  `recommender_taskid` varchar(50) NULL,
  `provtaxmapper_objid` varchar(50) NULL,
  `provtaxmapper_name` varchar(100) NULL,
  `provtaxmapper_title` varchar(50) NULL,
  `provtaxmapper_dtsigned` datetime NULL,
  `provtaxmapper_taskid` varchar(50) NULL,
  `provtaxmapperchief_objid` varchar(50) NULL,
  `provtaxmapperchief_name` varchar(100) NULL,
  `provtaxmapperchief_title` varchar(50) NULL,
  `provtaxmapperchief_dtsigned` datetime NULL,
  `provtaxmapperchief_taskid` varchar(50) NULL,
  `provappraiser_objid` varchar(50) NULL,
  `provappraiser_name` varchar(100) NULL,
  `provappraiser_title` varchar(50) NULL,
  `provappraiser_dtsigned` datetime NULL,
  `provappraiser_taskid` varchar(50) NULL,
  `provappraiserchief_objid` varchar(50) NULL,
  `provappraiserchief_name` varchar(100) NULL,
  `provappraiserchief_title` varchar(50) NULL,
  `provappraiserchief_dtsigned` datetime NULL,
  `provappraiserchief_taskid` varchar(50) NULL,
  `approver_objid` varchar(50) NULL,
  `approver_name` varchar(100) NULL,
  `approver_title` varchar(50) NULL,
  `approver_dtsigned` datetime NULL,
  `approver_taskid` varchar(50) NULL,
  `provapprover_objid` varchar(50) NULL,
  `provapprover_name` varchar(100) NULL,
  `provapprover_title` varchar(50) NULL,
  `provapprover_dtsigned` datetime NULL,
  `provapprover_taskid` varchar(50) NULL,
  `provrecommender_objid` varchar(50) NULL,
  `provrecommender_name` varchar(100) NULL,
  `provrecommender_title` varchar(50) NULL,
  `provrecommender_dtsigned` datetime NULL,
  `provrecommender_taskid` varchar(50) NULL,
  `reviewer_objid` varchar(50) NULL,
  `reviewer_name` varchar(100) NULL,
  `reviewer_title` varchar(75) NULL,
  `reviewer_dtsigned` datetime NULL,
  `reviewer_taskid` varchar(50) NULL,
  `assessor_name` varchar(100) NULL,
  `assessor_title` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_cancelledfaas_signatory_cancelled_faas` FOREIGN KEY (`objid`) REFERENCES `cancelledfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancelledfaas_task`
--

DROP TABLE IF EXISTS `cancelledfaas_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelledfaas_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `assignee_title` varchar(80) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `actor_title` varchar(80) NULL,
  `message` varchar(255) NULL,
  `signature` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `FK_cancelledfaas_task_cancelledfaas` FOREIGN KEY (`refid`) REFERENCES `cancelledfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `canceltdreason`
--

DROP TABLE IF EXISTS `canceltdreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canceltdreason` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_canceltdreason_code` (`code`),
  UNIQUE KEY `ux_canceltdreason_name` (`name`),
  KEY `ix_canceltdreason_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_treasury_ledger`
--

DROP TABLE IF EXISTS `cash_treasury_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_treasury_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NULL,
  `itemacctid` varchar(50) NULL,
  `dr` decimal(16,4) NULL,
  `cr` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_cash_treasury_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt`
--

DROP TABLE IF EXISTS `cashreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `payer_objid` varchar(50) NULL,
  `payer_name` varchar(800) NULL,
  `paidby` varchar(800) NOT NULL,
  `paidbyaddress` varchar(800) NOT NULL,
  `amount` decimal(16,4) NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `totalcash` decimal(16,4) NULL,
  `totalnoncash` decimal(16,4) NULL,
  `cashchange` decimal(16,2) NOT NULL,
  `totalcredit` decimal(16,2) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `collectiontype_objid` varchar(50) NULL,
  `collectiontype_name` varchar(100) NULL,
  `user_objid` varchar(50) NULL,
  `user_name` varchar(100) NULL,
  `remarks` varchar(200) NULL,
  `subcollector_objid` varchar(50) NULL,
  `subcollector_name` varchar(100) NULL,
  `subcollector_title` varchar(50) NULL,
  `formtype` varchar(25) NULL,
  `stub` varchar(25) NULL,
  `remittanceid` varchar(50) NULL,
  `subcollector_remittanceid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_receiptno` (`receiptno`),
  KEY `fk_cashereceipt_userid` (`user_objid`),
  KEY `fk_cashreceipt_afcontrol` (`controlid`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorname` (`collector_name`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_state` (`state`),
  KEY `fk_cashreceipt_collectiontype` (`collectiontype_objid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_subcollector_remittanceid` (`subcollector_remittanceid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_formno` (`formno`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_user_objid` (`user_objid`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  KEY `ix_paidby` (`paidby`(255)),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_payer_name` (`payer_name`(255)),
  KEY `ix_formtype` (`formtype`),
  CONSTRAINT `cashreceipt_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_cashreceipt_collectiontype` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `fk_cashreceipt_remittanceid` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_burial`
--

DROP TABLE IF EXISTS `cashreceipt_burial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_burial` (
  `objid` varchar(50) NOT NULL,
  `tocitymuni` varchar(100) NULL,
  `toprovince` varchar(100) NULL,
  `permissiontype` varchar(15) NULL,
  `name` varchar(100) NULL,
  `nationality` varchar(15) NULL,
  `age` int(11) NULL,
  `sex` varchar(10) NULL,
  `dtdeath` varchar(15) NULL,
  `deathcause` varchar(50) NULL,
  `cemetery` varchar(50) NULL,
  `infectious` varchar(50) NULL,
  `embalmed` varchar(50) NULL,
  `disposition` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_cancelseries`
--

DROP TABLE IF EXISTS `cashreceipt_cancelseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_cancelseries` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) NULL,
  `postedby_name` varchar(100) NULL,
  `reason` varchar(255) NULL,
  `controlid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_controlid` (`controlid`),
  CONSTRAINT `cashreceipt_cancelseries_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_cashticket`
--

DROP TABLE IF EXISTS `cashreceipt_cashticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_cashticket` (
  `objid` varchar(50) NOT NULL,
  `qtyissued` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_cashreceipt_cashticket_cashreceipt` (`objid`),
  CONSTRAINT `cashreceipt_cashticket_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_ctc_corporate`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_ctc_corporate` (
  `objid` varchar(50) NOT NULL,
  `payer_tin` varchar(50) NULL,
  `payer_orgtype` varchar(50) NULL,
  `payer_nature` varchar(50) NULL,
  `payer_dtregistered` datetime NULL,
  `payer_placeregistered` varchar(100) NULL,
  `additional_remarks` varchar(100) NULL,
  `realpropertyav` decimal(16,2) NOT NULL,
  `businessgross` decimal(16,2) NOT NULL,
  `basictax` decimal(16,2) NOT NULL,
  `propertyavtax` decimal(16,2) NOT NULL,
  `businessgrosstax` decimal(16,2) NOT NULL,
  `totaltax` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `amountdue` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_ctc_corporate_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_ctc_individual`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_ctc_individual` (
  `objid` varchar(50) NOT NULL,
  `payer_profession` varchar(50) NULL,
  `payer_citizenship` varchar(50) NULL,
  `payer_civilstatus` varchar(25) NULL,
  `payer_height` varchar(25) NULL,
  `payer_weight` varchar(25) NULL,
  `additional_remarks` varchar(100) NULL,
  `businessgross` decimal(16,2) NOT NULL,
  `annualsalary` decimal(16,2) NOT NULL,
  `propertyincome` decimal(16,2) NOT NULL,
  `basictax` decimal(16,2) NOT NULL,
  `salarytax` decimal(16,2) NOT NULL,
  `businessgrosstax` decimal(16,2) NOT NULL,
  `propertyincometax` decimal(16,2) NOT NULL,
  `additionaltax` decimal(16,2) NOT NULL,
  `totaltax` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `amountdue` decimal(16,2) NOT NULL,
  `interestdue` decimal(16,2) NOT NULL,
  `barangay_objid` varchar(50) NULL,
  `barangay_name` varchar(50) NULL,
  `brgytaxshare` decimal(16,2) NOT NULL,
  `brgyinterestshare` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_ctc_individual_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_group`
--

DROP TABLE IF EXISTS `cashreceipt_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_group` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `cashchange` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_txndate` (`txndate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_groupitem`
--

DROP TABLE IF EXISTS `cashreceipt_groupitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_groupitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_cashreceipt_groupitem_objid` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_cashreceipt_groupitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `cashreceipt_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_largecattleownership`
--

DROP TABLE IF EXISTS `cashreceipt_largecattleownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_largecattleownership` (
  `objid` varchar(50) NOT NULL,
  `ownerof` varchar(200) NULL,
  `sex` varchar(10) NULL,
  `age` int(11) NULL,
  `municipalitybrand` varchar(20) NULL,
  `ownerbrand` varchar(20) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_largecattleownership_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_largecattletransfer`
--

DROP TABLE IF EXISTS `cashreceipt_largecattletransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_largecattletransfer` (
  `objid` varchar(50) NOT NULL,
  `purchasedby` varchar(200) NULL,
  `price` decimal(16,2) NULL,
  `citymuni` varchar(100) NULL,
  `province` varchar(100) NULL,
  `sex` varchar(10) NULL,
  `age` int(11) NULL,
  `municipalitybrand` varchar(20) NULL,
  `ownerbrand` varchar(20) NULL,
  `certificateno` varchar(30) NULL,
  `issuedate` date NULL,
  `issuedcitymuni` varchar(100) NULL,
  `issuedprovince` varchar(100) NULL,
  `attestedby` varchar(100) NULL,
  `treasurer` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_largecattletransfer_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_marriage`
--

DROP TABLE IF EXISTS `cashreceipt_marriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_marriage` (
  `objid` varchar(50) NOT NULL,
  `groomname` varchar(100) NULL,
  `groomaddress` varchar(100) NULL,
  `groomageyear` int(11) NULL,
  `groomagemonth` int(11) NULL,
  `bridename` varchar(100) NULL,
  `brideaddress` varchar(100) NULL,
  `brideageyear` int(11) NULL,
  `brideagemonth` int(11) NULL,
  `registerno` varchar(30) NULL,
  `attachments` varchar(200) NULL,
  `lcrofficer` varchar(100) NULL,
  `lcrofficertitle` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_marriage_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_plugin`
--

DROP TABLE IF EXISTS `cashreceipt_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_plugin` (
  `objid` varchar(50) NOT NULL,
  `connection` varchar(150) NOT NULL,
  `servicename` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_reprint_log`
--

DROP TABLE IF EXISTS `cashreceipt_reprint_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_reprint_log` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `approvedby_objid` varchar(50) NOT NULL,
  `approvedby_name` varchar(150) NOT NULL,
  `dtapproved` datetime NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_receiptid` (`receiptid`),
  CONSTRAINT `fk_cashreceipt_reprint_log_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_rpt`
--

DROP TABLE IF EXISTS `cashreceipt_rpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_rpt` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `txntype` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_share`
--

DROP TABLE IF EXISTS `cashreceipt_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_share` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `refitem_objid` varchar(50) NOT NULL,
  `payableitem_objid` varchar(50) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `share` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refitem_objid` (`refitem_objid`),
  KEY `ix_payableitem_objid` (`payableitem_objid`),
  CONSTRAINT `fk_cashreceipt_share_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_slaughter`
--

DROP TABLE IF EXISTS `cashreceipt_slaughter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_slaughter` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) NULL,
  `acctno` varchar(50) NULL,
  `acctitle` varchar(100) NULL,
  `permitamount` decimal(18,2) NULL,
  `slaughterof` varchar(25) NULL,
  `weight` decimal(18,2) NULL,
  `ordinanceno` varchar(50) NULL,
  `ordinancedate` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_acctno` (`acctno`),
  CONSTRAINT `cashreceipt_slaughter_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipt_void`
--

DROP TABLE IF EXISTS `cashreceipt_void`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_void` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) NOT NULL,
  `postedby_name` varchar(100) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_receiptid` (`receiptid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  CONSTRAINT `cashreceipt_void_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptitem`
--

DROP TABLE IF EXISTS `cashreceiptitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `item_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `remarks` varchar(255) NULL,
  `sortorder` int(11) NULL,
  `item_fund_objid` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_item_code` (`item_code`),
  KEY `ix_item_title` (`item_title`),
  KEY `ix_item_fund_objid` (`item_fund_objid`),
  CONSTRAINT `cashreceiptitem_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceiptitem_ibfk_2` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_cashreceiptitem_item_fund_objid` FOREIGN KEY (`item_fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptitem_discount`
--

DROP TABLE IF EXISTS `cashreceiptitem_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem_discount` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NULL,
  `receiptitemid` varchar(50) NULL,
  `acctid` varchar(50) NULL,
  `amount` decimal(16,2) NULL,
  `title` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `receiptid` (`receiptid`),
  KEY `ix_receiptitemid` (`receiptitemid`),
  KEY `ix_acctid` (`acctid`),
  CONSTRAINT `cashreceiptitem_discount_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptpayment_creditmemo`
--

DROP TABLE IF EXISTS `cashreceiptpayment_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_creditmemo` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NULL,
  `account_objid` varchar(50) NULL,
  `account_code` varchar(100) NULL,
  `account_fund_name` varchar(50) NULL,
  `account_fund_objid` varchar(100) NULL,
  `account_bank` varchar(50) NULL,
  `refno` varchar(25) NULL,
  `refdate` datetime NULL,
  `amount` decimal(16,2) NULL,
  `particulars` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_account_fund_objid` (`account_fund_objid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptpayment_eor`
--

DROP TABLE IF EXISTS `cashreceiptpayment_eor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_eor` (
  `objid` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `receiptid` varchar(50) NULL,
  `partner_objid` varchar(50) NULL,
  `txnrefid` varchar(50) NULL,
  `txnreftype` varchar(50) NULL,
  `refno` varchar(100) NULL,
  `refdate` datetime NULL,
  `amount` decimal(16,2) NULL,
  `txntype` varchar(50) NULL,
  `particulars` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_account_objid` (`partner_objid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`),
  CONSTRAINT `fk_payment_partner_eor` FOREIGN KEY (`partner_objid`) REFERENCES `z20181120_payment_partner` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `cashreceiptpayment_noncash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_noncash` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NULL,
  `_bank` varchar(50) NULL,
  `refno` varchar(25) NULL,
  `refdate` datetime NULL,
  `reftype` varchar(50) NULL,
  `amount` decimal(16,2) NULL,
  `particulars` varchar(255) NULL,
  `_bankid` varchar(50) NULL,
  `_deposittype` varchar(50) NULL,
  `account_objid` varchar(50) NULL,
  `account_code` varchar(50) NULL,
  `account_name` varchar(100) NULL,
  `account_fund_objid` varchar(100) NULL,
  `account_fund_name` varchar(50) NULL,
  `account_bank` varchar(100) NULL,
  `fund_objid` varchar(100) NULL,
  `refid` varchar(50) NULL,
  `checkid` varchar(50) NULL,
  `voidamount` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `bankid` (`_bankid`),
  KEY `FK_cashreceiptpayment_check` (`receiptid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_account_fund_objid` (`account_fund_objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_checkid` (`checkid`),
  CONSTRAINT `cashreceiptpayment_noncash_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_cashreceiptpayment_noncash_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashreceipts`
--

DROP TABLE IF EXISTS `cashreceipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipts` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `refid` varchar(50) NULL,
  `name` varchar(200) NOT NULL,
  `address` longtext NOT NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(100) NOT NULL,
  `purpose` longtext,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) NULL,
  `byauthoritytitle` varchar(50) NULL,
  `orno` varchar(25) NULL,
  `ordate` datetime NULL,
  `oramount` decimal(16,2) NOT NULL,
  `stampamount` decimal(16,2) NOT NULL,
  `createdbyid` varchar(50) NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) NULL,
  `info` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpayment`
--

DROP TABLE IF EXISTS `checkpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment` (
  `objid` varchar(50) NOT NULL,
  `bankid` varchar(50) NULL,
  `refno` varchar(50) NULL,
  `refdate` date NULL,
  `amount` decimal(16,4) NULL,
  `receiptid` varchar(50) NULL,
  `bank_name` varchar(255) NULL,
  `amtused` decimal(16,4) NULL,
  `receivedfrom` longtext,
  `state` varchar(50) NULL,
  `depositvoucherid` varchar(50) NULL,
  `fundid` varchar(100) NULL,
  `depositslipid` varchar(100) NULL,
  `split` int(11) NOT NULL,
  `external` int(11) NOT NULL DEFAULT '0',
  `collector_objid` varchar(50) NULL,
  `collector_name` varchar(255) NULL,
  `subcollector_objid` varchar(50) NULL,
  `subcollector_name` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankid` (`bankid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_depositslipid` (`depositslipid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  CONSTRAINT `fk_checkpayment_bankid` FOREIGN KEY (`bankid`) REFERENCES `bank` (`objid`),
  CONSTRAINT `fk_checkpayment_depositslipid` FOREIGN KEY (`depositslipid`) REFERENCES `depositslip` (`objid`),
  CONSTRAINT `fk_paymentcheck_depositvoucher` FOREIGN KEY (`depositvoucherid`) REFERENCES `depositvoucher` (`objid`),
  CONSTRAINT `fk_paymentcheck_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpayment_deadchecks`
--

DROP TABLE IF EXISTS `checkpayment_deadchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment_deadchecks` (
  `objid` varchar(50) NOT NULL,
  `bankid` varchar(50) NULL,
  `refno` varchar(50) NULL,
  `refdate` date NULL,
  `amount` decimal(16,4) NULL,
  `collector_objid` varchar(50) NULL,
  `bank_name` varchar(255) NULL,
  `amtused` decimal(16,4) NULL,
  `receivedfrom` varchar(255) NULL,
  `state` varchar(50) NULL,
  `depositvoucherid` varchar(50) NULL,
  `fundid` varchar(100) NULL,
  `depositslipid` varchar(100) NULL,
  `split` int(11) NOT NULL,
  `amtdeposited` decimal(16,4) NULL,
  `external` int(11) NULL,
  `collector_name` varchar(255) NULL,
  `subcollector_objid` varchar(50) NULL,
  `subcollector_name` varchar(255) NULL,
  `collectorid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankid` (`bankid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorid_` (`collectorid`),
  KEY `ix_depositslipid` (`depositslipid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_subcollector_objid` (`subcollector_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citizenship` (
  `objid` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `indexno` varchar(15) NULL,
  `pin` varchar(15) NULL,
  `name` varchar(50) NULL,
  `previd` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `mayor_name` varchar(100) NULL,
  `mayor_title` varchar(50) NULL,
  `mayor_office` varchar(50) NULL,
  `assessor_name` varchar(100) NULL,
  `assessor_title` varchar(50) NULL,
  `assessor_office` varchar(50) NULL,
  `treasurer_name` varchar(100) NULL,
  `treasurer_title` varchar(50) NULL,
  `treasurer_office` varchar(50) NULL,
  `address` varchar(100) NULL,
  `fullname` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_pin` (`pin`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_city_org` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiongroup`
--

DROP TABLE IF EXISTS `collectiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(30) NULL,
  `name` varchar(150) NOT NULL,
  `sharing` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiongroup_account`
--

DROP TABLE IF EXISTS `collectiongroup_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup_account` (
  `collectiongroupid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `valuetype` varchar(50) NULL,
  `defaultvalue` decimal(16,2) NULL,
  `objid` varchar(50) NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `tag` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_account` (`collectiongroupid`,`account_objid`),
  KEY `revenueitemid` (`account_objid`),
  KEY `ix_collectiongroupid` (`collectiongroupid`),
  CONSTRAINT `fk_collectiongroup_account_account_objid` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_collectiongroup_account_collectiongroupid` FOREIGN KEY (`collectiongroupid`) REFERENCES `collectiongroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiongroup_org`
--

DROP TABLE IF EXISTS `collectiongroup_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup_org` (
  `objid` varchar(100) NOT NULL,
  `collectiongroupid` varchar(50) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `org_type` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_org` (`collectiongroupid`,`org_objid`),
  KEY `ix_collectiongroupid` (`collectiongroupid`),
  KEY `ix_org_objid` (`org_objid`),
  CONSTRAINT `fk_collectiongroup_org_parent` FOREIGN KEY (`collectiongroupid`) REFERENCES `collectiongroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiontype`
--

DROP TABLE IF EXISTS `collectiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `name` varchar(50) NULL,
  `title` varchar(50) NULL,
  `formno` varchar(10) NULL,
  `handler` varchar(25) NULL,
  `allowbatch` int(11) DEFAULT '0',
  `barcodekey` varchar(100) NULL,
  `allowonline` int(11) DEFAULT '0',
  `allowoffline` int(11) DEFAULT '0',
  `sortorder` int(11) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(50) NULL,
  `fund_objid` varchar(100) NULL,
  `fund_title` varchar(255) NULL,
  `category` varchar(100) NULL,
  `allowpaymentorder` int(11) DEFAULT '0',
  `allowkiosk` int(11) DEFAULT '0',
  `allowcreditmemo` int(11) DEFAULT '0',
  `system` int(11) DEFAULT '0',
  `queuesection` varchar(100) NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_collectiontype_category` (`category`),
  KEY `ix_state` (`state`),
  KEY `ix_formno` (`formno`),
  KEY `ix_handler` (`handler`),
  KEY `ix_fund_objid` (`fund_objid`),
  CONSTRAINT `fk_collectiontype_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiontype_account`
--

DROP TABLE IF EXISTS `collectiontype_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype_account` (
  `collectiontypeid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(100) NULL,
  `tag` varchar(50) NULL,
  `defaultvalue` decimal(16,2) NULL,
  `valuetype` varchar(20) NULL,
  `sortorder` int(11) NULL,
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiontype_account` (`collectiontypeid`,`account_objid`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  KEY `ix_account_objid` (`account_objid`),
  CONSTRAINT `fk_collectiontype_account_account_objid` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_collectiontype_account_collectiontype` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `fk_collectiontype_account_parentid` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `fk_collectiontype_account_revitem` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiontype_org`
--

DROP TABLE IF EXISTS `collectiontype_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype_org` (
  `objid` varchar(100) NOT NULL,
  `collectiontypeid` varchar(50) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(150) NULL,
  `org_type` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiontype_org` (`collectiontypeid`,`org_objid`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_org_name` (`org_name`),
  CONSTRAINT `fk_collectiontype_org_parent` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectionvoucher`
--

DROP TABLE IF EXISTS `collectionvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionvoucher` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `controldate` date NOT NULL,
  `dtposted` datetime NOT NULL,
  `liquidatingofficer_objid` varchar(50) NULL,
  `liquidatingofficer_name` varchar(100) NULL,
  `liquidatingofficer_title` varchar(50) NULL,
  `liquidatingofficer_signature` longtext,
  `amount` decimal(18,2) NULL,
  `totalcash` decimal(18,2) NULL,
  `totalcheck` decimal(16,4) NULL,
  `cashbreakdown` longtext,
  `totalcr` decimal(16,4) NULL,
  `depositvoucherid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  KEY `ix_state` (`state`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_liquidatingofficer_objid` (`liquidatingofficer_objid`),
  KEY `ix_liquidatingofficer_name` (`liquidatingofficer_name`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  CONSTRAINT `fk_collectionvoucher_depositvoucherid` FOREIGN KEY (`depositvoucherid`) REFERENCES `depositvoucher` (`objid`),
  CONSTRAINT `fk_collectionvoucher_liquidatingofficer` FOREIGN KEY (`liquidatingofficer_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectionvoucher_fund`
--

DROP TABLE IF EXISTS `collectionvoucher_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionvoucher_fund` (
  `objid` varchar(255) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(100) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `cashbreakdown` longtext,
  `depositvoucherid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_fund_objid` (`parentid`,`fund_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  CONSTRAINT `fk_collectionvoucher_fund_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_collectionvoucher_fund_parentid` FOREIGN KEY (`parentid`) REFERENCES `collectionvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidatedland`
--

DROP TABLE IF EXISTS `consolidatedland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidatedland` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `rpid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidatedland_consolidation` (`consolidationid`),
  KEY `FK_consolidatedland_faas` (`landfaasid`),
  CONSTRAINT `FK_consolidatedland_consolidation` FOREIGN KEY (`consolidationid`) REFERENCES `consolidation` (`objid`),
  CONSTRAINT `FK_consolidatedland_faas` FOREIGN KEY (`landfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidation`
--

DROP TABLE IF EXISTS `consolidation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(50) NULL,
  `autonumber` int(11) NULL,
  `effectivityyear` int(11) NULL,
  `effectivityqtr` int(11) NULL,
  `newtdno` varchar(50) NULL,
  `newutdno` varchar(50) NULL,
  `newtitletype` varchar(50) NULL,
  `newtitleno` varchar(50) NULL,
  `newtitledate` varchar(50) NULL,
  `memoranda` longtext,
  `lguid` varchar(50) NULL,
  `lgutype` varchar(50) NULL,
  `newrpid` varchar(50) NULL,
  `newrpuid` varchar(50) NULL,
  `newfaasid` varchar(50) NULL,
  `taxpayer_objid` varchar(50) NULL,
  `taxpayer_name` longtext,
  `taxpayer_address` varchar(200) NULL,
  `owner_name` longtext,
  `owner_address` varchar(200) NULL,
  `administrator_objid` varchar(50) NULL,
  `administrator_name` varchar(500) NULL,
  `administrator_address` varchar(200) NULL,
  `administratorid` varchar(50) NULL,
  `administratorname` varchar(500) NULL,
  `administratoraddress` varchar(200) NULL,
  `signatories` longtext,
  `originlguid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lguid` (`lguid`),
  KEY `FK_consolidation_newfaas` (`newfaasid`),
  KEY `FK_consolidation_newrp` (`newrpid`),
  KEY `FK_consolidation_newrpu` (`newrpuid`),
  CONSTRAINT `FK_consolidation_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_consolidation_newrp` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `FK_consolidation_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidation_task`
--

DROP TABLE IF EXISTS `consolidation_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidation_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `assignee_title` varchar(80) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `actor_title` varchar(80) NULL,
  `message` varchar(255) NULL,
  `signature` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consolidationaffectedrpu`
--

DROP TABLE IF EXISTS `consolidationaffectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consolidationaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `newrpid` varchar(50) NOT NULL,
  `newrpuid` varchar(50) NOT NULL,
  `newfaasid` varchar(50) NULL,
  `newtdno` varchar(50) NULL,
  `newutdno` varchar(50) NULL,
  `newsuffix` int(11) NULL,
  `memoranda` varchar(500) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidationaffectedrpu_consolidation` (`consolidationid`),
  KEY `FK_consolidationaffectedrpu_newfaas` (`newfaasid`),
  KEY `FK_consolidationaffectedrpu_newrpu` (`newrpuid`),
  KEY `FK_consolidationaffectedrpu_prevfaas` (`prevfaasid`),
  KEY `ix_consolidationaffectedrpu_landfaasid` (`landfaasid`),
  KEY `ix_consolidationaffectedrpu_newtdno` (`newtdno`),
  CONSTRAINT `FK_consolidationaffectedrpu_consolidation` FOREIGN KEY (`consolidationid`) REFERENCES `consolidation` (`objid`),
  CONSTRAINT `FK_consolidationaffectedrpu_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_consolidationaffectedrpu_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_consolidationaffectedrpu_prevfaas` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemo`
--

DROP TABLE IF EXISTS `creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(25) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `particulars` varchar(250) NULL,
  `type_objid` varchar(50) NULL,
  `type_title` varchar(150) NULL,
  `bankaccount_objid` varchar(50) NULL,
  `bankaccount_title` varchar(150) NULL,
  `payer_objid` varchar(50) NULL,
  `_payername` varchar(255) NULL,
  `_payeraddress` varchar(255) NULL,
  `controlno` varchar(50) NULL,
  `receiptid` varchar(50) NULL,
  `receiptno` varchar(50) NULL,
  `dtissued` date NULL,
  `issuedby_objid` varchar(50) NULL,
  `issuedby_name` varchar(150) NULL,
  `bankaccount_code` varchar(50) NULL,
  `receiptdate` date NULL,
  `issuereceipt` int(11) NULL,
  `type` varchar(25) NULL,
  `payer_name` varchar(255) NOT NULL,
  `payer_address_objid` varchar(50) NULL,
  `payer_address_text` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_type_objid` (`type_objid`),
  KEY `ix_bankaccount_objid` (`bankaccount_objid`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_payer_name` (`payer_name`),
  KEY `ix_payer_address_objid` (`payer_address_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemoitem`
--

DROP TABLE IF EXISTS `creditmemoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemoitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_item_objid` (`item_objid`),
  CONSTRAINT `fk_creditmemoitem_item_objid` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_creditmemoitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `creditmemo` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemotype`
--

DROP TABLE IF EXISTS `creditmemotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemotype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) NULL,
  `issuereceipt` int(11) NULL,
  `handler` varchar(50) NULL,
  `sortorder` int(11) NULL,
  `fund_objid` varchar(100) NULL,
  `fund_code` varchar(50) NULL,
  `fund_title` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  CONSTRAINT `fk_creditmemotype_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditmemotype_account`
--

DROP TABLE IF EXISTS `creditmemotype_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemotype_account` (
  `typeid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(100) NULL,
  `tag` varchar(50) NULL,
  `sortorder` int(11) NULL,
  PRIMARY KEY (`typeid`,`account_objid`),
  KEY `ix_typeid` (`typeid`),
  KEY `ix_account_objid` (`account_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_fund_transfer`
--

DROP TABLE IF EXISTS `deposit_fund_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_fund_transfer` (
  `objid` varchar(150) NOT NULL,
  `fromdepositvoucherfundid` varchar(150) NOT NULL,
  `todepositvoucherfundid` varchar(150) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_fromfundid` (`fromdepositvoucherfundid`),
  KEY `ix_tofundid` (`todepositvoucherfundid`),
  CONSTRAINT `fk_deposit_fund_transfer_fromdepositvoucherfundid` FOREIGN KEY (`fromdepositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`),
  CONSTRAINT `fk_deposit_fund_transfer_todepositvoucherfundid` FOREIGN KEY (`todepositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depositslip`
--

DROP TABLE IF EXISTS `depositslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositslip` (
  `objid` varchar(100) NOT NULL,
  `depositvoucherfundid` varchar(150) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `depositdate` date NULL,
  `dtcreated` datetime NULL,
  `bankacctid` varchar(50) NULL,
  `totalcash` decimal(16,4) NULL,
  `totalcheck` decimal(16,4) NULL,
  `amount` decimal(16,4) NULL,
  `validation_refno` varchar(50) NULL,
  `validation_refdate` date NULL,
  `cashbreakdown` longtext,
  `state` varchar(10) NULL,
  `deposittype` varchar(50) NULL,
  `checktype` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_depositvoucherid` (`depositvoucherfundid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_depositdate` (`depositdate`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_validation_refno` (`validation_refno`),
  KEY `ix_validation_refdate` (`validation_refdate`),
  CONSTRAINT `fk_depositslip_bankacctid` FOREIGN KEY (`bankacctid`) REFERENCES `bankaccount` (`objid`),
  CONSTRAINT `fk_depositslip_depositvoucherfundid` FOREIGN KEY (`depositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depositvoucher`
--

DROP TABLE IF EXISTS `depositvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositvoucher` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `controldate` date NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `dtposted` datetime NULL,
  `postedby_objid` varchar(50) NULL,
  `postedby_name` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  KEY `ix_state` (`state`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_postedby_name` (`postedby_name`),
  KEY `ix_dtposted` (`dtposted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depositvoucher_fund`
--

DROP TABLE IF EXISTS `depositvoucher_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositvoucher_fund` (
  `objid` varchar(150) NOT NULL,
  `state` varchar(20) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `fundid` varchar(100) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `amountdeposited` decimal(16,4) NOT NULL,
  `totaldr` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `dtposted` datetime NULL,
  `postedby_objid` varchar(50) NULL,
  `postedby_name` varchar(255) NULL,
  `postedby_title` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_fundid` (`parentid`,`fundid`),
  KEY `ix_state` (`state`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_postedby_name` (`postedby_name`),
  CONSTRAINT `fk_depositvoucher_fund_fundid` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_depositvoucher_fund_parentid` FOREIGN KEY (`parentid`) REFERENCES `depositvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `indexno` varchar(15) NULL,
  `pin` varchar(15) NULL,
  `name` varchar(50) NULL,
  `previd` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `oldindexno` varchar(15) NULL,
  `oldpin` varchar(15) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_pin` (`pin`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `draftremittance`
--

DROP TABLE IF EXISTS `draftremittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftremittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `remittancedate` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(255) NOT NULL,
  `collector_title` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `txnmode` varchar(32) NOT NULL,
  `lockid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_remittancedate` (`remittancedate`),
  KEY `ix_collector_objid` (`collector_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `draftremittanceitem`
--

DROP TABLE IF EXISTS `draftremittanceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftremittanceitem` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `batchid` varchar(50) NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `voided` int(11) NOT NULL,
  `cancelled` int(11) NOT NULL,
  `lockid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_batchid` (`batchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eftpayment`
--

DROP TABLE IF EXISTS `eftpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eftpayment` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `receivedfrom` varchar(255) NULL,
  `particulars` varchar(255) NULL,
  `bankacctid` varchar(50) NOT NULL,
  `fundid` varchar(100) NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `receiptid` varchar(50) NULL,
  `receiptno` varchar(50) NULL,
  `payer_objid` varchar(50) NULL,
  `payer_name` varchar(255) NULL,
  `payer_address_objid` varchar(50) NULL,
  `payer_address_text` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_payer_address_objid` (`payer_address_objid`),
  CONSTRAINT `fk_eftpayment_bankacct` FOREIGN KEY (`bankacctid`) REFERENCES `bankaccount` (`objid`),
  CONSTRAINT `fk_eftpayment_bankacctid` FOREIGN KEY (`bankacctid`) REFERENCES `bankaccount` (`objid`),
  CONSTRAINT `fk_eftpayment_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_eftpayment_fundid` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity` (
  `objid` varchar(50) NOT NULL,
  `entityno` varchar(50) NOT NULL,
  `name` longtext NOT NULL,
  `address_text` varchar(255) NOT NULL,
  `mailingaddress` varchar(255) NULL,
  `type` varchar(25) NOT NULL,
  `sys_lastupdate` varchar(25) NULL,
  `sys_lastupdateby` varchar(50) NULL,
  `remarks` varchar(300) NULL,
  `entityname` varchar(900) NOT NULL,
  `address_objid` varchar(50) NULL,
  `mobileno` varchar(25) NULL,
  `phoneno` varchar(25) NULL,
  `email` varchar(50) NULL,
  `state` varchar(10) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_entityno` (`entityno`),
  KEY `ix_entityname` (`entityname`(255)),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_address`
--

DROP TABLE IF EXISTS `entity_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_address` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `type` varchar(50) NULL,
  `addresstype` varchar(50) NULL,
  `barangay_objid` varchar(50) NULL,
  `barangay_name` varchar(100) NULL,
  `city` varchar(50) NULL,
  `province` varchar(50) NULL,
  `municipality` varchar(50) NULL,
  `bldgno` varchar(50) NULL,
  `bldgname` varchar(50) NULL,
  `unitno` varchar(50) NULL,
  `street` varchar(255) NULL,
  `subdivision` varchar(100) NULL,
  `pin` varchar(50) NULL,
  `text` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  CONSTRAINT `fk_entity_address_parentid` FOREIGN KEY (`parentid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_ctc`
--

DROP TABLE IF EXISTS `entity_ctc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_ctc` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `nonresident` int(11) NOT NULL,
  `ctcno` varchar(50) NOT NULL,
  `dtissued` date NOT NULL,
  `placeissued` varchar(255) NOT NULL,
  `lgu_objid` varchar(50) NULL,
  `lgu_name` varchar(255) NULL,
  `barangay_objid` varchar(50) NULL,
  `barangay_name` varchar(255) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(160) NOT NULL,
  `system` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_name` (`barangay_name`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_ctcno` (`ctcno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_lgu_name` (`lgu_name`),
  KEY `ix_lgu_objid` (`lgu_objid`),
  CONSTRAINT `fk_entity_ctc_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_fingerprint`
--

DROP TABLE IF EXISTS `entity_fingerprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_fingerprint` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NULL,
  `dtfiled` datetime NULL,
  `fingertype` varchar(20) NULL,
  `data` longtext,
  `image` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_entityid_fingertype` (`entityid`,`fingertype`),
  KEY `ix_dtfiled` (`dtfiled`),
  CONSTRAINT `fk_entity_fingerprint_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_mapping`
--

DROP TABLE IF EXISTS `entity_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `org_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_reconciled`
--

DROP TABLE IF EXISTS `entity_reconciled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_reconciled` (
  `objid` varchar(50) NOT NULL,
  `info` longtext,
  `masterid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_entity_reconciled_entity` (`masterid`),
  CONSTRAINT `fk_entity_reconciled_masterid` FOREIGN KEY (`masterid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_reconciled_txn`
--

DROP TABLE IF EXISTS `entity_reconciled_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_reconciled_txn` (
  `objid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `tag` char(1) NULL,
  PRIMARY KEY (`objid`,`reftype`,`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_relation`
--

DROP TABLE IF EXISTS `entity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relation` (
  `objid` varchar(50) NOT NULL,
  `entity_objid` varchar(50) NULL,
  `relateto_objid` varchar(50) NULL,
  `relation_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_sender_receiver` (`entity_objid`,`relateto_objid`),
  KEY `ix_entity_objid` (`entity_objid`),
  KEY `ix_relateto_objid` (`relateto_objid`),
  KEY `ix_relation_objid` (`relation_objid`),
  CONSTRAINT `fk_entity_relation_entity_objid` FOREIGN KEY (`entity_objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `fk_entity_relation_relation` FOREIGN KEY (`relation_objid`) REFERENCES `entity_relation_type` (`objid`),
  CONSTRAINT `fk_entity_relation_relation_objid` FOREIGN KEY (`relateto_objid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_relation_type`
--

DROP TABLE IF EXISTS `entity_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relation_type` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(1) NULL,
  `inverse_any` varchar(50) NULL,
  `inverse_male` varchar(50) NULL,
  `inverse_female` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entitycontact`
--

DROP TABLE IF EXISTS `entitycontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitycontact` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `contacttype` varchar(25) NOT NULL,
  `contact` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_entityid` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityid`
--

DROP TABLE IF EXISTS `entityid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityid` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `dtissued` date NULL,
  `dtexpiry` date NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_idtype_idno` (`idtype`,`idno`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_idno` (`idno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  CONSTRAINT `fk_entityid_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityidcard`
--

DROP TABLE IF EXISTS `entityidcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityidcard` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `expiry` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_entityidcard_entityid_idtype_idno` (`entityid`,`idtype`,`idno`),
  KEY `FK_entityidcard_entity` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityindividual`
--

DROP TABLE IF EXISTS `entityindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityindividual` (
  `objid` varchar(50) NOT NULL,
  `lastname` varchar(800) NOT NULL,
  `firstname` varchar(800) NOT NULL,
  `middlename` varchar(100) NULL,
  `birthdate` datetime NULL,
  `birthplace` varchar(255) NULL,
  `citizenship` varchar(50) NULL,
  `gender` varchar(10) NULL,
  `civilstatus` varchar(15) NULL,
  `profession` varchar(50) NULL,
  `tin` varchar(50) NULL,
  `sss` varchar(25) NULL,
  `height` varchar(10) NULL,
  `weight` varchar(10) NULL,
  `acr` varchar(50) NULL,
  `religion` varchar(50) NULL,
  `photo` mediumblob,
  `thumbnail` mediumblob,
  `profileid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_entityindividual_lastname` (`lastname`(255)),
  KEY `ix_lfname` (`lastname`(255),`firstname`(255)),
  KEY `ix_fname` (`firstname`(255)),
  KEY `ix_profileid` (`profileid`),
  KEY `ix_tin` (`tin`),
  KEY `ix_entityindividual_firstname` (`firstname`(255)),
  KEY `ix_lastname` (`lastname`(255)),
  CONSTRAINT `fk_entityindividual_objid` FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `fk_entityindividual_profileid` FOREIGN KEY (`profileid`) REFERENCES `entityprofile` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityjuridical`
--

DROP TABLE IF EXISTS `entityjuridical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityjuridical` (
  `objid` varchar(50) NOT NULL,
  `tin` varchar(50) NULL,
  `dtregistered` datetime NULL,
  `orgtype` varchar(25) NULL,
  `nature` varchar(50) NULL,
  `placeregistered` varchar(100) NULL,
  `administrator_name` varchar(100) NULL,
  `administrator_address` varchar(255) NULL,
  `administrator_position` varchar(50) NULL,
  `administrator_objid` varchar(50) NULL,
  `administrator_address_objid` varchar(50) NULL,
  `administrator_address_text` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_tin` (`tin`),
  KEY `ix_dtregistered` (`dtregistered`),
  KEY `ix_administrator_objid` (`administrator_objid`),
  KEY `ix_administrator_name` (`administrator_name`),
  KEY `ix_administrator_address_objid` (`administrator_address_objid`),
  CONSTRAINT `fk_entityjuridical_objid` FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entitymember`
--

DROP TABLE IF EXISTS `entitymember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymember` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `itemno` int(11) NOT NULL,
  `prefix` varchar(50) NULL,
  `member_objid` varchar(50) NOT NULL,
  `member_name` varchar(800) NOT NULL,
  `member_address_text` varchar(255) NOT NULL,
  `suffix` varchar(50) NULL,
  `remarks` varchar(255) NULL,
  `member_address` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_entitymember_entity` (`entityid`),
  KEY `ix_taxpayer_objid` (`member_objid`),
  KEY `ix_member_name` (`member_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entitymultiple`
--

DROP TABLE IF EXISTS `entitymultiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymultiple` (
  `objid` varchar(50) NOT NULL,
  `fullname` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityprofile`
--

DROP TABLE IF EXISTS `entityprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityprofile` (
  `objid` varchar(50) NOT NULL,
  `idno` varchar(50) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `middlename` varchar(60) NULL,
  `birthdate` date NULL,
  `gender` varchar(10) NULL,
  `address` longtext,
  `defaultentityid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_idno` (`idno`),
  KEY `ix_firstname` (`firstname`),
  KEY `ix_lastname` (`lastname`),
  KEY `ix_lfname` (`lastname`,`firstname`),
  KEY `ix_defaultentityid` (`defaultentityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examiner_finding`
--

DROP TABLE IF EXISTS `examiner_finding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examiner_finding` (
  `objid` varchar(50) NOT NULL,
  `findings` longtext,
  `parent_objid` varchar(50) NULL,
  `dtinspected` date NULL,
  `recommendations` varchar(500) NULL,
  `inspectors` varchar(500) NULL,
  `notedby` varchar(100) NULL,
  `notedbytitle` varchar(50) NULL,
  `photos` varchar(255) NULL,
  `inspectedby_objid` varchar(50) NULL,
  `inspectedby_name` varchar(100) NULL,
  `inspectedby_title` varchar(50) NULL,
  `doctype` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_dtinspected` (`dtinspected`),
  KEY `ix_examiner_finding_inspectedby_objid` (`inspectedby_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exemptiontype`
--

DROP TABLE IF EXISTS `exemptiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemptiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_exemptiontype_code` (`code`),
  UNIQUE KEY `ux_exemptiontype_name` (`name`),
  KEY `ix_exemptiontype_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas`
--

DROP TABLE IF EXISTS `faas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rpuid` varchar(50) NULL,
  `datacapture` int(11) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `utdno` varchar(25) NOT NULL,
  `tdno` varchar(25) NULL,
  `txntype_objid` varchar(10) NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `titletype` varchar(10) NULL,
  `titleno` varchar(50) NULL,
  `titledate` datetime NULL,
  `taxpayer_objid` varchar(50) NULL,
  `owner_name` varchar(1200) NULL,
  `owner_address` varchar(150) NULL,
  `administrator_objid` varchar(50) NULL,
  `administrator_name` varchar(800) NULL,
  `administrator_address` varchar(150) NULL,
  `beneficiary_objid` varchar(50) NULL,
  `beneficiary_name` varchar(150) NULL,
  `beneficiary_address` varchar(150) NULL,
  `memoranda` longtext,
  `cancelnote` varchar(250) NULL,
  `restrictionid` varchar(50) NULL,
  `backtaxyrs` int(11) NOT NULL,
  `prevtdno` varchar(800) NULL,
  `prevpin` varchar(500) NULL,
  `prevowner` longtext,
  `prevav` varchar(200) NULL,
  `prevmv` varchar(200) NULL,
  `cancelreason` varchar(5) NULL,
  `canceldate` datetime NULL,
  `cancelledbytdnos` longtext,
  `lguid` varchar(50) NOT NULL,
  `txntimestamp` varchar(20) NULL,
  `cancelledtimestamp` varchar(25) NULL,
  `name` varchar(100) NULL,
  `dtapproved` date NULL,
  `realpropertyid` varchar(50) NULL,
  `lgutype` varchar(25) NULL,
  `signatories` longtext,
  `ryordinanceno` varchar(25) NULL,
  `ryordinancedate` date NULL,
  `prevareaha` varchar(200) NULL,
  `prevareasqm` varchar(200) NULL,
  `preveffectivity` varchar(15) NULL,
  `year` int(11) NULL,
  `qtr` int(11) NULL,
  `month` int(11) NULL,
  `day` int(11) NULL,
  `cancelledyear` int(11) NULL,
  `cancelledqtr` int(11) NULL,
  `cancelledmonth` int(11) NULL,
  `cancelledday` int(11) NULL,
  `fullpin` varchar(35) NULL,
  `prevadministrator` varchar(500) NULL,
  `originlguid` varchar(50) NULL,
  `parentfaasid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faas_utdno` (`utdno`),
  KEY `FK_faas_entity` (`taxpayer_objid`),
  KEY `FK_faas_entity_admin` (`administrator_objid`),
  KEY `FK_faas_entity_beneficiary` (`beneficiary_objid`),
  KEY `FK_faas_rpu` (`rpuid`),
  KEY `ix_canceldate` (`canceldate`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_faas_administratorname` (`administrator_name`(255)),
  KEY `ix_faas_appraisedby` (`objid`),
  KEY `ix_faas_beneficiary` (`beneficiary_name`),
  KEY `ix_faas_cancelledtimestamp` (`cancelledtimestamp`),
  KEY `ix_faas_cancelledyear` (`cancelledyear`),
  KEY `ix_faas_cancelledyear_qtr` (`cancelledyear`,`cancelledqtr`),
  KEY `ix_faas_cancelledyear_qtr_month` (`cancelledyear`,`cancelledqtr`,`cancelledmonth`),
  KEY `ix_faas_cancelledyear_qtr_month_day` (`cancelledyear`,`cancelledqtr`,`cancelledmonth`,`cancelledday`),
  KEY `ix_faas_fullpin` (`fullpin`),
  KEY `ix_faas_name` (`name`),
  KEY `ix_faas_prevpin` (`prevpin`(255)),
  KEY `ix_faas_prevtdno` (`prevtdno`(255)),
  KEY `ix_faas_realproperty` (`realpropertyid`),
  KEY `ix_faas_restrictionid` (`restrictionid`),
  KEY `ix_faas_state` (`state`),
  KEY `ix_faas_tdno` (`tdno`),
  KEY `ix_faas_titleno` (`titleno`),
  KEY `ix_faas_year` (`year`),
  KEY `ix_faas_year_qtr` (`year`,`qtr`),
  KEY `ix_faas_year_qtr_month` (`year`,`qtr`,`month`),
  KEY `ix_faas_year_qtr_month_day` (`year`,`qtr`,`month`,`day`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_faas_owner_name` (`owner_name`(255)),
  CONSTRAINT `FK_faas_rpu` FOREIGN KEY (`rpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_affectedrpu`
--

DROP TABLE IF EXISTS `faas_affectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_affectedrpu` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `newfaasid` varchar(50) NULL,
  `newsuffix` int(11) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faasaffectedrpu_faasprevfaas` (`faasid`,`prevfaasid`),
  KEY `FK_faasaffectedrpu_faas` (`faasid`),
  KEY `FK_faasaffectedrpu_newfaas` (`newfaasid`),
  KEY `FK_faasaffectedrpu_prevfaas` (`prevfaasid`),
  CONSTRAINT `FK_faasaffectedrpu_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_faasaffectedrpu_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_faasaffectedrpu_prevfaas` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_list`
--

DROP TABLE IF EXISTS `faas_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_list` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `realpropertyid` varchar(50) NOT NULL,
  `datacapture` int(11) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(50) NOT NULL,
  `tdno` varchar(25) NULL,
  `utdno` varchar(25) NOT NULL,
  `prevtdno` varchar(800) NULL,
  `displaypin` varchar(35) NOT NULL,
  `pin` varchar(35) NOT NULL,
  `taxpayer_objid` varchar(50) NULL,
  `owner_name` varchar(5000) NULL,
  `owner_address` varchar(150) NULL,
  `administrator_name` varchar(150) NULL,
  `administrator_address` varchar(150) NULL,
  `rputype` varchar(10) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `barangay` varchar(75) NOT NULL,
  `classification_objid` varchar(50) NULL,
  `classcode` varchar(20) NULL,
  `cadastrallotno` varchar(900) NULL,
  `blockno` varchar(100) NULL,
  `surveyno` varchar(255) NULL,
  `titleno` varchar(50) NULL,
  `totalareaha` decimal(18,6) NULL,
  `totalareasqm` decimal(18,6) NULL,
  `totalmv` decimal(16,2) NULL,
  `totalav` decimal(16,2) NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `cancelreason` varchar(15) NULL,
  `cancelledbytdnos` longtext,
  `lguid` varchar(50) NOT NULL,
  `originlguid` varchar(50) NOT NULL,
  `yearissued` int(11) NULL,
  `taskid` varchar(50) NULL,
  `taskstate` varchar(50) NULL,
  `assignee_objid` varchar(50) NULL,
  `trackingno` varchar(20) NULL,
  `publicland` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_faaslist_administrator_name` (`administrator_name`),
  KEY `ix_faaslist_assigneeid` (`assignee_objid`),
  KEY `ix_faaslist_barangay` (`barangay`),
  KEY `ix_faaslist_barangayid` (`barangayid`),
  KEY `ix_faaslist_blockno` (`blockno`),
  KEY `ix_faaslist_classcode` (`classcode`),
  KEY `ix_faaslist_classification_objid` (`classification_objid`),
  KEY `ix_faaslist_lguid` (`lguid`),
  KEY `ix_faaslist_originlguid` (`originlguid`),
  KEY `ix_faaslist_pin` (`pin`),
  KEY `ix_faaslist_publicland` (`publicland`),
  KEY `ix_faaslist_realpropertyid` (`realpropertyid`),
  KEY `ix_faaslist_rpuid` (`rpuid`),
  KEY `ix_faaslist_rputype` (`rputype`),
  KEY `ix_faaslist_ry` (`ry`),
  KEY `ix_faaslist_state` (`state`),
  KEY `ix_faaslist_surveyno` (`surveyno`),
  KEY `ix_faaslist_taskstate` (`taskstate`),
  KEY `ix_faaslist_taxpayer_objid` (`taxpayer_objid`),
  KEY `ix_faaslist_tdno` (`tdno`),
  KEY `ix_faaslist_titleno` (`titleno`),
  KEY `ix_faaslist_trackingno` (`trackingno`),
  KEY `ix_faaslist_utdno` (`utdno`),
  KEY `ix_faaslist_prevtdno` (`prevtdno`(255)),
  KEY `ix_faaslist_cadastrallotno` (`cadastrallotno`(255)),
  KEY `ix_faaslist_owner_name` (`owner_name`(255)),
  KEY `ix_faaslist_txntype_objid` (`txntype_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_previous`
--

DROP TABLE IF EXISTS `faas_previous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_previous` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NULL,
  `prevrpuid` varchar(50) NULL,
  `prevtdno` longtext,
  `prevpin` longtext,
  `prevowner` longtext,
  `prevadministrator` longtext,
  `prevav` varchar(500) NULL,
  `prevmv` varchar(500) NULL,
  `prevareasqm` varchar(500) NULL,
  `prevareaha` varchar(500) NULL,
  `preveffectivity` varchar(15) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_faas_previous_faas` (`faasid`),
  KEY `ix_faas_previous_pin` (`prevpin`(255)),
  KEY `ix_faas_previous_tdno` (`prevtdno`(255)),
  CONSTRAINT `FK_faas_previous_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_restriction`
--

DROP TABLE IF EXISTS `faas_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_restriction` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `ledger_objid` varchar(50) NULL,
  `state` varchar(25) NOT NULL,
  `restrictiontype_objid` varchar(50) NOT NULL,
  `txndate` date NULL,
  `remarks` varchar(255) NULL,
  `receipt_objid` varchar(50) NULL,
  `receipt_receiptno` varchar(15) NULL,
  `receipt_receiptdate` datetime NULL,
  `receipt_amount` decimal(16,2) NULL,
  `receipt_lastyearpaid` int(11) NULL,
  `receipt_lastqtrpaid` int(11) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(150) NULL,
  `dtcreated` datetime NULL,
  `rpumaster_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_ledger_objid` (`ledger_objid`),
  KEY `ix_parent_objid` (`parent_objid`),
  KEY `ix_receiptno` (`receipt_receiptno`),
  KEY `ix_restrictiontype_objid` (`restrictiontype_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `FK_faas_restriction_faas` FOREIGN KEY (`parent_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_restriction_type`
--

DROP TABLE IF EXISTS `faas_restriction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_restriction_type` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `idx` int(11) NOT NULL,
  `isother` int(11) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_signatory`
--

DROP TABLE IF EXISTS `faas_signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_signatory` (
  `objid` varchar(50) NOT NULL,
  `taxmapper_objid` varchar(50) NULL,
  `taxmapper_name` varchar(100) NULL,
  `taxmapper_title` varchar(50) NULL,
  `taxmapper_dtsigned` datetime NULL,
  `taxmapper_taskid` varchar(50) NULL,
  `taxmapperchief_objid` varchar(50) NULL,
  `taxmapperchief_name` varchar(100) NULL,
  `taxmapperchief_title` varchar(50) NULL,
  `taxmapperchief_dtsigned` datetime NULL,
  `taxmapperchief_taskid` varchar(50) NULL,
  `appraiser_objid` varchar(50) NULL,
  `appraiser_name` varchar(100) NULL,
  `appraiser_title` varchar(50) NULL,
  `appraiser_dtsigned` datetime NULL,
  `appraiser_taskid` varchar(50) NULL,
  `appraiserchief_objid` varchar(50) NULL,
  `appraiserchief_name` varchar(100) NULL,
  `appraiserchief_title` varchar(50) NULL,
  `appraiserchief_dtsigned` datetime NULL,
  `appraiserchief_taskid` varchar(50) NULL,
  `recommender_objid` varchar(50) NULL,
  `recommender_name` varchar(100) NULL,
  `recommender_title` varchar(50) NULL,
  `recommender_dtsigned` datetime NULL,
  `recommender_taskid` varchar(50) NULL,
  `provtaxmapper_objid` varchar(50) NULL,
  `provtaxmapper_name` varchar(100) NULL,
  `provtaxmapper_title` varchar(50) NULL,
  `provtaxmapper_dtsigned` datetime NULL,
  `provtaxmapper_taskid` varchar(50) NULL,
  `provtaxmapperchief_objid` varchar(50) NULL,
  `provtaxmapperchief_name` varchar(100) NULL,
  `provtaxmapperchief_title` varchar(50) NULL,
  `provtaxmapperchief_dtsigned` datetime NULL,
  `provtaxmapperchief_taskid` varchar(50) NULL,
  `provappraiser_objid` varchar(50) NULL,
  `provappraiser_name` varchar(100) NULL,
  `provappraiser_title` varchar(50) NULL,
  `provappraiser_dtsigned` datetime NULL,
  `provappraiser_taskid` varchar(50) NULL,
  `provappraiserchief_objid` varchar(50) NULL,
  `provappraiserchief_name` varchar(100) NULL,
  `provappraiserchief_title` varchar(50) NULL,
  `provappraiserchief_dtsigned` datetime NULL,
  `provappraiserchief_taskid` varchar(50) NULL,
  `approver_objid` varchar(50) NULL,
  `approver_name` varchar(100) NULL,
  `approver_title` varchar(50) NULL,
  `approver_dtsigned` datetime NULL,
  `approver_taskid` varchar(50) NULL,
  `provapprover_objid` varchar(50) NULL,
  `provapprover_name` varchar(100) NULL,
  `provapprover_title` varchar(75) NULL,
  `provapprover_dtsigned` datetime NULL,
  `provapprover_taskid` varchar(50) NULL,
  `provrecommender_objid` varchar(50) NULL,
  `provrecommender_name` varchar(100) NULL,
  `provrecommender_title` varchar(50) NULL,
  `provrecommender_dtsigned` datetime NULL,
  `provrecommender_taskid` varchar(50) NULL,
  `reviewer_objid` varchar(50) NULL,
  `reviewer_name` varchar(100) NULL,
  `reviewer_title` varchar(75) NULL,
  `reviewer_dtsigned` datetime NULL,
  `reviewer_taskid` varchar(50) NULL,
  `assessor_name` varchar(100) NULL,
  `assessor_title` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_faas_faas_signatory` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_sketch`
--

DROP TABLE IF EXISTS `faas_sketch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_sketch` (
  `objid` varchar(50) NOT NULL,
  `drawing` longtext NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_faas_sketch_faas` (`objid`),
  CONSTRAINT `FK_faas_sketch_faas` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_stewardship`
--

DROP TABLE IF EXISTS `faas_stewardship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_stewardship` (
  `objid` varchar(50) NOT NULL,
  `rpumasterid` varchar(50) NOT NULL,
  `stewardrpumasterid` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `stewardshipno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faas_stewardship` (`rpumasterid`,`stewardrpumasterid`,`ry`,`stewardshipno`),
  KEY `ix_faas_stewardship_rpumasterid` (`rpumasterid`),
  KEY `ix_faas_stewardship_stewardrpumasterid` (`stewardrpumasterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_task`
--

DROP TABLE IF EXISTS `faas_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `assignee_title` varchar(80) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `actor_title` varchar(80) NULL,
  `message` varchar(255) NULL,
  `signature` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_txntype`
--

DROP TABLE IF EXISTS `faas_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_txntype` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `newledger` int(11) NOT NULL,
  `newrpu` int(11) NOT NULL,
  `newrealproperty` int(11) NOT NULL,
  `displaycode` varchar(10) NULL,
  `allowEditOwner` int(11) NULL,
  `allowEditPin` int(11) NULL,
  `allowEditPinInfo` int(11) NULL,
  `allowEditAppraisal` int(11) NULL,
  `opener` varchar(50) NULL,
  `checkbalance` int(11) NULL,
  `reconcileledger` int(11) NULL,
  `allowannotated` int(11) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_txntype_attribute`
--

DROP TABLE IF EXISTS `faas_txntype_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_txntype_attribute` (
  `txntype_objid` varchar(50) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`txntype_objid`,`attribute`),
  KEY `FK_faas_txntype_attribute_type` (`attribute`),
  CONSTRAINT `FK_faas_txntype_attribute` FOREIGN KEY (`txntype_objid`) REFERENCES `faas_txntype` (`objid`),
  CONSTRAINT `FK_faas_txntype_attribute_type` FOREIGN KEY (`attribute`) REFERENCES `faas_txntype_attribute_type` (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faas_txntype_attribute_type`
--

DROP TABLE IF EXISTS `faas_txntype_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faas_txntype_attribute_type` (
  `attribute` varchar(50) NOT NULL,
  PRIMARY KEY (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasannotation`
--

DROP TABLE IF EXISTS `faasannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasannotation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `annotationtype_objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `txnno` varchar(25) NULL,
  `txndate` datetime NULL,
  `fileno` varchar(25) NOT NULL,
  `orno` varchar(10) NULL,
  `ordate` date NULL,
  `oramount` decimal(16,2) NULL,
  `memoranda` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_faasannotation_faas` (`faasid`),
  KEY `FK_faasannotation_faasannotationtype` (`annotationtype_objid`),
  KEY `ix_faasannotation_fileno` (`fileno`),
  KEY `ix_faasannotation_orno` (`orno`),
  KEY `ix_faasannotation_state` (`state`),
  KEY `ix_faasannotation_txnno` (`txnno`),
  CONSTRAINT `FK_faasannotation_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_faasannotation_faasannotationtype` FOREIGN KEY (`annotationtype_objid`) REFERENCES `faasannotationtype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasannotationtype`
--

DROP TABLE IF EXISTS `faasannotationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasannotationtype` (
  `objid` varchar(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `annotationtype` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasbacktax`
--

DROP TABLE IF EXISTS `faasbacktax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasbacktax` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `tdno` varchar(25) NULL,
  `bmv` decimal(10,0) NOT NULL,
  `mv` decimal(10,0) NOT NULL,
  `av` decimal(10,0) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `taxable` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_faasbacktax` (`faasid`),
  CONSTRAINT `FK_faasbacktax` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faasupdate`
--

DROP TABLE IF EXISTS `faasupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faasupdate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `prevtitletype` varchar(25) NULL,
  `prevtitleno` varchar(25) NULL,
  `prevtitledate` datetime NULL,
  `prevtaxpayerid` varchar(50) NOT NULL,
  `prevtaxpayername` varchar(800) NOT NULL,
  `prevtaxpayeraddress` varchar(150) NOT NULL,
  `prevownername` varchar(800) NOT NULL,
  `prevowneraddress` varchar(150) NOT NULL,
  `prevadministratorid` varchar(50) NULL,
  `prevadministratorname` varchar(150) NULL,
  `prevadministratoraddress` varchar(100) NULL,
  `prevrestrictionid` varchar(50) NULL,
  `prevmemoranda` varchar(500) NOT NULL,
  `prevsurveyno` varchar(100) NULL,
  `prevcadastrallotno` varchar(100) NOT NULL,
  `prevblockno` varchar(50) NULL,
  `prevpurok` varchar(50) NULL,
  `prevstreet` varchar(100) NULL,
  `prevnorth` varchar(150) NOT NULL,
  `preveast` varchar(150) NOT NULL,
  `prevsouth` varchar(150) NOT NULL,
  `prevwest` varchar(150) NOT NULL,
  `faas_titletype` varchar(25) NULL,
  `faas_titleno` varchar(25) NULL,
  `faas_titledate` datetime NULL,
  `faas_restrictionid` varchar(50) NULL,
  `faas_memoranda` varchar(500) NOT NULL,
  `rp_surveyno` varchar(100) NULL,
  `rp_cadastrallotno` varchar(100) NOT NULL,
  `rp_blockno` varchar(50) NULL,
  `rp_street` varchar(100) NULL,
  `rp_north` varchar(150) NOT NULL,
  `rp_east` varchar(150) NOT NULL,
  `rp_south` varchar(150) NOT NULL,
  `rp_west` varchar(150) NOT NULL,
  `faas_taxpayer_objid` varchar(50) NOT NULL,
  `faas_taxpayer_name` varchar(800) NOT NULL,
  `faas_taxpayer_address` varchar(150) NOT NULL,
  `faas_owner_address` varchar(800) NOT NULL,
  `faas_owner_name` varchar(800) NOT NULL,
  `faas_administrator_name` varchar(200) NULL,
  `faas_administrator_objid` varchar(50) NULL,
  `faas_administrator_address` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_faasupdate_txnno` (`txnno`),
  KEY `FK_faasupdate_faas` (`faasid`),
  CONSTRAINT `FK_faasupdate_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(50) NULL,
  `state` varchar(10) NULL,
  `code` varchar(50) NULL,
  `title` varchar(255) NULL,
  `type` varchar(20) NULL,
  `special` int(11) NULL,
  `system` int(11) NULL,
  `groupid` varchar(50) NULL,
  `depositoryfundid` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_depositoryfundid` (`depositoryfundid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_code` (`code`),
  KEY `ix_title` (`title`),
  CONSTRAINT `fk_fund_groupid` FOREIGN KEY (`groupid`) REFERENCES `fundgroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fundgroup`
--

DROP TABLE IF EXISTS `fundgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fundgroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `indexno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `government_property`
--

DROP TABLE IF EXISTS `government_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `government_property` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) NULL,
  `barangay_objid` varchar(50) NULL,
  `barangay_name` varchar(255) NULL,
  `pin` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_name` (`barangay_name`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NULL,
  `month` int(11) NULL,
  `day` int(11) NULL,
  `week` int(11) NULL,
  `dow` int(11) NULL,
  `name` varchar(255) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `income_ledger`
--

DROP TABLE IF EXISTS `income_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_itemacctid` (`itemacctid`),
  CONSTRAINT `fk_income_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_income_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `income_summary`
--

DROP TABLE IF EXISTS `income_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_summary` (
  `refid` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `amount` decimal(16,4) NULL,
  `refno` varchar(50) NULL,
  `reftype` varchar(50) NULL,
  `orgid` varchar(50) NOT NULL DEFAULT '',
  `collectorid` varchar(50) NULL,
  `refyear` int(11) NULL,
  `refmonth` int(11) NULL,
  `refqtr` int(11) NULL,
  `remittanceid` varchar(50) NOT NULL DEFAULT '',
  `remittancedate` date NOT NULL DEFAULT '0000-00-00',
  `remittanceyear` int(11) NULL,
  `remittancemonth` int(11) NULL,
  `remittanceqtr` int(11) NULL,
  `liquidationid` varchar(50) NOT NULL DEFAULT '',
  `liquidationdate` date NULL,
  `liquidationyear` int(11) NULL,
  `liquidationmonth` int(11) NULL,
  `liquidationqtr` int(11) NULL,
  PRIMARY KEY (`refid`,`refdate`,`fundid`,`acctid`,`orgid`,`remittanceid`,`remittancedate`,`liquidationid`),
  KEY `ix_income_summary_refid` (`refid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_collectorid` (`collectorid`),
  KEY `ix_refyear` (`refyear`),
  KEY `ix_refmonth` (`refmonth`),
  KEY `ix_refqtr` (`refqtr`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_remittancedate` (`remittancedate`),
  KEY `ix_remittanceyear` (`remittanceyear`),
  KEY `ix_remittancemonth` (`remittancemonth`),
  KEY `ix_remittanceqtr` (`remittanceqtr`),
  KEY `ix_liquidationid` (`liquidationid`),
  KEY `ix_liquidationdate` (`liquidationdate`),
  KEY `ix_liquidationyear` (`liquidationyear`),
  KEY `ix_liquidationmonth` (`liquidationmonth`),
  KEY `ix_liquidationqtr` (`liquidationqtr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interfund_transfer_ledger`
--

DROP TABLE IF EXISTS `interfund_transfer_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfund_transfer_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NULL,
  `itemacctid` varchar(50) NULL,
  `dr` decimal(16,4) NULL,
  `cr` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_itemacctid` (`itemacctid`),
  CONSTRAINT `fk_interfund_transfer_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_interfund_transfer_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemaccount`
--

DROP TABLE IF EXISTS `itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `code` varchar(50) NULL,
  `title` varchar(255) NULL,
  `description` varchar(255) NULL,
  `type` varchar(25) NULL,
  `fund_objid` varchar(100) NULL,
  `fund_code` varchar(50) NULL,
  `fund_title` varchar(50) NULL,
  `defaultvalue` decimal(16,2) NULL,
  `valuetype` varchar(10) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `generic` int(11) DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `hidefromlookup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_type` (`type`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_state` (`state`),
  KEY `ix_generic` (`generic`),
  KEY `ix_code` (`code`),
  KEY `ix_title` (`title`),
  CONSTRAINT `fk_itemaccount_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_itemaccount_org_objid` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemaccount_tag`
--

DROP TABLE IF EXISTS `itemaccount_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount_tag` (
  `acctid` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_acctid_tag` (`acctid`,`tag`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_tag` (`tag`),
  CONSTRAINT `itemaccount_tag_itemaccount` FOREIGN KEY (`acctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jev`
--

DROP TABLE IF EXISTS `jev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jev` (
  `objid` varchar(150) NOT NULL,
  `jevno` varchar(50) NULL,
  `jevdate` date NULL,
  `fundid` varchar(50) NULL,
  `dtposted` datetime NULL,
  `txntype` varchar(50) NULL,
  `refid` varchar(50) NULL,
  `refno` varchar(50) NULL,
  `reftype` varchar(50) NULL,
  `amount` decimal(16,4) NULL,
  `state` varchar(32) NULL,
  `postedby_objid` varchar(50) NULL,
  `postedby_name` varchar(255) NULL,
  `verifiedby_objid` varchar(50) NULL,
  `verifiedby_name` varchar(255) NULL,
  `dtverified` datetime NULL,
  `batchid` varchar(50) NULL,
  `refdate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchid` (`batchid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_dtverified` (`dtverified`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_jevdate` (`jevdate`),
  KEY `ix_jevno` (`jevno`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_verifiedby_objid` (`verifiedby_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jevitem`
--

DROP TABLE IF EXISTS `jevitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jevitem` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NULL,
  `accttype` varchar(50) NULL,
  `acctid` varchar(50) NULL,
  `acctcode` varchar(32) NULL,
  `acctname` varchar(255) NULL,
  `dr` decimal(16,4) NULL,
  `cr` decimal(16,4) NULL,
  `particulars` varchar(255) NULL,
  `itemrefid` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_ledgertype` (`accttype`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_acctcode` (`acctcode`),
  KEY `ix_acctname` (`acctname`),
  KEY `ix_itemrefid` (`itemrefid`),
  CONSTRAINT `fk_jevitem_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustment`
--

DROP TABLE IF EXISTS `landadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustment` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NULL,
  `landdetailid` varchar(50) NULL,
  `adjustmenttype_objid` varchar(50) NOT NULL,
  `expr` varchar(1000) NULL,
  `adjustment` decimal(16,2) DEFAULT '0.00',
  `type` varchar(2) NOT NULL,
  `basemarketvalue` decimal(16,2) NULL,
  `marketvalue` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landadjustment_landadjustmenttype` (`adjustmenttype_objid`),
  KEY `FK_landadjustment_landdetail` (`landdetailid`),
  KEY `FK_landadjustment_landrpu` (`landrpuid`),
  CONSTRAINT `FK_landadjustment_landadjustmenttype` FOREIGN KEY (`adjustmenttype_objid`) REFERENCES `landadjustmenttype` (`objid`),
  CONSTRAINT `FK_landadjustment_landdetail` FOREIGN KEY (`landdetailid`) REFERENCES `landdetail` (`objid`),
  CONSTRAINT `FK_landadjustment_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustmentparameter`
--

DROP TABLE IF EXISTS `landadjustmentparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustmentparameter` (
  `objid` varchar(50) NOT NULL,
  `landadjustmentid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `parameter_objid` varchar(50) NULL,
  `value` decimal(10,0) NOT NULL,
  `param_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landadjustmentparameter_landadjustment` (`landadjustmentid`),
  KEY `FK_landadjustmentparameter_landrpu` (`landrpuid`),
  KEY `FK_landadjustmentparameter_rptparameter` (`parameter_objid`),
  CONSTRAINT `FK_landadjustmentparameter_landadjustment` FOREIGN KEY (`landadjustmentid`) REFERENCES `landadjustment` (`objid`),
  CONSTRAINT `FK_landadjustmentparameter_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_landadjustmentparameter_rptparameter` FOREIGN KEY (`parameter_objid`) REFERENCES `rptparameter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustmenttype`
--

DROP TABLE IF EXISTS `landadjustmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustmenttype` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expr` longtext NOT NULL,
  `appliedto` varchar(150) NULL,
  `previd` varchar(50) NULL,
  `idx` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landadjustment_landrysetting` (`landrysettingid`),
  KEY `ix_landadjustmenttype` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_landadjustment_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landadjustmenttype_classification`
--

DROP TABLE IF EXISTS `landadjustmenttype_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landadjustmenttype_classification` (
  `landadjustmenttypeid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  PRIMARY KEY (`landadjustmenttypeid`,`classification_objid`),
  KEY `FK_landadjustment_classification_landrysetting` (`landrysettingid`),
  KEY `FK_landadjustmenttype_classification_classification` (`classification_objid`),
  CONSTRAINT `FK_landadjustmenttype_classification_classification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_landadjustmenttype_landadjustment` FOREIGN KEY (`landadjustmenttypeid`) REFERENCES `landadjustmenttype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landassesslevel`
--

DROP TABLE IF EXISTS `landassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landassesslevel` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_landassesslevel_code` (`landrysettingid`,`code`),
  UNIQUE KEY `ux_landassesslevel_name` (`landrysettingid`,`name`),
  KEY `FK_landassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_landassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_landassesslevel_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_landassesslevl_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landassesslevelrange`
--

DROP TABLE IF EXISTS `landassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `landassesslevelid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landassesslevelrange_landassesslevel` (`landassesslevelid`),
  KEY `ix_landassesslevelrange_rootid` (`landrysettingid`),
  CONSTRAINT `FK_landassesslevelrange_landassesslevel` FOREIGN KEY (`landassesslevelid`) REFERENCES `landassesslevel` (`objid`),
  CONSTRAINT `FK_landassesslevel_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landdetail`
--

DROP TABLE IF EXISTS `landdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landdetail` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `subclass_objid` varchar(50) NULL,
  `specificclass_objid` varchar(50) NULL,
  `actualuse_objid` varchar(50) NULL,
  `stripping_objid` varchar(50) NULL,
  `striprate` decimal(10,0) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `addlinfo` varchar(250) NULL,
  `area` decimal(18,6) DEFAULT '0.000000',
  `areasqm` decimal(18,6) DEFAULT '0.000000',
  `areaha` decimal(18,6) DEFAULT '0.000000',
  `basevalue` decimal(18,2) DEFAULT '0.00',
  `unitvalue` decimal(18,2) DEFAULT '0.00',
  `taxable` int(11) NOT NULL,
  `basemarketvalue` decimal(18,2) DEFAULT '0.00',
  `adjustment` decimal(18,2) DEFAULT '0.00',
  `landvalueadjustment` decimal(18,2) DEFAULT '0.00',
  `actualuseadjustment` decimal(18,2) DEFAULT '0.00',
  `marketvalue` decimal(18,2) DEFAULT '0.00',
  `assesslevel` decimal(18,2) DEFAULT '0.00',
  `assessedvalue` decimal(18,2) DEFAULT '0.00',
  `landspecificclass_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_landdetail_actualuse` (`actualuse_objid`),
  KEY `FK_landdetail_landrpu` (`landrpuid`),
  KEY `FK_landdetail_lcuvspecificclass` (`specificclass_objid`),
  KEY `FK_landdetail_lcuvstripping` (`stripping_objid`),
  KEY `FK_landdetail_lcuvsubclass` (`subclass_objid`),
  CONSTRAINT `FK_landdetail_actualuse` FOREIGN KEY (`actualuse_objid`) REFERENCES `landassesslevel` (`objid`),
  CONSTRAINT `FK_landdetail_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_landdetail_lcuvspecificclass` FOREIGN KEY (`specificclass_objid`) REFERENCES `lcuvspecificclass` (`objid`),
  CONSTRAINT `FK_landdetail_lcuvsubclass` FOREIGN KEY (`subclass_objid`) REFERENCES `lcuvsubclass` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landrpu`
--

DROP TABLE IF EXISTS `landrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landrpu` (
  `objid` varchar(50) NOT NULL,
  `idleland` int(11) NOT NULL,
  `totallandbmv` decimal(18,2) DEFAULT '0.00',
  `totallandmv` decimal(18,2) DEFAULT '0.00',
  `totallandav` decimal(18,2) DEFAULT '0.00',
  `totalplanttreebmv` decimal(18,2) DEFAULT '0.00',
  `totalplanttreemv` decimal(18,2) DEFAULT '0.00',
  `totalplanttreeadjustment` decimal(18,2) DEFAULT '0.00',
  `totalplanttreeav` decimal(18,2) DEFAULT '0.00',
  `landvalueadjustment` decimal(18,2) DEFAULT '0.00',
  `publicland` int(11) NULL,
  `distanceawr` decimal(16,2) NULL,
  `distanceltc` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_landrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landrysetting`
--

DROP TABLE IF EXISTS `landrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `appliedto` varchar(500) NULL,
  `previd` varchar(50) NULL,
  `remarks` varchar(200) NULL,
  `ordinanceno` varchar(25) NULL,
  `ordinancedate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_landrysetting_previd` (`previd`),
  KEY `ix_landrysetting_ry` (`ry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landspecificclass`
--

DROP TABLE IF EXISTS `landspecificclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landspecificclass` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ux_landspecificclass_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landtax_lgu_account_mapping`
--

DROP TABLE IF EXISTS `landtax_lgu_account_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landtax_lgu_account_mapping` (
  `objid` varchar(50) NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `revtype` varchar(50) NOT NULL,
  `revperiod` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  KEY `fk_landtaxlguaccountmapping_itemaccount` (`item_objid`),
  KEY `fk_landtaxlguaccountmapping_sysorg` (`lgu_objid`),
  KEY `ix_objid` (`objid`),
  KEY `ix_revtype` (`revtype`),
  CONSTRAINT `fk_landtaxlguaccountmapping_itemaccount` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_landtaxlguaccountmapping_sysorg` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landtax_report_rptdelinquency`
--

DROP TABLE IF EXISTS `landtax_report_rptdelinquency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landtax_report_rptdelinquency` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NULL,
  `revtype` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `dtgenerated` datetime NOT NULL,
  `generatedby_name` varchar(255) NOT NULL,
  `generatedby_title` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcuvspecificclass`
--

DROP TABLE IF EXISTS `lcuvspecificclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcuvspecificclass` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `previd` varchar(50) NULL,
  `landspecificclass_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_lcuvspecificclass_propertyclassification` (`classification_objid`),
  KEY `ix_landspecificclass_objid` (`landspecificclass_objid`),
  KEY `ix_lcuvspecificclass_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  KEY `FK_lcuvspecificclass_landrysetting` (`landrysettingid`),
  CONSTRAINT `FK_lcuvspecificclass_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `fk_lcuvspecificclass_landspecificclass` FOREIGN KEY (`landspecificclass_objid`) REFERENCES `landspecificclass` (`objid`),
  CONSTRAINT `FK_lcuvspecificclass_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcuvstripping`
--

DROP TABLE IF EXISTS `lcuvstripping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcuvstripping` (
  `objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `striplevel` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_lcuvstripping_landrysetting` (`landrysettingid`),
  KEY `FK_lcuvstripping_propertyclassification` (`classification_objid`),
  KEY `ix_lcuvstripping_previd` (`previd`),
  CONSTRAINT `FK_lcuvstripping_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `FK_lcuvstripping_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcuvsubclass`
--

DROP TABLE IF EXISTS `lcuvsubclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcuvsubclass` (
  `objid` varchar(50) NOT NULL,
  `specificclass_objid` varchar(50) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_lcuvsubclass_code` (`landrysettingid`,`specificclass_objid`,`code`),
  UNIQUE KEY `ux_lcuvsubclass_name` (`landrysettingid`,`specificclass_objid`,`code`,`name`),
  KEY `FK_lcuvsubclass_lcuvspecificclass` (`specificclass_objid`),
  KEY `ix_lcuvsubclass_previd` (`previd`),
  KEY `ix_lcuvsubclass_rootid` (`landrysettingid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_lcuvsubclass_landrysetting` FOREIGN KEY (`landrysettingid`) REFERENCES `landrysetting` (`objid`),
  CONSTRAINT `FK_lcuvsubclass_lcuvspecificclass` FOREIGN KEY (`specificclass_objid`) REFERENCES `lcuvspecificclass` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machassesslevel`
--

DROP TABLE IF EXISTS `machassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machassesslevel` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machassesslevel_settingcode` (`machrysettingid`,`code`),
  UNIQUE KEY `ux_machassesslevel_settingname` (`machrysettingid`,`name`),
  KEY `FK_machassesslevel_propertyclassification` (`classification_objid`),
  KEY `ix_machassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_machassesslevel_machrysetting` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`),
  CONSTRAINT `FK_machassesslevel_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machassesslevelrange`
--

DROP TABLE IF EXISTS `machassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `machassesslevelid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machassesslevelrange_mvfrom` (`machrysettingid`,`machassesslevelid`,`mvfrom`),
  KEY `FK_machassesslevelrange_machassesslevel` (`machassesslevelid`),
  CONSTRAINT `FK_machassesslevelrange_machassesslevel` FOREIGN KEY (`machassesslevelid`) REFERENCES `machassesslevel` (`objid`),
  CONSTRAINT `FK_machassesslevelrange_machrysetting` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machdetail`
--

DROP TABLE IF EXISTS `machdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machdetail` (
  `objid` varchar(50) NOT NULL,
  `machuseid` varchar(50) NOT NULL,
  `machrpuid` varchar(50) NOT NULL,
  `machine_objid` varchar(50) NULL,
  `operationyear` int(11) NULL,
  `replacementcost` decimal(18,2) DEFAULT '0.00',
  `depreciation` decimal(16,6) NULL,
  `depreciationvalue` decimal(18,2) DEFAULT '0.00',
  `basemarketvalue` decimal(18,2) DEFAULT '0.00',
  `marketvalue` decimal(18,2) DEFAULT '0.00',
  `assesslevel` decimal(18,2) DEFAULT '0.00',
  `assessedvalue` decimal(18,2) DEFAULT '0.00',
  `brand` varchar(50) NULL,
  `capacity` varchar(50) NULL,
  `model` varchar(50) NULL,
  `serialno` varchar(50) NULL,
  `status` varchar(50) NULL,
  `yearacquired` int(11) NULL,
  `estimatedlife` int(11) NULL,
  `remaininglife` int(11) NULL,
  `yearinstalled` int(11) NULL,
  `yearsused` int(11) NULL,
  `originalcost` decimal(18,2) DEFAULT '0.00',
  `freightcost` decimal(18,2) DEFAULT '0.00',
  `insurancecost` decimal(18,2) DEFAULT '0.00',
  `installationcost` decimal(18,2) DEFAULT '0.00',
  `brokeragecost` decimal(18,2) DEFAULT '0.00',
  `arrastrecost` decimal(18,2) DEFAULT '0.00',
  `othercost` decimal(18,2) DEFAULT '0.00',
  `acquisitioncost` decimal(18,2) DEFAULT '0.00',
  `feracid` varchar(50) NULL,
  `ferac` decimal(10,0) NULL,
  `forexid` varchar(50) NULL,
  `forex` decimal(18,2) DEFAULT '0.00',
  `residualrate` decimal(18,2) DEFAULT '0.00',
  `conversionfactor` decimal(18,2) DEFAULT '0.00',
  `swornamount` decimal(18,2) DEFAULT '0.00',
  `useswornamount` int(11) NOT NULL,
  `imported` int(11) NOT NULL,
  `newlyinstalled` int(11) NOT NULL,
  `autodepreciate` int(11) NOT NULL,
  `taxable` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_machdetail_machforex` (`feracid`),
  KEY `FK_machdetail_machforexid` (`forexid`),
  KEY `FK_machdetail_machine` (`machine_objid`),
  KEY `FK_machdetail_machrpu` (`machrpuid`),
  KEY `FK_machdetail_machuse` (`machuseid`),
  CONSTRAINT `FK_machdetail_machforex` FOREIGN KEY (`feracid`) REFERENCES `machforex` (`objid`),
  CONSTRAINT `FK_machdetail_machforexid` FOREIGN KEY (`forexid`) REFERENCES `machforex` (`objid`),
  CONSTRAINT `FK_machdetail_machine` FOREIGN KEY (`machine_objid`) REFERENCES `machine` (`objid`),
  CONSTRAINT `FK_machdetail_machrpu` FOREIGN KEY (`machrpuid`) REFERENCES `machrpu` (`objid`),
  CONSTRAINT `FK_machdetail_machuse` FOREIGN KEY (`machuseid`) REFERENCES `machuse` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machforex`
--

DROP TABLE IF EXISTS `machforex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machforex` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `forex` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machforex_settingyear` (`machrysettingid`,`year`),
  KEY `ix_machforex_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_machforex_machrysetting` FOREIGN KEY (`machrysettingid`) REFERENCES `machrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_machine_code` (`code`),
  UNIQUE KEY `ux_machine_name` (`name`),
  KEY `ix_machine_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machrpu`
--

DROP TABLE IF EXISTS `machrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machrpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NULL,
  `bldgmaster_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_machrpu_landrpu` (`landrpuid`),
  CONSTRAINT `FK_machrpu_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_machrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machrysetting`
--

DROP TABLE IF EXISTS `machrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) NULL,
  `appliedto` longtext,
  `residualrate` decimal(10,2) NULL,
  `remarks` varchar(200) NULL,
  `ordinanceno` varchar(25) NULL,
  `ordinancedate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_machrysetting_machrysetting` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machuse`
--

DROP TABLE IF EXISTS `machuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machuse` (
  `objid` varchar(50) NOT NULL,
  `machrpuid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NULL,
  `basemarketvalue` decimal(18,2) DEFAULT '0.00',
  `marketvalue` decimal(18,2) DEFAULT '0.00',
  `assesslevel` decimal(18,2) DEFAULT '0.00',
  `assessedvalue` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  KEY `FK_machuse_machassesslevel` (`actualuse_objid`),
  KEY `FK_machuse_machrpu` (`machrpuid`),
  CONSTRAINT `FK_machuse_machassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `machassesslevel` (`objid`),
  CONSTRAINT `FK_machuse_machrpu` FOREIGN KEY (`machrpuid`) REFERENCES `machrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_material_code` (`code`),
  UNIQUE KEY `ux_material_name` (`name`),
  KEY `ix_material_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcsettlement`
--

DROP TABLE IF EXISTS `mcsettlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcsettlement` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NULL,
  `txnno` varchar(25) NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` longtext,
  `prevfaas_objid` varchar(50) NULL,
  `newfaas_objid` varchar(50) NULL,
  `newtdno` varchar(25) NULL,
  `signatories` longtext NOT NULL,
  `lgutype` varchar(25) NOT NULL,
  `lguid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_mcsettlement_state` (`state`),
  KEY `ix_mcsettlement_txnno` (`txnno`),
  KEY `FK_mcsettlement_prevfaas` (`prevfaas_objid`),
  KEY `FK_mcsettlement_newfaas` (`newfaas_objid`),
  CONSTRAINT `FK_mcsettlement_newfaas` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_mcsettlement_prevfaas` FOREIGN KEY (`prevfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcsettlement_affectedrpu`
--

DROP TABLE IF EXISTS `mcsettlement_affectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcsettlement_affectedrpu` (
  `objid` varchar(50) NOT NULL,
  `mcsettlementid` varchar(50) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `prevfaas_objid` varchar(50) NOT NULL,
  `newfaas_objid` varchar(50) NULL,
  `newtdno` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_mcaffectedrpu_prevfaas_objid` (`prevfaas_objid`),
  KEY `ix_mcaffectedrpu_mcid` (`mcsettlementid`),
  KEY `ix_mcaffectedrpu_newfaas_objid` (`newfaas_objid`),
  KEY `ix_mcaffectedrpu_prevfaas_objid` (`prevfaas_objid`),
  CONSTRAINT `FK_mcaffectedrpu_mc` FOREIGN KEY (`mcsettlementid`) REFERENCES `mcsettlement` (`objid`),
  CONSTRAINT `FK_mcaffectedrpu_newfaas` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_mcaffectedrpu_prevfaas` FOREIGN KEY (`prevfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mcsettlement_otherclaim`
--

DROP TABLE IF EXISTS `mcsettlement_otherclaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcsettlement_otherclaim` (
  `objid` varchar(50) NOT NULL,
  `mcsettlementid` varchar(50) NOT NULL,
  `faas_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_mcotherclaim_faas_objid` (`faas_objid`),
  KEY `ix_mcotherclaim_faas_objid` (`faas_objid`),
  KEY `ix_mcotherclaim_mcid` (`mcsettlementid`),
  CONSTRAINT `FK_mcotherclaim_faas` FOREIGN KEY (`faas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_mcotherclaim_mc` FOREIGN KEY (`mcsettlementid`) REFERENCES `mcsettlement` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memoranda_template`
--

DROP TABLE IF EXISTS `memoranda_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memoranda_template` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(25) NOT NULL,
  `template` varchar(500) NOT NULL,
  `fields` longtext,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscassesslevel`
--

DROP TABLE IF EXISTS `miscassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscassesslevel` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_miscassesslevel_settingcode` (`miscrysettingid`,`code`),
  UNIQUE KEY `ux_miscassesslevel_settingname` (`miscrysettingid`,`name`),
  KEY `FK_miscassesslevel_classification` (`classification_objid`),
  KEY `ix_miscassesslevel_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_miscassesslevel_classification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_miscassesslevel_miscrysetting` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscassesslevelrange`
--

DROP TABLE IF EXISTS `miscassesslevelrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscassesslevelrange` (
  `objid` varchar(50) NOT NULL,
  `miscassesslevelid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `mvfrom` decimal(10,0) NOT NULL,
  `mvto` decimal(10,0) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_miscassesslevelrange_miscassesslevel` (`miscassesslevelid`),
  KEY `FK_miscassesslevelrange_miscrysetting` (`miscrysettingid`),
  CONSTRAINT `FK_miscassesslevelrange_miscassesslevel` FOREIGN KEY (`miscassesslevelid`) REFERENCES `miscassesslevel` (`objid`),
  CONSTRAINT `FK_miscassesslevelrange_miscrysetting` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscitem`
--

DROP TABLE IF EXISTS `miscitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_miscitem_code` (`code`),
  UNIQUE KEY `ux_miscitem_name` (`name`),
  KEY `ix_miscitem_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscitemvalue`
--

DROP TABLE IF EXISTS `miscitemvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscitemvalue` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `miscitem_objid` varchar(50) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_miscitemvalue_rysetting_item` (`miscrysettingid`,`miscitem_objid`),
  KEY `FK_miscitemvalue_miscitem` (`miscitem_objid`),
  KEY `ix_miscitemvalue_previd` (`previd`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `FK_miscitemvalue_miscitem` FOREIGN KEY (`miscitem_objid`) REFERENCES `miscitem` (`objid`),
  CONSTRAINT `FK_miscitemvalue_miscrysetting` FOREIGN KEY (`miscrysettingid`) REFERENCES `miscrysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrpu`
--

DROP TABLE IF EXISTS `miscrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrpu` (
  `objid` varchar(50) NOT NULL,
  `actualuse_objid` varchar(50) NULL,
  `landrpuid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_miscrpu_miscassesslevel` (`actualuse_objid`),
  CONSTRAINT `FK_miscrpu_miscassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `miscassesslevel` (`objid`),
  CONSTRAINT `FK_miscrpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrpuitem`
--

DROP TABLE IF EXISTS `miscrpuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrpuitem` (
  `objid` varchar(50) NOT NULL,
  `miscrpuid` varchar(50) NOT NULL,
  `miv_objid` varchar(50) NOT NULL,
  `miscitem_objid` varchar(50) NOT NULL,
  `expr` varchar(255) NOT NULL,
  `depreciation` decimal(10,0) NOT NULL,
  `depreciatedvalue` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_miscrpuitem_miscitem` (`miscitem_objid`),
  KEY `FK_miscrpuitem_miscitemvalue` (`miv_objid`),
  KEY `FK_miscrpuitem_miscrpu` (`miscrpuid`),
  CONSTRAINT `FK_miscrpuitem_miscitem` FOREIGN KEY (`miscitem_objid`) REFERENCES `miscitem` (`objid`),
  CONSTRAINT `FK_miscrpuitem_miscitemvalue` FOREIGN KEY (`miv_objid`) REFERENCES `miscitemvalue` (`objid`),
  CONSTRAINT `FK_miscrpuitem_miscrpu` FOREIGN KEY (`miscrpuid`) REFERENCES `miscrpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrpuitem_rptparameter`
--

DROP TABLE IF EXISTS `miscrpuitem_rptparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrpuitem_rptparameter` (
  `miscrpuitemid` varchar(50) NOT NULL,
  `param_objid` varchar(50) NOT NULL,
  `miscrpuid` varchar(50) NOT NULL,
  `intvalue` int(11) NULL,
  `decimalvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`miscrpuitemid`,`param_objid`),
  KEY `FK_miscrpuitem_rptparameter_` (`miscrpuid`),
  KEY `FK_miscrpuitem_rptparameter_rptparamer` (`param_objid`),
  CONSTRAINT `FK_miscrpuitem_rptparameter_` FOREIGN KEY (`miscrpuid`) REFERENCES `miscrpu` (`objid`),
  CONSTRAINT `FK_miscrpuitem_rptparameter_miscrpuitem` FOREIGN KEY (`miscrpuitemid`) REFERENCES `miscrpuitem` (`objid`),
  CONSTRAINT `FK_miscrpuitem_rptparameter_rptparamer` FOREIGN KEY (`param_objid`) REFERENCES `rptparameter` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscrysetting`
--

DROP TABLE IF EXISTS `miscrysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscrysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) NULL,
  `appliedto` longtext,
  `remarks` varchar(200) NULL,
  `ordinanceno` varchar(25) NULL,
  `ordinancedate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_miscrysetting_ry` (`ry`),
  KEY `ix_miscrysetting_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `indexno` varchar(15) NULL,
  `pin` varchar(15) NULL,
  `name` varchar(50) NULL,
  `previd` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `mayor_name` varchar(100) NULL,
  `mayor_title` varchar(50) NULL,
  `mayor_office` varchar(50) NULL,
  `assessor_name` varchar(100) NULL,
  `assessor_title` varchar(50) NULL,
  `assessor_office` varchar(50) NULL,
  `treasurer_name` varchar(100) NULL,
  `treasurer_title` varchar(50) NULL,
  `treasurer_office` varchar(50) NULL,
  `address` varchar(100) NULL,
  `fullname` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_pin` (`pin`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_municipality_org` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality_taxaccount_mapping`
--

DROP TABLE IF EXISTS `municipality_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality_taxaccount_mapping` (
  `lguid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) NULL,
  `basicprevacct_objid` varchar(50) NULL,
  `basicprevintacct_objid` varchar(50) NULL,
  `basicprioracct_objid` varchar(50) NULL,
  `basicpriorintacct_objid` varchar(50) NULL,
  `basiccurracct_objid` varchar(50) NULL,
  `basiccurrintacct_objid` varchar(50) NULL,
  `sefadvacct_objid` varchar(50) NULL,
  `sefprevacct_objid` varchar(50) NULL,
  `sefprevintacct_objid` varchar(50) NULL,
  `sefprioracct_objid` varchar(50) NULL,
  `sefpriorintacct_objid` varchar(50) NULL,
  `sefcurracct_objid` varchar(50) NULL,
  `sefcurrintacct_objid` varchar(50) NULL,
  `basicidlecurracct_objid` varchar(50) NULL,
  `basicidlecurrintacct_objid` varchar(50) NULL,
  `basicidleprevacct_objid` varchar(50) NULL,
  `basicidleprevintacct_objid` varchar(50) NULL,
  `basicidleadvacct_objid` varchar(50) NULL,
  PRIMARY KEY (`lguid`),
  KEY `ix_lguid` (`lguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ngas_revenue_mapping`
--

DROP TABLE IF EXISTS `ngas_revenue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngas_revenue_mapping` (
  `objid` varchar(50) NOT NULL,
  `version` varchar(10) NULL,
  `revenueitemid` varchar(50) NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_revenueitem_ngasacctid` (`version`,`revenueitemid`,`acctid`),
  KEY `fk_revenue_mapping_ngasaccount` (`acctid`),
  KEY `fk_revenue_mapping_revenueitemid` (`revenueitemid`),
  CONSTRAINT `fk_ngas_revenue_mapping_acctid` FOREIGN KEY (`acctid`) REFERENCES `ngasaccount` (`objid`),
  CONSTRAINT `fk_ngas_revenue_mapping_revenueitemid` FOREIGN KEY (`revenueitemid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ngasaccount`
--

DROP TABLE IF EXISTS `ngasaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngasaccount` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `state` varchar(10) NULL,
  `chartid` varchar(50) NULL,
  `code` varchar(50) NULL,
  `title` varchar(255) NULL,
  `type` varchar(20) NULL,
  `acctgroup` varchar(50) NULL,
  `target` decimal(12,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_chartid` (`chartid`),
  KEY `ix_code` (`code`),
  KEY `ix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payable_ledger`
--

DROP TABLE IF EXISTS `payable_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_ledger` (
  `objid` varchar(50) NOT NULL,
  `jevid` varchar(150) NULL,
  `refitemacctid` varchar(50) NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NULL,
  `cr` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_refitemacctid` (`refitemacctid`),
  KEY `ix_itemacctid` (`itemacctid`),
  CONSTRAINT `fk_payable_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_payable_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentorder`
--

DROP TABLE IF EXISTS `paymentorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime NULL,
  `payer_objid` varchar(50) NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(150) NULL,
  `particulars` text,
  `amount` decimal(16,2) NULL,
  `txntype` varchar(50) NULL,
  `expirydate` date NULL,
  `refid` varchar(50) NULL,
  `refno` varchar(50) NULL,
  `info` text,
  `txntypename` varchar(255) NULL,
  `locationid` varchar(50) NULL,
  `origin` varchar(50) NULL,
  `issuedby_objid` varchar(50) NULL,
  `issuedby_name` varchar(150) NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(255) NULL,
  `items` text,
  `collectiontypeid` varchar(50) NULL,
  `queueid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  KEY `ix_issuedby_name` (`issuedby_name`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_locationid` (`locationid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentorder_type`
--

DROP TABLE IF EXISTS `paymentorder_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder_type` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(150) NULL,
  `collectiontype_objid` varchar(50) NULL,
  `queuesection` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  CONSTRAINT `fk_paymentorder_type_collectiontype_objid` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_lgu_barangay` (`barangayid`),
  KEY `ix_pin_state` (`state`),
  CONSTRAINT `FK_pin_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttree`
--

DROP TABLE IF EXISTS `planttree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttree` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_planttree_code` (`code`),
  UNIQUE KEY `ux_planttree_name` (`name`),
  KEY `ix_planttree_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreeassesslevel`
--

DROP TABLE IF EXISTS `planttreeassesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreeassesslevel` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `code` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  `classification_objid` varchar(50) NULL,
  `fixrate` int(11) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_planttreeassesslevel_settingcode` (`planttreerysettingid`,`code`),
  UNIQUE KEY `ux_planttreeassesslevel_settingname` (`planttreerysettingid`,`name`),
  KEY `FK_planttreeassesslevel_planttreeassesslevel` (`previd`),
  CONSTRAINT `FK_planttreeassesslevel_planttreerysetting` FOREIGN KEY (`planttreerysettingid`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreedetail`
--

DROP TABLE IF EXISTS `planttreedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreedetail` (
  `objid` varchar(50) NOT NULL,
  `planttreerpuid` varchar(50) NULL,
  `landrpuid` varchar(50) NULL,
  `planttreeunitvalue_objid` varchar(50) NULL,
  `planttree_objid` varchar(50) NULL,
  `actualuse_objid` varchar(50) NOT NULL,
  `productive` decimal(10,0) NOT NULL,
  `nonproductive` decimal(10,0) NOT NULL,
  `nonproductiveage` varchar(25) NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `basemarketvalue` decimal(10,0) NOT NULL,
  `adjustment` decimal(10,0) NOT NULL,
  `adjustmentrate` decimal(10,0) NOT NULL,
  `marketvalue` decimal(10,0) NOT NULL,
  `assesslevel` decimal(10,0) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `areacovered` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_planttreedetail_landrpu` (`landrpuid`),
  KEY `FK_planttreedetail_plantreeassesslevel` (`actualuse_objid`),
  KEY `FK_planttreedetail_planttree` (`planttree_objid`),
  KEY `FK_planttreedetail_planttreerpu` (`planttreerpuid`),
  KEY `FK_planttreedetail_planttreeunitvalue` (`planttreeunitvalue_objid`),
  CONSTRAINT `FK_planttreedetail_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_planttreedetail_plantreeassesslevel` FOREIGN KEY (`actualuse_objid`) REFERENCES `planttreeassesslevel` (`objid`),
  CONSTRAINT `FK_planttreedetail_planttree` FOREIGN KEY (`planttree_objid`) REFERENCES `planttree` (`objid`),
  CONSTRAINT `FK_planttreedetail_planttreerpu` FOREIGN KEY (`planttreerpuid`) REFERENCES `planttreerpu` (`objid`),
  CONSTRAINT `FK_planttreedetail_planttreeunitvalue` FOREIGN KEY (`planttreeunitvalue_objid`) REFERENCES `planttreeunitvalue` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreerpu`
--

DROP TABLE IF EXISTS `planttreerpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreerpu` (
  `objid` varchar(50) NOT NULL,
  `landrpuid` varchar(50) NOT NULL,
  `productive` decimal(10,0) NOT NULL,
  `nonproductive` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_planttreerpu_landrpu` (`landrpuid`),
  CONSTRAINT `FK_planttreerpu_landrpu` FOREIGN KEY (`landrpuid`) REFERENCES `landrpu` (`objid`),
  CONSTRAINT `FK_planttreerpu_rpu` FOREIGN KEY (`objid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreerysetting`
--

DROP TABLE IF EXISTS `planttreerysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreerysetting` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `ry` int(11) NOT NULL,
  `applyagriadjustment` int(11) NULL,
  `appliedto` longtext,
  `previd` varchar(50) NULL,
  `remarks` varchar(200) NULL,
  `ordinanceno` varchar(25) NULL,
  `ordinancedate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_planttreerysetting_ry` (`ry`),
  KEY `FK_planttreerysetting_planttreerysetting` (`previd`),
  CONSTRAINT `FK_planttreerysetting_planttreerysetting` FOREIGN KEY (`previd`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planttreeunitvalue`
--

DROP TABLE IF EXISTS `planttreeunitvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planttreeunitvalue` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `planttree_objid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,0) NOT NULL,
  `previd` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_planttreeunitvalue_settingplanttreecode` (`planttreerysettingid`,`planttree_objid`,`code`),
  UNIQUE KEY `ux_planttreeunitvalue_settingplanttreename` (`planttreerysettingid`,`planttree_objid`,`name`),
  KEY `FK_planttreeunitvalue_planttree` (`planttree_objid`),
  KEY `FK_planttreeunitvalue_planttreeunitvalue` (`previd`),
  CONSTRAINT `FK_planttreeunitvalue_planttree` FOREIGN KEY (`planttree_objid`) REFERENCES `planttree` (`objid`),
  CONSTRAINT `FK_planttreeunitvalue_planttreerysetting` FOREIGN KEY (`planttreerysettingid`) REFERENCES `planttreerysetting` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `previousfaas`
--

DROP TABLE IF EXISTS `previousfaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `previousfaas` (
  `faasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  PRIMARY KEY (`faasid`,`prevfaasid`),
  KEY `FK_previousfaas_prevfaas` (`prevfaasid`),
  CONSTRAINT `FK_previousfaas_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_previousfaas_prevfaas` FOREIGN KEY (`prevfaasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertyclassification`
--

DROP TABLE IF EXISTS `propertyclassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertyclassification` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `special` int(11) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_propertyclassification_code` (`code`),
  UNIQUE KEY `ux_propertyclassification_name` (`name`),
  KEY `ix_propertyclassification_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertypayer`
--

DROP TABLE IF EXISTS `propertypayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertypayer` (
  `objid` varchar(50) NOT NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_propertypayer_taxpayerid` (`taxpayer_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propertypayer_item`
--

DROP TABLE IF EXISTS `propertypayer_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertypayer_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledger_objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_propertypayeritem_rptledgerid` (`parentid`,`rptledger_objid`),
  KEY `ix_propertypayeritem_parentid` (`parentid`),
  KEY `ix_propertypayeritem_rptledgerid` (`rptledger_objid`),
  CONSTRAINT `FK_propertypayeritem_propertypayer` FOREIGN KEY (`parentid`) REFERENCES `propertypayer` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `indexno` varchar(15) NULL,
  `pin` varchar(15) NULL,
  `name` varchar(50) NULL,
  `previd` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `governor_name` varchar(100) NULL,
  `governor_title` varchar(50) NULL,
  `governor_office` varchar(50) NULL,
  `assessor_name` varchar(100) NULL,
  `assessor_title` varchar(50) NULL,
  `assessor_office` varchar(50) NULL,
  `treasurer_name` varchar(100) NULL,
  `treasurer_title` varchar(50) NULL,
  `treasurer_office` varchar(50) NULL,
  `address` varchar(100) NULL,
  `fullname` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_indexno` (`indexno`),
  KEY `ix_pin` (`pin`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_previd` (`previd`),
  CONSTRAINT `fk_province_org` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province_taxaccount_mapping`
--

DROP TABLE IF EXISTS `province_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_taxaccount_mapping` (
  `objid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) NULL,
  `basicprevacct_objid` varchar(50) NULL,
  `basicprevintacct_objid` varchar(50) NULL,
  `basicprioracct_objid` varchar(50) NULL,
  `basicpriorintacct_objid` varchar(50) NULL,
  `basiccurracct_objid` varchar(50) NULL,
  `basiccurrintacct_objid` varchar(50) NULL,
  `sefadvacct_objid` varchar(50) NULL,
  `sefprevacct_objid` varchar(50) NULL,
  `sefprevintacct_objid` varchar(50) NULL,
  `sefprioracct_objid` varchar(50) NULL,
  `sefpriorintacct_objid` varchar(50) NULL,
  `sefcurracct_objid` varchar(50) NULL,
  `sefcurrintacct_objid` varchar(50) NULL,
  `basicidlecurracct_objid` varchar(50) NULL,
  `basicidlecurrintacct_objid` varchar(50) NULL,
  `basicidleprevacct_objid` varchar(50) NULL,
  `basicidleprevintacct_objid` varchar(50) NULL,
  `basicidleadvacct_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realproperty`
--

DROP TABLE IF EXISTS `realproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realproperty` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `pintype` varchar(5) NOT NULL,
  `pin` varchar(30) NOT NULL,
  `ry` int(11) NOT NULL,
  `claimno` varchar(5) NULL,
  `section` varchar(3) NOT NULL,
  `parcel` varchar(3) NOT NULL,
  `cadastrallotno` varchar(300) NULL,
  `blockno` varchar(255) NULL,
  `surveyno` varchar(100) NULL,
  `street` varchar(100) NULL,
  `purok` varchar(100) NULL,
  `north` varchar(255) NULL,
  `south` varchar(255) NULL,
  `east` varchar(255) NULL,
  `west` varchar(255) NULL,
  `barangayid` varchar(50) NOT NULL,
  `lgutype` varchar(50) NOT NULL,
  `previd` varchar(50) NULL,
  `lguid` varchar(50) NULL,
  `stewardshipno` varchar(3) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_realproperty_blockno` (`blockno`),
  KEY `ix_realproperty_brgysection` (`barangayid`,`section`),
  KEY `ix_realproperty_brgystate` (`barangayid`,`state`),
  KEY `ix_realproperty_cadastrallotno` (`cadastrallotno`(255)),
  KEY `ix_realproperty_claimno` (`claimno`),
  KEY `ix_realproperty_pin` (`pin`),
  KEY `ix_realproperty_ry` (`ry`),
  KEY `ix_realproperty_surveyno` (`surveyno`),
  CONSTRAINT `FK_realproperty_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religion` (
  `objid` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remittance`
--

DROP TABLE IF EXISTS `remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `liquidatingofficer_objid` varchar(50) NULL,
  `liquidatingofficer_name` varchar(100) NULL,
  `liquidatingofficer_title` varchar(50) NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalcheck` decimal(16,2) NOT NULL,
  `cashbreakdown` longtext NOT NULL,
  `controldate` date NOT NULL,
  `remarks` varchar(255) NULL,
  `totalcr` decimal(16,2) NOT NULL,
  `collector_signature` longtext,
  `liquidatingofficer_signature` longtext,
  `collectionvoucherid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  KEY `ix_remittance_state` (`state`),
  KEY `ix_txnno` (`controlno`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_liquidatingofficer_objid` (`liquidatingofficer_objid`),
  KEY `ix_remittancedate` (`controldate`),
  KEY `ix_state` (`state`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_collectionvoucherid` (`collectionvoucherid`),
  CONSTRAINT `fk_remittance_collectionvoucherid` FOREIGN KEY (`collectionvoucherid`) REFERENCES `collectionvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remittance_af`
--

DROP TABLE IF EXISTS `remittance_af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance_af` (
  `objid` varchar(150) NOT NULL,
  `remittanceid` varchar(50) NULL,
  `controlid` varchar(50) NULL,
  `receivedstartseries` int(11) NULL,
  `receivedendseries` int(11) NULL,
  `beginstartseries` int(11) NULL,
  `beginendseries` int(11) NULL,
  `issuedstartseries` int(11) NULL,
  `issuedendseries` int(11) NULL,
  `endingstartseries` int(11) NULL,
  `endingendseries` int(11) NULL,
  `qtyreceived` int(11) NULL,
  `qtybegin` int(11) NULL,
  `qtyissued` int(11) NULL,
  `qtyending` int(11) NULL,
  `qtycancelled` int(11) NULL,
  `remarks` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_remittance_afserial_remittance` (`remittanceid`),
  KEY `ix_controlid` (`controlid`),
  CONSTRAINT `remittance_af_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remittance_fund`
--

DROP TABLE IF EXISTS `remittance_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance_fund` (
  `objid` varchar(150) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `cashbreakdown` longtext,
  `controlno` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_remittance_fund` (`remittanceid`,`fund_objid`),
  KEY `remittanceid` (`remittanceid`),
  KEY `ix_fund_objid` (`fund_objid`),
  CONSTRAINT `fk_remittance_fund_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `remittance_fund_ibfk_1` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remoteserverdata`
--

DROP TABLE IF EXISTS `remoteserverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remoteserverdata` (
  `objid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency`
--

DROP TABLE IF EXISTS `report_rptdelinquency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `dtgenerated` datetime NOT NULL,
  `dtcomputed` datetime NOT NULL,
  `generatedby_name` varchar(255) NOT NULL,
  `generatedby_title` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_barangay`
--

DROP TABLE IF EXISTS `report_rptdelinquency_barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_barangay` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `processed` int(11) NOT NULL,
  `errors` int(11) NOT NULL,
  `ignored` int(11) NOT NULL,
  `idx` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptdelinquency_barangay_barangay` (`barangayid`),
  KEY `fk_rptdelinquency_barangay_rptdelinquency` (`parentid`),
  CONSTRAINT `fk_rptdelinquency_barangay_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`),
  CONSTRAINT `fk_rptdelinquency_barangay_rptdelinquency` FOREIGN KEY (`parentid`) REFERENCES `report_rptdelinquency` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_error`
--

DROP TABLE IF EXISTS `report_rptdelinquency_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_error` (
  `objid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `error` longtext,
  `ignored` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_forprocess`
--

DROP TABLE IF EXISTS `report_rptdelinquency_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_forprocess` (
  `objid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangayid` (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_rptdelinquency_item`
--

DROP TABLE IF EXISTS `report_rptdelinquency_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_rptdelinquency_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NULL,
  `revtype` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptdelinquency_barangay_rptdelinquency` (`parentid`),
  KEY `fk_rptdelinquency_item_barangay` (`barangayid`),
  KEY `fk_rptdelinquency_item_rptdelinquency` (`parentid`),
  KEY `fk_rptdelinquency_item_rptledger` (`rptledgerid`),
  CONSTRAINT `fk_rptdelinquency_item_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`),
  CONSTRAINT `fk_rptdelinquency_item_rptdelinquency` FOREIGN KEY (`parentid`) REFERENCES `report_rptdelinquency` (`objid`),
  CONSTRAINT `fk_rptdelinquency_item_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resection`
--

DROP TABLE IF EXISTS `resection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `barangay_objid` varchar(50) NOT NULL,
  `pintype` varchar(3) NOT NULL,
  `section` varchar(3) NOT NULL,
  `originlgu_objid` varchar(50) NOT NULL,
  `memoranda` varchar(255) NULL,
  `taskid` varchar(50) NULL,
  `taskstate` varchar(50) NULL,
  `assignee_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_resection_txnno` (`txnno`),
  KEY `FK_resection_lgu_org` (`lgu_objid`),
  KEY `FK_resection_barangay_org` (`barangay_objid`),
  KEY `FK_resection_originlgu_org` (`originlgu_objid`),
  KEY `ix_resection_state` (`state`),
  CONSTRAINT `FK_resection_barangay_org` FOREIGN KEY (`barangay_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `FK_resection_lgu_org` FOREIGN KEY (`lgu_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `FK_resection_originlgu_org` FOREIGN KEY (`originlgu_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resection_item`
--

DROP TABLE IF EXISTS `resection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resection_item` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `faas_objid` varchar(50) NOT NULL,
  `faas_rputype` varchar(15) NOT NULL,
  `faas_pin` varchar(25) NOT NULL,
  `faas_suffix` int(255) NOT NULL,
  `newfaas_objid` varchar(50) NULL,
  `newfaas_rpuid` varchar(50) NULL,
  `newfaas_rpid` varchar(50) NULL,
  `newfaas_section` varchar(3) NULL,
  `newfaas_parcel` varchar(3) NULL,
  `newfaas_suffix` int(255) NULL,
  `newfaas_tdno` varchar(25) NULL,
  `newfaas_fullpin` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_resection_item_tdno` (`newfaas_tdno`),
  KEY `FK_resection_item_item` (`parent_objid`),
  KEY `FK_resection_item_faas` (`faas_objid`),
  KEY `FK_resection_item_newfaas` (`newfaas_objid`),
  KEY `ix_resection_item_fullpin` (`newfaas_fullpin`),
  CONSTRAINT `FK_resection_item_faas` FOREIGN KEY (`faas_objid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_resection_item_item` FOREIGN KEY (`parent_objid`) REFERENCES `resection` (`objid`),
  CONSTRAINT `FK_resection_item_newfaas` FOREIGN KEY (`newfaas_objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resection_task`
--

DROP TABLE IF EXISTS `resection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resection_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `assignee_title` varchar(80) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `actor_title` varchar(80) NULL,
  `message` varchar(255) NULL,
  `signature` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_changeinfo`
--

DROP TABLE IF EXISTS `rpt_changeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_changeinfo` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NULL,
  `rpid` varchar(50) NULL,
  `rpuid` varchar(50) NULL,
  `action` varchar(100) NOT NULL,
  `reason` longtext NOT NULL,
  `newinfo` longtext NOT NULL,
  `previnfo` longtext NOT NULL,
  `dtposted` datetime NOT NULL,
  `postedbyid` varchar(50) NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(100) NOT NULL,
  `refid` varchar(50) NULL,
  `redflagid` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_redflag`
--

DROP TABLE IF EXISTS `rpt_redflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_redflag` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(50) NULL,
  `caseno` varchar(25) NOT NULL,
  `message` longtext,
  `filedby_date` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `action` varchar(50) NOT NULL,
  `resolvedby_objid` varchar(50) NULL,
  `resolvedby_name` varchar(150) NULL,
  `resolvedby_date` datetime NULL,
  `lguid` varchar(15) NOT NULL,
  `dtclosed` datetime NULL,
  `remarks` longtext,
  `info` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptredflag_caseno` (`caseno`),
  KEY `ix_rptredflag_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_requirement`
--

DROP TABLE IF EXISTS `rpt_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_requirement` (
  `objid` varchar(50) NOT NULL,
  `requirementtypeid` varchar(50) NOT NULL,
  `handler` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `value_objid` varchar(50) NULL,
  `value_txnno` varchar(50) NULL,
  `value_txndate` date NULL,
  `value_txnamount` decimal(10,0) NULL,
  `value_remarks` longtext,
  `complied` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptrequirement_refid` (`refid`),
  KEY `ix_rptrequirement_requirementtypeid` (`requirementtypeid`),
  KEY `ix_rptrequirement_valueobjid` (`value_objid`),
  CONSTRAINT `FK_rptrequirement_rptrequirementtype` FOREIGN KEY (`requirementtypeid`) REFERENCES `rpt_requirement_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_requirement_type`
--

DROP TABLE IF EXISTS `rpt_requirement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_requirement_type` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(150) NULL,
  `handler` varchar(100) NULL,
  `sortorder` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptrequirementtype_name` (`name`),
  KEY `ix_rptrequirementtype_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_sales_data`
--

DROP TABLE IF EXISTS `rpt_sales_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sales_data` (
  `objid` varchar(50) NOT NULL,
  `seller_name` varchar(250) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `buyer_name` varchar(250) NOT NULL,
  `buyer_address` varchar(100) NOT NULL,
  `saledate` date NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `remarks` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_buyername` (`buyer_name`),
  KEY `ix_FK_faas_sales_data` (`objid`),
  KEY `ix_sellername` (`seller_name`),
  CONSTRAINT `FK_faas_sales_data` FOREIGN KEY (`objid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_sms`
--

DROP TABLE IF EXISTS `rpt_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sms` (
  `objid` varchar(50) NOT NULL,
  `traceid` varchar(50) NULL,
  `phoneno` varchar(50) NOT NULL,
  `logdate` datetime NOT NULL,
  `message` varchar(500) NULL,
  `amount` decimal(10,0) NOT NULL,
  `amtpaid` decimal(10,0) NOT NULL,
  `action` varchar(100) NULL,
  `status` varchar(25) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptsms_phoneno` (`phoneno`),
  KEY `ix_rptsms_traceid` (`traceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_sms_registration`
--

DROP TABLE IF EXISTS `rpt_sms_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpt_sms_registration` (
  `phoneno` varchar(25) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `dtregistered` datetime NOT NULL,
  PRIMARY KEY (`phoneno`,`refid`),
  KEY `ix_rptsmsreg_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptacknowledgement`
--

DROP TABLE IF EXISTS `rptacknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptacknowledgement` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NULL,
  `taxpayer_objid` varchar(50) NULL,
  `txntype_objid` varchar(50) NULL,
  `releasedate` datetime NULL,
  `releasemode` varchar(50) NULL,
  `receivedby` varchar(255) NULL,
  `remarks` varchar(255) NULL,
  `pin` varchar(25) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(150) NULL,
  `createdby_title` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptacknowledgement_txnno` (`txnno`),
  KEY `ix_rptacknowledgement_pin` (`pin`),
  KEY `ix_rptacknowledgement_taxpayerid` (`taxpayer_objid`),
  KEY `ix_rptacknowledgement_createdby_objid` (`createdby_objid`),
  KEY `ix_rptacknowledgement_createdby_name` (`createdby_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptacknowledgement_item`
--

DROP TABLE IF EXISTS `rptacknowledgement_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptacknowledgement_item` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `trackingno` varchar(25) NULL,
  `faas_objid` varchar(50) NULL,
  `newfaas_objid` varchar(50) NULL,
  `remarks` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptacknowledgement_itemno` (`trackingno`),
  KEY `ix_rptacknowledgement_parentid` (`parent_objid`),
  KEY `ix_rptacknowledgement_item_faasid` (`faas_objid`),
  KEY `ix_rptacknowledgement_item_newfaasid` (`newfaas_objid`),
  CONSTRAINT `fk_rptacknowledgement_item_rptacknowledgement` FOREIGN KEY (`parent_objid`) REFERENCES `rptacknowledgement` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptbill`
--

DROP TABLE IF EXISTS `rptbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptbill` (
  `objid` varchar(50) NOT NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(150) NOT NULL,
  `barcode` varchar(25) NOT NULL,
  `expirydate` date NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NULL,
  `billtoyear` int(11) NULL,
  `billtoqtr` int(11) NULL,
  `dtposted` datetime NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptbill_barcode` (`barcode`),
  KEY `ix_expirydate` (`expirydate`),
  KEY `ix_rptbill_expirydate` (`expirydate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptbill_ledger`
--

DROP TABLE IF EXISTS `rptbill_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptbill_ledger` (
  `rptledgerid` varchar(50) NOT NULL DEFAULT '',
  `billid` varchar(50) NOT NULL DEFAULT '',
  `updateflag` varchar(50) NULL,
  PRIMARY KEY (`rptledgerid`,`billid`),
  KEY `ix_rptbill_ledgter_rptbillid` (`billid`),
  KEY `ix_rptbill_ledgter_rptledgerid` (`rptledgerid`),
  CONSTRAINT `FK_rptbillledger_rptbill` FOREIGN KEY (`billid`) REFERENCES `rptbill` (`objid`),
  CONSTRAINT `FK_rptbillledger_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcertification`
--

DROP TABLE IF EXISTS `rptcertification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcertification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `opener` varchar(50) NOT NULL,
  `faasid` varchar(50) NULL,
  `taxpayer_objid` varchar(50) NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(255) NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(255) NOT NULL,
  `purpose` varchar(500) NULL,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) NULL,
  `byauthoritytitle` varchar(50) NULL,
  `official` int(11) NOT NULL,
  `orno` varchar(25) NULL,
  `ordate` datetime NULL,
  `oramount` decimal(10,0) NOT NULL,
  `stampamount` decimal(10,0) NOT NULL,
  `createdbyid` varchar(50) NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) NULL,
  `addlinfo` varchar(500) NULL,
  `attestedby` varchar(100) NULL,
  `attestedbytitle` varchar(100) NULL,
  `asofyear` int(11) NULL,
  `year` int(11) NULL,
  `qtr` int(11) NULL,
  `properties` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptcertification_txnno` (`txnno`),
  KEY `FK_rptcertification_faas` (`faasid`),
  KEY `ix_rptcertification_office` (`office`),
  KEY `ix_rptcertification_office_txnno` (`office`,`txnno`),
  KEY `ix_rptcertification_taxpayerid` (`taxpayer_objid`),
  CONSTRAINT `FK_rptcertification_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcertificationitem`
--

DROP TABLE IF EXISTS `rptcertificationitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcertificationitem` (
  `objid` int(11) NOT NULL AUTO_INCREMENT,
  `rptcertificationid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptcertificationitem_rptcertification` (`rptcertificationid`),
  KEY `ix_rptcertificationitem_refid` (`refid`),
  CONSTRAINT `FK_rptcertificationitem_rptcertification` FOREIGN KEY (`rptcertificationid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise`
--

DROP TABLE IF EXISTS `rptcompromise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` date NOT NULL,
  `faasid` varchar(50) NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `lastyearpaid` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `startyear` int(11) NOT NULL,
  `startqtr` int(11) NOT NULL,
  `endyear` int(11) NOT NULL,
  `endqtr` int(11) NOT NULL,
  `enddate` date NOT NULL,
  `cypaymentrequired` int(11) NULL,
  `cypaymentorno` varchar(15) NULL,
  `cypaymentordate` date NULL,
  `cypaymentoramount` decimal(10,2) NULL,
  `downpaymentrequired` int(11) NOT NULL,
  `downpaymentrate` decimal(10,0) NOT NULL,
  `downpayment` decimal(10,2) NOT NULL,
  `downpaymentorno` varchar(50) NULL,
  `downpaymentordate` date NULL,
  `term` int(11) NOT NULL,
  `numofinstallment` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtforinstallment` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `firstpartyname` varchar(100) NOT NULL,
  `firstpartytitle` varchar(50) NOT NULL,
  `firstpartyaddress` varchar(100) NOT NULL,
  `firstpartyctcno` varchar(15) NOT NULL,
  `firstpartyctcissued` varchar(100) NOT NULL,
  `firstpartyctcdate` date NOT NULL,
  `firstpartynationality` varchar(50) NOT NULL,
  `firstpartystatus` varchar(50) NOT NULL,
  `firstpartygender` varchar(10) NOT NULL,
  `secondpartyrepresentative` varchar(100) NOT NULL,
  `secondpartyname` varchar(100) NOT NULL,
  `secondpartyaddress` varchar(100) NOT NULL,
  `secondpartyctcno` varchar(15) NOT NULL,
  `secondpartyctcissued` varchar(100) NOT NULL,
  `secondpartyctcdate` date NOT NULL,
  `secondpartynationality` varchar(50) NOT NULL,
  `secondpartystatus` varchar(50) NOT NULL,
  `secondpartygender` varchar(10) NOT NULL,
  `dtsigned` date NULL,
  `notarizeddate` date NULL,
  `notarizedby` varchar(100) NULL,
  `notarizedbytitle` varchar(50) NULL,
  `signatories` longtext NOT NULL,
  `manualdiff` decimal(16,2) NOT NULL DEFAULT '0.00',
  `cypaymentreceiptid` varchar(50) NULL,
  `downpaymentreceiptid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_faasid` (`faasid`),
  KEY `ix_rptcompromise_ledgerid` (`rptledgerid`),
  CONSTRAINT `fk_rptcompromise_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `fk_rptcompromise_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise_credit`
--

DROP TABLE IF EXISTS `rptcompromise_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise_credit` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NULL,
  `installmentid` varchar(50) NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `orno` varchar(15) NULL,
  `ordate` date NOT NULL,
  `oramount` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `paidby` varchar(150) NOT NULL,
  `paidbyaddress` varchar(100) NOT NULL,
  `partial` int(11) NULL,
  `remarks` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_credit_installmentid` (`installmentid`),
  KEY `ix_rptcompromise_credit_parentid` (`parentid`),
  KEY `ix_rptcompromise_credit_receiptid` (`receiptid`),
  CONSTRAINT `fk_rptcompromise_credit_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_rptcompromise_credit_rptcompromise` FOREIGN KEY (`parentid`) REFERENCES `rptcompromise` (`objid`),
  CONSTRAINT `fk_rptcompromise_credit_rptcompromise_installment` FOREIGN KEY (`installmentid`) REFERENCES `rptcompromise_installment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise_installment`
--

DROP TABLE IF EXISTS `rptcompromise_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise_installment` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `installmentno` int(11) NOT NULL,
  `duedate` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `fullypaid` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_installment_rptcompromiseid` (`parentid`),
  CONSTRAINT `fk_rptcompromise_installment_rptcompromise` FOREIGN KEY (`parentid`) REFERENCES `rptcompromise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptcompromise_item`
--

DROP TABLE IF EXISTS `rptcompromise_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptcompromise_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NOT NULL,
  `revtype` varchar(50) NOT NULL,
  `revperiod` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `interestpaid` decimal(16,2) NOT NULL,
  `priority` int(11) NULL,
  `taxdifference` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptcompromise_item_rptcompromise` (`parentid`),
  KEY `ix_rptcompromise_item_rptledgerfaas` (`rptledgerfaasid`),
  CONSTRAINT `fk_rptcompromise_item_rptcompromise` FOREIGN KEY (`parentid`) REFERENCES `rptcompromise` (`objid`),
  CONSTRAINT `fk_rptcompromise_item_rptledgerfaas` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptexpiry`
--

DROP TABLE IF EXISTS `rptexpiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptexpiry` (
  `iyear` int(11) NOT NULL,
  `iqtr` int(11) NOT NULL,
  `expirytype` varchar(50) NOT NULL,
  `expirydate` datetime NULL,
  PRIMARY KEY (`iqtr`,`iyear`,`expirytype`),
  KEY `ix_rptexpiry_yrqtr` (`iyear`,`iqtr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger`
--

DROP TABLE IF EXISTS `rptledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `faasid` varchar(50) NULL,
  `nextbilldate` date NULL,
  `lastyearpaid` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `taxpayer_objid` varchar(50) NULL,
  `fullpin` varchar(35) NULL,
  `tdno` varchar(30) NULL,
  `cadastrallotno` longtext,
  `rputype` varchar(15) NULL,
  `txntype_objid` varchar(50) NULL,
  `classcode` varchar(15) NULL,
  `totalav` decimal(16,2) NULL,
  `totalmv` decimal(16,2) NULL,
  `totalareaha` decimal(16,6) NULL,
  `taxable` int(11) NULL,
  `owner_name` longtext,
  `prevtdno` varchar(800) NULL,
  `classification_objid` varchar(50) NULL,
  `titleno` varchar(50) NULL,
  `undercompromise` int(11) NULL,
  `administrator_name` varchar(150) NULL,
  `blockno` varchar(50) NULL,
  `lguid` varchar(50) NULL,
  `beneficiary_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptledger_faas` (`faasid`),
  KEY `ix_rptledger_administartorname` (`administrator_name`),
  KEY `ix_rptledger_blockno` (`blockno`),
  KEY `ix_rptledger_cadastrallotno` (`cadastrallotno`(255)),
  KEY `ix_rptledger_faasid` (`faasid`),
  KEY `ix_rptledger_fullpin` (`fullpin`),
  KEY `ix_rptledger_state` (`state`),
  KEY `ix_rptledger_state_barangay` (`state`,`barangayid`),
  KEY `ix_rptledger_state_faasid` (`state`,`faasid`),
  KEY `ix_rptledger_state_lastyearpaid` (`state`,`lastyearpaid`),
  KEY `ix_rptledger_tdno` (`tdno`),
  KEY `ix_rptledgerlastyearpaidqtr` (`lastyearpaid`,`lastqtrpaid`),
  KEY `FK_rptledger_barangay` (`barangayid`),
  KEY `ix_rptledger_prevtdno` (`prevtdno`(255)),
  CONSTRAINT `FK_rptledger_barangay` FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`),
  CONSTRAINT `FK_rptledger_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_avdifference`
--

DROP TABLE IF EXISTS `rptledger_avdifference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_avdifference` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `rptledgerfaas_objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `paid` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptledger` (`parent_objid`),
  KEY `fk_rptledgerfaas` (`rptledgerfaas_objid`),
  CONSTRAINT `fk_rptledger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_rptledgerfaas` FOREIGN KEY (`rptledgerfaas_objid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_credit`
--

DROP TABLE IF EXISTS `rptledger_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_credit` (
  `objid` varchar(100) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `payorid` varchar(50) NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `collector` varchar(80) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(12,2) NOT NULL,
  `basicint` decimal(12,2) NOT NULL,
  `basicdisc` decimal(12,2) NOT NULL,
  `basicidle` decimal(12,2) NOT NULL,
  `sef` decimal(12,2) NOT NULL,
  `sefint` decimal(12,2) NOT NULL,
  `sefdisc` decimal(12,2) NOT NULL,
  `firecode` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `collectingagency` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptledgercredit_rptledger` (`rptledgerid`),
  KEY `ix_rptreceipt_payorid` (`payorid`),
  KEY `ix_rptreceipt_receiptno` (`refno`),
  CONSTRAINT `rptledger_credit_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_forprocess`
--

DROP TABLE IF EXISTS `rptledger_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_forprocess` (
  `objid` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_item`
--

DROP TABLE IF EXISTS `rptledger_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `rptledgerfaasid` varchar(50) NULL,
  `remarks` varchar(100) NULL,
  `basicav` decimal(16,2) NOT NULL,
  `sefav` decimal(16,2) NOT NULL,
  `av` decimal(16,2) NOT NULL,
  `revtype` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `priority` int(11) NOT NULL,
  `taxdifference` int(11) NOT NULL,
  `system` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptledger_item_rptledger` (`parentid`),
  CONSTRAINT `fk_rptledger_item_rptledger` FOREIGN KEY (`parentid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_payment`
--

DROP TABLE IF EXISTS `rptledger_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_payment` (
  `objid` varchar(100) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `receiptid` varchar(50) NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` date NOT NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `collectingagency` varchar(50) NULL,
  `voided` int(11) NOT NULL,
  `remarks` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptledger_payment_cashreceipt` (`receiptid`),
  KEY `fk_rptledger_payment_rptledger` (`rptledgerid`),
  KEY `ix_receiptno` (`receiptno`),
  CONSTRAINT `fk_rptledger_payment_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `fk_rptledger_payment_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_payment_item`
--

DROP TABLE IF EXISTS `rptledger_payment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_payment_item` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(100) NULL,
  `rptledgerfaasid` varchar(50) NULL,
  `rptledgeritemid` varchar(50) NULL,
  `rptledgeritemqtrlyid` varchar(50) NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `basicidle` decimal(16,2) NOT NULL,
  `basicidledisc` decimal(16,2) NULL,
  `basicidleint` decimal(16,2) NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `firecode` decimal(10,2) NULL,
  `sh` decimal(16,2) NOT NULL,
  `shint` decimal(16,2) NOT NULL,
  `shdisc` decimal(16,2) NOT NULL,
  `total` decimal(16,2) NULL,
  `revperiod` varchar(25) NULL,
  `partialled` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptledger_payment_item_parentid` (`parentid`),
  KEY `fk_rptledger_payment_item_rptledgerfaasid` (`rptledgerfaasid`),
  KEY `ix_rptledgeritemid` (`rptledgeritemid`),
  KEY `ix_rptledgeritemqtrlyid` (`rptledgeritemqtrlyid`),
  CONSTRAINT `fk_rptledger_payment_item_parentid` FOREIGN KEY (`parentid`) REFERENCES `rptledger_payment` (`objid`),
  CONSTRAINT `fk_rptledger_payment_item_rptledgerfaasid` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_payment_share`
--

DROP TABLE IF EXISTS `rptledger_payment_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_payment_share` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(100) NULL,
  `revperiod` varchar(25) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `item_objid` varchar(50) NULL,
  `amount` decimal(16,4) NOT NULL,
  `sharetype` varchar(25) NOT NULL,
  `discount` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_item_objid` (`item_objid`),
  KEY `fk_parentid` (`parentid`),
  CONSTRAINT `fk_rptledger_payment_share_itemaccount` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_rptledger_payment_share_parentid` FOREIGN KEY (`parentid`) REFERENCES `rptledger_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_restriction`
--

DROP TABLE IF EXISTS `rptledger_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_restriction` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `restrictionid` varchar(50) NOT NULL,
  `remarks` varchar(150) NULL,
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`objid`),
  KEY `ix_autoinc_oid` (`oid`),
  KEY `FK_rptledger_restriction_rptledger` (`parentid`),
  CONSTRAINT `FK_rptledger_restriction_rptledger` FOREIGN KEY (`parentid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_subledger`
--

DROP TABLE IF EXISTS `rptledger_subledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_subledger` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `subacctno` varchar(10) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_subacctno` (`parent_objid`,`subacctno`),
  CONSTRAINT `FK_rptledger_subledger_rptldger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledger_tag`
--

DROP TABLE IF EXISTS `rptledger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledger_tag` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptledger_tag` (`parent_objid`,`tag`),
  KEY `FK_rptledgertag_rptledger` (`parent_objid`),
  CONSTRAINT `FK_rptledgertag_rptledger` FOREIGN KEY (`parent_objid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledgerbill`
--

DROP TABLE IF EXISTS `rptledgerbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledgerbill` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `ledgerfaasid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `av` decimal(10,0) NOT NULL,
  `type` varchar(25) NOT NULL,
  `revenueitemid` varchar(50) NULL,
  `amount` decimal(10,0) NOT NULL,
  `amtpaid` decimal(10,0) NOT NULL,
  `interest` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `refid` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptledgerfaas`
--

DROP TABLE IF EXISTS `rptledgerfaas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptledgerfaas` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `faasid` varchar(50) NULL,
  `tdno` varchar(25) NOT NULL,
  `txntype_objid` varchar(10) NULL,
  `classification_objid` varchar(50) NULL,
  `actualuse_objid` varchar(50) NULL,
  `taxable` int(11) NOT NULL,
  `backtax` int(11) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `assessedvalue` decimal(10,0) NOT NULL,
  `systemcreated` int(11) NOT NULL,
  `reclassed` int(11) NULL,
  `idleland` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rptledgerhistory_rptledger` (`rptledgerid`),
  KEY `ix_rptledgerfaas_rptledgerid_faasid` (`rptledgerid`,`faasid`),
  KEY `ix_rptledgerhistory_ledgerid_toyear` (`rptledgerid`,`toyear`),
  KEY `FK_rptledgerfaas_faas` (`faasid`),
  KEY `ix_rptledgerfaas_tdno` (`tdno`),
  CONSTRAINT `FK_rptledgerfaas_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_rptledgerfaas_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptparameter`
--

DROP TABLE IF EXISTS `rptparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptparameter` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `description` longtext,
  `paramtype` varchar(20) NOT NULL,
  `minvalue` decimal(10,0) NOT NULL,
  `maxvalue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rptparameter_name` (`name`),
  KEY `ix_rptparameter_caption` (`caption`),
  KEY `ix_rptparameter_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptpayment`
--

DROP TABLE IF EXISTS `rptpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptpayment` (
  `objid` varchar(100) NOT NULL,
  `type` varchar(50) NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `receiptid` varchar(50) NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `collectingagency` varchar(50) NULL,
  `voided` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptpayment_cashreceipt` (`receiptid`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_refid` (`refid`),
  KEY `ix_rptpayment_receiptdate` (`receiptdate`),
  CONSTRAINT `fk_rptpayment_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptpayment_item`
--

DROP TABLE IF EXISTS `rptpayment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptpayment_item` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(100) NULL,
  `rptledgerfaasid` varchar(50) NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NULL,
  `revtype` varchar(50) NOT NULL,
  `revperiod` varchar(25) NULL,
  `amount` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `partialled` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptpayment_item_parentid` (`parentid`),
  KEY `fk_rptpayment_item_rptledgerfaasid` (`rptledgerfaasid`),
  CONSTRAINT `rptpayment_item_rptledgerfaas` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`),
  CONSTRAINT `rptpayment_item_rptpayment` FOREIGN KEY (`parentid`) REFERENCES `rptpayment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptpayment_share`
--

DROP TABLE IF EXISTS `rptpayment_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptpayment_share` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(100) NULL,
  `revperiod` varchar(25) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `sharetype` varchar(25) NOT NULL,
  `item_objid` varchar(50) NULL,
  `amount` decimal(16,4) NOT NULL,
  `discount` decimal(16,4) NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_rptpayment_share_item_objid` (`item_objid`),
  KEY `fk_rptpayment_share_parentid` (`parentid`),
  CONSTRAINT `rptpayment_share_itemaccount` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `rptpayment_share_rptpayment` FOREIGN KEY (`parentid`) REFERENCES `rptpayment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptreceipt_capture`
--

DROP TABLE IF EXISTS `rptreceipt_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptreceipt_capture` (
  `objid` varchar(100) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `receiptno` varchar(25) NOT NULL,
  `receiptdate` date NOT NULL,
  `payorid` varchar(50) NULL,
  `paidby_name` longtext NOT NULL,
  `paidby_address` varchar(150) NOT NULL,
  `collector` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `postedby` varchar(100) NOT NULL,
  `postedbytitle` varchar(50) NOT NULL,
  `dtposted` datetime NOT NULL,
  `paidby` varchar(50) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `period` varchar(50) NOT NULL,
  `basic` decimal(12,2) NOT NULL,
  `basicint` decimal(12,2) NOT NULL,
  `basicdisc` decimal(12,2) NOT NULL,
  `sef` decimal(12,2) NOT NULL,
  `sefint` decimal(12,2) NOT NULL,
  `sefdisc` decimal(12,2) NOT NULL,
  `firecode` decimal(12,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptreceipt_capture_paidby` (`paidby`),
  KEY `ix_rptreceipt_payorid` (`payorid`),
  KEY `ix_rptreceipt_receiptno` (`receiptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttask`
--

DROP TABLE IF EXISTS `rpttask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttask` (
  `taskid` varchar(50) NOT NULL,
  `objid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `msg` varchar(100) NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `createdby_title` varchar(50) NULL,
  `assignedto_objid` varchar(50) NULL,
  `assignedto_name` varchar(150) NULL,
  `assignedto_title` varchar(50) NULL,
  `workflowid` varchar(50) NULL,
  `signatory` varchar(50) NULL,
  `docname` varchar(50) NULL,
  `status` varchar(100) NULL,
  PRIMARY KEY (`taskid`),
  KEY `ix_rpttask_assignedto_enddate` (`assignedto_objid`,`enddate`),
  KEY `ix_rpttask_assignedto_name` (`assignedto_name`),
  KEY `ix_rpttask_assignedto_objid` (`assignedto_objid`),
  KEY `ix_rpttask_createdby_name` (`createdby_name`),
  KEY `ix_rpttask_createdby_objid` (`createdby_objid`),
  KEY `ix_rpttask_enddate` (`enddate`),
  KEY `ix_rpttask_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxclearance`
--

DROP TABLE IF EXISTS `rpttaxclearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxclearance` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `reporttype` varchar(15) NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `FK_rpttaxclearance_rptcertification` FOREIGN KEY (`objid`) REFERENCES `rptcertification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxincentive`
--

DROP TABLE IF EXISTS `rpttaxincentive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxincentive` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(25) NULL,
  `txndate` date NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `taxpayer_name` longtext NOT NULL,
  `taxpayer_address` varchar(150) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `createdby_title` varchar(50) NOT NULL,
  `createdby_date` datetime NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rpttaxincentive_name` (`name`),
  KEY `ix_rpttaxincentive_state` (`state`),
  KEY `ix_rpttaxincentive_taxpayerid` (`taxpayer_objid`),
  KEY `ix_rpttaxincentive_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttaxincentive_item`
--

DROP TABLE IF EXISTS `rpttaxincentive_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttaxincentive_item` (
  `objid` varchar(50) NOT NULL,
  `rpttaxincentiveid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `basicrate` int(11) NOT NULL,
  `sefrate` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rpttaxincentiveitem_rptledgerid` (`rptledgerid`),
  KEY `ix_rpttaxincentiveitem_rpttaxincentiveid` (`rpttaxincentiveid`),
  CONSTRAINT `FK_rpttaxincentiveitem_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `FK_rpttaxincentiveitem_rpttaxincentive` FOREIGN KEY (`rpttaxincentiveid`) REFERENCES `rpttaxincentive` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttracking`
--

DROP TABLE IF EXISTS `rpttracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttracking` (
  `objid` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `trackingno` varchar(25) NOT NULL,
  `msg` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_rpttracking_trackingno` (`trackingno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttransmittal`
--

DROP TABLE IF EXISTS `rpttransmittal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttransmittal` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `txnno` varchar(15) NOT NULL,
  `txndate` datetime NOT NULL,
  `lgu_objid` varchar(50) NOT NULL,
  `lgu_name` varchar(50) NOT NULL,
  `lgu_type` varchar(50) NOT NULL,
  `tolgu_objid` varchar(50) NOT NULL,
  `tolgu_name` varchar(50) NOT NULL,
  `tolgu_type` varchar(50) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `createdby_title` varchar(50) NOT NULL,
  `remarks` varchar(500) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_txnno` (`txnno`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_lguname` (`lgu_name`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpttransmittal_item`
--

DROP TABLE IF EXISTS `rpttransmittal_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpttransmittal_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(150) NOT NULL,
  `message` varchar(350) NULL,
  `remarks` varchar(350) NULL,
  `status` varchar(50) NULL,
  `disapprovedby_name` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_refid` (`parentid`,`refid`),
  KEY `fk_rpttransmittal_item_rpttransmittal` (`parentid`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `fk_rpttransmittal_item_rpttransmittal` FOREIGN KEY (`parentid`) REFERENCES `rpttransmittal` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptworkflow`
--

DROP TABLE IF EXISTS `rptworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptworkflow` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NULL,
  `appliedto` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptworkflow_state`
--

DROP TABLE IF EXISTS `rptworkflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptworkflow_state` (
  `objid` varchar(50) NOT NULL,
  `workflowid` varchar(50) NOT NULL,
  `fromstate` varchar(50) NULL,
  `tostate` varchar(50) NULL,
  `type` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `signatory` varchar(50) NULL,
  `message` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_rptworkflowstate_workflowid` (`workflowid`),
  CONSTRAINT `FK_rptworkflowstate_rptworkflow` FOREIGN KEY (`workflowid`) REFERENCES `rptworkflow` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu`
--

DROP TABLE IF EXISTS `rpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `realpropertyid` varchar(50) NULL,
  `rputype` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `fullpin` varchar(30) NULL,
  `suffix` int(11) NOT NULL,
  `subsuffix` int(11) NULL,
  `classification_objid` varchar(50) NULL,
  `exemptiontype_objid` varchar(50) NULL,
  `taxable` int(11) NOT NULL,
  `totalareaha` decimal(18,6) NULL,
  `totalareasqm` decimal(18,6) NULL,
  `totalbmv` decimal(16,2) NULL,
  `totalmv` decimal(16,2) NULL,
  `totalav` decimal(16,2) NULL,
  `hasswornamount` int(11) NOT NULL,
  `swornamount` decimal(16,2) NULL,
  `useswornamount` int(11) NOT NULL,
  `previd` varchar(50) NULL,
  `rpumasterid` varchar(50) NULL,
  `reclassed` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rpu_realpropertyid` (`realpropertyid`),
  KEY `ix_classification_objid` (`classification_objid`),
  KEY `ix_previd` (`previd`),
  KEY `ix_rpu_fullpin` (`fullpin`),
  KEY `ix_rpu_rpumasterid` (`rpumasterid`),
  KEY `ix_rpu_ry_fullpin` (`fullpin`,`ry`),
  KEY `ix_rpu_ry_state` (`state`),
  KEY `ix_rpu_state` (`state`),
  KEY `ix_rpy_ry` (`ry`),
  KEY `FK_rpu_exemptiontype` (`exemptiontype_objid`),
  CONSTRAINT `FK_rpu_exemptiontype` FOREIGN KEY (`exemptiontype_objid`) REFERENCES `exemptiontype` (`objid`),
  CONSTRAINT `FK_rpu_propertyclassification` FOREIGN KEY (`classification_objid`) REFERENCES `propertyclassification` (`objid`),
  CONSTRAINT `FK_rpu_realpropertyid` FOREIGN KEY (`realpropertyid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `FK_rpu_rpumaster` FOREIGN KEY (`rpumasterid`) REFERENCES `rpumaster` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu_assessment`
--

DROP TABLE IF EXISTS `rpu_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu_assessment` (
  `objid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `classification_objid` varchar(50) NULL,
  `actualuse_objid` varchar(50) NULL,
  `areasqm` decimal(18,2) DEFAULT '0.00',
  `areaha` decimal(18,6) DEFAULT '0.000000',
  `marketvalue` decimal(18,2) DEFAULT '0.00',
  `assesslevel` decimal(18,2) DEFAULT '0.00',
  `assessedvalue` decimal(18,2) DEFAULT '0.00',
  `rputype` varchar(25) NULL,
  `taxable` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_rpuassessmetn_rpu` (`rpuid`),
  CONSTRAINT `FK_rpuassessmetn_rpu` FOREIGN KEY (`rpuid`) REFERENCES `rpu` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpu_type_suffix`
--

DROP TABLE IF EXISTS `rpu_type_suffix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpu_type_suffix` (
  `objid` varchar(50) NOT NULL,
  `rputype` varchar(20) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpumaster`
--

DROP TABLE IF EXISTS `rpumaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpumaster` (
  `objid` varchar(50) NOT NULL,
  `currentfaasid` varchar(50) NULL,
  `currentrpuid` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rysetting_lgu`
--

DROP TABLE IF EXISTS `rysetting_lgu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rysetting_lgu` (
  `rysettingid` varchar(50) NOT NULL,
  `lguid` varchar(50) NOT NULL,
  `lguname` varchar(100) NOT NULL,
  `settingtype` varchar(15) NOT NULL,
  `barangayid` varchar(50) NULL,
  `objid` varchar(50) NULL,
  PRIMARY KEY (`rysettingid`,`lguid`),
  KEY `ix_lguid` (`lguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rysettinginfo`
--

DROP TABLE IF EXISTS `rysettinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rysettinginfo` (
  `ry` int(11) NOT NULL,
  `ordinanceno` varchar(50) NULL,
  `ordinancedate` datetime NULL,
  `sangguniangname` varchar(50) NULL,
  PRIMARY KEY (`ry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signatory`
--

DROP TABLE IF EXISTS `signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signatory` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NULL,
  `name` varchar(150) NULL,
  `title` varchar(50) NOT NULL,
  `department` varchar(50) NULL,
  `personnelid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_doctype` (`doctype`),
  KEY `ix_personnelid` (`personnelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_rpt_registration`
--

DROP TABLE IF EXISTS `sms_rpt_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_rpt_registration` (
  `mobileno` varchar(25) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `dtregistered` datetime NOT NULL,
  PRIMARY KEY (`mobileno`,`rptledgerid`),
  KEY `ix_smsrptreg_rptledgerid` (`rptledgerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialaccountsetting`
--

DROP TABLE IF EXISTS `specialaccountsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialaccountsetting` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `item_objid` varchar(50) NOT NULL DEFAULT '',
  `amount` decimal(16,2) NOT NULL,
  `collectiontypeid` varchar(50) NOT NULL,
  `revtype` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_specialaccountsetting_collectiontype` (`collectiontypeid`),
  CONSTRAINT `FK_specialaccountsetting_collectiontype` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `specialaccountsetting_ibfk_1` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sre_revenue_mapping`
--

DROP TABLE IF EXISTS `sre_revenue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sre_revenue_mapping` (
  `objid` varchar(50) NOT NULL,
  `version` varchar(10) NULL,
  `revenueitemid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_revenueitemid` (`revenueitemid`),
  KEY `ix_acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sreaccount`
--

DROP TABLE IF EXISTS `sreaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreaccount` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `state` varchar(10) NULL,
  `chartid` varchar(50) NULL,
  `code` varchar(50) NULL,
  `title` varchar(255) NULL,
  `type` varchar(20) NULL,
  `acctgroup` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_chartid` (`chartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sreaccount_incometarget`
--

DROP TABLE IF EXISTS `sreaccount_incometarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreaccount_incometarget` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(18,2) NULL,
  PRIMARY KEY (`objid`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structure`
--

DROP TABLE IF EXISTS `structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `indexno` int(11) NOT NULL,
  `showinfaas` int(11) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_structure_code` (`code`),
  UNIQUE KEY `ux_structure_name` (`name`),
  KEY `ix_structure_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structurematerial`
--

DROP TABLE IF EXISTS `structurematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structurematerial` (
  `structure_objid` varchar(50) NOT NULL,
  `material_objid` varchar(50) NOT NULL,
  `display` int(11) NULL,
  `idx` int(11) NULL,
  PRIMARY KEY (`structure_objid`,`material_objid`),
  KEY `FK_structurematerial_material` (`material_objid`),
  CONSTRAINT `FK_structurematerial_material` FOREIGN KEY (`material_objid`) REFERENCES `material` (`objid`),
  CONSTRAINT `FK_structurematerial_strucutre` FOREIGN KEY (`structure_objid`) REFERENCES `structure` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcollector_remittance`
--

DROP TABLE IF EXISTS `subcollector_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollector_remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(30) NOT NULL,
  `subcollector_objid` varchar(50) NOT NULL,
  `subcollector_name` varchar(100) NOT NULL,
  `subcollector_title` varchar(50) NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(12,2) NULL,
  `totalnoncash` decimal(12,2) NULL,
  `cashbreakdown` longtext,
  `collectionsummaries` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_txnno` (`txnno`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcollector_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `subcollector_remittance_cashreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollector_remittance_cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_remittanceid` (`remittanceid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `subcollector_remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdividedland`
--

DROP TABLE IF EXISTS `subdividedland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdividedland` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(10) NULL,
  `newtdno` varchar(50) NULL,
  `newutdno` varchar(50) NULL,
  `newpin` varchar(25) NOT NULL,
  `newtitletype` varchar(50) NULL,
  `newtitleno` varchar(50) NULL,
  `newtitledate` varchar(50) NULL,
  `areasqm` decimal(16,6) NULL,
  `areaha` decimal(16,6) NULL,
  `memoranda` longtext,
  `administrator_objid` varchar(50) NULL,
  `administrator_name` varchar(200) NULL,
  `administrator_address` varchar(200) NULL,
  `taxpayer_objid` varchar(50) NULL,
  `taxpayer_name` longtext,
  `taxpayer_address` varchar(200) NULL,
  `owner_name` longtext,
  `owner_address` longtext,
  `newrpid` varchar(50) NOT NULL,
  `newrpuid` varchar(50) NULL,
  `newfaasid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_newpin` (`subdivisionid`,`newpin`),
  KEY `FK_subdividedland_newrp` (`newrpid`),
  KEY `FK_subdividedland_subdivision` (`subdivisionid`),
  KEY `ix_subdividedland_newpin` (`newpin`),
  KEY `FK_subdividedland_faas` (`newfaasid`),
  KEY `FK_subdividedland_newrpu` (`newrpuid`),
  CONSTRAINT `FK_subdividedland_faas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_subdividedland_newrp` FOREIGN KEY (`newrpid`) REFERENCES `realproperty` (`objid`),
  CONSTRAINT `FK_subdividedland_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_subdividedland_subdivision` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision`
--

DROP TABLE IF EXISTS `subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype_objid` varchar(5) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `autonumber` int(11) NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` longtext NOT NULL,
  `motherfaasid` varchar(50) NULL,
  `lguid` varchar(50) NULL,
  `signatories` longtext,
  `source` varchar(50) NULL,
  `filetype` varchar(50) NULL,
  `originlguid` varchar(50) NULL,
  `mothertdnos` longtext,
  `motherpins` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_subdivision_txnno` (`txnno`),
  KEY `ix_lguid` (`lguid`),
  KEY `ix_subdivision_motherpins` (`motherpins`(255)),
  KEY `ix_subdivision_mothertdnos` (`mothertdnos`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_cancelledimprovement`
--

DROP TABLE IF EXISTS `subdivision_cancelledimprovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_cancelledimprovement` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `faasid` varchar(50) NULL,
  `remarks` longtext,
  `lasttaxyear` int(11) NULL,
  `lguid` varchar(50) NULL,
  `reason_objid` varchar(50) NULL,
  `cancelledbytdnos` varchar(500) NULL,
  `cancelledbypins` varchar(500) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_subdivision_cancelledimprovement_faas` (`faasid`),
  KEY `FK_subdivision_cancelledimprovement_subdivision` (`parentid`),
  CONSTRAINT `FK_subdivision_cancelledimprovement_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_subdivision_cancelledimprovement_subdivision` FOREIGN KEY (`parentid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_motherland`
--

DROP TABLE IF EXISTS `subdivision_motherland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_motherland` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `rpuid` varchar(50) NOT NULL,
  `rpid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_consolidatedland_faas` (`landfaasid`),
  KEY `FK_consolidatedland_subdivision` (`subdivisionid`),
  CONSTRAINT `FK_subdivision_motherland_faas` FOREIGN KEY (`landfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_subdivison_motherland_subdivision` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivision_task`
--

DROP TABLE IF EXISTS `subdivision_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivision_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `assignee_title` varchar(80) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `actor_title` varchar(80) NULL,
  `message` varchar(255) NULL,
  `signature` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivisionaffectedrpu`
--

DROP TABLE IF EXISTS `subdivisionaffectedrpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdivisionaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(50) NULL,
  `subdividedlandid` varchar(50) NULL,
  `prevfaasid` varchar(50) NULL,
  `newfaasid` varchar(50) NULL,
  `newtdno` varchar(50) NULL,
  `newutdno` varchar(50) NULL,
  `newsuffix` int(11) NULL,
  `newpin` varchar(25) NULL,
  `newrpuid` varchar(50) NULL,
  `newrpid` varchar(50) NULL,
  `memoranda` longtext,
  `prevpin` varchar(50) NULL,
  `prevtdno` varchar(50) NULL,
  `isnew` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_subdivisionaffectedpru_newfaas` (`newfaasid`),
  KEY `FK_subdivisionaffectedpru_newrpu` (`newrpuid`),
  KEY `FK_subdivisionaffectedpru_prevfaas` (`prevfaasid`),
  KEY `FK_subdivisionaffectedpru_subdividedland` (`subdividedlandid`),
  KEY `FK_subdivisionaffectedpru_subdivision` (`subdivisionid`),
  KEY `ix_subdivisionaffectedrpu_newtdno` (`newtdno`),
  CONSTRAINT `FK_subdivisionaffectedpru_newfaas` FOREIGN KEY (`newfaasid`) REFERENCES `faas` (`objid`),
  CONSTRAINT `FK_subdivisionaffectedpru_newrpu` FOREIGN KEY (`newrpuid`) REFERENCES `rpu` (`objid`),
  CONSTRAINT `FK_subdivisionaffectedpru_subdividedland` FOREIGN KEY (`subdividedlandid`) REFERENCES `subdividedland` (`objid`),
  CONSTRAINT `FK_subdivisionaffectedpru_subdivision` FOREIGN KEY (`subdivisionid`) REFERENCES `subdivision` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_data`
--

DROP TABLE IF EXISTS `sync_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_data` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `orgid` varchar(50) NULL,
  `remote_orgid` varchar(50) NULL,
  `remote_orgcode` varchar(20) NULL,
  `remote_orgclass` varchar(20) NULL,
  `dtfiled` datetime NOT NULL,
  `idx` int(11) NOT NULL,
  `sender_objid` varchar(50) NULL,
  `sender_name` varchar(150) NULL,
  `refno` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_sync_data_refid` (`refid`),
  KEY `ix_sync_data_reftype` (`reftype`),
  KEY `ix_sync_data_orgid` (`orgid`),
  KEY `ix_sync_data_dtfiled` (`dtfiled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_data_forprocess`
--

DROP TABLE IF EXISTS `sync_data_forprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_data_forprocess` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `fk_sync_data_forprocess_sync_data` FOREIGN KEY (`objid`) REFERENCES `sync_data` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_data_pending`
--

DROP TABLE IF EXISTS `sync_data_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_data_pending` (
  `objid` varchar(50) NOT NULL,
  `error` text,
  `expirydate` datetime NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_expirydate` (`expirydate`),
  CONSTRAINT `fk_sync_data_pending_sync_data` FOREIGN KEY (`objid`) REFERENCES `sync_data` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_dataset`
--

DROP TABLE IF EXISTS `sys_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dataset` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NULL,
  `title` varchar(255) NULL,
  `input` longtext,
  `output` longtext,
  `statement` varchar(50) NULL,
  `datasource` varchar(50) NULL,
  `servicename` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_org` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NULL,
  `orgclass` varchar(50) NULL,
  `parent_objid` varchar(50) NULL,
  `parent_orgclass` varchar(50) NULL,
  `code` varchar(50) NULL,
  `root` int(11) NOT NULL DEFAULT '0',
  `txncode` varchar(10) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`),
  KEY `ix_parent_objid` (`parent_objid`),
  KEY `ix_parent_orgclass` (`parent_orgclass`),
  KEY `ix_code` (`code`),
  KEY `fk_sys_org_orgclass` (`orgclass`),
  CONSTRAINT `sys_org_ibfk_1` FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `sys_org_ibfk_2` FOREIGN KEY (`parent_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `sys_org_ibfk_3` FOREIGN KEY (`parent_orgclass`) REFERENCES `sys_orgclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_orgclass`
--

DROP TABLE IF EXISTS `sys_orgclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_orgclass` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) NULL,
  `parentclass` varchar(255) NULL,
  `handler` varchar(50) NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_quarter`
--

DROP TABLE IF EXISTS `sys_quarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_quarter` (
  `qtrid` int(11) NOT NULL,
  PRIMARY KEY (`qtrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report` (
  `objid` varchar(50) NOT NULL,
  `folderid` varchar(50) NULL,
  `title` varchar(255) NULL,
  `filetype` varchar(25) NULL,
  `dtcreated` datetime NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `datasetid` varchar(50) NULL,
  `template` mediumtext,
  `outputtype` varchar(50) NULL,
  `system` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_dataset` (`datasetid`),
  KEY `FK_sys_report_entry_folder` (`folderid`),
  CONSTRAINT `sys_report_ibfk_1` FOREIGN KEY (`datasetid`) REFERENCES `sys_dataset` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_admin`
--

DROP TABLE IF EXISTS `sys_report_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_admin` (
  `objid` varchar(50) NOT NULL,
  `userid` varchar(50) NULL,
  `reportfolderid` varchar(50) NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_admin_folder` (`reportfolderid`),
  KEY `FK_sys_report_admin_user` (`userid`),
  CONSTRAINT `sys_report_admin_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `sys_report_admin_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_folder`
--

DROP TABLE IF EXISTS `sys_report_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_folder` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) NULL,
  `title` varchar(255) NULL,
  `parentid` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_report_member`
--

DROP TABLE IF EXISTS `sys_report_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_member` (
  `objid` varchar(50) NOT NULL,
  `reportfolderid` varchar(50) NULL,
  `userid` varchar(50) NULL,
  `usergroupid` varchar(50) NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_member_folder` (`reportfolderid`),
  KEY `FK_sys_report_member_user` (`userid`),
  KEY `FK_sys_report_member_usergroup` (`usergroupid`),
  CONSTRAINT `sys_report_member_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_2` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_requirement_type`
--

DROP TABLE IF EXISTS `sys_requirement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_requirement_type` (
  `code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `handler` varchar(50) NULL,
  `objid` varchar(50) NOT NULL,
  `type` varchar(50) NULL,
  `system` int(11) NULL,
  `agency` varchar(50) NULL,
  `sortindex` int(11) NOT NULL,
  `verifier` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) NULL,
  `title` varchar(250) NULL,
  `description` longtext,
  `salience` int(11) NULL,
  `effectivefrom` date NULL,
  `effectiveto` date NULL,
  `dtfiled` datetime NULL,
  `user_objid` varchar(50) NULL,
  `user_name` varchar(100) NULL,
  `noloop` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_ruleset_name` (`ruleset`,`name`),
  KEY `rulegroup` (`rulegroup`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `actiondef_objid` varchar(50) NULL,
  `actiondef_name` varchar(50) NULL,
  `pos` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_actiondef_objid` (`actiondef_objid`),
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `actiondefparam_objid` varchar(255) NOT NULL,
  `stringvalue` varchar(255) NULL,
  `booleanvalue` int(11) NULL,
  `var_objid` varchar(50) NULL,
  `var_name` varchar(50) NULL,
  `expr` longtext,
  `exprtype` varchar(25) NULL,
  `pos` int(11) NULL,
  `obj_key` varchar(50) NULL,
  `obj_value` varchar(255) NULL,
  `listvalue` longtext,
  `lov` varchar(50) NULL,
  `rangeoption` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) NULL,
  `sortorder` int(11) NULL,
  `actionname` varchar(50) NULL,
  `domain` varchar(50) NULL,
  `actionclass` varchar(255) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(255) NOT NULL,
  `parentid` varchar(50) NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) NULL,
  `title` varchar(50) NULL,
  `datatype` varchar(50) NULL,
  `handler` varchar(50) NULL,
  `lookuphandler` varchar(50) NULL,
  `lookupkey` varchar(50) NULL,
  `lookupvalue` varchar(50) NULL,
  `vardatatype` varchar(50) NULL,
  `lovname` varchar(50) NULL,
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `fact_name` varchar(50) NULL,
  `fact_objid` varchar(50) NULL,
  `varname` varchar(50) NULL,
  `pos` int(11) NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) NULL,
  `dynamic_key` varchar(50) NULL,
  `dynamic_value` varchar(50) NULL,
  `notexist` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_fact_objid` (`fact_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `field_objid` varchar(255) NULL,
  `fieldname` varchar(50) NULL,
  `varname` varchar(50) NULL,
  `operator_caption` varchar(50) NULL,
  `operator_symbol` varchar(50) NULL,
  `usevar` int(11) NULL,
  `var_objid` varchar(50) NULL,
  `var_name` varchar(50) NULL,
  `decimalvalue` decimal(16,2) NULL,
  `intvalue` int(11) NULL,
  `stringvalue` varchar(255) NULL,
  `listvalue` longtext,
  `datevalue` date NULL,
  `pos` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `ruleid` varchar(50) NULL,
  `varname` varchar(50) NULL,
  `datatype` varchar(50) NULL,
  `pos` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`),
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) NULL,
  `factclass` varchar(50) NULL,
  `sortorder` int(11) NULL,
  `handler` varchar(50) NULL,
  `defaultvarname` varchar(25) NULL,
  `dynamic` int(11) NULL,
  `lookuphandler` varchar(50) NULL,
  `lookupkey` varchar(50) NULL,
  `lookupvalue` varchar(50) NULL,
  `lookupdatatype` varchar(50) NULL,
  `dynamicfieldname` varchar(50) NULL,
  `builtinconstraints` varchar(50) NULL,
  `domain` varchar(50) NULL,
  `factsuperclass` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(255) NOT NULL,
  `parentid` varchar(50) NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) NULL,
  `datatype` varchar(50) NULL,
  `sortorder` int(11) NULL,
  `handler` varchar(50) NULL,
  `lookuphandler` varchar(50) NULL,
  `lookupkey` varchar(50) NULL,
  `lookupvalue` varchar(50) NULL,
  `lookupdatatype` varchar(50) NULL,
  `multivalued` int(11) NULL,
  `required` int(11) NULL,
  `vardatatype` varchar(50) NULL,
  `lovname` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) NULL,
  `sortorder` int(11) NULL,
  PRIMARY KEY (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) NULL,
  `packagename` varchar(50) NULL,
  `domain` varchar(50) NULL,
  `role` varchar(50) NULL,
  `permission` varchar(50) NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`actiondef`),
  KEY `actiondef` (`actiondef`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`rulefact`),
  KEY `rulefact` (`rulefact`),
  CONSTRAINT `sys_ruleset_fact_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `title` longblob,
  `content` longtext,
  `category` varchar(20) NULL,
  `dtcreated` datetime NULL,
  `createdby` varchar(50) NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_securitygroup`
--

DROP TABLE IF EXISTS `sys_securitygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_securitygroup` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NULL,
  `usergroup_objid` varchar(50) NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_securitygroup_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_securitygroup_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_session`
--

DROP TABLE IF EXISTS `sys_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) NULL,
  `username` varchar(50) NULL,
  `clienttype` varchar(12) NULL,
  `accesstime` datetime NULL,
  `accessexpiry` datetime NULL,
  `timein` datetime NULL,
  PRIMARY KEY (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_session_log`
--

DROP TABLE IF EXISTS `sys_session_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_session_log` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) NULL,
  `username` varchar(50) NULL,
  `clienttype` varchar(12) NULL,
  `accesstime` datetime NULL,
  `accessexpiry` datetime NULL,
  `timein` datetime NULL,
  `timeout` datetime NULL,
  `state` varchar(10) NULL,
  PRIMARY KEY (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_timeout` (`timeout`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_terminal`
--

DROP TABLE IF EXISTS `sys_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_terminal` (
  `terminalid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `parentcode` varchar(50) NULL,
  `parenttype` varchar(50) NULL,
  `macaddress` varchar(50) NULL,
  `dtregistered` datetime NULL,
  `registeredby` varchar(50) NULL,
  `info` longtext,
  `state` int(11) NULL,
  PRIMARY KEY (`terminalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NULL,
  `dtcreated` datetime NULL,
  `createdby` varchar(50) NULL,
  `username` varchar(50) NULL,
  `pwd` varchar(50) NULL,
  `firstname` varchar(50) NULL,
  `lastname` varchar(50) NULL,
  `middlename` varchar(50) NULL,
  `name` varchar(50) NULL,
  `jobtitle` varchar(50) NULL,
  `pwdlogincount` int(11) NULL,
  `pwdexpirydate` datetime NULL,
  `usedpwds` longtext,
  `lockid` varchar(32) NULL,
  `txncode` varchar(10) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_username` (`username`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!50001 DROP VIEW IF EXISTS `sys_user_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sys_user_role` (
  `objid` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `domain` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `txncode` tinyint NOT NULL,
  `jobtitle` tinyint NOT NULL,
  `usergroupmemberid` tinyint NOT NULL,
  `usergroup_objid` tinyint NOT NULL,
  `respcenter_objid` tinyint NOT NULL,
  `respcenter_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NULL,
  `domain` varchar(25) NULL,
  `userclass` varchar(25) NULL,
  `orgclass` varchar(50) NULL,
  `role` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_usergroup_admin`
--

DROP TABLE IF EXISTS `sys_usergroup_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_admin` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) NULL,
  `user_objid` varchar(50) NULL,
  `user_username` varchar(50) NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NULL,
  `exclude` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `usergroupid` (`usergroupid`),
  KEY `FK_sys_usergroup_admin` (`user_objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_2` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_usergroup_member`
--

DROP TABLE IF EXISTS `sys_usergroup_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_member` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NULL,
  `usergroup_objid` varchar(50) NULL,
  `user_objid` varchar(50) NOT NULL,
  `user_username` varchar(50) NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `org_objid` varchar(50) NULL,
  `org_name` varchar(50) NULL,
  `org_orgclass` varchar(50) NULL,
  `securitygroup_objid` varchar(50) NULL,
  `exclude` varchar(255) NULL,
  `displayname` varchar(50) NULL,
  `jobtitle` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `usergroup_objid` (`usergroup_objid`),
  KEY `FK_sys_usergroup_member` (`user_objid`),
  KEY `FK_sys_usergroup_member_org` (`org_objid`),
  KEY `FK_sys_usergroup_member_securitygorup` (`securitygroup_objid`),
  KEY `ix_user_firstname` (`user_firstname`),
  KEY `ix_user_lastname_firstname` (`user_lastname`,`user_firstname`),
  KEY `ix_username` (`user_username`),
  CONSTRAINT `sys_usergroup_member_ibfk_1` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_2` FOREIGN KEY (`securitygroup_objid`) REFERENCES `sys_securitygroup` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_3` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_4` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_usergroup_permission`
--

DROP TABLE IF EXISTS `sys_usergroup_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_permission` (
  `objid` varchar(150) NOT NULL,
  `usergroup_objid` varchar(50) NULL,
  `object` varchar(25) NULL,
  `permission` varchar(25) NULL,
  `title` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_usergroup_permission_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_2` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) NULL,
  `datatype` varchar(15) NULL,
  `category` varchar(50) NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) NULL,
  `domain` varchar(50) NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_assignee`
--

DROP TABLE IF EXISTS `sys_wf_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_assignee` (
  `objid` varchar(50) NOT NULL,
  `processname` varchar(50) NULL,
  `state` varchar(50) NULL,
  `domain` varchar(50) NULL,
  `role` varchar(50) NULL,
  `user_objid` varchar(50) NULL,
  `expr` varchar(255) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL,
  `title` varchar(100) NULL,
  `nodetype` varchar(10) NULL,
  `idx` int(11) NULL,
  `salience` int(11) NULL,
  `domain` varchar(50) NULL,
  `role` varchar(255) NULL,
  `properties` text,
  `ui` text,
  `tracktime` int(11) NULL,
  PRIMARY KEY (`name`,`processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_subtask`
--

DROP TABLE IF EXISTS `sys_wf_subtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_subtask` (
  `objid` varchar(50) NOT NULL,
  `taskid` varchar(50) NULL,
  `requester_objid` varchar(50) NULL,
  `requester_name` varchar(100) NULL,
  `requestdate` datetime NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `remarks` varchar(255) NULL,
  `message` varchar(255) NULL,
  `action` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_wf_subtask_sys_wf_task` (`taskid`),
  CONSTRAINT `sys_wf_subtask_ibfk_1` FOREIGN KEY (`taskid`) REFERENCES `sys_wf_task` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_task`
--

DROP TABLE IF EXISTS `sys_wf_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_task` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `message` varchar(255) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) NULL,
  `eval` longtext,
  `properties` varchar(255) NULL,
  `permission` varchar(255) NULL,
  `caption` varchar(255) NULL,
  `ui` text,
  PRIMARY KEY (`parentid`,`processname`,`to`,`action`),
  CONSTRAINT `sys_wf_transition_ibfk_1` FOREIGN KEY (`parentid`, `processname`) REFERENCES `sys_wf_node` (`name`, `processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_wf_workitemtype`
--

DROP TABLE IF EXISTS `sys_wf_workitemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_workitemtype` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL,
  `title` varchar(100) NULL,
  `action` varchar(50) NULL,
  `domain` varchar(50) NULL,
  `role` varchar(50) NULL,
  `expr` varchar(255) NULL,
  `handler` varchar(50) NULL,
  PRIMARY KEY (`name`,`state`,`processname`),
  KEY `FK_sys_wf_subtasktype_node` (`state`,`processname`),
  CONSTRAINT `sys_wf_workitemtype_ibfk_1` FOREIGN KEY (`state`, `processname`) REFERENCES `sys_wf_node` (`name`, `processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treasury_variableinfo`
--

DROP TABLE IF EXISTS `treasury_variableinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasury_variableinfo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) NULL,
  `arrayvalues` longtext,
  `system` int(11) NULL,
  `sortorder` int(11) NULL,
  `category` varchar(100) NULL,
  `handler` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txnlog`
--

DROP TABLE IF EXISTS `txnlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnlog` (
  `objid` varchar(50) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `refid` longtext NOT NULL,
  `txndate` datetime NOT NULL,
  `action` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `remarks` longtext,
  `diff` longtext,
  `username` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txnlog_action` (`action`),
  KEY `ix_txnlog_ref` (`ref`),
  KEY `ix_txnlog_userid` (`userid`),
  KEY `ix_txnlog_useridaction` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txnref`
--

DROP TABLE IF EXISTS `txnref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnref` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `ix_txnref_refid` (`refid`),
  KEY `ix_txnref_objid` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `txnsignatory`
--

DROP TABLE IF EXISTS `txnsignatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnsignatory` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `personnelid` varchar(50) NULL,
  `type` varchar(25) NOT NULL,
  `caption` varchar(25) NULL,
  `name` varchar(200) NULL,
  `title` varchar(50) NULL,
  `dtsigned` datetime NULL,
  `seqno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_signatory_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variableinfo`
--

DROP TABLE IF EXISTS `variableinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variableinfo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) NULL,
  `arrayvalues` longtext,
  `system` int(11) NULL,
  `sortorder` int(11) NULL,
  `category` varchar(100) NULL,
  `handler` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `vw_account_income_summary`
--

DROP TABLE IF EXISTS `vw_account_income_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_account_income_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_income_summary` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `accttype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_incometarget`
--

DROP TABLE IF EXISTS `vw_account_incometarget`;
/*!50001 DROP VIEW IF EXISTS `vw_account_incometarget`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_incometarget` (
  `objid` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `target` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `item_objid` tinyint NOT NULL,
  `item_code` tinyint NOT NULL,
  `item_title` tinyint NOT NULL,
  `item_level` tinyint NOT NULL,
  `item_leftindex` tinyint NOT NULL,
  `group_objid` tinyint NOT NULL,
  `group_code` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `group_level` tinyint NOT NULL,
  `group_leftindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_item_mapping`
--

DROP TABLE IF EXISTS `vw_account_item_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_account_item_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_item_mapping` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_mapping`
--

DROP TABLE IF EXISTS `vw_account_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_account_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_mapping` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_af_control_detail`
--

DROP TABLE IF EXISTS `vw_af_control_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_af_control_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_af_control_detail` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `indexno` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `aftxnitemid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `txntype` tinyint NOT NULL,
  `receivedstartseries` tinyint NOT NULL,
  `receivedendseries` tinyint NOT NULL,
  `beginstartseries` tinyint NOT NULL,
  `beginendseries` tinyint NOT NULL,
  `issuedstartseries` tinyint NOT NULL,
  `issuedendseries` tinyint NOT NULL,
  `endingstartseries` tinyint NOT NULL,
  `endingendseries` tinyint NOT NULL,
  `qtyreceived` tinyint NOT NULL,
  `qtybegin` tinyint NOT NULL,
  `qtyissued` tinyint NOT NULL,
  `qtyending` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `issuedto_objid` tinyint NOT NULL,
  `issuedto_name` tinyint NOT NULL,
  `respcenter_objid` tinyint NOT NULL,
  `respcenter_name` tinyint NOT NULL,
  `prevdetailid` tinyint NOT NULL,
  `aftxnid` tinyint NOT NULL,
  `afid` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `saleprice` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `currentseries` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL,
  `cost` tinyint NOT NULL,
  `batchno` tinyint NOT NULL,
  `controlstate` tinyint NOT NULL,
  `qtybalance` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_af_inventory_summary`
--

DROP TABLE IF EXISTS `vw_af_inventory_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_af_inventory_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_af_inventory_summary` (
  `objid` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL,
  `countopen` tinyint NOT NULL,
  `countissued` tinyint NOT NULL,
  `countclosed` tinyint NOT NULL,
  `countsold` tinyint NOT NULL,
  `countprocessing` tinyint NOT NULL,
  `counthold` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_afunit`
--

DROP TABLE IF EXISTS `vw_afunit`;
/*!50001 DROP VIEW IF EXISTS `vw_afunit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_afunit` (
  `objid` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `usetype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `saleprice` tinyint NOT NULL,
  `interval` tinyint NOT NULL,
  `cashreceiptprintout` tinyint NOT NULL,
  `cashreceiptdetailprintout` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_assessment_notice`
--

DROP TABLE IF EXISTS `vw_assessment_notice`;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_assessment_notice` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `txnno` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `taxpayerid` tinyint NOT NULL,
  `taxpayername` tinyint NOT NULL,
  `taxpayeraddress` tinyint NOT NULL,
  `dtdelivered` tinyint NOT NULL,
  `receivedby` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `assessmentyear` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `titleno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_assessment_notice_item`
--

DROP TABLE IF EXISTS `vw_assessment_notice_item`;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_assessment_notice_item` (
  `objid` tinyint NOT NULL,
  `assessmentnoticeid` tinyint NOT NULL,
  `faasid` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `taxpayer_address` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `administrator_name` tinyint NOT NULL,
  `administrator_address` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `txntype_code` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalbmv` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `parcel` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `claimno` tinyint NOT NULL,
  `street` tinyint NOT NULL,
  `lguname` tinyint NOT NULL,
  `barangay` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `classification` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt_share`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt_share` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refitemid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt_share_payable` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `payableitemid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid_share`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid_share` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid_share_payable` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance_share`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance_share` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance_share_payable` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `hidefromlookup` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount_collectiongroup`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount_collectiongroup` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectiongroupid` tinyint NOT NULL,
  `generic` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount_collectiontype`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount_collectiontype` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectiontypeid` tinyint NOT NULL,
  `hasorg` tinyint NOT NULL,
  `hidefromlookup` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceiptpayment_noncash` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `account_objid` tinyint NOT NULL,
  `account_code` tinyint NOT NULL,
  `account_name` tinyint NOT NULL,
  `account_fund_objid` tinyint NOT NULL,
  `account_fund_name` tinyint NOT NULL,
  `account_bank` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `checkid` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `void_objid` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `receipt_receiptno` tinyint NOT NULL,
  `receipt_receiptdate` tinyint NOT NULL,
  `receipt_amount` tinyint NOT NULL,
  `receipt_collector_objid` tinyint NOT NULL,
  `receipt_collector_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_objid` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceiptpayment_noncash_liquidated`
--

DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceiptpayment_noncash_liquidated` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `account_objid` tinyint NOT NULL,
  `account_code` tinyint NOT NULL,
  `account_name` tinyint NOT NULL,
  `account_fund_objid` tinyint NOT NULL,
  `account_fund_name` tinyint NOT NULL,
  `account_bank` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `checkid` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `void_objid` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `receipt_receiptno` tinyint NOT NULL,
  `receipt_receiptdate` tinyint NOT NULL,
  `receipt_amount` tinyint NOT NULL,
  `receipt_collector_objid` tinyint NOT NULL,
  `receipt_collector_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_objid` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectionvoucher_objid` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `collectionvoucher_controldate` tinyint NOT NULL,
  `depositvoucherid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiongroup`
--

DROP TABLE IF EXISTS `vw_collectiongroup`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiongroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiongroup` (
  `objid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `sharing` tinyint NOT NULL,
  `orgid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiontype`
--

DROP TABLE IF EXISTS `vw_collectiontype`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiontype` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `handler` tinyint NOT NULL,
  `allowbatch` tinyint NOT NULL,
  `barcodekey` tinyint NOT NULL,
  `allowonline` tinyint NOT NULL,
  `allowoffline` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `queuesection` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `af_formtype` tinyint NOT NULL,
  `af_serieslength` tinyint NOT NULL,
  `af_denomination` tinyint NOT NULL,
  `af_baseunit` tinyint NOT NULL,
  `allowpaymentorder` tinyint NOT NULL,
  `allowkiosk` tinyint NOT NULL,
  `allowcreditmemo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiontype_account`
--

DROP TABLE IF EXISTS `vw_collectiontype_account`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiontype_account` (
  `objid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `collectiontypeid` tinyint NOT NULL,
  `tag` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectionvoucher_cashreceiptitem`
--

DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptitem`;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectionvoucher_cashreceiptitem` (
  `collectionvoucher_controldate` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `remarks` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectionvoucher_cashreceiptshare`
--

DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptshare`;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectionvoucher_cashreceiptshare` (
  `collectionvoucher_controldate` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `refacctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_deposit_fund_transfer`
--

DROP TABLE IF EXISTS `vw_deposit_fund_transfer`;
/*!50001 DROP VIEW IF EXISTS `vw_deposit_fund_transfer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_deposit_fund_transfer` (
  `objid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `todepositvoucherfundid` tinyint NOT NULL,
  `todepositvoucherfund_fund_objid` tinyint NOT NULL,
  `todepositvoucherfund_fund_code` tinyint NOT NULL,
  `todepositvoucherfund_fund_title` tinyint NOT NULL,
  `fromdepositvoucherfundid` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_objid` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_code` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entity_mapping`
--

DROP TABLE IF EXISTS `vw_entity_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_entity_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entity_mapping` (
  `objid` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_province` tinyint NOT NULL,
  `address_municipality` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entity_relation`
--

DROP TABLE IF EXISTS `vw_entity_relation`;
/*!50001 DROP VIEW IF EXISTS `vw_entity_relation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entity_relation` (
  `objid` tinyint NOT NULL,
  `ownerid` tinyint NOT NULL,
  `entityid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `relationship` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityindividual`
--

DROP TABLE IF EXISTS `vw_entityindividual`;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityindividual` (
  `objid` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `birthplace` tinyint NOT NULL,
  `citizenship` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `civilstatus` tinyint NOT NULL,
  `profession` tinyint NOT NULL,
  `tin` tinyint NOT NULL,
  `sss` tinyint NOT NULL,
  `height` tinyint NOT NULL,
  `weight` tinyint NOT NULL,
  `acr` tinyint NOT NULL,
  `religion` tinyint NOT NULL,
  `photo` tinyint NOT NULL,
  `thumbnail` tinyint NOT NULL,
  `profileid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `entityname` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL,
  `address_objid` tinyint NOT NULL,
  `address_text` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityindividual_lookup`
--

DROP TABLE IF EXISTS `vw_entityindividual_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityindividual_lookup` (
  `objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityrelation_lookup`
--

DROP TABLE IF EXISTS `vw_entityrelation_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_entityrelation_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityrelation_lookup` (
  `objid` tinyint NOT NULL,
  `entity_objid` tinyint NOT NULL,
  `relateto_objid` tinyint NOT NULL,
  `relation_objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_faas_lookup`
--

DROP TABLE IF EXISTS `vw_faas_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_faas_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_faas_lookup` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rpuid` tinyint NOT NULL,
  `utdno` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `effectivityyear` tinyint NOT NULL,
  `effectivityqtr` tinyint NOT NULL,
  `taxpayer_objid` tinyint NOT NULL,
  `owner_name` tinyint NOT NULL,
  `owner_address` tinyint NOT NULL,
  `prevtdno` tinyint NOT NULL,
  `cancelreason` tinyint NOT NULL,
  `cancelledbytdnos` tinyint NOT NULL,
  `lguid` tinyint NOT NULL,
  `realpropertyid` tinyint NOT NULL,
  `fullpin` tinyint NOT NULL,
  `originlguid` tinyint NOT NULL,
  `taxpayer_name` tinyint NOT NULL,
  `taxpayer_address` tinyint NOT NULL,
  `classification_code` tinyint NOT NULL,
  `classcode` tinyint NOT NULL,
  `classification_name` tinyint NOT NULL,
  `classname` tinyint NOT NULL,
  `ry` tinyint NOT NULL,
  `rputype` tinyint NOT NULL,
  `totalmv` tinyint NOT NULL,
  `totalav` tinyint NOT NULL,
  `totalareasqm` tinyint NOT NULL,
  `totalareaha` tinyint NOT NULL,
  `barangayid` tinyint NOT NULL,
  `cadastrallotno` tinyint NOT NULL,
  `blockno` tinyint NOT NULL,
  `surveyno` tinyint NOT NULL,
  `pin` tinyint NOT NULL,
  `barangay_name` tinyint NOT NULL,
  `trackingno` tinyint NOT NULL,
  `section` tinyint NOT NULL,
  `parcel` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_fund`
--

DROP TABLE IF EXISTS `vw_fund`;
/*!50001 DROP VIEW IF EXISTS `vw_fund`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_fund` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `special` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `depositoryfundid` tinyint NOT NULL,
  `group_objid` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `group_indexno` tinyint NOT NULL,
  `depositoryfund_objid` tinyint NOT NULL,
  `depositoryfund_state` tinyint NOT NULL,
  `depositoryfund_code` tinyint NOT NULL,
  `depositoryfund_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_income_ledger`
--

DROP TABLE IF EXISTS `vw_income_ledger`;
/*!50001 DROP VIEW IF EXISTS `vw_income_ledger`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_income_ledger` (
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `itemacctid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `jevid` tinyint NOT NULL,
  `objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_income_summary`
--

DROP TABLE IF EXISTS `vw_income_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_income_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_income_summary` (
  `refid` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `refyear` tinyint NOT NULL,
  `refmonth` tinyint NOT NULL,
  `refqtr` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittanceyear` tinyint NOT NULL,
  `remittancemonth` tinyint NOT NULL,
  `remittanceqtr` tinyint NOT NULL,
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `liquidationyear` tinyint NOT NULL,
  `liquidationmonth` tinyint NOT NULL,
  `liquidationqtr` tinyint NOT NULL,
  `fundgroupid` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL,
  `itemtype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_landtax_lgu_account_mapping`
--

DROP TABLE IF EXISTS `vw_landtax_lgu_account_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_lgu_account_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_landtax_lgu_account_mapping` (
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `org_class` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `parent_code` tinyint NOT NULL,
  `parent_title` tinyint NOT NULL,
  `item_objid` tinyint NOT NULL,
  `item_code` tinyint NOT NULL,
  `item_title` tinyint NOT NULL,
  `item_fund_objid` tinyint NOT NULL,
  `item_fund_code` tinyint NOT NULL,
  `item_fund_title` tinyint NOT NULL,
  `item_type` tinyint NOT NULL,
  `item_tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt` (
  `remittance_objid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formtypeindexno` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `totalnoncash` tinyint NOT NULL,
  `totalcash` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `payer_objid` tinyint NOT NULL,
  `payer_name` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `collector_name` tinyint NOT NULL,
  `collector_title` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt_af`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt_af`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_af`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt_af` (
  `remittanceid` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `fromreceiptno` tinyint NOT NULL,
  `toreceiptno` tinyint NOT NULL,
  `fromseries` tinyint NOT NULL,
  `toseries` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `qtyvoided` tinyint NOT NULL,
  `voidamt` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `cancelledamt` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt_afsummary`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt_afsummary`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt_afsummary` (
  `objid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `fromreceiptno` tinyint NOT NULL,
  `toreceiptno` tinyint NOT NULL,
  `fromseries` tinyint NOT NULL,
  `toseries` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `qtyvoided` tinyint NOT NULL,
  `voidamt` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `cancelledamt` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptitem`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptitem`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptitem` (
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptpayment_noncash`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptpayment_noncash` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `bankid` tinyint NOT NULL,
  `bank_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptshare`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptshare`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptshare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptshare` (
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `refacctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rptledger_avdifference`
--

DROP TABLE IF EXISTS `vw_rptledger_avdifference`;
/*!50001 DROP VIEW IF EXISTS `vw_rptledger_avdifference`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rptledger_avdifference` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `rptledgerid` tinyint NOT NULL,
  `faasid` tinyint NOT NULL,
  `tdno` tinyint NOT NULL,
  `txntype_objid` tinyint NOT NULL,
  `classification_objid` tinyint NOT NULL,
  `actualuse_objid` tinyint NOT NULL,
  `taxable` tinyint NOT NULL,
  `backtax` tinyint NOT NULL,
  `fromyear` tinyint NOT NULL,
  `fromqtr` tinyint NOT NULL,
  `toyear` tinyint NOT NULL,
  `toqtr` tinyint NOT NULL,
  `assessedvalue` tinyint NOT NULL,
  `systemcreated` tinyint NOT NULL,
  `reclassed` tinyint NOT NULL,
  `idleland` tinyint NOT NULL,
  `taxdifference` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_rptpayment_item_detail`
--

DROP TABLE IF EXISTS `vw_rptpayment_item_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_rptpayment_item_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_rptpayment_item_detail` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `rptledgerfaasid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `qtr` tinyint NOT NULL,
  `revperiod` tinyint NOT NULL,
  `basic` tinyint NOT NULL,
  `basicint` tinyint NOT NULL,
  `basicdisc` tinyint NOT NULL,
  `basicdp` tinyint NOT NULL,
  `basicnet` tinyint NOT NULL,
  `basicidle` tinyint NOT NULL,
  `basicidleint` tinyint NOT NULL,
  `basicidledisc` tinyint NOT NULL,
  `basicidledp` tinyint NOT NULL,
  `sef` tinyint NOT NULL,
  `sefint` tinyint NOT NULL,
  `sefdisc` tinyint NOT NULL,
  `sefdp` tinyint NOT NULL,
  `sefnet` tinyint NOT NULL,
  `firecode` tinyint NOT NULL,
  `sh` tinyint NOT NULL,
  `shint` tinyint NOT NULL,
  `shdisc` tinyint NOT NULL,
  `shdp` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `partialled` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_txn_log`
--

DROP TABLE IF EXISTS `vw_txn_log`;
/*!50001 DROP VIEW IF EXISTS `vw_txn_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_txn_log` (
  `userid` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `ref` tinyint NOT NULL,
  `action` tinyint NOT NULL,
  `cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workflowstate`
--

DROP TABLE IF EXISTS `workflowstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowstate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `txndate` datetime NULL,
  `userid` varchar(50) NULL,
  `username` varchar(100) NULL,
  PRIMARY KEY (`objid`,`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `sys_user_role`
--

/*!50001 DROP TABLE IF EXISTS `sys_user_role`*/;
/*!50001 DROP VIEW IF EXISTS `sys_user_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sys_user_role` AS select `u`.`objid` AS `objid`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`middlename` AS `middlename`,`u`.`username` AS `username`,concat(`u`.`lastname`,', ',`u`.`firstname`,(case when isnull(`u`.`middlename`) then '' else concat(' ',`u`.`middlename`) end)) AS `name`,`ug`.`role` AS `role`,`ug`.`domain` AS `domain`,`ugm`.`org_objid` AS `orgid`,`u`.`txncode` AS `txncode`,`u`.`jobtitle` AS `jobtitle`,`ugm`.`objid` AS `usergroupmemberid`,`ugm`.`usergroup_objid` AS `usergroup_objid`,`ugm`.`org_objid` AS `respcenter_objid`,`ugm`.`org_name` AS `respcenter_name` from ((`sys_usergroup_member` `ugm` join `sys_usergroup` `ug` on((`ug`.`objid` = `ugm`.`usergroup_objid`))) join `sys_user` `u` on((`u`.`objid` = `ugm`.`user_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_income_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_income_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_income_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_income_summary` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`inc`.`amount` AS `amount`,`inc`.`acctid` AS `acctid`,`inc`.`fundid` AS `fundid`,`inc`.`collectorid` AS `collectorid`,`inc`.`refdate` AS `refdate`,`inc`.`remittancedate` AS `remittancedate`,`inc`.`liquidationdate` AS `liquidationdate`,`ia`.`type` AS `accttype` from (((`account_item_mapping` `aim` join `account` `a` on((`a`.`objid` = `aim`.`acctid`))) join `itemaccount` `ia` on((`ia`.`objid` = `aim`.`itemid`))) join `income_summary` `inc` on((`inc`.`acctid` = `ia`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_incometarget`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_incometarget`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_incometarget`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_incometarget` AS select `t`.`objid` AS `objid`,`t`.`itemid` AS `itemid`,`t`.`year` AS `year`,`t`.`target` AS `target`,`a`.`maingroupid` AS `maingroupid`,`a`.`objid` AS `item_objid`,`a`.`code` AS `item_code`,`a`.`title` AS `item_title`,`a`.`level` AS `item_level`,`a`.`leftindex` AS `item_leftindex`,`g`.`objid` AS `group_objid`,`g`.`code` AS `group_code`,`g`.`title` AS `group_title`,`g`.`level` AS `group_level`,`g`.`leftindex` AS `group_leftindex` from ((`account_incometarget` `t` join `account` `a` on((`a`.`objid` = `t`.`itemid`))) join `account` `g` on((`g`.`objid` = `a`.`groupid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_item_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_item_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_item_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_item_mapping` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`l`.`amount` AS `amount`,`l`.`fundid` AS `fundid`,`l`.`year` AS `year`,`l`.`month` AS `month`,`aim`.`itemid` AS `itemid`,`ia`.`code` AS `itemcode`,`ia`.`title` AS `itemtitle` from (((`account_item_mapping` `aim` join `account` `a` on((`a`.`objid` = `aim`.`acctid`))) join `itemaccount` `ia` on((`ia`.`objid` = `aim`.`itemid`))) join `vw_income_ledger` `l` on((`l`.`itemacctid` = `aim`.`itemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_mapping` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`m`.`itemid` AS `itemid`,`m`.`acctid` AS `acctid` from (`account_item_mapping` `m` join `account` `a` on((`a`.`objid` = `m`.`acctid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_af_control_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_af_control_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_af_control_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_af_control_detail` AS select `afd`.`objid` AS `objid`,`afd`.`state` AS `state`,`afd`.`controlid` AS `controlid`,`afd`.`indexno` AS `indexno`,`afd`.`refid` AS `refid`,`afd`.`aftxnitemid` AS `aftxnitemid`,`afd`.`refno` AS `refno`,`afd`.`reftype` AS `reftype`,`afd`.`refdate` AS `refdate`,`afd`.`txndate` AS `txndate`,`afd`.`txntype` AS `txntype`,`afd`.`receivedstartseries` AS `receivedstartseries`,`afd`.`receivedendseries` AS `receivedendseries`,`afd`.`beginstartseries` AS `beginstartseries`,`afd`.`beginendseries` AS `beginendseries`,`afd`.`issuedstartseries` AS `issuedstartseries`,`afd`.`issuedendseries` AS `issuedendseries`,`afd`.`endingstartseries` AS `endingstartseries`,`afd`.`endingendseries` AS `endingendseries`,`afd`.`qtyreceived` AS `qtyreceived`,`afd`.`qtybegin` AS `qtybegin`,`afd`.`qtyissued` AS `qtyissued`,`afd`.`qtyending` AS `qtyending`,`afd`.`qtycancelled` AS `qtycancelled`,`afd`.`remarks` AS `remarks`,`afd`.`issuedto_objid` AS `issuedto_objid`,`afd`.`issuedto_name` AS `issuedto_name`,`afd`.`respcenter_objid` AS `respcenter_objid`,`afd`.`respcenter_name` AS `respcenter_name`,`afd`.`prevdetailid` AS `prevdetailid`,`afd`.`aftxnid` AS `aftxnid`,`afc`.`afid` AS `afid`,`afc`.`unit` AS `unit`,`af`.`formtype` AS `formtype`,`af`.`denomination` AS `denomination`,`af`.`serieslength` AS `serieslength`,`afu`.`qty` AS `qty`,`afu`.`saleprice` AS `saleprice`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`currentseries` AS `currentseries`,`afc`.`stubno` AS `stubno`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix`,`afc`.`cost` AS `cost`,`afc`.`batchno` AS `batchno`,`afc`.`state` AS `controlstate`,`afd`.`qtyending` AS `qtybalance` from (((`af_control_detail` `afd` join `af_control` `afc` on((`afc`.`objid` = `afd`.`controlid`))) join `af` on((`af`.`objid` = `afc`.`afid`))) join `afunit` `afu` on(((`afu`.`itemid` = `af`.`objid`) and (`afu`.`unit` = `afc`.`unit`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_af_inventory_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_af_inventory_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_af_inventory_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_af_inventory_summary` AS select `af`.`objid` AS `objid`,`af`.`title` AS `title`,`u`.`unit` AS `unit`,`af`.`formtype` AS `formtype`,(case when (`af`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'OPEN'))) AS `countopen`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'ISSUED'))) AS `countissued`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'ISSUED') and (`af_control`.`currentseries` > `af_control`.`endseries`))) AS `countclosed`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'SOLD'))) AS `countsold`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'PROCESSING'))) AS `countprocessing`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'HOLD'))) AS `counthold` from (`af` join `afunit` `u`) where (`af`.`objid` = `u`.`itemid`) order by (case when (`af`.`formtype` = 'serial') then 0 else 1 end),`af`.`objid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_afunit`
--

/*!50001 DROP TABLE IF EXISTS `vw_afunit`*/;
/*!50001 DROP VIEW IF EXISTS `vw_afunit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afunit` AS select `u`.`objid` AS `objid`,`af`.`title` AS `title`,`af`.`usetype` AS `usetype`,`af`.`serieslength` AS `serieslength`,`af`.`system` AS `system`,`af`.`denomination` AS `denomination`,`af`.`formtype` AS `formtype`,`u`.`itemid` AS `itemid`,`u`.`unit` AS `unit`,`u`.`qty` AS `qty`,`u`.`saleprice` AS `saleprice`,`u`.`interval` AS `interval`,`u`.`cashreceiptprintout` AS `cashreceiptprintout`,`u`.`cashreceiptdetailprintout` AS `cashreceiptdetailprintout` from (`afunit` `u` join `af` on((`af`.`objid` = `u`.`itemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_assessment_notice`
--

/*!50001 DROP TABLE IF EXISTS `vw_assessment_notice`*/;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assessment_notice` AS select `a`.`objid` AS `objid`,`a`.`state` AS `state`,`a`.`txnno` AS `txnno`,`a`.`txndate` AS `txndate`,`a`.`taxpayerid` AS `taxpayerid`,`a`.`taxpayername` AS `taxpayername`,`a`.`taxpayeraddress` AS `taxpayeraddress`,`a`.`dtdelivered` AS `dtdelivered`,`a`.`receivedby` AS `receivedby`,`a`.`remarks` AS `remarks`,`a`.`assessmentyear` AS `assessmentyear`,`a`.`administrator_name` AS `administrator_name`,`a`.`administrator_address` AS `administrator_address`,`fl`.`tdno` AS `tdno`,`fl`.`displaypin` AS `fullpin`,`fl`.`cadastrallotno` AS `cadastrallotno`,`fl`.`titleno` AS `titleno` from ((`assessmentnotice` `a` join `assessmentnoticeitem` `i` on((`a`.`objid` = `i`.`assessmentnoticeid`))) join `faas_list` `fl` on((`i`.`faasid` = `fl`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_assessment_notice_item`
--

/*!50001 DROP TABLE IF EXISTS `vw_assessment_notice_item`*/;
/*!50001 DROP VIEW IF EXISTS `vw_assessment_notice_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assessment_notice_item` AS select `ni`.`objid` AS `objid`,`ni`.`assessmentnoticeid` AS `assessmentnoticeid`,`f`.`objid` AS `faasid`,`f`.`effectivityyear` AS `effectivityyear`,`f`.`effectivityqtr` AS `effectivityqtr`,`f`.`tdno` AS `tdno`,`f`.`taxpayer_objid` AS `taxpayer_objid`,`e`.`name` AS `taxpayer_name`,`e`.`address_text` AS `taxpayer_address`,`f`.`owner_name` AS `owner_name`,`f`.`owner_address` AS `owner_address`,`f`.`administrator_name` AS `administrator_name`,`f`.`administrator_address` AS `administrator_address`,`f`.`rpuid` AS `rpuid`,`f`.`lguid` AS `lguid`,`f`.`txntype_objid` AS `txntype_objid`,`ft`.`displaycode` AS `txntype_code`,`rpu`.`rputype` AS `rputype`,`rpu`.`ry` AS `ry`,`rpu`.`fullpin` AS `fullpin`,`rpu`.`taxable` AS `taxable`,`rpu`.`totalareaha` AS `totalareaha`,`rpu`.`totalareasqm` AS `totalareasqm`,`rpu`.`totalbmv` AS `totalbmv`,`rpu`.`totalmv` AS `totalmv`,`rpu`.`totalav` AS `totalav`,`rp`.`section` AS `section`,`rp`.`parcel` AS `parcel`,`rp`.`surveyno` AS `surveyno`,`rp`.`cadastrallotno` AS `cadastrallotno`,`rp`.`blockno` AS `blockno`,`rp`.`claimno` AS `claimno`,`rp`.`street` AS `street`,`o`.`name` AS `lguname`,`b`.`name` AS `barangay`,`pc`.`code` AS `classcode`,`pc`.`name` AS `classification` from (((((((((`assessmentnoticeitem` `ni` join `faas` `f` on((`ni`.`faasid` = `f`.`objid`))) left join `txnsignatory` `ts` on(((`ts`.`refid` = `f`.`objid`) and (`ts`.`type` = 'APPROVER')))) join `rpu` on((`f`.`rpuid` = `rpu`.`objid`))) join `propertyclassification` `pc` on((`rpu`.`classification_objid` = `pc`.`objid`))) join `realproperty` `rp` on((`f`.`realpropertyid` = `rp`.`objid`))) join `barangay` `b` on((`rp`.`barangayid` = `b`.`objid`))) join `sys_org` `o` on((`f`.`lguid` = `o`.`objid`))) join `entity` `e` on((`f`.`taxpayer_objid` = `e`.`objid`))) join `faas_txntype` `ft` on((`f`.`txntype_objid` = `ft`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt` AS select `c`.`objid` AS `objid`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`ci`.`amount` AS `dr`,0.0 AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt_share` AS select `c`.`objid` AS `objid`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,0.0 AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`cs`.`refitem_objid` AS `refitemid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt_share_payable` AS select `c`.`objid` AS `objid`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,0.0 AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`cs`.`payableitem_objid` AS `payableitemid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid` AS select `v`.`objid` AS `objid`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`ci`.`amount` AS `dr`,(case when isnull(`r`.`liquidatingofficer_objid`) then 0.0 when (`v`.`txndate` > `r`.`dtposted`) then `ci`.`amount` else 0.0 end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid_share` AS select `v`.`objid` AS `objid`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,(case when isnull(`r`.`liquidatingofficer_objid`) then 0.0 when (`v`.`txndate` > `r`.`dtposted`) then `cs`.`amount` else 0.0 end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid_share_payable` AS select `v`.`objid` AS `objid`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,(case when isnull(`r`.`liquidatingofficer_objid`) then 0.0 when (`v`.`txndate` > `r`.`dtposted`) then `cs`.`amount` else 0.0 end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance` AS select `r`.`objid` AS `objid`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,0.0 AS `dr`,`ci`.`amount` AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance_share` AS select `r`.`objid` AS `objid`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ia`.`fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,0.0 AS `dr`,`cs`.`amount` AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance_share_payable` AS select `r`.`objid` AS `objid`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ia`.`fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,0.0 AS `dr`,`cs`.`amount` AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount` AS select `itemaccount`.`objid` AS `objid`,`itemaccount`.`state` AS `state`,`itemaccount`.`code` AS `code`,`itemaccount`.`title` AS `title`,`itemaccount`.`description` AS `description`,`itemaccount`.`type` AS `type`,`itemaccount`.`fund_objid` AS `fund_objid`,`itemaccount`.`fund_code` AS `fund_code`,`itemaccount`.`fund_title` AS `fund_title`,`itemaccount`.`defaultvalue` AS `defaultvalue`,`itemaccount`.`valuetype` AS `valuetype`,`itemaccount`.`sortorder` AS `sortorder`,`itemaccount`.`org_objid` AS `orgid`,`itemaccount`.`hidefromlookup` AS `hidefromlookup` from `itemaccount` where ((`itemaccount`.`state` = 'ACTIVE') and (`itemaccount`.`type` in ('REVENUE','NONREVENUE','PAYABLE')) and (ifnull(`itemaccount`.`generic`,0) = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount_collectiongroup`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount_collectiongroup` AS select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,(case when (`ca`.`defaultvalue` = 0) then `ia`.`defaultvalue` else `ca`.`defaultvalue` end) AS `defaultvalue`,(case when (`ca`.`defaultvalue` = 0) then `ia`.`valuetype` else `ca`.`valuetype` end) AS `valuetype`,`ca`.`sortorder` AS `sortorder`,`ia`.`org_objid` AS `orgid`,`ca`.`collectiongroupid` AS `collectiongroupid`,`ia`.`generic` AS `generic` from (`collectiongroup_account` `ca` join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount_collectiontype`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount_collectiontype` AS select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,`ca`.`defaultvalue` AS `defaultvalue`,(case when isnull(`ca`.`valuetype`) then 'ANY' else `ca`.`valuetype` end) AS `valuetype`,(case when isnull(`ca`.`sortorder`) then 0 else `ca`.`sortorder` end) AS `sortorder`,NULL AS `orgid`,`ca`.`collectiontypeid` AS `collectiontypeid`,0 AS `hasorg`,`ia`.`hidefromlookup` AS `hidefromlookup` from (((`collectiontype` `ct` join `collectiontype_account` `ca` on((`ca`.`collectiontypeid` = `ct`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) left join `collectiontype_org` `o` on((`o`.`collectiontypeid` = `ca`.`objid`))) where (isnull(`o`.`objid`) and (`ia`.`state` = 'ACTIVE') and (`ia`.`type` in ('REVENUE','NONREVENUE','PAYABLE'))) union all select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,`ca`.`defaultvalue` AS `defaultvalue`,(case when isnull(`ca`.`valuetype`) then 'ANY' else `ca`.`valuetype` end) AS `valuetype`,(case when isnull(`ca`.`sortorder`) then 0 else `ca`.`sortorder` end) AS `sortorder`,`o`.`org_objid` AS `orgid`,`ca`.`collectiontypeid` AS `collectiontypeid`,1 AS `hasorg`,`ia`.`hidefromlookup` AS `hidefromlookup` from (((`collectiontype` `ct` join `collectiontype_org` `o` on((`o`.`collectiontypeid` = `ct`.`objid`))) join `collectiontype_account` `ca` on((`ca`.`collectiontypeid` = `ct`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) where ((`ia`.`state` = 'ACTIVE') and (`ia`.`type` in ('REVENUE','NONREVENUE','PAYABLE'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceiptpayment_noncash`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceiptpayment_noncash` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`amount` AS `amount`,`nc`.`particulars` AS `particulars`,`nc`.`account_objid` AS `account_objid`,`nc`.`account_code` AS `account_code`,`nc`.`account_name` AS `account_name`,`nc`.`account_fund_objid` AS `account_fund_objid`,`nc`.`account_fund_name` AS `account_fund_name`,`nc`.`account_bank` AS `account_bank`,`nc`.`fund_objid` AS `fund_objid`,`nc`.`refid` AS `refid`,`nc`.`checkid` AS `checkid`,`nc`.`voidamount` AS `voidamount`,`v`.`objid` AS `void_objid`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,`c`.`receiptno` AS `receipt_receiptno`,`c`.`receiptdate` AS `receipt_receiptdate`,`c`.`amount` AS `receipt_amount`,`c`.`collector_objid` AS `receipt_collector_objid`,`c`.`collector_name` AS `receipt_collector_name`,`c`.`remittanceid` AS `remittanceid`,`rem`.`objid` AS `remittance_objid`,`rem`.`controlno` AS `remittance_controlno`,`rem`.`controldate` AS `remittance_controldate` from (((`cashreceiptpayment_noncash` `nc` join `cashreceipt` `c` on((`c`.`objid` = `nc`.`receiptid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) left join `remittance` `rem` on((`rem`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceiptpayment_noncash_liquidated`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceiptpayment_noncash_liquidated` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`amount` AS `amount`,`nc`.`particulars` AS `particulars`,`nc`.`account_objid` AS `account_objid`,`nc`.`account_code` AS `account_code`,`nc`.`account_name` AS `account_name`,`nc`.`account_fund_objid` AS `account_fund_objid`,`nc`.`account_fund_name` AS `account_fund_name`,`nc`.`account_bank` AS `account_bank`,`nc`.`fund_objid` AS `fund_objid`,`nc`.`refid` AS `refid`,`nc`.`checkid` AS `checkid`,`nc`.`voidamount` AS `voidamount`,`v`.`objid` AS `void_objid`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,`c`.`receiptno` AS `receipt_receiptno`,`c`.`receiptdate` AS `receipt_receiptdate`,`c`.`amount` AS `receipt_amount`,`c`.`collector_objid` AS `receipt_collector_objid`,`c`.`collector_name` AS `receipt_collector_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`objid` AS `remittance_objid`,`r`.`controlno` AS `remittance_controlno`,`r`.`controldate` AS `remittance_controldate`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`cv`.`objid` AS `collectionvoucher_objid`,`cv`.`controlno` AS `collectionvoucher_controlno`,`cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`depositvoucherid` AS `depositvoucherid` from ((((`collectionvoucher` `cv` join `remittance` `r` on((`r`.`collectionvoucherid` = `cv`.`objid`))) join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on((`nc`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiongroup`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiongroup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiongroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiongroup` AS select `cg`.`objid` AS `objid`,`cg`.`name` AS `name`,`cg`.`sharing` AS `sharing`,NULL AS `orgid` from (`collectiongroup` `cg` left join `collectiongroup_org` `co` on((`co`.`collectiongroupid` = `cg`.`objid`))) where ((`cg`.`state` = 'ACTIVE') and isnull(`co`.`objid`)) union select `cg`.`objid` AS `objid`,`cg`.`name` AS `name`,`cg`.`sharing` AS `sharing`,`co`.`org_objid` AS `orgid` from (`collectiongroup` `cg` join `collectiongroup_org` `co` on((`co`.`collectiongroupid` = `cg`.`objid`))) where (`cg`.`state` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiontype`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiontype`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiontype` AS select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`name` AS `name`,`c`.`title` AS `title`,`c`.`formno` AS `formno`,`c`.`handler` AS `handler`,`c`.`allowbatch` AS `allowbatch`,`c`.`barcodekey` AS `barcodekey`,`c`.`allowonline` AS `allowonline`,`c`.`allowoffline` AS `allowoffline`,`c`.`sortorder` AS `sortorder`,`o`.`org_objid` AS `orgid`,`c`.`fund_objid` AS `fund_objid`,`c`.`fund_title` AS `fund_title`,`c`.`category` AS `category`,`c`.`queuesection` AS `queuesection`,`c`.`system` AS `system`,`af`.`formtype` AS `af_formtype`,`af`.`serieslength` AS `af_serieslength`,`af`.`denomination` AS `af_denomination`,`af`.`baseunit` AS `af_baseunit`,`c`.`allowpaymentorder` AS `allowpaymentorder`,`c`.`allowkiosk` AS `allowkiosk`,`c`.`allowcreditmemo` AS `allowcreditmemo` from ((`collectiontype_org` `o` join `collectiontype` `c` on((`c`.`objid` = `o`.`collectiontypeid`))) join `af` on((`af`.`objid` = `c`.`formno`))) where (`c`.`state` = 'ACTIVE') union select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`name` AS `name`,`c`.`title` AS `title`,`c`.`formno` AS `formno`,`c`.`handler` AS `handler`,`c`.`allowbatch` AS `allowbatch`,`c`.`barcodekey` AS `barcodekey`,`c`.`allowonline` AS `allowonline`,`c`.`allowoffline` AS `allowoffline`,`c`.`sortorder` AS `sortorder`,NULL AS `orgid`,`c`.`fund_objid` AS `fund_objid`,`c`.`fund_title` AS `fund_title`,`c`.`category` AS `category`,`c`.`queuesection` AS `queuesection`,`c`.`system` AS `system`,`af`.`formtype` AS `af_formtype`,`af`.`serieslength` AS `af_serieslength`,`af`.`denomination` AS `af_denomination`,`af`.`baseunit` AS `af_baseunit`,`c`.`allowpaymentorder` AS `allowpaymentorder`,`c`.`allowkiosk` AS `allowkiosk`,`c`.`allowcreditmemo` AS `allowcreditmemo` from ((`collectiontype` `c` join `af` on((`af`.`objid` = `c`.`formno`))) left join `collectiontype_org` `o` on((`c`.`objid` = `o`.`collectiontypeid`))) where ((`c`.`state` = 'ACTIVE') and isnull(`o`.`objid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiontype_account`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiontype_account`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiontype_account` AS select `ia`.`objid` AS `objid`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`fund_objid` AS `fund_objid`,`fund`.`code` AS `fund_code`,`fund`.`title` AS `fund_title`,`cta`.`collectiontypeid` AS `collectiontypeid`,`cta`.`tag` AS `tag`,`cta`.`valuetype` AS `valuetype`,`cta`.`defaultvalue` AS `defaultvalue` from ((`collectiontype_account` `cta` join `itemaccount` `ia` on((`ia`.`objid` = `cta`.`account_objid`))) join `fund` on((`fund`.`objid` = `ia`.`fund_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectionvoucher_cashreceiptitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectionvoucher_cashreceiptitem` AS select `cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`controlno` AS `collectionvoucher_controlno`,`v`.`remittanceid` AS `remittanceid`,`v`.`remittance_controldate` AS `remittance_controldate`,`v`.`remittance_controlno` AS `remittance_controlno`,`v`.`collectionvoucherid` AS `collectionvoucherid`,`v`.`collectiontype_objid` AS `collectiontype_objid`,`v`.`collectiontype_name` AS `collectiontype_name`,`v`.`org_objid` AS `org_objid`,`v`.`org_name` AS `org_name`,`v`.`formtype` AS `formtype`,`v`.`formno` AS `formno`,`v`.`formtypeindex` AS `formtypeindex`,`v`.`receiptid` AS `receiptid`,`v`.`receiptdate` AS `receiptdate`,`v`.`receiptno` AS `receiptno`,`v`.`controlid` AS `controlid`,`v`.`series` AS `series`,`v`.`paidby` AS `paidby`,`v`.`paidbyaddress` AS `paidbyaddress`,`v`.`collectorid` AS `collectorid`,`v`.`collectorname` AS `collectorname`,`v`.`collectortitle` AS `collectortitle`,`v`.`fundid` AS `fundid`,`v`.`acctid` AS `acctid`,`v`.`acctcode` AS `acctcode`,`v`.`acctname` AS `acctname`,`v`.`amount` AS `amount`,`v`.`voided` AS `voided`,`v`.`voidamount` AS `voidamount`,`v`.`remarks` AS `remarks` from (`collectionvoucher` `cv` join `vw_remittance_cashreceiptitem` `v` on((`v`.`collectionvoucherid` = `cv`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectionvoucher_cashreceiptshare`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectionvoucher_cashreceiptshare` AS select `cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`controlno` AS `collectionvoucher_controlno`,`v`.`remittanceid` AS `remittanceid`,`v`.`remittance_controldate` AS `remittance_controldate`,`v`.`remittance_controlno` AS `remittance_controlno`,`v`.`collectionvoucherid` AS `collectionvoucherid`,`v`.`formno` AS `formno`,`v`.`formtype` AS `formtype`,`v`.`receiptid` AS `receiptid`,`v`.`receiptdate` AS `receiptdate`,`v`.`receiptno` AS `receiptno`,`v`.`paidby` AS `paidby`,`v`.`paidbyaddress` AS `paidbyaddress`,`v`.`org_objid` AS `org_objid`,`v`.`org_name` AS `org_name`,`v`.`collectiontype_objid` AS `collectiontype_objid`,`v`.`collectiontype_name` AS `collectiontype_name`,`v`.`collectorid` AS `collectorid`,`v`.`collectorname` AS `collectorname`,`v`.`collectortitle` AS `collectortitle`,`v`.`refacctid` AS `refacctid`,`v`.`fundid` AS `fundid`,`v`.`acctid` AS `acctid`,`v`.`acctcode` AS `acctcode`,`v`.`acctname` AS `acctname`,`v`.`amount` AS `amount`,`v`.`voided` AS `voided`,`v`.`voidamount` AS `voidamount` from (`collectionvoucher` `cv` join `vw_remittance_cashreceiptshare` `v` on((`v`.`collectionvoucherid` = `cv`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_deposit_fund_transfer`
--

/*!50001 DROP TABLE IF EXISTS `vw_deposit_fund_transfer`*/;
/*!50001 DROP VIEW IF EXISTS `vw_deposit_fund_transfer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_deposit_fund_transfer` AS select `dft`.`objid` AS `objid`,`dft`.`amount` AS `amount`,`dft`.`todepositvoucherfundid` AS `todepositvoucherfundid`,`tof`.`objid` AS `todepositvoucherfund_fund_objid`,`tof`.`code` AS `todepositvoucherfund_fund_code`,`tof`.`title` AS `todepositvoucherfund_fund_title`,`dft`.`fromdepositvoucherfundid` AS `fromdepositvoucherfundid`,`fromf`.`objid` AS `fromdepositvoucherfund_fund_objid`,`fromf`.`code` AS `fromdepositvoucherfund_fund_code`,`fromf`.`title` AS `fromdepositvoucherfund_fund_title` from ((((`deposit_fund_transfer` `dft` join `depositvoucher_fund` `todv` on((`dft`.`todepositvoucherfundid` = `todv`.`objid`))) join `fund` `tof` on((`todv`.`fundid` = `tof`.`objid`))) join `depositvoucher_fund` `fromdv` on((`dft`.`fromdepositvoucherfundid` = `fromdv`.`objid`))) join `fund` `fromf` on((`fromdv`.`fundid` = `fromf`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entity_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_entity_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entity_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entity_mapping` AS select `r`.`objid` AS `objid`,`r`.`parent_objid` AS `parent_objid`,`r`.`org_objid` AS `org_objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `address_text`,`a`.`province` AS `address_province`,`a`.`municipality` AS `address_municipality` from ((((`entity_mapping` `r` join `entity` `e` on((`r`.`objid` = `e`.`objid`))) left join `entity_address` `a` on((`e`.`address_objid` = `a`.`objid`))) left join `sys_org` `b` on((`a`.`barangay_objid` = `b`.`objid`))) left join `sys_org` `m` on((`b`.`parent_objid` = `m`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entity_relation`
--

/*!50001 DROP TABLE IF EXISTS `vw_entity_relation`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entity_relation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entity_relation` AS select `er`.`objid` AS `objid`,`er`.`entity_objid` AS `ownerid`,`ei`.`objid` AS `entityid`,`ei`.`entityno` AS `entityno`,`ei`.`name` AS `name`,`ei`.`firstname` AS `firstname`,`ei`.`lastname` AS `lastname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`gender` AS `gender`,`er`.`relation_objid` AS `relationship` from (`entity_relation` `er` join `vw_entityindividual` `ei` on((`er`.`relateto_objid` = `ei`.`objid`))) union all select `er`.`objid` AS `objid`,`er`.`relateto_objid` AS `ownerid`,`ei`.`objid` AS `entityid`,`ei`.`entityno` AS `entityno`,`ei`.`name` AS `name`,`ei`.`firstname` AS `firstname`,`ei`.`lastname` AS `lastname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`gender` AS `gender`,(case when (`ei`.`gender` = 'M') then `et`.`inverse_male` when (`ei`.`gender` = 'F') then `et`.`inverse_female` else `et`.`inverse_any` end) AS `relationship` from ((`entity_relation` `er` join `vw_entityindividual` `ei` on((`er`.`entity_objid` = `ei`.`objid`))) join `entity_relation_type` `et` on((`er`.`relation_objid` = `et`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityindividual`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityindividual`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityindividual` AS select `ei`.`objid` AS `objid`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`birthplace` AS `birthplace`,`ei`.`citizenship` AS `citizenship`,`ei`.`gender` AS `gender`,`ei`.`civilstatus` AS `civilstatus`,`ei`.`profession` AS `profession`,`ei`.`tin` AS `tin`,`ei`.`sss` AS `sss`,`ei`.`height` AS `height`,`ei`.`weight` AS `weight`,`ei`.`acr` AS `acr`,`ei`.`religion` AS `religion`,`ei`.`photo` AS `photo`,`ei`.`thumbnail` AS `thumbnail`,`ei`.`profileid` AS `profileid`,`e`.`entityno` AS `entityno`,`e`.`type` AS `type`,`e`.`name` AS `name`,`e`.`entityname` AS `entityname`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno`,`e`.`address_objid` AS `address_objid`,`e`.`address_text` AS `address_text` from (`entityindividual` `ei` join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityindividual_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityindividual_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityindividual_lookup` AS select `e`.`objid` AS `objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `addresstext`,`e`.`type` AS `type`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`gender` AS `gender`,`ei`.`birthdate` AS `birthdate`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno` from (`entity` `e` join `entityindividual` `ei` on((`ei`.`objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityrelation_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityrelation_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityrelation_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityrelation_lookup` AS select `er`.`objid` AS `objid`,`er`.`entity_objid` AS `entity_objid`,`er`.`relateto_objid` AS `relateto_objid`,`er`.`relation_objid` AS `relation_objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `addresstext`,`e`.`type` AS `type`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`gender` AS `gender`,`ei`.`birthdate` AS `birthdate`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno` from ((`entity_relation` `er` join `entityindividual` `ei` on((`ei`.`objid` = `er`.`relateto_objid`))) join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_faas_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_faas_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_faas_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_faas_lookup` AS select `fl`.`objid` AS `objid`,`fl`.`state` AS `state`,`fl`.`rpuid` AS `rpuid`,`fl`.`utdno` AS `utdno`,`fl`.`tdno` AS `tdno`,`fl`.`txntype_objid` AS `txntype_objid`,`fl`.`effectivityyear` AS `effectivityyear`,`fl`.`effectivityqtr` AS `effectivityqtr`,`fl`.`taxpayer_objid` AS `taxpayer_objid`,`fl`.`owner_name` AS `owner_name`,`fl`.`owner_address` AS `owner_address`,`fl`.`prevtdno` AS `prevtdno`,`fl`.`cancelreason` AS `cancelreason`,`fl`.`cancelledbytdnos` AS `cancelledbytdnos`,`fl`.`lguid` AS `lguid`,`fl`.`realpropertyid` AS `realpropertyid`,`fl`.`displaypin` AS `fullpin`,`fl`.`originlguid` AS `originlguid`,`e`.`name` AS `taxpayer_name`,`e`.`address_text` AS `taxpayer_address`,`pc`.`code` AS `classification_code`,`pc`.`code` AS `classcode`,`pc`.`name` AS `classification_name`,`pc`.`name` AS `classname`,`fl`.`ry` AS `ry`,`fl`.`rputype` AS `rputype`,`fl`.`totalmv` AS `totalmv`,`fl`.`totalav` AS `totalav`,`fl`.`totalareasqm` AS `totalareasqm`,`fl`.`totalareaha` AS `totalareaha`,`fl`.`barangayid` AS `barangayid`,`fl`.`cadastrallotno` AS `cadastrallotno`,`fl`.`blockno` AS `blockno`,`fl`.`surveyno` AS `surveyno`,`fl`.`pin` AS `pin`,`fl`.`barangay` AS `barangay_name`,`fl`.`trackingno` AS `trackingno`,`rp`.`section` AS `section`,`rp`.`parcel` AS `parcel` from (((`faas_list` `fl` join `realproperty` `rp` on((`fl`.`realpropertyid` = `rp`.`objid`))) left join `propertyclassification` `pc` on((`fl`.`classification_objid` = `pc`.`objid`))) left join `entity` `e` on((`fl`.`taxpayer_objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_fund`
--

/*!50001 DROP TABLE IF EXISTS `vw_fund`*/;
/*!50001 DROP VIEW IF EXISTS `vw_fund`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_fund` AS select `f`.`objid` AS `objid`,`f`.`parentid` AS `parentid`,`f`.`state` AS `state`,`f`.`code` AS `code`,`f`.`title` AS `title`,`f`.`type` AS `type`,`f`.`special` AS `special`,`f`.`system` AS `system`,`f`.`groupid` AS `groupid`,`f`.`depositoryfundid` AS `depositoryfundid`,`g`.`objid` AS `group_objid`,`g`.`title` AS `group_title`,`g`.`indexno` AS `group_indexno`,`d`.`objid` AS `depositoryfund_objid`,`d`.`state` AS `depositoryfund_state`,`d`.`code` AS `depositoryfund_code`,`d`.`title` AS `depositoryfund_title` from ((`fund` `f` left join `fundgroup` `g` on((`g`.`objid` = `f`.`groupid`))) left join `fund` `d` on((`d`.`objid` = `f`.`depositoryfundid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_income_ledger`
--

/*!50001 DROP TABLE IF EXISTS `vw_income_ledger`*/;
/*!50001 DROP VIEW IF EXISTS `vw_income_ledger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income_ledger` AS select year(`jev`.`jevdate`) AS `year`,month(`jev`.`jevdate`) AS `month`,`jev`.`fundid` AS `fundid`,`l`.`itemacctid` AS `itemacctid`,`l`.`cr` AS `amount`,`l`.`jevid` AS `jevid`,`l`.`objid` AS `objid` from (`income_ledger` `l` join `jev` on((`jev`.`objid` = `l`.`jevid`))) union all select year(`jev`.`jevdate`) AS `year`,month(`jev`.`jevdate`) AS `month`,`jev`.`fundid` AS `fundid`,`l`.`refitemacctid` AS `itemacctid`,(`l`.`cr` - `l`.`dr`) AS `amount`,`l`.`jevid` AS `jevid`,`l`.`objid` AS `objid` from (`payable_ledger` `l` join `jev` on((`jev`.`objid` = `l`.`jevid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_income_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_income_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_income_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income_summary` AS select `inc`.`refid` AS `refid`,`inc`.`refdate` AS `refdate`,`inc`.`acctid` AS `acctid`,`inc`.`fundid` AS `fundid`,`inc`.`amount` AS `amount`,`inc`.`refno` AS `refno`,`inc`.`reftype` AS `reftype`,`inc`.`orgid` AS `orgid`,`inc`.`collectorid` AS `collectorid`,`inc`.`refyear` AS `refyear`,`inc`.`refmonth` AS `refmonth`,`inc`.`refqtr` AS `refqtr`,`inc`.`remittanceid` AS `remittanceid`,`inc`.`remittancedate` AS `remittancedate`,`inc`.`remittanceyear` AS `remittanceyear`,`inc`.`remittancemonth` AS `remittancemonth`,`inc`.`remittanceqtr` AS `remittanceqtr`,`inc`.`liquidationid` AS `liquidationid`,`inc`.`liquidationdate` AS `liquidationdate`,`inc`.`liquidationyear` AS `liquidationyear`,`inc`.`liquidationmonth` AS `liquidationmonth`,`inc`.`liquidationqtr` AS `liquidationqtr`,`fund`.`groupid` AS `fundgroupid`,`ia`.`objid` AS `itemid`,`ia`.`code` AS `itemcode`,`ia`.`title` AS `itemtitle`,`ia`.`type` AS `itemtype` from ((`income_summary` `inc` join `fund` on((`fund`.`objid` = `inc`.`fundid`))) join `itemaccount` `ia` on((`ia`.`objid` = `inc`.`acctid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_landtax_lgu_account_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_landtax_lgu_account_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_landtax_lgu_account_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_landtax_lgu_account_mapping` AS select `ia`.`org_objid` AS `org_objid`,`ia`.`org_name` AS `org_name`,`o`.`orgclass` AS `org_class`,`p`.`objid` AS `parent_objid`,`p`.`code` AS `parent_code`,`p`.`title` AS `parent_title`,`ia`.`objid` AS `item_objid`,`ia`.`code` AS `item_code`,`ia`.`title` AS `item_title`,`ia`.`fund_objid` AS `item_fund_objid`,`ia`.`fund_code` AS `item_fund_code`,`ia`.`fund_title` AS `item_fund_title`,`ia`.`type` AS `item_type`,`pt`.`tag` AS `item_tag` from (((`itemaccount` `ia` join `itemaccount` `p` on((`ia`.`parentid` = `p`.`objid`))) join `itemaccount_tag` `pt` on((`p`.`objid` = `pt`.`acctid`))) join `sys_org` `o` on((`ia`.`org_objid` = `o`.`objid`))) where (`p`.`state` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt` AS select `r`.`objid` AS `remittance_objid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`controlid` AS `controlid`,`af`.`formtype` AS `formtype`,(case when (`af`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindexno`,`c`.`formno` AS `formno`,`c`.`stub` AS `stubno`,`c`.`series` AS `series`,`c`.`receiptno` AS `receiptno`,`c`.`receiptdate` AS `receiptdate`,`c`.`amount` AS `amount`,`c`.`totalnoncash` AS `totalnoncash`,(`c`.`amount` - `c`.`totalnoncash`) AS `totalcash`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0 else `c`.`amount` end) AS `voidamount`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`payer_objid` AS `payer_objid`,`c`.`payer_name` AS `payer_name`,`c`.`collector_objid` AS `collector_objid`,`c`.`collector_name` AS `collector_name`,`c`.`collector_title` AS `collector_title`,`c`.`objid` AS `receiptid`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`org_objid` AS `org_objid` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `af` on((`af`.`objid` = `c`.`formno`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt_af`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt_af`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_af`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt_af` AS select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,min(`cr`.`receiptno`) AS `fromreceiptno`,max(`cr`.`receiptno`) AS `toreceiptno`,min(`cr`.`series`) AS `fromseries`,max(`cr`.`series`) AS `toseries`,count(`cr`.`objid`) AS `qty`,sum(`cr`.`amount`) AS `amount`,0 AS `qtyvoided`,0.0 AS `voidamt`,0 AS `qtycancelled`,0.0 AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from (((`cashreceipt` `cr` join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` union all select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,NULL AS `fromreceiptno`,NULL AS `toreceiptno`,NULL AS `fromseries`,NULL AS `toseries`,0 AS `qty`,0.0 AS `amount`,count(`cr`.`objid`) AS `qtyvoided`,sum(`cr`.`amount`) AS `voidamt`,0 AS `qtycancelled`,0.0 AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from ((((`cashreceipt` `cr` join `cashreceipt_void` `cv` on((`cv`.`receiptid` = `cr`.`objid`))) join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` union all select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,NULL AS `fromreceiptno`,NULL AS `toreceiptno`,NULL AS `fromseries`,NULL AS `toseries`,0 AS `qty`,0.0 AS `amount`,0 AS `qtyvoided`,0.0 AS `voidamt`,count(`cr`.`objid`) AS `qtycancelled`,sum(`cr`.`amount`) AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from (((`cashreceipt` `cr` join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) where (`cr`.`state` = 'CANCELLED') group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt_afsummary`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt_afsummary` AS select concat(`v`.`remittanceid`,'|',`v`.`collector_objid`,'|',`v`.`controlid`) AS `objid`,`v`.`remittanceid` AS `remittanceid`,`v`.`collector_objid` AS `collector_objid`,`v`.`controlid` AS `controlid`,min(`v`.`fromreceiptno`) AS `fromreceiptno`,max(`v`.`toreceiptno`) AS `toreceiptno`,min(`v`.`fromseries`) AS `fromseries`,max(`v`.`toseries`) AS `toseries`,sum(`v`.`qty`) AS `qty`,sum(`v`.`amount`) AS `amount`,sum(`v`.`qtyvoided`) AS `qtyvoided`,sum(`v`.`voidamt`) AS `voidamt`,sum(`v`.`qtycancelled`) AS `qtycancelled`,sum(`v`.`cancelledamt`) AS `cancelledamt`,`v`.`formtype` AS `formtype`,`v`.`serieslength` AS `serieslength`,`v`.`denomination` AS `denomination`,`v`.`formno` AS `formno`,`v`.`stubno` AS `stubno`,`v`.`startseries` AS `startseries`,`v`.`endseries` AS `endseries`,`v`.`prefix` AS `prefix`,`v`.`suffix` AS `suffix` from `vw_remittance_cashreceipt_af` `v` group by `v`.`remittanceid`,`v`.`collector_objid`,`v`.`controlid`,`v`.`formtype`,`v`.`serieslength`,`v`.`denomination`,`v`.`formno`,`v`.`stubno`,`v`.`startseries`,`v`.`endseries`,`v`.`prefix`,`v`.`suffix` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptitem` AS select `c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`collectiontype_name` AS `collectiontype_name`,`c`.`org_objid` AS `org_objid`,`c`.`org_name` AS `org_name`,`c`.`formtype` AS `formtype`,`c`.`formno` AS `formno`,(case when (`c`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex`,`cri`.`receiptid` AS `receiptid`,`c`.`receiptdate` AS `receiptdate`,`c`.`receiptno` AS `receiptno`,`c`.`controlid` AS `controlid`,`c`.`series` AS `series`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`collector_objid` AS `collectorid`,`c`.`collector_name` AS `collectorname`,`c`.`collector_title` AS `collectortitle`,`cri`.`item_fund_objid` AS `fundid`,`cri`.`item_objid` AS `acctid`,`cri`.`item_code` AS `acctcode`,`cri`.`item_title` AS `acctname`,`cri`.`remarks` AS `remarks`,(case when isnull(`v`.`objid`) then `cri`.`amount` else 0.0 end) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `cri`.`amount` end) AS `voidamount` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptitem` `cri` on((`cri`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptpayment_noncash`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptpayment_noncash` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`particulars` AS `particulars`,`nc`.`refid` AS `refid`,`nc`.`amount` AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `nc`.`amount` end) AS `voidamount`,`cp`.`bankid` AS `bankid`,`cp`.`bank_name` AS `bank_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on(((`nc`.`receiptid` = `c`.`objid`) and (`nc`.`reftype` = 'CHECK')))) join `checkpayment` `cp` on((`cp`.`objid` = `nc`.`refid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) union all select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,'EFT' AS `reftype`,`nc`.`particulars` AS `particulars`,`nc`.`refid` AS `refid`,`nc`.`amount` AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `nc`.`amount` end) AS `voidamount`,`ba`.`bank_objid` AS `bankid`,`ba`.`bank_name` AS `bank_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid` from (((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on(((`nc`.`receiptid` = `c`.`objid`) and (`nc`.`reftype` = 'EFT')))) join `eftpayment` `eft` on((`eft`.`objid` = `nc`.`refid`))) join `bankaccount` `ba` on((`ba`.`objid` = `eft`.`bankacctid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptshare`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptshare`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptshare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptshare` AS select `c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`cs`.`receiptid` AS `receiptid`,`c`.`receiptdate` AS `receiptdate`,`c`.`receiptno` AS `receiptno`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`org_objid` AS `org_objid`,`c`.`org_name` AS `org_name`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`collectiontype_name` AS `collectiontype_name`,`c`.`collector_objid` AS `collectorid`,`c`.`collector_name` AS `collectorname`,`c`.`collector_title` AS `collectortitle`,`cs`.`refitem_objid` AS `refacctid`,`ia`.`fund_objid` AS `fundid`,`ia`.`objid` AS `acctid`,`ia`.`code` AS `acctcode`,`ia`.`title` AS `acctname`,(case when isnull(`v`.`objid`) then `cs`.`amount` else 0.0 end) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `cs`.`amount` end) AS `voidamount` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rptledger_avdifference`
--

/*!50001 DROP TABLE IF EXISTS `vw_rptledger_avdifference`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rptledger_avdifference`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rptledger_avdifference` AS select `rlf`.`objid` AS `objid`,'APPROVED' AS `state`,`d`.`parent_objid` AS `rptledgerid`,`rl`.`faasid` AS `faasid`,`rl`.`tdno` AS `tdno`,`rlf`.`txntype_objid` AS `txntype_objid`,`rlf`.`classification_objid` AS `classification_objid`,`rlf`.`actualuse_objid` AS `actualuse_objid`,`rlf`.`taxable` AS `taxable`,`rlf`.`backtax` AS `backtax`,`d`.`year` AS `fromyear`,1 AS `fromqtr`,`d`.`year` AS `toyear`,4 AS `toqtr`,`d`.`av` AS `assessedvalue`,1 AS `systemcreated`,`rlf`.`reclassed` AS `reclassed`,`rlf`.`idleland` AS `idleland`,1 AS `taxdifference` from ((`rptledger_avdifference` `d` join `rptledgerfaas` `rlf` on((`d`.`rptledgerfaas_objid` = `rlf`.`objid`))) join `rptledger` `rl` on((`d`.`parent_objid` = `rl`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rptpayment_item_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_rptpayment_item_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_rptpayment_item_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rptpayment_item_detail` AS select `rpi`.`objid` AS `objid`,`rpi`.`parentid` AS `parentid`,`rpi`.`rptledgerfaasid` AS `rptledgerfaasid`,`rpi`.`year` AS `year`,`rpi`.`qtr` AS `qtr`,`rpi`.`revperiod` AS `revperiod`,(case when (`rpi`.`revtype` = 'basic') then `rpi`.`amount` else 0 end) AS `basic`,(case when (`rpi`.`revtype` = 'basic') then `rpi`.`interest` else 0 end) AS `basicint`,(case when (`rpi`.`revtype` = 'basic') then `rpi`.`discount` else 0 end) AS `basicdisc`,(case when (`rpi`.`revtype` = 'basic') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `basicdp`,(case when (`rpi`.`revtype` = 'basic') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `basicnet`,(case when (`rpi`.`revtype` = 'basicidle') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `basicidle`,(case when (`rpi`.`revtype` = 'basicidle') then `rpi`.`interest` else 0 end) AS `basicidleint`,(case when (`rpi`.`revtype` = 'basicidle') then `rpi`.`discount` else 0 end) AS `basicidledisc`,(case when (`rpi`.`revtype` = 'basicidle') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `basicidledp`,(case when (`rpi`.`revtype` = 'sef') then `rpi`.`amount` else 0 end) AS `sef`,(case when (`rpi`.`revtype` = 'sef') then `rpi`.`interest` else 0 end) AS `sefint`,(case when (`rpi`.`revtype` = 'sef') then `rpi`.`discount` else 0 end) AS `sefdisc`,(case when (`rpi`.`revtype` = 'sef') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `sefdp`,(case when (`rpi`.`revtype` = 'sef') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `sefnet`,(case when (`rpi`.`revtype` = 'firecode') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `firecode`,(case when (`rpi`.`revtype` = 'sh') then ((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) else 0 end) AS `sh`,(case when (`rpi`.`revtype` = 'sh') then `rpi`.`interest` else 0 end) AS `shint`,(case when (`rpi`.`revtype` = 'sh') then `rpi`.`discount` else 0 end) AS `shdisc`,(case when (`rpi`.`revtype` = 'sh') then (`rpi`.`interest` - `rpi`.`discount`) else 0 end) AS `shdp`,((`rpi`.`amount` + `rpi`.`interest`) - `rpi`.`discount`) AS `amount`,`rpi`.`partialled` AS `partialled` from `rptpayment_item` `rpi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_txn_log`
--

/*!50001 DROP TABLE IF EXISTS `vw_txn_log`*/;
/*!50001 DROP VIEW IF EXISTS `vw_txn_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_txn_log` AS select distinct `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`txndate` AS `txndate`,`t`.`ref` AS `ref`,`t`.`action` AS `action`,1 AS `cnt` from (`txnlog` `t` join `sys_user` `u` on((`t`.`userid` = `u`.`objid`))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'faas' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`faas_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%assign%'))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'subdivision' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`subdivision_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%assign%'))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'consolidation' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`subdivision_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%consolidation%'))) union select `u`.`objid` AS `userid`,`u`.`name` AS `username`,`t`.`enddate` AS `txndate`,'cancelledfaas' AS `ref`,(case when (`t`.`state` like '%receiver%') then 'receive' when (`t`.`state` like '%examiner%') then 'examine' when (`t`.`state` like '%taxmapper_chief%') then 'approve taxmap' when (`t`.`state` like '%taxmapper%') then 'taxmap' when (`t`.`state` like '%appraiser%') then 'appraise' when (`t`.`state` like '%appraiser_chief%') then 'approve appraisal' when (`t`.`state` like '%recommender%') then 'recommend' when (`t`.`state` like '%approver%') then 'approve' else `t`.`state` end) AS `action`,1 AS `cnt` from (`subdivision_task` `t` join `sys_user` `u` on((`t`.`actor_objid` = `u`.`objid`))) where (not((`t`.`state` like '%cancelledfaas%'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-27 20:14:42
