--
-- Table structure for table `atores`
--

DROP TABLE IF EXISTS `atores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atores` (
  `id_ator` int NOT NULL AUTO_INCREMENT,
  `nome_ator` varchar(100) NOT NULL,
  `cidade_nascimento` varchar(100) NOT NULL,
  `pais_nascimento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atores`
--

LOCK TABLES `atores` WRITE;
/*!40000 ALTER TABLE `atores` DISABLE KEYS */;
/*!40000 ALTER TABLE `atores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro`
--

DROP TABLE IF EXISTS `cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `e_mail` varchar(70) NOT NULL,
  `senha` varchar(35) NOT NULL,
  `mensalidade` int NOT NULL,
  `id_cidade` int NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `fone` (`fone`),
  UNIQUE KEY `e_mail` (`e_mail`),
  KEY `id_cidade` (`id_cidade`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `cadastro_ibfk_1` FOREIGN KEY (`id_cidade`) REFERENCES `cidades` (`id_cidades`),
  CONSTRAINT `cadastro_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro`
--

LOCK TABLES `cadastro` WRITE;
/*!40000 ALTER TABLE `cadastro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo` (
  `id_catalogo` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `id_filme` int DEFAULT NULL,
  `id_serie` int DEFAULT NULL,
  `id_documentario` int DEFAULT NULL,
  PRIMARY KEY (`id_catalogo`),
  KEY `cpf` (`cpf`),
  KEY `id_filme` (`id_filme`),
  KEY `id_serie` (`id_serie`),
  KEY `id_documentario` (`id_documentario`),
  CONSTRAINT `catalogo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cadastro` (`cpf`),
  CONSTRAINT `catalogo_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filmes` (`id_filme`),
  CONSTRAINT `catalogo_ibfk_3` FOREIGN KEY (`id_serie`) REFERENCES `series` (`id_serie`),
  CONSTRAINT `catalogo_ibfk_4` FOREIGN KEY (`id_documentario`) REFERENCES `documentarios` (`id_documentario`),
  CONSTRAINT `chk_catalogo` CHECK ((((`id_filme` is not null) and (`id_serie` is null) and (`id_documentario` is null)) or ((`id_filme` is null) and (`id_serie` is not null) and (`id_documentario` is null)) or ((`id_filme` is null) and (`id_serie` is null) and (`id_documentario` is not null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id_cidades` int NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(50) NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_cidades`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `cidades_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentarios`
--

DROP TABLE IF EXISTS `documentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentarios` (
  `id_documentario` int NOT NULL AUTO_INCREMENT,
  `titulo_documentario` varchar(100) NOT NULL,
  `ano_documentario` year DEFAULT NULL,
  `duracao_documentario` int NOT NULL,
  PRIMARY KEY (`id_documentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentarios`
--

LOCK TABLES `documentarios` WRITE;
/*!40000 ALTER TABLE `documentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elenco`
--

DROP TABLE IF EXISTS `elenco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elenco` (
  `id_ator` int NOT NULL,
  `id_midia` int NOT NULL,
  `tipo_midia` enum('filme','episodio','documentario','serie') NOT NULL,
  PRIMARY KEY (`id_ator`,`id_midia`,`tipo_midia`),
  CONSTRAINT `elenco_ibfk_1` FOREIGN KEY (`id_ator`) REFERENCES `atores` (`id_ator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elenco`
--

LOCK TABLES `elenco` WRITE;
/*!40000 ALTER TABLE `elenco` DISABLE KEYS */;
/*!40000 ALTER TABLE `elenco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodios_temporada`
--

DROP TABLE IF EXISTS `episodios_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodios_temporada` (
  `id_temporada` int NOT NULL,
  `id_episodio` int NOT NULL AUTO_INCREMENT,
  `titulo_episodio` varchar(100) NOT NULL,
  `ano_episodio` year NOT NULL,
  PRIMARY KEY (`id_episodio`),
  KEY `id_temporada` (`id_temporada`),
  CONSTRAINT `episodios_temporada_ibfk_1` FOREIGN KEY (`id_temporada`) REFERENCES `temporadas` (`id_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodios_temporada`
--

LOCK TABLES `episodios_temporada` WRITE;
/*!40000 ALTER TABLE `episodios_temporada` DISABLE KEYS */;
/*!40000 ALTER TABLE `episodios_temporada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id_estados` int NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_estados`),
  UNIQUE KEY `nome_estado` (`nome_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filmes` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `titulo_filme` varchar(100) NOT NULL,
  `ano_filme` year DEFAULT NULL,
  `duracao_filme` int NOT NULL,
  PRIMARY KEY (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmes`
--

LOCK TABLES `filmes` WRITE;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id_serie` int NOT NULL AUTO_INCREMENT,
  `titulo_serie` varchar(100) NOT NULL,
  `ano_serie` year NOT NULL,
  PRIMARY KEY (`id_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporadas`
--

DROP TABLE IF EXISTS `temporadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporadas` (
  `id_temporada` int NOT NULL AUTO_INCREMENT,
  `quantidade_eps` int NOT NULL,
  PRIMARY KEY (`id_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporadas`
--

LOCK TABLES `temporadas` WRITE;
/*!40000 ALTER TABLE `temporadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Netflix'
--

--
-- Dumping routines for database 'Netflix'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19  7:37:26
