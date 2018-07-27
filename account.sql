-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.7.22

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

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('020142e0-805d-4c8d-907c-6043a4bfacda',NULL,'idp-confirm-link','openpitrix','a876614c-25b2-4562-940a-cb44b6c1fa88',0,10,'\0',NULL,NULL),('02e043bc-3337-4112-9ebb-d42142a3bbdc',NULL,'registration-profile-action','master','8390dfb8-8980-4d1e-bdf0-d516f277175d',0,40,'\0',NULL,NULL),('039eb294-60bf-4d74-b982-3d1396fc8142',NULL,'registration-page-form','master','3d29538d-9d8b-4fd5-961f-524361101d57',0,10,'','8390dfb8-8980-4d1e-bdf0-d516f277175d',NULL),('06c073ae-df4f-4461-b1e0-67c9d0388ea3',NULL,'idp-review-profile','openpitrix','79f43c94-d370-43f5-96e8-e949a06c67d3',0,10,'\0',NULL,'d8caf5fe-d8d0-401d-9bda-088398c83105'),('0e831454-26d5-43c0-8665-bdd4cc55a075',NULL,NULL,'openpitrix','a876614c-25b2-4562-940a-cb44b6c1fa88',2,30,'','25a49b01-d783-48f1-b312-46a201b32539',NULL),('106689ad-d84d-48f1-ac3c-c7655085d19a',NULL,'auth-otp-form','openpitrix','8506b3db-6a7f-41d1-b83f-850587b5ee48',1,20,'\0',NULL,NULL),('138b95cb-69e5-4426-91a5-c7eb3b4485ea',NULL,'direct-grant-validate-otp','master','f012eae8-785a-4019-a668-2c7f4d4713b6',1,30,'\0',NULL,NULL),('198d5b44-bf30-4f6d-89f7-1220dac135fe',NULL,'auth-otp-form','master','d67ff625-12c4-4dfe-a29f-e024ae6291b8',1,20,'\0',NULL,NULL),('1d5ff297-a759-4bc6-8176-a5b0bc13865e',NULL,'reset-password','openpitrix','dfc1c02d-4ae1-44e2-947f-517dde925275',0,30,'\0',NULL,NULL),('2122007c-8d95-4f95-af30-d41e2fe7cf9b',NULL,'http-basic-authenticator','master','293ca66d-9f45-476f-89a6-9560d9d3340f',0,10,'\0',NULL,NULL),('22a61b7d-6269-457b-b602-a91b407292c2',NULL,'direct-grant-validate-username','openpitrix','f488cf13-991d-4137-a1c0-ca2dec6e813c',0,10,'\0',NULL,NULL),('25d5297a-1db2-49a2-b8cd-04c727e48f06',NULL,NULL,'openpitrix','3cc43cfc-acca-40b8-940f-aeb586439264',2,30,'','8506b3db-6a7f-41d1-b83f-850587b5ee48',NULL),('2a81a8ed-1ba1-486d-a47f-6bbaa29a1ed6',NULL,NULL,'openpitrix','79f43c94-d370-43f5-96e8-e949a06c67d3',2,30,'','a876614c-25b2-4562-940a-cb44b6c1fa88',NULL),('2bcab0b6-746d-4dfe-a1fc-66b2e0bb3c8f',NULL,'registration-recaptcha-action','master','8390dfb8-8980-4d1e-bdf0-d516f277175d',3,60,'\0',NULL,NULL),('39de36ff-a9ae-41c8-bd27-e2bfb41ec9a2',NULL,NULL,'master','4e885b8b-faf0-42e7-9602-b552720e32d1',2,30,'','2bf1b7b1-3aab-4c2a-8f02-be08ed7eff45',NULL),('3e713c48-7762-4ed2-87dd-da4c8408424a',NULL,'identity-provider-redirector','openpitrix','3cc43cfc-acca-40b8-940f-aeb586439264',2,25,'\0',NULL,NULL),('3ea85f74-94bf-45b4-8efe-9632160e726b',NULL,'idp-create-user-if-unique','master','0d21098b-2697-4c79-8caa-c266f5386a30',2,20,'\0',NULL,'9b025da9-4738-4cfa-a11b-522486dac8a6'),('3fcdad9e-7c59-42fa-8872-20ab83898c70',NULL,'docker-http-basic-authenticator','openpitrix','a8e8b1b1-4785-4027-9f94-e753dc18d04a',0,10,'\0',NULL,NULL),('4b3d4217-c2c1-4f52-9c2d-77cd71e4532e',NULL,'direct-grant-validate-otp','openpitrix','f488cf13-991d-4137-a1c0-ca2dec6e813c',1,30,'\0',NULL,NULL),('4b67f714-b59d-4923-817c-922e72fa8ce5',NULL,'registration-password-action','openpitrix','2ce6add1-6424-48c4-a6a4-4ba65961c94e',0,50,'\0',NULL,NULL),('4c453a21-9d01-4d47-91a0-e56f32e31da3',NULL,'idp-username-password-form','master','d67ff625-12c4-4dfe-a29f-e024ae6291b8',0,10,'\0',NULL,NULL),('51193eca-58b4-491b-9e87-e20d32979f81',NULL,'registration-recaptcha-action','openpitrix','2ce6add1-6424-48c4-a6a4-4ba65961c94e',3,60,'\0',NULL,NULL),('52c6a25e-8e6f-49bb-8133-19bf61c1c5ef',NULL,'auth-username-password-form','master','2bf1b7b1-3aab-4c2a-8f02-be08ed7eff45',0,10,'\0',NULL,NULL),('54cc1490-9858-4ea8-b4f2-f42b8499cd8b',NULL,'idp-email-verification','openpitrix','a876614c-25b2-4562-940a-cb44b6c1fa88',2,20,'\0',NULL,NULL),('54e07095-0e4a-4ed5-91d4-3e6528756d9b',NULL,'client-secret','master','18edbb39-aad9-4419-a4d4-2d3b6e1a1c49',2,10,'\0',NULL,NULL),('62b55483-a8bb-4152-97d8-dcefc4d5ba05',NULL,'reset-credentials-choose-user','master','468cd2c8-5b4a-4820-91b3-c680fe70ebea',0,10,'\0',NULL,NULL),('63efe254-d32d-4f18-95cc-9da3ce935e1f',NULL,'reset-password','master','468cd2c8-5b4a-4820-91b3-c680fe70ebea',0,30,'\0',NULL,NULL),('6c565ff0-6dd0-4d31-8afb-6d7debb3d2bc',NULL,'auth-cookie','openpitrix','3cc43cfc-acca-40b8-940f-aeb586439264',2,10,'\0',NULL,NULL),('6ca3ea48-03e1-49d2-9e1b-ed8d1af21a4c',NULL,'http-basic-authenticator','openpitrix','1a974954-1566-4042-bc90-4d1e2ffa66e8',0,10,'\0',NULL,NULL),('6fd7f033-6b53-45c9-ba7c-7913ba92e6d9',NULL,'idp-email-verification','master','d1fd92b9-bc21-41a4-bdd2-c3c9c584e174',2,20,'\0',NULL,NULL),('7b14aa1c-ae38-472e-ac90-6fe52d0e5f6b',NULL,'idp-username-password-form','openpitrix','25a49b01-d783-48f1-b312-46a201b32539',0,10,'\0',NULL,NULL),('7efa8afd-5e52-419c-80bc-ff7195c6dafc',NULL,'registration-password-action','master','8390dfb8-8980-4d1e-bdf0-d516f277175d',0,50,'\0',NULL,NULL),('805104e6-0de8-49aa-80d3-f9eefdbd7c87',NULL,'reset-credential-email','openpitrix','dfc1c02d-4ae1-44e2-947f-517dde925275',0,20,'\0',NULL,NULL),('825b483a-94d1-4d3d-b14d-fdc891b228f5',NULL,NULL,'master','0d21098b-2697-4c79-8caa-c266f5386a30',2,30,'','d1fd92b9-bc21-41a4-bdd2-c3c9c584e174',NULL),('841dccd8-8b34-40b6-a913-347e826401c6',NULL,'idp-review-profile','master','0d21098b-2697-4c79-8caa-c266f5386a30',0,10,'\0',NULL,'247740ef-96cd-4947-896b-9042416fbb79'),('86e418ec-b402-4df8-9497-c0b1f3a4b16c',NULL,'identity-provider-redirector','master','4e885b8b-faf0-42e7-9602-b552720e32d1',2,25,'\0',NULL,NULL),('87c5cb55-0a36-438e-890c-0b915d7f5e48',NULL,'auth-spnego','master','4e885b8b-faf0-42e7-9602-b552720e32d1',3,20,'\0',NULL,NULL),('887937f9-23bd-4a95-adb3-3d1e1c9da4b8',NULL,'client-secret-jwt','openpitrix','325d94fb-97bb-4fb0-9959-366ee37d9e09',2,30,'\0',NULL,NULL),('89508378-96dc-4058-8138-73c1214fe3ac',NULL,'direct-grant-validate-password','master','f012eae8-785a-4019-a668-2c7f4d4713b6',0,20,'\0',NULL,NULL),('94b00bb7-b148-4e98-928e-bf415a046629',NULL,'auth-otp-form','openpitrix','25a49b01-d783-48f1-b312-46a201b32539',1,20,'\0',NULL,NULL),('9ac56386-1340-49d4-8fda-5ac0d1eb3951',NULL,'registration-user-creation','openpitrix','2ce6add1-6424-48c4-a6a4-4ba65961c94e',0,20,'\0',NULL,NULL),('a2794eae-0342-4452-b223-525fb340e236',NULL,'auth-otp-form','master','2bf1b7b1-3aab-4c2a-8f02-be08ed7eff45',1,20,'\0',NULL,NULL),('a662c74b-ac98-45c2-a459-5aac6b85b280',NULL,'registration-profile-action','openpitrix','2ce6add1-6424-48c4-a6a4-4ba65961c94e',0,40,'\0',NULL,NULL),('aa58b4a4-ada2-49ff-985a-1c7c5ee06517',NULL,'registration-user-creation','master','8390dfb8-8980-4d1e-bdf0-d516f277175d',0,20,'\0',NULL,NULL),('b281acbf-6d8b-4a15-95d7-aa3af631cc7e',NULL,'docker-http-basic-authenticator','master','ad5a263d-5c3f-4f31-9f69-6c39a732ef05',0,10,'\0',NULL,NULL),('ba716520-c1b5-43e3-9b64-a09c57f01df7',NULL,'reset-credential-email','master','468cd2c8-5b4a-4820-91b3-c680fe70ebea',0,20,'\0',NULL,NULL),('baa6349d-b586-4e18-85cc-6b21b392fa55',NULL,'reset-otp','openpitrix','dfc1c02d-4ae1-44e2-947f-517dde925275',1,40,'\0',NULL,NULL),('bfaa7242-82cb-45e5-ba28-08ea85624f07',NULL,'client-secret-jwt','master','18edbb39-aad9-4419-a4d4-2d3b6e1a1c49',2,30,'\0',NULL,NULL),('c0ae9a40-96a4-4fb8-a526-98d24dbec8bf',NULL,'client-secret','openpitrix','325d94fb-97bb-4fb0-9959-366ee37d9e09',2,10,'\0',NULL,NULL),('c3746e64-a4a8-4069-8f51-cf4ad5e36337',NULL,'client-jwt','openpitrix','325d94fb-97bb-4fb0-9959-366ee37d9e09',2,20,'\0',NULL,NULL),('c3e9f671-d586-4820-8388-1ef9e5a3654c',NULL,'client-jwt','master','18edbb39-aad9-4419-a4d4-2d3b6e1a1c49',2,20,'\0',NULL,NULL),('c7b86a4f-6917-43ea-92a3-d39078cdc24e',NULL,'auth-spnego','openpitrix','3cc43cfc-acca-40b8-940f-aeb586439264',3,20,'\0',NULL,NULL),('cc61953d-894a-4e44-b68f-57fda3be9b63',NULL,'idp-create-user-if-unique','openpitrix','79f43c94-d370-43f5-96e8-e949a06c67d3',2,20,'\0',NULL,'8cec6012-41be-4120-8cf6-c2e7ef406bcf'),('d545bacb-4670-4787-9bc6-6a76b70ff65d',NULL,NULL,'master','d1fd92b9-bc21-41a4-bdd2-c3c9c584e174',2,30,'','d67ff625-12c4-4dfe-a29f-e024ae6291b8',NULL),('d5479124-79bf-45b0-aafd-3fae9002ae75',NULL,'direct-grant-validate-password','openpitrix','f488cf13-991d-4137-a1c0-ca2dec6e813c',0,20,'\0',NULL,NULL),('d68bb608-7966-4223-a6f3-027e3f8c7db9',NULL,'reset-credentials-choose-user','openpitrix','dfc1c02d-4ae1-44e2-947f-517dde925275',0,10,'\0',NULL,NULL),('dce712c3-e3f9-4454-afe9-634216dcbe93',NULL,'direct-grant-validate-username','master','f012eae8-785a-4019-a668-2c7f4d4713b6',0,10,'\0',NULL,NULL),('e541cfd7-d110-44bf-a43d-dd842fa9e76c',NULL,'idp-confirm-link','master','d1fd92b9-bc21-41a4-bdd2-c3c9c584e174',0,10,'\0',NULL,NULL),('e87d498e-e88b-437c-a682-72bf03cad7c1',NULL,'auth-cookie','master','4e885b8b-faf0-42e7-9602-b552720e32d1',2,10,'\0',NULL,NULL),('eafa6d5c-0d4a-43c1-a8ca-8657fda1070f',NULL,'auth-username-password-form','openpitrix','8506b3db-6a7f-41d1-b83f-850587b5ee48',0,10,'\0',NULL,NULL),('edafc92d-1ffc-4b70-80fd-7f5a2f0ac477',NULL,'registration-page-form','openpitrix','d95594d6-cdeb-446f-9f92-40337b587d5a',0,10,'','2ce6add1-6424-48c4-a6a4-4ba65961c94e',NULL),('ef6a346b-d8ec-4963-806f-5c494f8ee23f',NULL,'reset-otp','master','468cd2c8-5b4a-4820-91b3-c680fe70ebea',1,40,'\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0d21098b-2697-4c79-8caa-c266f5386a30','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('18edbb39-aad9-4419-a4d4-2d3b6e1a1c49','clients','Base authentication for clients','master','client-flow','',''),('1a974954-1566-4042-bc90-4d1e2ffa66e8','saml ecp','SAML ECP Profile Authentication Flow','openpitrix','basic-flow','',''),('25a49b01-d783-48f1-b312-46a201b32539','Verify Existing Account by Re-authentication','Reauthentication of existing account','openpitrix','basic-flow','\0',''),('293ca66d-9f45-476f-89a6-9560d9d3340f','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow','',''),('2bf1b7b1-3aab-4c2a-8f02-be08ed7eff45','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('2ce6add1-6424-48c4-a6a4-4ba65961c94e','registration form','registration form','openpitrix','form-flow','\0',''),('325d94fb-97bb-4fb0-9959-366ee37d9e09','clients','Base authentication for clients','openpitrix','client-flow','',''),('3cc43cfc-acca-40b8-940f-aeb586439264','browser','browser based authentication','openpitrix','basic-flow','',''),('3d29538d-9d8b-4fd5-961f-524361101d57','registration','registration flow','master','basic-flow','',''),('468cd2c8-5b4a-4820-91b3-c680fe70ebea','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('4e885b8b-faf0-42e7-9602-b552720e32d1','browser','browser based authentication','master','basic-flow','',''),('79f43c94-d370-43f5-96e8-e949a06c67d3','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','openpitrix','basic-flow','',''),('8390dfb8-8980-4d1e-bdf0-d516f277175d','registration form','registration form','master','form-flow','\0',''),('8506b3db-6a7f-41d1-b83f-850587b5ee48','forms','Username, password, otp and other auth forms.','openpitrix','basic-flow','\0',''),('a876614c-25b2-4562-940a-cb44b6c1fa88','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','openpitrix','basic-flow','\0',''),('a8e8b1b1-4785-4027-9f94-e753dc18d04a','docker auth','Used by Docker clients to authenticate against the IDP','openpitrix','basic-flow','',''),('ad5a263d-5c3f-4f31-9f69-6c39a732ef05','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow','',''),('d1fd92b9-bc21-41a4-bdd2-c3c9c584e174','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('d67ff625-12c4-4dfe-a29f-e024ae6291b8','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('d95594d6-cdeb-446f-9f92-40337b587d5a','registration','registration flow','openpitrix','basic-flow','',''),('dfc1c02d-4ae1-44e2-947f-517dde925275','reset credentials','Reset credentials for a user if they forgot their password or something','openpitrix','basic-flow','',''),('f012eae8-785a-4019-a668-2c7f4d4713b6','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('f488cf13-991d-4137-a1c0-ca2dec6e813c','direct grant','OpenID Connect Resource Owner Grant','openpitrix','basic-flow','','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('247740ef-96cd-4947-896b-9042416fbb79','review profile config','master'),('8cec6012-41be-4120-8cf6-c2e7ef406bcf','create unique user config','openpitrix'),('9b025da9-4738-4cfa-a11b-522486dac8a6','create unique user config','master'),('d8caf5fe-d8d0-401d-9bda-088398c83105','review profile config','openpitrix');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('247740ef-96cd-4947-896b-9042416fbb79','missing','update.profile.on.first.login'),('8cec6012-41be-4120-8cf6-c2e7ef406bcf','false','require.password.update.after.registration'),('9b025da9-4738-4cfa-a11b-522486dac8a6','false','require.password.update.after.registration'),('d8caf5fe-d8d0-401d-9bda-088398c83105','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','','\0','security-admin-console',0,'','7b65e30b-2aa3-4627-b57c-8dc979bd03d5','/auth/admin/openpitrix/console/index.html','\0',NULL,'\0','openpitrix','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('2609128d-54fc-4a0f-96dc-3c477d59dd39','','\0','admin-cli',0,'','59a2877c-8c21-4773-83c8-26048b1260e3',NULL,'\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('2f24032d-914f-4073-930e-b273fa72dc60','','\0','realm-management',0,'\0','2ec494c3-6cd2-4ca1-baca-9e87acc822a0',NULL,'',NULL,'\0','openpitrix','openid-connect',0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','','\0','broker',0,'\0','b94c2fa1-64e6-4b02-88f6-0963f9f24890',NULL,'\0',NULL,'\0','openpitrix','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('7f467b19-4489-4740-977b-9fe168d74a3c','','\0','account',0,'\0','c575b60f-e6cd-4daf-8165-fa7c790484c8','/auth/realms/master/account','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('80262a94-7a64-4c5f-9328-3574fda0af33','','','master-realm',0,'\0','8896a69e-217a-40bc-8d21-15442e9abdb2',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('8baa9b9f-9890-488a-aded-401c324b7a0d','','\0','account',0,'\0','1df822da-c83c-4cb5-8a7d-0da89eb6c778','/auth/realms/openpitrix/account','\0',NULL,'\0','openpitrix','openid-connect',0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','','\0','admin-cli',0,'','e4edab44-f1d9-4bea-b41b-285232692489',NULL,'\0',NULL,'\0','openpitrix','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0',''),('9749701a-cd84-4f43-993b-074f0afaa434','','\0','broker',0,'\0','c3cc7443-6e5a-48a7-86ef-8a77fcde95a1',NULL,'\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','','','iam',0,'\0','44d90e1b-4d8f-4994-baa1-2fbad56a81d8',NULL,'\0',NULL,'\0','openpitrix','openid-connect',-1,'\0','\0',NULL,'','client-secret',NULL,NULL,NULL,'','\0',''),('f60bdb88-81aa-41d8-9dff-c5182a719562','','\0','security-admin-console',0,'','a8b075a3-9ca7-44fc-b156-50e313489ad6','/auth/admin/master/console/index.html','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0'),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','','','openpitrix-realm',0,'\0','1c91c12f-0d4b-4a37-a456-95609cf6dab2',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','openpitrix Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','display.on.consent.screen'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','exclude.session.state.from.auth.response'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.assertion.signature'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.authnstatement'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.client.signature'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.encrypt'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.force.post.binding'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.multivalued.roles'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.onetimeuse.condition'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.server.signature'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml.server.signature.keyinfo.ext'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','saml_force_name_id_format'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','false','tls.client.certificate.bound.access.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('8baa9b9f-9890-488a-aded-401c324b7a0d','065e85ab-5abb-4e1f-a5cc-0ac6ce107bba'),('7f467b19-4489-4740-977b-9fe168d74a3c','96883089-e5a1-40c6-9780-a98b0380c1f0'),('8baa9b9f-9890-488a-aded-401c324b7a0d','c42a65a5-84e2-4e7c-924c-759952d9aa36'),('7f467b19-4489-4740-977b-9fe168d74a3c','ee3f0d05-714f-43d4-b6f9-d5264e3c081a');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
  CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('21286ba4-7698-46c1-a2ff-65f8ef134bbf','address','master','OpenID Connect built-in scope: address','openid-connect'),('36db3897-0ad3-41e6-aa62-a7dbdedd6a26','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('4dfa3e08-0085-4a9d-9567-b4fe2a63c852','email','openpitrix','OpenID Connect built-in scope: email','openid-connect'),('612c5523-f515-4b04-8dc6-519b5b2e8114','role_list','openpitrix','SAML role list','saml'),('85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('89529abf-5c8d-46e7-a8fc-dbbe3c4f2238','email','master','OpenID Connect built-in scope: email','openid-connect'),('a40b2391-6393-4886-8e45-bcb3a2a0baed','role_list','master','SAML role list','saml'),('b8468b0d-03dd-4bb7-af3d-359d893b2d8a','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('be798254-83d4-4b24-a7de-42eaf17bb8f9','profile','openpitrix','OpenID Connect built-in scope: profile','openid-connect'),('c45344fe-d827-452b-af61-a195fe556ad8','address','openpitrix','OpenID Connect built-in scope: address','openid-connect'),('c6939c5f-0876-45c1-9ff6-976d168db221','phone','openpitrix','OpenID Connect built-in scope: phone','openid-connect'),('faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','offline_access','openpitrix','OpenID Connect built-in scope: offline_access','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('21286ba4-7698-46c1-a2ff-65f8ef134bbf','${addressScopeConsentText}','consent.screen.text'),('21286ba4-7698-46c1-a2ff-65f8ef134bbf','true','display.on.consent.screen'),('36db3897-0ad3-41e6-aa62-a7dbdedd6a26','${profileScopeConsentText}','consent.screen.text'),('36db3897-0ad3-41e6-aa62-a7dbdedd6a26','true','display.on.consent.screen'),('4dfa3e08-0085-4a9d-9567-b4fe2a63c852','${emailScopeConsentText}','consent.screen.text'),('4dfa3e08-0085-4a9d-9567-b4fe2a63c852','true','display.on.consent.screen'),('612c5523-f515-4b04-8dc6-519b5b2e8114','${samlRoleListScopeConsentText}','consent.screen.text'),('612c5523-f515-4b04-8dc6-519b5b2e8114','true','display.on.consent.screen'),('85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','${phoneScopeConsentText}','consent.screen.text'),('85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','true','display.on.consent.screen'),('89529abf-5c8d-46e7-a8fc-dbbe3c4f2238','${emailScopeConsentText}','consent.screen.text'),('89529abf-5c8d-46e7-a8fc-dbbe3c4f2238','true','display.on.consent.screen'),('a40b2391-6393-4886-8e45-bcb3a2a0baed','${samlRoleListScopeConsentText}','consent.screen.text'),('a40b2391-6393-4886-8e45-bcb3a2a0baed','true','display.on.consent.screen'),('b8468b0d-03dd-4bb7-af3d-359d893b2d8a','${offlineAccessScopeConsentText}','consent.screen.text'),('b8468b0d-03dd-4bb7-af3d-359d893b2d8a','true','display.on.consent.screen'),('be798254-83d4-4b24-a7de-42eaf17bb8f9','${profileScopeConsentText}','consent.screen.text'),('be798254-83d4-4b24-a7de-42eaf17bb8f9','true','display.on.consent.screen'),('c45344fe-d827-452b-af61-a195fe556ad8','${addressScopeConsentText}','consent.screen.text'),('c45344fe-d827-452b-af61-a195fe556ad8','true','display.on.consent.screen'),('c6939c5f-0876-45c1-9ff6-976d168db221','${phoneScopeConsentText}','consent.screen.text'),('c6939c5f-0876-45c1-9ff6-976d168db221','true','display.on.consent.screen'),('faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','${offlineAccessScopeConsentText}','consent.screen.text'),('faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0'),('2609128d-54fc-4a0f-96dc-3c477d59dd39','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('2609128d-54fc-4a0f-96dc-3c477d59dd39','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('2609128d-54fc-4a0f-96dc-3c477d59dd39','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('2609128d-54fc-4a0f-96dc-3c477d59dd39','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('2609128d-54fc-4a0f-96dc-3c477d59dd39','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('2609128d-54fc-4a0f-96dc-3c477d59dd39','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0'),('2f24032d-914f-4073-930e-b273fa72dc60','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('2f24032d-914f-4073-930e-b273fa72dc60','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('2f24032d-914f-4073-930e-b273fa72dc60','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('2f24032d-914f-4073-930e-b273fa72dc60','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('2f24032d-914f-4073-930e-b273fa72dc60','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('2f24032d-914f-4073-930e-b273fa72dc60','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0'),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('507dfaaf-8457-4c66-b6b6-5eadd6579f39','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0'),('7f467b19-4489-4740-977b-9fe168d74a3c','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('7f467b19-4489-4740-977b-9fe168d74a3c','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('7f467b19-4489-4740-977b-9fe168d74a3c','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('7f467b19-4489-4740-977b-9fe168d74a3c','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('7f467b19-4489-4740-977b-9fe168d74a3c','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('7f467b19-4489-4740-977b-9fe168d74a3c','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0'),('80262a94-7a64-4c5f-9328-3574fda0af33','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('80262a94-7a64-4c5f-9328-3574fda0af33','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('80262a94-7a64-4c5f-9328-3574fda0af33','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('80262a94-7a64-4c5f-9328-3574fda0af33','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('80262a94-7a64-4c5f-9328-3574fda0af33','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('80262a94-7a64-4c5f-9328-3574fda0af33','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0'),('8baa9b9f-9890-488a-aded-401c324b7a0d','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('8baa9b9f-9890-488a-aded-401c324b7a0d','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('8baa9b9f-9890-488a-aded-401c324b7a0d','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('8baa9b9f-9890-488a-aded-401c324b7a0d','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('8baa9b9f-9890-488a-aded-401c324b7a0d','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('8baa9b9f-9890-488a-aded-401c324b7a0d','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0'),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('8ed4ee2c-e12c-4c26-a071-2081bd8c0a1a','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0'),('9749701a-cd84-4f43-993b-074f0afaa434','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('9749701a-cd84-4f43-993b-074f0afaa434','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('9749701a-cd84-4f43-993b-074f0afaa434','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('9749701a-cd84-4f43-993b-074f0afaa434','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('9749701a-cd84-4f43-993b-074f0afaa434','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('9749701a-cd84-4f43-993b-074f0afaa434','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0'),('f60bdb88-81aa-41d8-9dff-c5182a719562','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('f60bdb88-81aa-41d8-9dff-c5182a719562','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('f60bdb88-81aa-41d8-9dff-c5182a719562','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('f60bdb88-81aa-41d8-9dff-c5182a719562','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('f60bdb88-81aa-41d8-9dff-c5182a719562','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('f60bdb88-81aa-41d8-9dff-c5182a719562','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0'),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('f65daa41-2ef2-44b2-8ed1-cb38fd229486','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('b8468b0d-03dd-4bb7-af3d-359d893b2d8a','80a846b1-c11b-453c-9716-96b9d021dcfa'),('faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','b6972f98-1d4e-42ad-8f0a-d38bec93835e');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('097cce4f-e022-402b-813a-71cbd715157a','Allowed Protocol Mapper Types','openpitrix','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','anonymous'),('1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','Allowed Protocol Mapper Types','openpitrix','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','authenticated'),('21d2ce11-97d9-4931-aabd-0de834586a53','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('377bc972-a5af-4ebe-9730-758b81d14e7d','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('482d610d-eb0d-4c16-9594-dd81ea36e7e5','Full Scope Disabled','openpitrix','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','anonymous'),('5bf6b31b-b214-4c40-9483-c8b005c9ba06','hmac-generated','openpitrix','hmac-generated','org.keycloak.keys.KeyProvider','openpitrix',NULL),('5d422973-6629-4490-8516-ead67a26875b','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6c1e732a-0568-415a-89d6-d917ce174460','aes-generated','openpitrix','aes-generated','org.keycloak.keys.KeyProvider','openpitrix',NULL),('81bc4491-2417-48af-8fa9-5aff26a8f48b','Trusted Hosts','openpitrix','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','anonymous'),('85ba3c5a-ea5a-4f87-bb41-7ee22b2569dd','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('a2548ed8-f286-47b5-bcc0-092dd123181c','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('a2fa291e-a40e-4389-82d7-5fc480d28f9d','Allowed Client Scopes','openpitrix','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','anonymous'),('a3c06329-c826-46de-bd9e-43bc1b062ae5','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('a3cb80cd-c27c-4f39-bdaa-90a5a7878d20','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('a566576c-5c80-4057-afa4-577c0f8dcb1c','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('a6dbcaea-5bf6-4025-86b2-06006be439e7','Max Clients Limit','openpitrix','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','anonymous'),('a8173460-95dd-4618-b6ce-5b1739461e3d','Allowed Client Scopes','openpitrix','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','authenticated'),('b21e71cc-d393-4bc3-bf62-434896c32e4e','rsa-generated','openpitrix','rsa-generated','org.keycloak.keys.KeyProvider','openpitrix',NULL),('cb0232aa-0a07-4f8a-86f7-6679c95f708a','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('d0bce488-3884-4b16-a24e-b914580d1649','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('ea8b38cb-9d1c-4567-90fb-b6b4b6be30c3','Consent Required','openpitrix','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','openpitrix','anonymous'),('f2ea24c2-4fc2-4558-8ca7-a066d92099ea','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0274f094-68fa-4592-9050-1483b975104c','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('032b3954-1e68-41ee-bec1-5bd6b24e4912','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('0743641f-8d79-41f4-92ce-639b6e90ea9a','a2548ed8-f286-47b5-bcc0-092dd123181c','secret','HGdoGzUokEPQuG7hF_MhEKWlTYc5V7LwodmIISsbXfs'),('0a2653b6-e9bb-47f9-bfa2-67b0fd6986fc','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('14d79862-b575-46c4-9017-08dcceb28e00','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','oidc-address-mapper'),('1a7d0a6a-ff37-4df4-8519-74fd2265bbc1','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','saml-user-property-mapper'),('1ac00dd6-cda4-473c-901f-689a77fe95f0','5bf6b31b-b214-4c40-9483-c8b005c9ba06','secret','iDtsGoa7LEhITzlrH4zFDR1qwEwluF0cB6jtTdSrADA'),('205b76d8-c1d8-4121-bad7-e582dc25b1c4','81bc4491-2417-48af-8fa9-5aff26a8f48b','host-sending-registration-request-must-match','true'),('22a8d05b-92ca-4835-b54a-865515574afe','6c1e732a-0568-415a-89d6-d917ce174460','secret','t3ymOrPPw3Gf7Oo_XO3cHQ'),('2539a1cc-e34c-46a6-b9c6-2d5a5beda7b1','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','saml-user-property-mapper'),('25da55cb-a957-4c71-b101-9a97033858ab','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2cf853af-654d-4a75-8916-c2f13539ec95','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('30cfe5c6-12c2-4e5d-81d9-b0968e17f359','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('30ff8507-fcab-4845-ae54-0b1eed5258e8','a3c06329-c826-46de-bd9e-43bc1b062ae5','max-clients','200'),('3622d30f-1ef2-4c87-a516-908ec79a9fbf','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','oidc-address-mapper'),('3b7b412e-344b-4a9c-bcb4-92c91eaede4b','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','saml-role-list-mapper'),('3c6bd41f-8219-4aa7-8da1-cbfe631985e4','6c1e732a-0568-415a-89d6-d917ce174460','priority','100'),('3f8c1c78-bdc4-40e8-9783-9f5b416ea7d0','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3ffe6bb4-b19b-4f82-8ef1-844825be46c3','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('44332a41-937f-4770-9d15-e9346b0fa255','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','oidc-full-name-mapper'),('4443f97d-3089-43d5-a6b4-2bca2f194b06','a3cb80cd-c27c-4f39-bdaa-90a5a7878d20','host-sending-registration-request-must-match','true'),('5871c009-9bd9-4833-a26c-1a4ac3852e14','cb0232aa-0a07-4f8a-86f7-6679c95f708a','allow-default-scopes','true'),('58fe29e6-fd49-49e2-88d9-44bb4d125ffc','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('5941ed8e-5258-4b6b-8f62-0d8312da5d3e','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5af6796e-e73c-46ed-81e4-d3b110b41f8c','b21e71cc-d393-4bc3-bf62-434896c32e4e','privateKey','MIIEpAIBAAKCAQEAwqi8tnjgfq+0F49d+4fhPnky6uj5DlbpVgjKVNJe2AcDEGzdlAVugyV4Akxs/NPlL8ajvg0MRlkZrQkHGUc1mr28r7SVVAFGRWp8gDNlgHxRGBG/ZJqKbsMPJfWiwWbua354u6M+nLEuiwrA7nBC07U9u0No6auhIKtjJkSDac8hkEQWc79gRPjpOd2Dbh6X49IDhW8D40DIRIttbkWUMSalDXkxwoz7k4V6Catkdy+ev4F3dOjnrlM4yJRPnXKqh7IVT66L6SgrdiIgtEAONa0DlQ9N2hXa3S2DpWPOKNLQaKCRonpXD8vZe+amEmub7SGcctqQd4H5aDY27ytpRQIDAQABAoIBAFsgUve5Lp8f8db1rrGJstBkPInr9mvYE/PKua1rrirDXZPa4v/gaxPJ/pxU2tChAbGT9COMSCrGm1Z922ziAR4npKU8jIt+7T6h0xbQ+LtldzElXcvi7NtdRUIn88FGRmbcFfkBOtZvu7IrnpYAx8gEGJoJvJtnVU7N7OSFPl/RXor56c5RTGyC2IeNVoxQ7hQdg3VLEnT72+JyoB5XJUVswU6+lQRRX4Yxs2TJvD6oW/V8p+n4AqnOBal8/AhKYNv0azO8hBzeYQKo2yIYeFlmHFGHaIntXI+RJvcVzwoTtI55gWpu/esRNGFVuyVY7d+VQ3QfsR/u+id4OgvVRiECgYEA30h/KaKdSPdUs/vIgd/2i/AfpeGWzccbHj2YoCWrcvjYxTcMu/Wc+wCwvaK5sycJRbTUYK8ekulrh9OAbbudyFssAXTyCvmKIf06IZc9GDJcebjCcES6XD4+ao//9Iiaa/kr1wBvAgb5rsooa59DffcgoeP7jWfUiitnRI1uqB8CgYEA3y6IVvQE9q3W5g2A1Dc/Y/UzvN+8HDWHDOdAv6hmTIE/u7HX+AM4u0l1ZgkczoxBoNHdG0Gvhjfqbr3qyGevjwNK8N/P3QtdtEk6hbsN0kjATZXHAeLgNp6NcyHVR7QXBuU5uEOEjcIAstm1+vEFHHz0EekHa7vmn/sJRtuikhsCgYAnR3CfWW0D7ganlu6B8m1D1t0qaFIIJzOdEUbtPVM46Y/wuaty0VVpTojJA3xZiM93xMTrsULWo1t4THu2UiACpA9Mvk7qIVXsfsigKiPkQs/D1f3WlDCYk5aVVnm3geRwhCfzLa9ZkvKPjh6oOB8+ZKAH+rxA9vgLynDjPWIvDwKBgQCVfrru29ezUPDA+syP2k4I68dzPb7oemZzGzhA6VFU78K8PD15MNdAhM0xwurb5BFV4x2jU1V6p1vOQELTaLitKDx7qr+2xhVHXUHpMEnq0LaXgbtjJRChJYWEWGZf+F7wTH1kUz2oIwqKwtBmPin5Ui2/DYPeA2hRQzuMjjSQfwKBgQCFedvOYEDpBPqJtw01T7cbgTGY8U3pHsQxjef/5BbYd4UROBhkXEzVmA1DMWvU+H52L1XVg1BdGJ9UNdi1NhOFcSi80rN6X8jl1l77kU9ZEWmyDYr9b2NUlP2YyjqCKwymRVasvZndyCbxHeG0SVp39IJAZa2PGf4JeGZI7icqiQ=='),('5b39bf13-d2ec-4f56-b4bd-89d7aa8613aa','f2ea24c2-4fc2-4558-8ca7-a066d92099ea','kid','43b02c41-cc1b-4d5e-8a7b-3f49f9d51169'),('5f2f4b2f-d67c-4271-9b07-81bd2d079202','a6dbcaea-5bf6-4025-86b2-06006be439e7','max-clients','200'),('68599193-35fd-4d0c-964f-2b4e16a96f1a','b21e71cc-d393-4bc3-bf62-434896c32e4e','certificate','MIICozCCAYsCBgFk1UN4RTANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApvcGVucGl0cml4MB4XDTE4MDcyNjA2MjM0NloXDTI4MDcyNjA2MjUyNlowFTETMBEGA1UEAwwKb3BlbnBpdHJpeDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMKovLZ44H6vtBePXfuH4T55Muro+Q5W6VYIylTSXtgHAxBs3ZQFboMleAJMbPzT5S/Go74NDEZZGa0JBxlHNZq9vK+0lVQBRkVqfIAzZYB8URgRv2Saim7DDyX1osFm7mt+eLujPpyxLosKwO5wQtO1PbtDaOmroSCrYyZEg2nPIZBEFnO/YET46Tndg24el+PSA4VvA+NAyESLbW5FlDEmpQ15McKM+5OFegmrZHcvnr+Bd3To565TOMiUT51yqoeyFU+ui+koK3YiILRADjWtA5UPTdoV2t0tg6VjzijS0GigkaJ6Vw/L2XvmphJrm+0hnHLakHeB+Wg2Nu8raUUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAooAzMddbIgieUz7cqVnq3Dz+4yug/y6EgDrBd5/3c2gc1gahxBD6txqAIw/9CdHVjWDSfaMpjjpcQErb63mqgm7juaYQAv+dzXB+QTNUrLrO52N/WF8P0ctylkWPPPe93tYePeYNKQHqoxqK5Cej8Eh0ZLGy0uNwyQWG9Vx9ZxpBt2pEzlmMmsvEUCSHTvHNAGLGiVtguUOFZQ5rwKaO0Pc72bLmH68vz9MMQ5TApJZfTcpysXxByaNKcsoS84Ycksx6cvYMkfjfdMPy5xu+CvWO/S+SHseL3BSmAmbZYmI4T+aoRM64bxbtydNK5otNAMpEXrOQd+N2FkOccLqccw=='),('69243125-04b6-442f-8060-1418b3b6eabf','6c1e732a-0568-415a-89d6-d917ce174460','kid','95b50866-e7b7-4e98-98ab-bdea080dc205'),('70edeb09-6b09-4690-a23c-d31102782398','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('7341aac1-1dba-4735-a4e4-f62bf32177f6','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('79860ca6-61cb-41f1-ae68-8e7da12be414','a2fa291e-a40e-4389-82d7-5fc480d28f9d','allow-default-scopes','true'),('7ccc027b-f59b-45ab-863f-25964003698c','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7e994619-1322-4d6e-99f9-6b677ac561d9','5bf6b31b-b214-4c40-9483-c8b005c9ba06','kid','4c657a7d-d0f4-44cd-be15-a4aa6cd661b3'),('86b5e9f9-7b4a-47d3-a129-acde444758a1','85ba3c5a-ea5a-4f87-bb41-7ee22b2569dd','allow-default-scopes','true'),('912047e4-b598-413f-a90d-f41e0bef4172','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','oidc-address-mapper'),('924a5d74-4fa6-453d-a167-f34f5a9736c6','b21e71cc-d393-4bc3-bf62-434896c32e4e','priority','100'),('93392618-8226-4cf2-9688-4ecd410f4048','a2548ed8-f286-47b5-bcc0-092dd123181c','kid','171331b5-6ef9-436b-a3e4-26ced1edaace'),('94362f8f-9459-441c-b6b6-6a46076714f4','d0bce488-3884-4b16-a24e-b914580d1649','priority','100'),('9527e68d-7bcb-49bc-b9bf-c6fe026e3971','a3cb80cd-c27c-4f39-bdaa-90a5a7878d20','client-uris-must-match','true'),('960baade-74b2-406b-b655-30ba0862c6c8','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('96eb61a3-f0cb-439e-9b3a-91fab7376b47','d0bce488-3884-4b16-a24e-b914580d1649','privateKey','MIIEpAIBAAKCAQEAjW7psh/E0UfVBe5WsM8l/jDJnvIp+WynkbfQoFvCkqSdO6kYeUmY2kLU9HTl+t6APtC082gvTbtadbLReQZWnDmcTNiznYmwKI01GSnx76gyTykBO2YHLQ9uZmi7NRoRitzRl/uWMtpl4NXQVSpBHs+VN0GdtJnZVyBEB98MFtRzGzZ0WhoiX3raPr740zxRWqW2yNYp+sTVuxtU8Zxga4U2aatYGrMLBWyTgE+/18gFuOIWd7DJzKSsbwkdBWPEfdfM+Jg6RpOhK57NKD9XA4PGYDw6/LPaJSvh5I2tbz56edoZvdR4DzBDh6gkyWPwKO2P5H5nqfp8WjotSiqc6wIDAQABAoIBAAy9wS/azNBNuFMgdY7YGoQbwQ4gosdlknL+LD1GBvFPAxss0JecmbiP7L9ZCJ7hDIycILEM4bYO+sc/pL9SYtsQFZSWsRewH76HehEaRkFg1adr+kBvoJXengN7y+Gsx4fK/NbEQ3OxWRw4JtyFQfiUmsyvjJWIhpvivD45Sc2Ek5LORvGKsY5AyrnQKgIRRvppzWUXOxEHZMFzjQcJIqjDlMZmGAwES6kYXjif1abYs6hjKyU8T49P6NJnStbOZP/X9IyCYwBL8j76pPwBdwNhRV6ullc+DSQG8VE+UXvwkT6shV19f/PJy3l/LE7w44jEnqtmvTrHf96m3fuYjoECgYEA1mSRpFl/uOmBbb26KGNYIcF5Brki1W2dTaxTlj/2dSM+oRtVd1jYNPX7bGG9VlS0mCcJPupCWXCh1B9MR5IR4wT8tE6wqG+aEy2OlREsESx2U/gvhgCvnqh4U5BFpqwTmxDUOGj0JGhBG6ngX4YSMnzJ5CWC0U/hIj5LKMdcu8cCgYEAqOGTvUdL4cnRfWNojQt/5CojVIg3I6Eqv96M1zXj8A5sJ0IR9MjzepiiF9BCtCYuuSShL/1/kzzQioJgrq6VW6bGyWFzu1ly2obeyi/FcKS9+mMFjS/bzcglGh19VAT8gywRf8UkbUP/JPLTUBke/RSLadZWGLbb1rhu0RC+Lb0CgYEAietIhiHNOHd++8oB59mA6LY91UVkU0ig2UbyvsWHFvQFZj7fTFerPua/R4nY86CqTPdPy1mINWFvubYorCIbv5+FsbitjK2+wHeeMedKIgIoXPxcFih60eYvAhLdu8sXEbpRy7g41vL6b4FpBgqJylDc0BgRf/WTLyRD1Yfq8CECgYBVXpqZXvYb8DJm6R6L1hlTVH3BmI4PA8ShczXNAJ/11MSVX8/F5uM1wPyHfy6I9Jg/3SViJgoceuyMZ/XJt9UmnHr2h73CIihuESmEGXv8QjsK3I2M3nmFX7xppCiblV20TU2XQif02B+dJObvIZPJqV4EJWYmXiFpPJhANO9+HQKBgQDJkC88G7Yv+7iEEfTGW8cPsIMs4ZqCQJUmbIwljt6UCGbunElNmlD39aJngl5u55WmkIlyX1xvgQftHTOp8Xu6RxkYw07fX9yLgAamrTZvEZB+PYjpyaPfxJmvZPosby/I5QtA7cc9P08BmQWBM7qk7Gb0BdLfTeCV3qBeypYViw=='),('9929fd1b-9b0f-4cd5-b0fe-80893d7160d2','a8173460-95dd-4618-b6ce-5b1739461e3d','allow-default-scopes','true'),('b187bb3e-177b-46e8-8c85-22b22e7cb34f','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b55216a1-3c93-4492-a197-0a7719ad6fa2','5bf6b31b-b214-4c40-9483-c8b005c9ba06','priority','100'),('c91f3314-783e-42f4-bc2d-ccd69f05b6ca','a2548ed8-f286-47b5-bcc0-092dd123181c','priority','100'),('c92b1cc3-dc82-4a66-a9e8-a415da1ac6dc','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('cd4cc7dc-31af-4691-bd8c-1df553073243','097cce4f-e022-402b-813a-71cbd715157a','allowed-protocol-mapper-types','saml-role-list-mapper'),('cd70aedb-550f-4f0b-be3b-70e50a1464dd','d0bce488-3884-4b16-a24e-b914580d1649','certificate','MIICmzCCAYMCBgFk1MINijANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTgwNzI2MDQwMjI0WhcNMjgwNzI2MDQwNDA0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCNbumyH8TRR9UF7lawzyX+MMme8in5bKeRt9CgW8KSpJ07qRh5SZjaQtT0dOX63oA+0LTzaC9Nu1p1stF5BlacOZxM2LOdibAojTUZKfHvqDJPKQE7ZgctD25maLs1GhGK3NGX+5Yy2mXg1dBVKkEez5U3QZ20mdlXIEQH3wwW1HMbNnRaGiJfeto+vvjTPFFapbbI1in6xNW7G1TxnGBrhTZpq1gaswsFbJOAT7/XyAW44hZ3sMnMpKxvCR0FY8R918z4mDpGk6Erns0oP1cDg8ZgPDr8s9olK+Hkja1vPnp52hm91HgPMEOHqCTJY/Ao7Y/kfmep+nxaOi1KKpzrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFyKH7T4CRk7YlHMuj3fUdty72071DsCtf/BLiSDOTEES+0FstsiSZsw17DZ+9K100v0lVPO0nF5Vn8erdHAhSxU6U+5Ay0ngaKHY82sOTGwuoA5gvVT+YPP+d+fuIipWr1T4ElTYqc13X46QQmH7R6S+q1BWE40fFSwBbLcikafvCItKbs2hCig22PuflZz62IGBdj5mWVe5NNk8zGzXvPaTjdPFvHH7sEA7+9lYmQPQ5k6qBH5nQDQ6JVxGmMZMFHgx6q6U3PhfMW5p7kBWuQrGjq+nfuuRfZN6Tl+toDA3j6mtQvK29kkLvgTSwr8rTKeTwmdnQwsjrtpGZncueo='),('cff9236e-92be-439a-906b-1e8255f41960','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d371ea9e-6543-493b-afa5-5ffb7d5b5ffd','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','saml-user-property-mapper'),('d58df8c1-f458-4f54-ad72-091eb880ea62','a566576c-5c80-4057-afa4-577c0f8dcb1c','allowed-protocol-mapper-types','saml-user-property-mapper'),('d6346721-1b3c-4644-b5ad-3781a887fd97','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','oidc-address-mapper'),('da8a64c6-359b-4820-8aca-7a83e411bef1','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('dfb140f2-9934-4038-97d1-ce8edfca67e1','f2ea24c2-4fc2-4558-8ca7-a066d92099ea','secret','vCdL8eNKT5tmGN2Nsrkxlw'),('e5ca39df-5b5a-4f22-8820-2910d80406bb','1e04b5e1-0b51-42d8-9191-ba6aedf0bb15','allowed-protocol-mapper-types','saml-role-list-mapper'),('fb1e263c-cd98-4c2b-b704-8e0254af60c8','f2ea24c2-4fc2-4558-8ca7-a066d92099ea','priority','100'),('fbaa677f-3ec4-45fd-831c-ce8a48d18edc','81bc4491-2417-48af-8fa9-5aff26a8f48b','client-uris-must-match','true'),('ff1c5d31-a733-4038-8c81-7ca86ebf7265','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ff3eec26-5854-4ec3-a9b6-b2a54a0c0f41','21d2ce11-97d9-4931-aabd-0de834586a53','allowed-protocol-mapper-types','saml-role-list-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('065e85ab-5abb-4e1f-a5cc-0ac6ce107bba','293b9ff7-58f3-4c5c-8c29-2c19f7ccbc57'),('275eba35-2006-4719-ba2b-e2834c0dbae3','d9e25bc5-8207-4b7f-a2f8-8df2100b426f'),('47fb9176-0474-4577-933e-87a5e048ea9c','5e716904-5173-4a4a-b0a0-2668281e3a23'),('47fb9176-0474-4577-933e-87a5e048ea9c','7dff7422-a31a-4a88-9ec0-40c8da9f5b6b'),('64bfa779-c352-4be9-b692-71f18c2c8429','dee34666-f669-4628-9cc0-63d3148985c1'),('96883089-e5a1-40c6-9780-a98b0380c1f0','1d6e1561-22cc-4f9f-851a-d3d63ed63492'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','1583e6a4-d323-4fb1-b6e5-a51d9eb9089b'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','27d16d0e-2985-4b45-8d63-0ce07a1892f5'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','2de01edc-f2f3-461c-a169-5d03db81d4cc'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','31fcee49-cb52-4e07-824d-aaa4a92fd8a4'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','37a35067-3b97-42b1-aac9-e3c905a21acd'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','4a75cc33-cee0-41ea-a217-867ef802c3b7'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','4d0ee1e2-8b00-4ea5-80d1-67a0c68dfb34'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','53047571-2c1a-41c0-9135-21a6710b308d'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','5af15f69-421d-4e25-8b8d-056c98a90819'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','5db26475-3135-41e2-ba3d-d3aa672dccf1'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','65f90391-9166-4b30-a4fa-734979df1076'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','6f89511b-c36c-47f9-b893-11e75db635d4'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','8b03d172-7bfb-4efb-b93d-96ddd3689a1f'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','96bb49d8-9094-4c6c-ad85-f7927c0b793d'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','b5a96e04-6bac-46b5-8762-734ea6384b04'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','ce08f9d5-eaa3-46aa-8125-d0f50b3a4645'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','e462e3ce-f77f-4a49-b9d6-bdba9fe7e16b'),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','e64a2e15-e809-42c9-b8f0-628ff33b685c'),('d10d2c8c-39bf-43b7-bb81-8b6424ffdf87','843d06cd-e0f9-4795-9f61-d0452eed0043'),('d10d2c8c-39bf-43b7-bb81-8b6424ffdf87','c5e72ce7-3942-4f6e-ae38-df4f466c3749'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','022bb1ba-fc66-44cf-8d9a-edbb0928eb10'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','0893add8-2084-4a3b-b715-0a8b8b4c2995'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','160d5f05-f26a-491e-a69a-24fced53849e'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','1dbc8818-b1ac-4504-8f1e-18934af712a2'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','20e819c0-3a17-4139-943a-422df94e11e1'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','275eba35-2006-4719-ba2b-e2834c0dbae3'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','2c11b43d-b7ad-47b0-9ae5-57c8e3d8ef7a'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','47fb9176-0474-4577-933e-87a5e048ea9c'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','56abd37c-d470-422d-8021-5ef6f88ab8c1'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','5bd83a73-44c6-42f7-8106-c46594cb03ca'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','5e716904-5173-4a4a-b0a0-2668281e3a23'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','63f43343-5e61-4816-b276-b51d470dd58a'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','64bfa779-c352-4be9-b692-71f18c2c8429'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','6652b227-29f4-405b-811f-2f27d095235d'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','6cff1deb-2d36-4954-95b7-2dcd64854085'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','74a40e6e-a913-423f-ba93-187b3fd70588'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','7dff7422-a31a-4a88-9ec0-40c8da9f5b6b'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','843d06cd-e0f9-4795-9f61-d0452eed0043'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','8550c73a-6039-4c8b-a506-c27a9aedfd0d'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','9349eb5a-4813-4c60-8d9c-e4cbbb24cbf9'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','aa18ee97-80fa-4f9d-b02d-397fbc2bc4c7'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','b93c6764-87a6-431a-89af-dfb2863c3d20'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','baf7760a-d2ce-4696-955b-01eccaf54a03'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','c3dcc99b-c627-4898-b257-d44e71d498a4'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','c5e72ce7-3942-4f6e-ae38-df4f466c3749'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','c864ccb0-b15f-4967-83e6-c624860299ae'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','cc1b6a2e-f02b-4771-9ee0-5f3bbb5fcbe6'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','d10d2c8c-39bf-43b7-bb81-8b6424ffdf87'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','d9e25bc5-8207-4b7f-a2f8-8df2100b426f'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','dd5d7ec6-dd51-41c1-9404-38a24a675fab'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','dee34666-f669-4628-9cc0-63d3148985c1'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','e480e0a2-0209-4bb4-be02-9373abe5531a'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','ef433a57-6e36-4965-8f36-588e13df91fd'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','f5cc3dd0-2194-4759-a90d-e55a877eac1b'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','f7495d17-130f-4194-a3ec-06ec71b89d12'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','fb63ebf3-2d98-463f-a0ce-4544d3c85b1d'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','fe717e1d-8479-486a-8e00-f76b918b1261'),('e462e3ce-f77f-4a49-b9d6-bdba9fe7e16b','b5a96e04-6bac-46b5-8762-734ea6384b04'),('e462e3ce-f77f-4a49-b9d6-bdba9fe7e16b','ce08f9d5-eaa3-46aa-8125-d0f50b3a4645'),('e64a2e15-e809-42c9-b8f0-628ff33b685c','96bb49d8-9094-4c6c-ad85-f7927c0b793d');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36),
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('11f43047-006e-4fd6-b446-79caf46b55e8',NULL,27500,'¨#)\ßmÁ³\ß\Ë\Ñ\Z>/i?P','password','vjKqQiNefSn/cHMXfsafVJC9ObNOal9SSp7j26TCLV27oYDmFk2oOH3IlM6ND8JtWOpgo7t66+uVDBE3FwYA0g==','3e716243-f29a-4417-85fe-5b8494afdcdb',NULL,0,0,0,'pbkdf2-sha256');
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL_ATTRIBUTE`
--

DROP TABLE IF EXISTS `CREDENTIAL_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CREDENTIAL_ATTR_CRED` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `CREDENTIAL` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL_ATTRIBUTE`
--

LOCK TABLES `CREDENTIAL_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CREDENTIAL_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2018-07-26 04:00:36',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2018-07-26 04:00:36',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2018-07-26 04:00:42',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2018-07-26 04:00:43',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2018-07-26 04:00:56',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2018-07-26 04:00:56',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2018-07-26 04:01:04',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2018-07-26 04:01:04',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2018-07-26 04:01:04',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2018-07-26 04:01:18',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2018-07-26 04:01:28',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2018-07-26 04:01:29',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2018-07-26 04:01:32',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-07-26 04:01:35',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-07-26 04:01:35',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-07-26 04:01:35',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2018-07-26 04:01:35',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2018-07-26 04:01:39',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2018-07-26 04:01:43',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2018-07-26 04:01:44',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2018-07-26 04:01:44',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2018-07-26 04:01:45',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2018-07-26 04:01:51',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2018-07-26 04:01:52',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2018-07-26 04:01:53',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2577622330'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2018-07-26 04:01:55',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2018-07-26 04:02:02',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2018-07-26 04:02:03',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2018-07-26 04:02:08',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2018-07-26 04:02:10',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2018-07-26 04:02:12',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2018-07-26 04:02:13',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-07-26 04:02:13',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-07-26 04:02:14',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-07-26 04:02:20',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2018-07-26 04:02:21',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2018-07-26 04:02:22',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2577622330'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2018-07-26 04:02:23',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2018-07-26 04:02:24',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2018-07-26 04:02:24',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2018-07-26 04:02:25',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2018-07-26 04:02:38',42,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2018-07-26 04:02:39',43,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-07-26 04:02:41',44,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-07-26 04:02:42',45,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-07-26 04:02:42',46,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-07-26 04:02:47',47,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2018-07-26 04:02:48',48,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2018-07-26 04:02:54',49,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2018-07-26 04:02:56',50,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2018-07-26 04:02:57',51,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2018-07-26 04:02:57',52,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2577622330'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2018-07-26 04:02:58',53,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2577622330'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2018-07-26 04:02:58',54,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'2577622330'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2018-07-26 04:02:59',55,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'2577622330'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2018-07-26 04:03:01',56,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('4.0.0-KEYCLOAK-5579','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2018-07-26 04:03:16',57,'EXECUTED','7:c88da39534e99aba51cc89d09fd53936','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2018-07-26 04:03:18',58,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'2577622330'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2018-07-26 04:03:18',59,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2577622330');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','21286ba4-7698-46c1-a2ff-65f8ef134bbf','\0'),('master','36db3897-0ad3-41e6-aa62-a7dbdedd6a26',''),('master','85c9fd98-8ca3-4a1b-8c70-8509e3239cf4','\0'),('master','89529abf-5c8d-46e7-a8fc-dbbe3c4f2238',''),('master','a40b2391-6393-4886-8e45-bcb3a2a0baed',''),('master','b8468b0d-03dd-4bb7-af3d-359d893b2d8a','\0'),('openpitrix','4dfa3e08-0085-4a9d-9567-b4fe2a63c852',''),('openpitrix','612c5523-f515-4b04-8dc6-519b5b2e8114',''),('openpitrix','be798254-83d4-4b24-a7de-42eaf17bb8f9',''),('openpitrix','c45344fe-d827-452b-af61-a195fe556ad8','\0'),('openpitrix','c6939c5f-0876-45c1-9ff6-976d168db221','\0'),('openpitrix','faf0b40c-4ec9-4e7d-a2b5-2473b032d7d5','\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_CREDENTIAL_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_CREDENTIAL_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FED_CRED_ATTR_CRED` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_FED_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `FED_USER_CREDENTIAL` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_CREDENTIAL_ATTRIBUTE`
--

LOCK TABLES `FED_CREDENTIAL_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('022bb1ba-fc66-44cf-8d9a-edbb0928eb10','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_manage-events}','manage-events','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('065e85ab-5abb-4e1f-a5cc-0ac6ce107bba','8baa9b9f-9890-488a-aded-401c324b7a0d','','${role_manage-account}','manage-account','openpitrix','8baa9b9f-9890-488a-aded-401c324b7a0d',NULL),('0893add8-2084-4a3b-b715-0a8b8b4c2995','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_manage-identity-providers}','manage-identity-providers','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('1583e6a4-d323-4fb1-b6e5-a51d9eb9089b','2f24032d-914f-4073-930e-b273fa72dc60','','${role_impersonation}','impersonation','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('160d5f05-f26a-491e-a69a-24fced53849e','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_view-events}','view-events','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('1d6e1561-22cc-4f9f-851a-d3d63ed63492','7f467b19-4489-4740-977b-9fe168d74a3c','','${role_manage-account-links}','manage-account-links','master','7f467b19-4489-4740-977b-9fe168d74a3c',NULL),('1dbc8818-b1ac-4504-8f1e-18934af712a2','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_create-client}','create-client','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('20e819c0-3a17-4139-943a-422df94e11e1','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_create-client}','create-client','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('275eba35-2006-4719-ba2b-e2834c0dbae3','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_view-clients}','view-clients','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('27d16d0e-2985-4b45-8d63-0ce07a1892f5','2f24032d-914f-4073-930e-b273fa72dc60','','${role_manage-clients}','manage-clients','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('293b9ff7-58f3-4c5c-8c29-2c19f7ccbc57','8baa9b9f-9890-488a-aded-401c324b7a0d','','${role_manage-account-links}','manage-account-links','openpitrix','8baa9b9f-9890-488a-aded-401c324b7a0d',NULL),('2c11b43d-b7ad-47b0-9ae5-57c8e3d8ef7a','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_view-identity-providers}','view-identity-providers','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('2de01edc-f2f3-461c-a169-5d03db81d4cc','2f24032d-914f-4073-930e-b273fa72dc60','','${role_manage-identity-providers}','manage-identity-providers','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('31fcee49-cb52-4e07-824d-aaa4a92fd8a4','2f24032d-914f-4073-930e-b273fa72dc60','','${role_create-client}','create-client','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('37a35067-3b97-42b1-aac9-e3c905a21acd','2f24032d-914f-4073-930e-b273fa72dc60','','${role_view-identity-providers}','view-identity-providers','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('47251525-e896-4b48-baef-3c978c603cca','openpitrix','\0','${role_uma_authorization}','uma_authorization','openpitrix',NULL,'openpitrix'),('47fb9176-0474-4577-933e-87a5e048ea9c','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_view-users}','view-users','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('4a75cc33-cee0-41ea-a217-867ef802c3b7','2f24032d-914f-4073-930e-b273fa72dc60','','${role_manage-authorization}','manage-authorization','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('4d0ee1e2-8b00-4ea5-80d1-67a0c68dfb34','2f24032d-914f-4073-930e-b273fa72dc60','','${role_view-realm}','view-realm','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('53047571-2c1a-41c0-9135-21a6710b308d','2f24032d-914f-4073-930e-b273fa72dc60','','${role_manage-users}','manage-users','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('56abd37c-d470-422d-8021-5ef6f88ab8c1','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_manage-realm}','manage-realm','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('5af15f69-421d-4e25-8b8d-056c98a90819','2f24032d-914f-4073-930e-b273fa72dc60','','${role_manage-realm}','manage-realm','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('5bd83a73-44c6-42f7-8106-c46594cb03ca','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_manage-authorization}','manage-authorization','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('5db26475-3135-41e2-ba3d-d3aa672dccf1','2f24032d-914f-4073-930e-b273fa72dc60','','${role_view-events}','view-events','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('5e716904-5173-4a4a-b0a0-2668281e3a23','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_query-groups}','query-groups','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('63f43343-5e61-4816-b276-b51d470dd58a','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_view-identity-providers}','view-identity-providers','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('64bfa779-c352-4be9-b692-71f18c2c8429','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_view-clients}','view-clients','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('65f90391-9166-4b30-a4fa-734979df1076','2f24032d-914f-4073-930e-b273fa72dc60','','${role_view-authorization}','view-authorization','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('6652b227-29f4-405b-811f-2f27d095235d','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_manage-realm}','manage-realm','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('6a16aaf2-c537-4661-9f5b-baa9e4b365e7','master','\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('6cff1deb-2d36-4954-95b7-2dcd64854085','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_manage-identity-providers}','manage-identity-providers','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('6f89511b-c36c-47f9-b893-11e75db635d4','2f24032d-914f-4073-930e-b273fa72dc60','','${role_query-realms}','query-realms','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('74a40e6e-a913-423f-ba93-187b3fd70588','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_query-realms}','query-realms','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('7dff7422-a31a-4a88-9ec0-40c8da9f5b6b','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_query-users}','query-users','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('80a846b1-c11b-453c-9716-96b9d021dcfa','master','\0','${role_offline-access}','offline_access','master',NULL,'master'),('843d06cd-e0f9-4795-9f61-d0452eed0043','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_query-users}','query-users','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('8550c73a-6039-4c8b-a506-c27a9aedfd0d','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_view-authorization}','view-authorization','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('8b03d172-7bfb-4efb-b93d-96ddd3689a1f','2f24032d-914f-4073-930e-b273fa72dc60','','${role_manage-events}','manage-events','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('9349eb5a-4813-4c60-8d9c-e4cbbb24cbf9','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_impersonation}','impersonation','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('96883089-e5a1-40c6-9780-a98b0380c1f0','7f467b19-4489-4740-977b-9fe168d74a3c','','${role_manage-account}','manage-account','master','7f467b19-4489-4740-977b-9fe168d74a3c',NULL),('96bb49d8-9094-4c6c-ad85-f7927c0b793d','2f24032d-914f-4073-930e-b273fa72dc60','','${role_query-clients}','query-clients','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('aa18ee97-80fa-4f9d-b02d-397fbc2bc4c7','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_query-realms}','query-realms','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('acff62af-df15-49e4-bc74-246a4d54a3f2','9749701a-cd84-4f43-993b-074f0afaa434','','${role_read-token}','read-token','master','9749701a-cd84-4f43-993b-074f0afaa434',NULL),('b0a6d738-a372-42bc-abcb-5783e7ef4d26','507dfaaf-8457-4c66-b6b6-5eadd6579f39','','${role_read-token}','read-token','openpitrix','507dfaaf-8457-4c66-b6b6-5eadd6579f39',NULL),('b2e19a19-400e-4f9c-9df4-8248b7ad04ad','2f24032d-914f-4073-930e-b273fa72dc60','','${role_realm-admin}','realm-admin','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('b5a96e04-6bac-46b5-8762-734ea6384b04','2f24032d-914f-4073-930e-b273fa72dc60','','${role_query-groups}','query-groups','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('b6972f98-1d4e-42ad-8f0a-d38bec93835e','openpitrix','\0','${role_offline-access}','offline_access','openpitrix',NULL,'openpitrix'),('b93c6764-87a6-431a-89af-dfb2863c3d20','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_manage-authorization}','manage-authorization','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('baf7760a-d2ce-4696-955b-01eccaf54a03','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_manage-clients}','manage-clients','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('c3dcc99b-c627-4898-b257-d44e71d498a4','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_view-realm}','view-realm','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('c42a65a5-84e2-4e7c-924c-759952d9aa36','8baa9b9f-9890-488a-aded-401c324b7a0d','','${role_view-profile}','view-profile','openpitrix','8baa9b9f-9890-488a-aded-401c324b7a0d',NULL),('c5e72ce7-3942-4f6e-ae38-df4f466c3749','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_query-groups}','query-groups','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('c864ccb0-b15f-4967-83e6-c624860299ae','master','\0','${role_create-realm}','create-realm','master',NULL,'master'),('cc1b6a2e-f02b-4771-9ee0-5f3bbb5fcbe6','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_impersonation}','impersonation','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('ce08f9d5-eaa3-46aa-8125-d0f50b3a4645','2f24032d-914f-4073-930e-b273fa72dc60','','${role_query-users}','query-users','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('d10d2c8c-39bf-43b7-bb81-8b6424ffdf87','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_view-users}','view-users','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('d9e25bc5-8207-4b7f-a2f8-8df2100b426f','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_query-clients}','query-clients','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','master','\0','${role_admin}','admin','master',NULL,'master'),('dd5d7ec6-dd51-41c1-9404-38a24a675fab','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_manage-users}','manage-users','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('dee34666-f669-4628-9cc0-63d3148985c1','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_query-clients}','query-clients','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('e462e3ce-f77f-4a49-b9d6-bdba9fe7e16b','2f24032d-914f-4073-930e-b273fa72dc60','','${role_view-users}','view-users','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('e480e0a2-0209-4bb4-be02-9373abe5531a','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_view-realm}','view-realm','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('e64a2e15-e809-42c9-b8f0-628ff33b685c','2f24032d-914f-4073-930e-b273fa72dc60','','${role_view-clients}','view-clients','openpitrix','2f24032d-914f-4073-930e-b273fa72dc60',NULL),('ee3f0d05-714f-43d4-b6f9-d5264e3c081a','7f467b19-4489-4740-977b-9fe168d74a3c','','${role_view-profile}','view-profile','master','7f467b19-4489-4740-977b-9fe168d74a3c',NULL),('ef433a57-6e36-4965-8f36-588e13df91fd','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_manage-events}','manage-events','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('f5cc3dd0-2194-4759-a90d-e55a877eac1b','f65daa41-2ef2-44b2-8ed1-cb38fd229486','','${role_view-events}','view-events','master','f65daa41-2ef2-44b2-8ed1-cb38fd229486',NULL),('f7495d17-130f-4194-a3ec-06ec71b89d12','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_manage-users}','manage-users','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('fb63ebf3-2d98-463f-a0ce-4544d3c85b1d','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_view-authorization}','view-authorization','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL),('fe717e1d-8479-486a-8e00-f76b918b1261','80262a94-7a64-4c5f-9328-3574fda0af33','','${role_manage-clients}','manage-clients','master','80262a94-7a64-4c5f-9328-3574fda0af33',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('SINGLETON','4.0.0');
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02223555-ff63-4c84-b902-c35aab01ce91','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('02721286-87c4-4cb6-b696-857089e9ca97','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('08886c40-4092-4543-adf6-a1d73b8c7afc','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('093a838f-04fb-48b3-83ad-15b8d1552f87','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('16af40c3-c094-4374-ab55-9c3b915fe796','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('17590cec-fd76-4f4b-a576-22e2654a14b1','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('1a38715d-7916-4797-9412-61e1196392da','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('1de95338-ed83-44c1-84ad-2cf92440584f','username','openid-connect','oidc-usermodel-property-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','locale','openid-connect','oidc-usermodel-attribute-mapper','07224f6d-d14f-4334-b0bc-d38b8ee2dbb8',NULL),('39f27bda-a735-47c7-b799-f520d867d6e5','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'4dfa3e08-0085-4a9d-9567-b4fe2a63c852'),('3e619c8b-811c-447e-aab5-a4f928ab4129','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','c4d3ad1f-4830-4069-b4b0-c6fad59a732d',NULL),('49a07b80-12e7-43ee-a9ce-303fc111aee9','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('4c89c056-bb16-41a9-85d7-e9f77040753c','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('4c9902ef-6f66-4c6f-b7d4-c162a07e2e38','role list','saml','saml-role-list-mapper',NULL,'612c5523-f515-4b04-8dc6-519b5b2e8114'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('539c0ab2-6539-4296-b366-d52a1922e945','username','openid-connect','oidc-usermodel-property-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('53a93771-acad-4a15-9772-b05c636cbbb6','role list','saml','saml-role-list-mapper',NULL,'a40b2391-6393-4886-8e45-bcb3a2a0baed'),('59e43c20-2018-4734-89bc-8b2732042cd9','address','openid-connect','oidc-address-mapper',NULL,'c45344fe-d827-452b-af61-a195fe556ad8'),('6548acea-2201-4341-a552-446272b702f7','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','email','openid-connect','oidc-usermodel-property-mapper',NULL,'89529abf-5c8d-46e7-a8fc-dbbe3c4f2238'),('7eab6ee8-c2fd-41ca-936a-a53786250196','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('7ec85784-733a-4975-aa08-57ab85869638','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','c4d3ad1f-4830-4069-b4b0-c6fad59a732d',NULL),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','address','openid-connect','oidc-address-mapper',NULL,'21286ba4-7698-46c1-a2ff-65f8ef134bbf'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'85c9fd98-8ca3-4a1b-8c70-8509e3239cf4'),('977c5ff9-591d-4685-97ca-76cf9f299120','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','email','openid-connect','oidc-usermodel-property-mapper',NULL,'4dfa3e08-0085-4a9d-9567-b4fe2a63c852'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c6939c5f-0876-45c1-9ff6-976d168db221'),('9e3b14e7-931c-413f-9e34-b481382f05bd','locale','openid-connect','oidc-usermodel-attribute-mapper','f60bdb88-81aa-41d8-9dff-c5182a719562',NULL),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('a8d5ce47-8c66-4666-b89d-dc8dd7134733','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','c4d3ad1f-4830-4069-b4b0-c6fad59a732d',NULL),('bb3c51ef-56a1-47fc-968f-76848c030f41','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'89529abf-5c8d-46e7-a8fc-dbbe3c4f2238'),('c4fd684b-858e-45af-8ba7-1194c172a819','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('c8966736-5bf8-4e15-afff-727e30c58027','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c6939c5f-0876-45c1-9ff6-976d168db221'),('d35add1c-0884-4b9a-b040-7324122e6e3f','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'85c9fd98-8ca3-4a1b-8c70-8509e3239cf4'),('dd5c97af-b64d-4b49-8621-e317e0b2d57e','full name','openid-connect','oidc-full-name-mapper',NULL,'36db3897-0ad3-41e6-aa62-a7dbdedd6a26'),('e2f4a8bb-660b-4436-976f-f22946c662d2','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('f13f4452-e593-465a-871b-be50d158a592','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9'),('f2523914-2585-45df-b947-13aef1501902','full name','openid-connect','oidc-full-name-mapper',NULL,'be798254-83d4-4b24-a7de-42eaf17bb8f9');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02223555-ff63-4c84-b902-c35aab01ce91','true','access.token.claim'),('02223555-ff63-4c84-b902-c35aab01ce91','nickname','claim.name'),('02223555-ff63-4c84-b902-c35aab01ce91','true','id.token.claim'),('02223555-ff63-4c84-b902-c35aab01ce91','String','jsonType.label'),('02223555-ff63-4c84-b902-c35aab01ce91','nickname','user.attribute'),('02223555-ff63-4c84-b902-c35aab01ce91','true','userinfo.token.claim'),('02721286-87c4-4cb6-b696-857089e9ca97','true','access.token.claim'),('02721286-87c4-4cb6-b696-857089e9ca97','family_name','claim.name'),('02721286-87c4-4cb6-b696-857089e9ca97','true','id.token.claim'),('02721286-87c4-4cb6-b696-857089e9ca97','String','jsonType.label'),('02721286-87c4-4cb6-b696-857089e9ca97','lastName','user.attribute'),('02721286-87c4-4cb6-b696-857089e9ca97','true','userinfo.token.claim'),('08886c40-4092-4543-adf6-a1d73b8c7afc','true','access.token.claim'),('08886c40-4092-4543-adf6-a1d73b8c7afc','zoneinfo','claim.name'),('08886c40-4092-4543-adf6-a1d73b8c7afc','true','id.token.claim'),('08886c40-4092-4543-adf6-a1d73b8c7afc','String','jsonType.label'),('08886c40-4092-4543-adf6-a1d73b8c7afc','zoneinfo','user.attribute'),('08886c40-4092-4543-adf6-a1d73b8c7afc','true','userinfo.token.claim'),('093a838f-04fb-48b3-83ad-15b8d1552f87','true','access.token.claim'),('093a838f-04fb-48b3-83ad-15b8d1552f87','birthdate','claim.name'),('093a838f-04fb-48b3-83ad-15b8d1552f87','true','id.token.claim'),('093a838f-04fb-48b3-83ad-15b8d1552f87','String','jsonType.label'),('093a838f-04fb-48b3-83ad-15b8d1552f87','birthdate','user.attribute'),('093a838f-04fb-48b3-83ad-15b8d1552f87','true','userinfo.token.claim'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','true','access.token.claim'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','middle_name','claim.name'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','true','id.token.claim'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','String','jsonType.label'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','middleName','user.attribute'),('0e0bf2b6-1445-4038-bcde-4f2570461ea9','true','userinfo.token.claim'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','true','access.token.claim'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','locale','claim.name'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','true','id.token.claim'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','String','jsonType.label'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','locale','user.attribute'),('0f69fa8c-4992-4632-aa07-9afc3e88f240','true','userinfo.token.claim'),('16af40c3-c094-4374-ab55-9c3b915fe796','true','access.token.claim'),('16af40c3-c094-4374-ab55-9c3b915fe796','zoneinfo','claim.name'),('16af40c3-c094-4374-ab55-9c3b915fe796','true','id.token.claim'),('16af40c3-c094-4374-ab55-9c3b915fe796','String','jsonType.label'),('16af40c3-c094-4374-ab55-9c3b915fe796','zoneinfo','user.attribute'),('16af40c3-c094-4374-ab55-9c3b915fe796','true','userinfo.token.claim'),('17590cec-fd76-4f4b-a576-22e2654a14b1','true','access.token.claim'),('17590cec-fd76-4f4b-a576-22e2654a14b1','profile','claim.name'),('17590cec-fd76-4f4b-a576-22e2654a14b1','true','id.token.claim'),('17590cec-fd76-4f4b-a576-22e2654a14b1','String','jsonType.label'),('17590cec-fd76-4f4b-a576-22e2654a14b1','profile','user.attribute'),('17590cec-fd76-4f4b-a576-22e2654a14b1','true','userinfo.token.claim'),('1a38715d-7916-4797-9412-61e1196392da','true','access.token.claim'),('1a38715d-7916-4797-9412-61e1196392da','updated_at','claim.name'),('1a38715d-7916-4797-9412-61e1196392da','true','id.token.claim'),('1a38715d-7916-4797-9412-61e1196392da','String','jsonType.label'),('1a38715d-7916-4797-9412-61e1196392da','updatedAt','user.attribute'),('1a38715d-7916-4797-9412-61e1196392da','true','userinfo.token.claim'),('1de95338-ed83-44c1-84ad-2cf92440584f','true','access.token.claim'),('1de95338-ed83-44c1-84ad-2cf92440584f','preferred_username','claim.name'),('1de95338-ed83-44c1-84ad-2cf92440584f','true','id.token.claim'),('1de95338-ed83-44c1-84ad-2cf92440584f','String','jsonType.label'),('1de95338-ed83-44c1-84ad-2cf92440584f','username','user.attribute'),('1de95338-ed83-44c1-84ad-2cf92440584f','true','userinfo.token.claim'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','true','access.token.claim'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','given_name','claim.name'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','true','id.token.claim'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','String','jsonType.label'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','firstName','user.attribute'),('244fbbf1-fcbf-4ed5-b597-0060497c3d24','true','userinfo.token.claim'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','true','access.token.claim'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','locale','claim.name'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','true','id.token.claim'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','String','jsonType.label'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','locale','user.attribute'),('2e656daa-4ea0-4cb1-9ec9-978fb13ea730','true','userinfo.token.claim'),('39f27bda-a735-47c7-b799-f520d867d6e5','true','access.token.claim'),('39f27bda-a735-47c7-b799-f520d867d6e5','email_verified','claim.name'),('39f27bda-a735-47c7-b799-f520d867d6e5','true','id.token.claim'),('39f27bda-a735-47c7-b799-f520d867d6e5','boolean','jsonType.label'),('39f27bda-a735-47c7-b799-f520d867d6e5','emailVerified','user.attribute'),('39f27bda-a735-47c7-b799-f520d867d6e5','true','userinfo.token.claim'),('3e619c8b-811c-447e-aab5-a4f928ab4129','true','access.token.claim'),('3e619c8b-811c-447e-aab5-a4f928ab4129','clientId','claim.name'),('3e619c8b-811c-447e-aab5-a4f928ab4129','true','id.token.claim'),('3e619c8b-811c-447e-aab5-a4f928ab4129','String','jsonType.label'),('3e619c8b-811c-447e-aab5-a4f928ab4129','clientId','user.session.note'),('49a07b80-12e7-43ee-a9ce-303fc111aee9','true','access.token.claim'),('49a07b80-12e7-43ee-a9ce-303fc111aee9','middle_name','claim.name'),('49a07b80-12e7-43ee-a9ce-303fc111aee9','true','id.token.claim'),('49a07b80-12e7-43ee-a9ce-303fc111aee9','String','jsonType.label'),('49a07b80-12e7-43ee-a9ce-303fc111aee9','middleName','user.attribute'),('49a07b80-12e7-43ee-a9ce-303fc111aee9','true','userinfo.token.claim'),('4c89c056-bb16-41a9-85d7-e9f77040753c','true','access.token.claim'),('4c89c056-bb16-41a9-85d7-e9f77040753c','website','claim.name'),('4c89c056-bb16-41a9-85d7-e9f77040753c','true','id.token.claim'),('4c89c056-bb16-41a9-85d7-e9f77040753c','String','jsonType.label'),('4c89c056-bb16-41a9-85d7-e9f77040753c','website','user.attribute'),('4c89c056-bb16-41a9-85d7-e9f77040753c','true','userinfo.token.claim'),('4c9902ef-6f66-4c6f-b7d4-c162a07e2e38','Role','attribute.name'),('4c9902ef-6f66-4c6f-b7d4-c162a07e2e38','Basic','attribute.nameformat'),('4c9902ef-6f66-4c6f-b7d4-c162a07e2e38','false','single'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','true','access.token.claim'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','given_name','claim.name'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','true','id.token.claim'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','String','jsonType.label'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','firstName','user.attribute'),('50619bb6-c6a6-40b5-9a31-097dc64e2520','true','userinfo.token.claim'),('539c0ab2-6539-4296-b366-d52a1922e945','true','access.token.claim'),('539c0ab2-6539-4296-b366-d52a1922e945','preferred_username','claim.name'),('539c0ab2-6539-4296-b366-d52a1922e945','true','id.token.claim'),('539c0ab2-6539-4296-b366-d52a1922e945','String','jsonType.label'),('539c0ab2-6539-4296-b366-d52a1922e945','username','user.attribute'),('539c0ab2-6539-4296-b366-d52a1922e945','true','userinfo.token.claim'),('53a93771-acad-4a15-9772-b05c636cbbb6','Role','attribute.name'),('53a93771-acad-4a15-9772-b05c636cbbb6','Basic','attribute.nameformat'),('53a93771-acad-4a15-9772-b05c636cbbb6','false','single'),('59e43c20-2018-4734-89bc-8b2732042cd9','true','access.token.claim'),('59e43c20-2018-4734-89bc-8b2732042cd9','true','id.token.claim'),('59e43c20-2018-4734-89bc-8b2732042cd9','country','user.attribute.country'),('59e43c20-2018-4734-89bc-8b2732042cd9','formatted','user.attribute.formatted'),('59e43c20-2018-4734-89bc-8b2732042cd9','locality','user.attribute.locality'),('59e43c20-2018-4734-89bc-8b2732042cd9','postal_code','user.attribute.postal_code'),('59e43c20-2018-4734-89bc-8b2732042cd9','region','user.attribute.region'),('59e43c20-2018-4734-89bc-8b2732042cd9','street','user.attribute.street'),('59e43c20-2018-4734-89bc-8b2732042cd9','true','userinfo.token.claim'),('6548acea-2201-4341-a552-446272b702f7','true','access.token.claim'),('6548acea-2201-4341-a552-446272b702f7','gender','claim.name'),('6548acea-2201-4341-a552-446272b702f7','true','id.token.claim'),('6548acea-2201-4341-a552-446272b702f7','String','jsonType.label'),('6548acea-2201-4341-a552-446272b702f7','gender','user.attribute'),('6548acea-2201-4341-a552-446272b702f7','true','userinfo.token.claim'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','true','access.token.claim'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','email','claim.name'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','true','id.token.claim'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','String','jsonType.label'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','email','user.attribute'),('660ad469-bae6-4eed-89ab-bf0b5f0b37f1','true','userinfo.token.claim'),('7eab6ee8-c2fd-41ca-936a-a53786250196','true','access.token.claim'),('7eab6ee8-c2fd-41ca-936a-a53786250196','nickname','claim.name'),('7eab6ee8-c2fd-41ca-936a-a53786250196','true','id.token.claim'),('7eab6ee8-c2fd-41ca-936a-a53786250196','String','jsonType.label'),('7eab6ee8-c2fd-41ca-936a-a53786250196','nickname','user.attribute'),('7eab6ee8-c2fd-41ca-936a-a53786250196','true','userinfo.token.claim'),('7ec85784-733a-4975-aa08-57ab85869638','true','access.token.claim'),('7ec85784-733a-4975-aa08-57ab85869638','clientAddress','claim.name'),('7ec85784-733a-4975-aa08-57ab85869638','true','id.token.claim'),('7ec85784-733a-4975-aa08-57ab85869638','String','jsonType.label'),('7ec85784-733a-4975-aa08-57ab85869638','clientAddress','user.session.note'),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','true','access.token.claim'),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','locale','claim.name'),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','true','id.token.claim'),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','String','jsonType.label'),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','locale','user.attribute'),('7fa2c5c6-037e-4235-a351-4fe682b77f8c','true','userinfo.token.claim'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','true','access.token.claim'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','true','id.token.claim'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','country','user.attribute.country'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','formatted','user.attribute.formatted'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','locality','user.attribute.locality'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','postal_code','user.attribute.postal_code'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','region','user.attribute.region'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','street','user.attribute.street'),('81993897-9150-49d1-8c5d-1f18fb3bb2a7','true','userinfo.token.claim'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','true','access.token.claim'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','profile','claim.name'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','true','id.token.claim'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','String','jsonType.label'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','profile','user.attribute'),('8b00aa2b-4b52-4d25-8f1c-41100212b2cc','true','userinfo.token.claim'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','true','access.token.claim'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','phone_number','claim.name'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','true','id.token.claim'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','String','jsonType.label'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','phoneNumber','user.attribute'),('90150ca1-d963-4486-b805-f4cd6c3fbfa9','true','userinfo.token.claim'),('977c5ff9-591d-4685-97ca-76cf9f299120','true','access.token.claim'),('977c5ff9-591d-4685-97ca-76cf9f299120','website','claim.name'),('977c5ff9-591d-4685-97ca-76cf9f299120','true','id.token.claim'),('977c5ff9-591d-4685-97ca-76cf9f299120','String','jsonType.label'),('977c5ff9-591d-4685-97ca-76cf9f299120','website','user.attribute'),('977c5ff9-591d-4685-97ca-76cf9f299120','true','userinfo.token.claim'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','true','access.token.claim'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','email','claim.name'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','true','id.token.claim'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','String','jsonType.label'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','email','user.attribute'),('9afc77d4-9313-44b2-aa63-18e128cc93a7','true','userinfo.token.claim'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','true','access.token.claim'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','phone_number_verified','claim.name'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','true','id.token.claim'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','boolean','jsonType.label'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','phoneNumberVerified','user.attribute'),('9b6081cf-3a3e-4b2b-a78c-aaaee6190397','true','userinfo.token.claim'),('9e3b14e7-931c-413f-9e34-b481382f05bd','true','access.token.claim'),('9e3b14e7-931c-413f-9e34-b481382f05bd','locale','claim.name'),('9e3b14e7-931c-413f-9e34-b481382f05bd','true','id.token.claim'),('9e3b14e7-931c-413f-9e34-b481382f05bd','String','jsonType.label'),('9e3b14e7-931c-413f-9e34-b481382f05bd','locale','user.attribute'),('9e3b14e7-931c-413f-9e34-b481382f05bd','true','userinfo.token.claim'),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','true','access.token.claim'),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','birthdate','claim.name'),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','true','id.token.claim'),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','String','jsonType.label'),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','birthdate','user.attribute'),('9ec6eb35-a681-43ca-bd84-3815dc7d2a54','true','userinfo.token.claim'),('a8d5ce47-8c66-4666-b89d-dc8dd7134733','true','access.token.claim'),('a8d5ce47-8c66-4666-b89d-dc8dd7134733','clientHost','claim.name'),('a8d5ce47-8c66-4666-b89d-dc8dd7134733','true','id.token.claim'),('a8d5ce47-8c66-4666-b89d-dc8dd7134733','String','jsonType.label'),('a8d5ce47-8c66-4666-b89d-dc8dd7134733','clientHost','user.session.note'),('bb3c51ef-56a1-47fc-968f-76848c030f41','true','access.token.claim'),('bb3c51ef-56a1-47fc-968f-76848c030f41','email_verified','claim.name'),('bb3c51ef-56a1-47fc-968f-76848c030f41','true','id.token.claim'),('bb3c51ef-56a1-47fc-968f-76848c030f41','boolean','jsonType.label'),('bb3c51ef-56a1-47fc-968f-76848c030f41','emailVerified','user.attribute'),('bb3c51ef-56a1-47fc-968f-76848c030f41','true','userinfo.token.claim'),('c4fd684b-858e-45af-8ba7-1194c172a819','true','access.token.claim'),('c4fd684b-858e-45af-8ba7-1194c172a819','picture','claim.name'),('c4fd684b-858e-45af-8ba7-1194c172a819','true','id.token.claim'),('c4fd684b-858e-45af-8ba7-1194c172a819','String','jsonType.label'),('c4fd684b-858e-45af-8ba7-1194c172a819','picture','user.attribute'),('c4fd684b-858e-45af-8ba7-1194c172a819','true','userinfo.token.claim'),('c8966736-5bf8-4e15-afff-727e30c58027','true','access.token.claim'),('c8966736-5bf8-4e15-afff-727e30c58027','updated_at','claim.name'),('c8966736-5bf8-4e15-afff-727e30c58027','true','id.token.claim'),('c8966736-5bf8-4e15-afff-727e30c58027','String','jsonType.label'),('c8966736-5bf8-4e15-afff-727e30c58027','updatedAt','user.attribute'),('c8966736-5bf8-4e15-afff-727e30c58027','true','userinfo.token.claim'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','true','access.token.claim'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','family_name','claim.name'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','true','id.token.claim'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','String','jsonType.label'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','lastName','user.attribute'),('ca35e6f9-d0ce-4293-83e5-b9244e728a12','true','userinfo.token.claim'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','true','access.token.claim'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','phone_number','claim.name'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','true','id.token.claim'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','String','jsonType.label'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','phoneNumber','user.attribute'),('ce2ba90b-dddc-42e5-b075-cb5e1d2b4eca','true','userinfo.token.claim'),('d35add1c-0884-4b9a-b040-7324122e6e3f','true','access.token.claim'),('d35add1c-0884-4b9a-b040-7324122e6e3f','phone_number_verified','claim.name'),('d35add1c-0884-4b9a-b040-7324122e6e3f','true','id.token.claim'),('d35add1c-0884-4b9a-b040-7324122e6e3f','boolean','jsonType.label'),('d35add1c-0884-4b9a-b040-7324122e6e3f','phoneNumberVerified','user.attribute'),('d35add1c-0884-4b9a-b040-7324122e6e3f','true','userinfo.token.claim'),('dd5c97af-b64d-4b49-8621-e317e0b2d57e','true','access.token.claim'),('dd5c97af-b64d-4b49-8621-e317e0b2d57e','true','id.token.claim'),('dd5c97af-b64d-4b49-8621-e317e0b2d57e','true','userinfo.token.claim'),('e2f4a8bb-660b-4436-976f-f22946c662d2','true','access.token.claim'),('e2f4a8bb-660b-4436-976f-f22946c662d2','gender','claim.name'),('e2f4a8bb-660b-4436-976f-f22946c662d2','true','id.token.claim'),('e2f4a8bb-660b-4436-976f-f22946c662d2','String','jsonType.label'),('e2f4a8bb-660b-4436-976f-f22946c662d2','gender','user.attribute'),('e2f4a8bb-660b-4436-976f-f22946c662d2','true','userinfo.token.claim'),('f13f4452-e593-465a-871b-be50d158a592','true','access.token.claim'),('f13f4452-e593-465a-871b-be50d158a592','picture','claim.name'),('f13f4452-e593-465a-871b-be50d158a592','true','id.token.claim'),('f13f4452-e593-465a-871b-be50d158a592','String','jsonType.label'),('f13f4452-e593-465a-871b-be50d158a592','picture','user.attribute'),('f13f4452-e593-465a-871b-be50d158a592','true','userinfo.token.claim'),('f2523914-2585-45df-b947-13aef1501902','true','access.token.claim'),('f2523914-2585-45df-b947-13aef1501902','true','id.token.claim'),('f2523914-2585-45df-b947-13aef1501902','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'\0','\0','\0','\0','NONE',1800,36000,'\0','\0','80262a94-7a64-4c5f-9328-3574fda0af33',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','4e885b8b-faf0-42e7-9602-b552720e32d1','3d29538d-9d8b-4fd5-961f-524361101d57','f012eae8-785a-4019-a668-2c7f4d4713b6','468cd2c8-5b4a-4820-91b3-c680fe70ebea','18edbb39-aad9-4419-a4d4-2d3b6e1a1c49',2592000,'\0',900,'','\0','ad5a263d-5c3f-4f31-9f69-6c39a732ef05',0,'\0'),('openpitrix',60,300,3600,NULL,NULL,NULL,'','\0',0,NULL,'openpitrix',0,NULL,'\0','\0','\0','\0','NONE',3600,36000,'\0','\0','f65daa41-2ef2-44b2-8ed1-cb38fd229486',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','3cc43cfc-acca-40b8-940f-aeb586439264','d95594d6-cdeb-446f-9f92-40337b587d5a','f488cf13-991d-4137-a1c0-ca2dec6e813c','dfc1c02d-4ae1-44e2-947f-517dde925275','325d94fb-97bb-4fb0-9959-366ee37d9e09',2592000,'\0',3600,'','\0','a8e8b1b1-4785-4027-9f94-e753dc18d04a',0,'\0');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','43200','openpitrix'),('actionTokenGeneratedByUserLifespan','300','openpitrix'),('bruteForceProtected','false','master'),('bruteForceProtected','false','openpitrix'),('displayName','Keycloak','master'),('displayName','Openpitrix','openpitrix'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('displayNameHtml','Openpitrix','openpitrix'),('failureFactor','30','master'),('failureFactor','30','openpitrix'),('maxDeltaTimeSeconds','43200','master'),('maxDeltaTimeSeconds','43200','openpitrix'),('maxFailureWaitSeconds','900','master'),('maxFailureWaitSeconds','900','openpitrix'),('minimumQuickLoginWaitSeconds','60','master'),('minimumQuickLoginWaitSeconds','60','openpitrix'),('offlineSessionMaxLifespan','5184000','master'),('offlineSessionMaxLifespan','5184000','openpitrix'),('offlineSessionMaxLifespanEnabled','false','master'),('offlineSessionMaxLifespanEnabled','false','openpitrix'),('permanentLockout','false','master'),('permanentLockout','false','openpitrix'),('quickLoginCheckMilliSeconds','1000','master'),('quickLoginCheckMilliSeconds','1000','openpitrix'),('waitIncrementSeconds','60','master'),('waitIncrementSeconds','60','openpitrix'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','openpitrix'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','openpitrix'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xContentTypeOptions','nosniff','openpitrix'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xFrameOptions','SAMEORIGIN','openpitrix'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xRobotsTag','none','openpitrix'),('_browser_header.xXSSProtection','1; mode=block','master'),('_browser_header.xXSSProtection','1; mode=block','openpitrix');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('openpitrix','47251525-e896-4b48-baef-3c978c603cca'),('master','6a16aaf2-c537-4661-9f5b-baa9e4b365e7'),('master','80a846b1-c11b-453c-9716-96b9d021dcfa'),('openpitrix','b6972f98-1d4e-42ad-8f0a-d38bec93835e');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('openpitrix','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password','','','master'),('password','password','','','openpitrix');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('07224f6d-d14f-4334-b0bc-d38b8ee2dbb8','/auth/admin/openpitrix/console/*'),('7f467b19-4489-4740-977b-9fe168d74a3c','/auth/realms/master/account/*'),('8baa9b9f-9890-488a-aded-401c324b7a0d','/auth/realms/openpitrix/account/*'),('c4d3ad1f-4830-4069-b4b0-c6fad59a732d','http://localhost:8080/auth'),('f60bdb88-81aa-41d8-9dff-c5182a719562','/auth/admin/master/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('01dd0486-ca2b-4cbd-aa80-d7d8a478a878','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE'),('0399a25c-6aeb-4913-93ee-cf1b4dd860e4','CONFIGURE_TOTP','Configure OTP','openpitrix','','\0','CONFIGURE_TOTP'),('0fd3540d-f31a-489d-be09-9147aa6293f0','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('314dcb0f-2374-4fa9-98f6-cb3fca2db27b','UPDATE_PASSWORD','Update Password','openpitrix','','\0','UPDATE_PASSWORD'),('76192e8b-f6ae-462b-90a5-e8452f636ac2','VERIFY_EMAIL','Verify Email','openpitrix','','\0','VERIFY_EMAIL'),('8104c165-9e3e-4cf8-b788-270e000df8c5','terms_and_conditions','Terms and Conditions','openpitrix','\0','\0','terms_and_conditions'),('b36c9ad3-4cc7-4708-aa0d-a506e8071d55','UPDATE_PROFILE','Update Profile','openpitrix','','\0','UPDATE_PROFILE'),('cc9021ab-2820-4008-ac3c-9155d1aebbc9','CONFIGURE_TOTP','Configure OTP','master','','\0','CONFIGURE_TOTP'),('fdb2f05f-5205-43f5-849a-7762cc920a31','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('fe2d04d1-b38b-42cb-b251-dd9ae0066137','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL');
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(36) NOT NULL,
  `REQUESTER` varchar(36) NOT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `URI` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(36) NOT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('3e716243-f29a-4417-85fe-5b8494afdcdb',NULL,'9b3a0cb2-df78-4a5f-bff1-3b98167961ad','\0','',NULL,NULL,NULL,'master','admin',1532577852705,NULL,0),('8d553fbb-f3b1-4e8a-957c-5f11c81839dd','service-account-iam@placeholder.org','service-account-iam@placeholder.org','\0','',NULL,NULL,NULL,'openpitrix','service-account-iam',1532586533649,'c4d3ad1f-4830-4069-b4b0-c6fad59a732d',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('6a16aaf2-c537-4661-9f5b-baa9e4b365e7','3e716243-f29a-4417-85fe-5b8494afdcdb'),('80a846b1-c11b-453c-9716-96b9d021dcfa','3e716243-f29a-4417-85fe-5b8494afdcdb'),('96883089-e5a1-40c6-9780-a98b0380c1f0','3e716243-f29a-4417-85fe-5b8494afdcdb'),('db377efb-4ed0-4c00-b3cf-a7421303b9a0','3e716243-f29a-4417-85fe-5b8494afdcdb'),('ee3f0d05-714f-43d4-b6f9-d5264e3c081a','3e716243-f29a-4417-85fe-5b8494afdcdb'),('065e85ab-5abb-4e1f-a5cc-0ac6ce107bba','8d553fbb-f3b1-4e8a-957c-5f11c81839dd'),('47251525-e896-4b48-baef-3c978c603cca','8d553fbb-f3b1-4e8a-957c-5f11c81839dd'),('53047571-2c1a-41c0-9135-21a6710b308d','8d553fbb-f3b1-4e8a-957c-5f11c81839dd'),('b6972f98-1d4e-42ad-8f0a-d38bec93835e','8d553fbb-f3b1-4e8a-957c-5f11c81839dd'),('c42a65a5-84e2-4e7c-924c-759952d9aa36','8d553fbb-f3b1-4e8a-957c-5f11c81839dd');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-26  6:38:30
