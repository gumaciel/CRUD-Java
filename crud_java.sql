DROP DATABASE IF EXISTS crud_java;
CREATE DATABASE IF NOT EXISTS crud_java;

USE crud_java;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud_java`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_tipo`
--

DROP TABLE IF EXISTS `telefone_tipo`;
CREATE TABLE IF NOT EXISTS `telefone_tipo` (
  `id_telefone_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) NOT NULL,
  PRIMARY KEY (`id_telefone_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefone_tipo`
--

INSERT INTO `telefone_tipo` (`id_telefone_tipo`, `nome`) VALUES
(1, 'Residencial'),
(2, 'Celular'),
(3, 'Comercial'),
(4, 'Fax'),
(5, 'Não Definido'),
(6, 'Tipo 0800');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_telefone`
--

DROP TABLE IF EXISTS `usuario_telefone`;
CREATE TABLE IF NOT EXISTS `usuario_telefone` (
  `id_usuario` int(11) NOT NULL,
  `ddd` int(11) NOT NULL,
  `numero_telefone` varchar(20) NOT NULL,
  `id_telefone_tipo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
