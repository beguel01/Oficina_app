/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: oficina_app
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabalho_id` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabalho_id` (`trabalho_id`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`trabalho_id`) REFERENCES `trabalhos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` VALUES
(1,1,4,NULL);
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'carlos','1198888-8888','111.222.333-44','carlos@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_a_pagar`
--

DROP TABLE IF EXISTS `contas_a_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contas_a_pagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loja_id` int(11) DEFAULT NULL,
  `categoria` enum('aluguel','energia','agua','fornecedor','salario','outros') DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `status` enum('pendente','pago','atrasado') DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `pedido_pecas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loja_id` (`loja_id`),
  KEY `pedido_pecas_id` (`pedido_pecas_id`),
  CONSTRAINT `contas_a_pagar_ibfk_1` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`),
  CONSTRAINT `contas_a_pagar_ibfk_2` FOREIGN KEY (`pedido_pecas_id`) REFERENCES `pedido_pecas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_a_pagar`
--

LOCK TABLES `contas_a_pagar` WRITE;
/*!40000 ALTER TABLE `contas_a_pagar` DISABLE KEYS */;
INSERT INTO `contas_a_pagar` VALUES
(1,1,'fornecedor','Pedido oleo - fornecedor ltda',200.00,'pendente','2026-08-01',NULL,1);
/*!40000 ALTER TABLE `contas_a_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES
(1,'fornecedor ltda','1197777-7777','fornecedor@gmail.com','11.222.333/4444-55');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holerites`
--

DROP TABLE IF EXISTS `holerites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `holerites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `holerites_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holerites`
--

LOCK TABLES `holerites` WRITE;
/*!40000 ALTER TABLE `holerites` DISABLE KEYS */;
INSERT INTO `holerites` VALUES
(1,1,'2026-08-01',2500.00);
/*!40000 ALTER TABLE `holerites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lojas`
--

DROP TABLE IF EXISTS `lojas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lojas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(7) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lojas`
--

LOCK TABLES `lojas` WRITE;
/*!40000 ALTER TABLE `lojas` DISABLE KEYS */;
INSERT INTO `lojas` VALUES
(1,'TIE-001','Loja Centro','R. Exemplo N° Imaginario');
/*!40000 ALTER TABLE `lojas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `loja_id` int(11) DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loja_id` (`loja_id`),
  CONSTRAINT `pecas_ibfk_1` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES
(1,'Lubrax 10w40',20,1,'2026-08-02');
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_pecas`
--

DROP TABLE IF EXISTS `pedido_pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_pecas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peca_id` int(11) DEFAULT NULL,
  `loja_id` int(11) DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `status` enum('pendente','enviado','entregue') DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `data_entrega_prevista` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peca_id` (`peca_id`),
  KEY `loja_id` (`loja_id`),
  KEY `fornecedor_id` (`fornecedor_id`),
  CONSTRAINT `pedido_pecas_ibfk_1` FOREIGN KEY (`peca_id`) REFERENCES `pecas` (`id`),
  CONSTRAINT `pedido_pecas_ibfk_2` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`),
  CONSTRAINT `pedido_pecas_ibfk_3` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_pecas`
--

LOCK TABLES `pedido_pecas` WRITE;
/*!40000 ALTER TABLE `pedido_pecas` DISABLE KEYS */;
INSERT INTO `pedido_pecas` VALUES
(1,1,1,1,10,'pendente','2026-08-01',NULL);
/*!40000 ALTER TABLE `pedido_pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponto`
--

DROP TABLE IF EXISTS `ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ponto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `entrada` time DEFAULT NULL,
  `saida_almoco` time DEFAULT NULL,
  `volta_almoco` time DEFAULT NULL,
  `saida` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `ponto_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponto`
--

LOCK TABLES `ponto` WRITE;
/*!40000 ALTER TABLE `ponto` DISABLE KEYS */;
INSERT INTO `ponto` VALUES
(1,1,'2026-08-01','07:00:00','12:00:00','13:00:00','15:00:00');
/*!40000 ALTER TABLE `ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_servicos`
--

DROP TABLE IF EXISTS `tipos_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_servicos`
--

LOCK TABLES `tipos_servicos` WRITE;
/*!40000 ALTER TABLE `tipos_servicos` DISABLE KEYS */;
INSERT INTO `tipos_servicos` VALUES
(1,'troca de oleo');
/*!40000 ALTER TABLE `tipos_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalho_funcionario`
--

DROP TABLE IF EXISTS `trabalho_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalho_funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabalho_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabalho_id` (`trabalho_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `trabalho_funcionario_ibfk_1` FOREIGN KEY (`trabalho_id`) REFERENCES `trabalhos` (`id`),
  CONSTRAINT `trabalho_funcionario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalho_funcionario`
--

LOCK TABLES `trabalho_funcionario` WRITE;
/*!40000 ALTER TABLE `trabalho_funcionario` DISABLE KEYS */;
INSERT INTO `trabalho_funcionario` VALUES
(1,1,1);
/*!40000 ALTER TABLE `trabalho_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalho_servicos`
--

DROP TABLE IF EXISTS `trabalho_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalho_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabalho_id` int(11) DEFAULT NULL,
  `tipo_servico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabalho_id` (`trabalho_id`),
  KEY `tipo_servico_id` (`tipo_servico_id`),
  CONSTRAINT `trabalho_servicos_ibfk_1` FOREIGN KEY (`trabalho_id`) REFERENCES `trabalhos` (`id`),
  CONSTRAINT `trabalho_servicos_ibfk_2` FOREIGN KEY (`tipo_servico_id`) REFERENCES `tipos_servicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalho_servicos`
--

LOCK TABLES `trabalho_servicos` WRITE;
/*!40000 ALTER TABLE `trabalho_servicos` DISABLE KEYS */;
INSERT INTO `trabalho_servicos` VALUES
(1,1,1);
/*!40000 ALTER TABLE `trabalho_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalhos`
--

DROP TABLE IF EXISTS `trabalhos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalhos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `veiculo_id` int(11) DEFAULT NULL,
  `loja_id` int(11) DEFAULT NULL,
  `status` enum('agendado','em_andamento','concluido','entregue') DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `veiculo_id` (`veiculo_id`),
  KEY `loja_id` (`loja_id`),
  CONSTRAINT `trabalhos_ibfk_1` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `trabalhos_ibfk_2` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalhos`
--

LOCK TABLES `trabalhos` WRITE;
/*!40000 ALTER TABLE `trabalhos` DISABLE KEYS */;
INSERT INTO `trabalhos` VALUES
(1,1,1,'em_andamento','2026-08-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `trabalhos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `loja_id` int(11) DEFAULT NULL,
  `cargo` enum('funcionario','gerente','dono') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `loja_id` (`loja_id`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'joao','joao@gmail.com','$2y$10$ziJHptC7jtPtooex94GGje5oZZmkC3XHK/p2rGWZMDh8ZMbR.CAkW',NULL,1,'funcionario'),
(2,'Teste Dono','dono@teste.com','$2y$10$cyeLwZsVTuVUrSn/eTKKQOv5EAHmAJ5ka02bvvwpiP1YveS5aO4Ea',NULL,NULL,'dono'),
(3,'Teste Gerente','gerente@teste.com','$2y$10$JlXRuU8ncPU7N0QYtsp5Gu0GrqT/Q4tGqL7haibonZAckleWKdUk6',NULL,NULL,'gerente');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `placa` varchar(12) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `placa` (`placa`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES
(1,1,'ABC1D23','honda','civic','preto');
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-06 22:53:10
