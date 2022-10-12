CREATE DATABASE  IF NOT EXISTS `db_michi_masitas` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_michi_masitas`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_michi_masitas
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_cuidades`
--

DROP TABLE IF EXISTS `t_cuidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cuidades` (
  `id_cuidad` int NOT NULL AUTO_INCREMENT,
  `nombre_cuidad` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_dpto_ciudad` int NOT NULL,
  `estado_ciudad` int NOT NULL,
  PRIMARY KEY (`id_cuidad`),
  UNIQUE KEY `id_cuidad_UNIQUE` (`id_cuidad`),
  KEY `id_dpto_ciudad_idx` (`id_dpto_ciudad`),
  CONSTRAINT `id_dpto_ciudad` FOREIGN KEY (`id_dpto_ciudad`) REFERENCES `t_departamentos` (`id_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cuidades`
--

LOCK TABLES `t_cuidades` WRITE;
/*!40000 ALTER TABLE `t_cuidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cuidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_departamentos`
--

DROP TABLE IF EXISTS `t_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_departamentos` (
  `id_dpto` int NOT NULL AUTO_INCREMENT,
  `nombre_dpto` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado_dpto` int NOT NULL,
  PRIMARY KEY (`id_dpto`),
  UNIQUE KEY `id_dpto_UNIQUE` (`id_dpto`),
  UNIQUE KEY `nombre_dpto_UNIQUE` (`nombre_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_departamentos`
--

LOCK TABLES `t_departamentos` WRITE;
/*!40000 ALTER TABLE `t_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_facturas`
--

DROP TABLE IF EXISTS `t_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `codigo_fac` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_usuario_fac` int NOT NULL,
  `fecha_fac` date NOT NULL,
  `total_fac` double NOT NULL,
  `estado_fac` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_factura_UNIQUE` (`id_factura`),
  UNIQUE KEY `codigo_fac_UNIQUE` (`codigo_fac`),
  KEY `id_usuario_fac_idx` (`id_usuario_fac`),
  CONSTRAINT `id_usuario_fac` FOREIGN KEY (`id_usuario_fac`) REFERENCES `t_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_facturas`
--

LOCK TABLES `t_facturas` WRITE;
/*!40000 ALTER TABLE `t_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_productos`
--

DROP TABLE IF EXISTS `t_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_pro` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre_pro` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `precio_pro` double NOT NULL,
  `cantidad_pro` int NOT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `foto_pro` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto_UNIQUE` (`id_producto`),
  UNIQUE KEY `codigo_pro_UNIQUE` (`codigo_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_productos`
--

LOCK TABLES `t_productos` WRITE;
/*!40000 ALTER TABLE `t_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuarios`
--

DROP TABLE IF EXISTS `t_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_usuarios` (
  `id_usuario` int NOT NULL,
  `usuario` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `contra_usu` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombres_usu` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos_usu` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo_usu` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `cel_usu` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_dpto_usu` int NOT NULL,
  `id_ciudad_usu` int NOT NULL,
  `rol_usu` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `id_dpto_usu_idx` (`id_dpto_usu`),
  KEY `id_ciudad_usu_idx` (`id_ciudad_usu`),
  CONSTRAINT `id_ciudad_usu` FOREIGN KEY (`id_ciudad_usu`) REFERENCES `t_cuidades` (`id_cuidad`),
  CONSTRAINT `id_dpto_usu` FOREIGN KEY (`id_dpto_usu`) REFERENCES `t_departamentos` (`id_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuarios`
--

LOCK TABLES `t_usuarios` WRITE;
/*!40000 ALTER TABLE `t_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ventas`
--

DROP TABLE IF EXISTS `t_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ventas` (
  `id_venta` int NOT NULL,
  `id_factura_ven` int NOT NULL,
  `id_producto_ven` int NOT NULL,
  `cantidad_ven` int NOT NULL,
  `precio_ven` double NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_producto_ven_idx` (`id_producto_ven`),
  KEY `id_factura_ven_idx` (`id_factura_ven`),
  CONSTRAINT `id_factura_ven` FOREIGN KEY (`id_factura_ven`) REFERENCES `t_facturas` (`id_factura`),
  CONSTRAINT `id_producto_ven` FOREIGN KEY (`id_producto_ven`) REFERENCES `t_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ventas`
--

LOCK TABLES `t_ventas` WRITE;
/*!40000 ALTER TABLE `t_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 15:51:45
