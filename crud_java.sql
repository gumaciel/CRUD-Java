CREATE DATABASE crud_java;
USE crud_java;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `quantidade` decimal(5,2) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `data_cadastro` date NOT NULL,
  `ultima_atualizacao` date DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;