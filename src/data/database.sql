-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: mysql04-farm67.uni5.net
-- Tempo de geração: 22/11/2018 às 21:55
-- Versão do servidor: 5.6.34-log
-- Versão do PHP: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `sharehunter03`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `block`
--

CREATE TABLE IF NOT EXISTS `block` (
  `id` int(11) NOT NULL,
  `id_blocker` int(11) NOT NULL,
  `id_blocked` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `block`
--

INSERT INTO `block` (`id`, `id_blocker`, `id_blocked`, `datetime_created`, `active`) VALUES
(1, 1, 3, '2018-09-22 19:46:51', 0),
(2, 1, 3, '2018-09-22 19:48:08', 1),
(3, 1, 5, '2018-09-23 16:41:12', 1),
(4, 1, 6, '2018-09-25 08:51:12', 0),
(5, 6, 3, '2018-10-07 13:49:02', 0),
(6, 6, 3, '2018-10-07 13:51:15', 0),
(7, 6, 3, '2018-10-07 13:51:30', 0),
(8, 6, 3, '2018-10-07 16:35:30', 0),
(9, 6, 5, '2018-10-18 21:55:46', 0),
(10, 6, 5, '2018-10-18 21:57:20', 0),
(11, 6, 5, '2018-10-18 22:00:11', 0),
(12, 6, 5, '2018-10-18 22:01:19', 0),
(13, 6, 5, '2018-10-18 22:02:53', 0),
(14, 6, 3, '2018-10-18 22:02:57', 0),
(15, 2, 5, '2018-10-23 15:23:37', 0),
(16, 4, 1, '2018-11-02 10:18:32', 0),
(17, 2, 6, '2018-11-03 14:30:31', 0),
(18, 5, 3, '2018-11-11 14:16:36', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `text` text NOT NULL,
  `datetime_published` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_last_edit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `comment`
--

INSERT INTO `comment` (`id`, `id_author`, `id_post`, `text`, `datetime_published`, `datetime_last_edit`, `active`) VALUES
(1, 1, 1, 'Comentando minha própria publicação', '2018-10-19 12:00:00', '2018-10-19 12:00:00', 1),
(2, 2, 1, 'Outro comentário hehe\r\nCom\r\nLinha\r\nQuebrada', '2018-10-19 09:40:22', '2018-10-19 09:40:22', 1),
(3, 3, 1, 'Comentário apagado... :(', '2018-10-19 09:42:43', '2018-10-19 09:42:43', 1),
(4, 1, 2, 'comentário aleatório', '2018-10-19 09:42:56', '2018-10-19 09:42:56', 1),
(5, 1, 8, 'teste', '2018-10-20 10:40:13', '2018-10-20 10:40:13', 1),
(6, 1, 8, 'comentario para ser deletado', '2018-10-20 18:54:32', '2018-10-20 18:54:32', 1),
(7, 1, 8, 'asas', '2018-10-20 19:42:34', '2018-10-20 19:42:34', 1),
(8, 1, 8, 'asas', '2018-10-20 19:42:48', '2018-10-20 19:42:48', 1),
(9, 1, 1, 'novo comentÃ¡rio agora', '2018-10-29 14:10:24', '2018-10-29 14:10:24', 1),
(10, 2, 18, 'teste', '2018-11-03 14:20:55', '2018-11-03 14:20:55', 1),
(11, 2, 18, 'adicionando outro comentÃ¡rio', '2018-11-03 14:21:26', '2018-11-03 14:21:26', 1),
(12, 2, 15, 'teste', '2018-11-04 14:55:13', '2018-11-04 14:55:13', 1),
(13, 2, 2, 'testeerer', '2018-11-04 14:55:30', '2018-11-04 14:55:30', 1),
(14, 2, 15, 'teste novo', '2018-11-04 14:58:24', '2018-11-04 14:58:24', 1),
(15, 2, 15, 'asdhi', '2018-11-04 15:05:18', '2018-11-04 15:05:18', 1),
(16, 2, 15, 'asdhi', '2018-11-04 15:05:18', '2018-11-04 15:05:18', 1),
(17, 2, 15, 'wewe', '2018-11-04 15:06:55', '2018-11-04 15:06:55', 1),
(18, 2, 15, 'dojffo', '2018-11-04 15:07:13', '2018-11-04 15:07:13', 1),
(19, 2, 1, 'hj', '2018-11-04 15:36:31', '2018-11-04 15:36:31', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `favorite`
--

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_object` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `favorite`
--

INSERT INTO `favorite` (`id`, `id_user`, `id_object`, `type`, `datetime`, `active`) VALUES
(1, 3, 2, 1, '2018-09-16 18:08:06', 1),
(2, 1, 2, 1, '2018-09-20 22:48:24', 0),
(3, 1, 4, 1, '2018-09-20 22:58:54', 1),
(4, 1, 2, 1, '2018-09-20 22:59:03', 0),
(5, 1, 3, 1, '2018-10-21 16:16:21', 0),
(6, 1, 2, 1, '2018-10-21 17:01:10', 0),
(7, 1, 2, 1, '2018-10-21 17:02:12', 1),
(8, 2, 2, 1, '2018-10-21 20:52:10', 1),
(9, 4, 3, 1, '2018-11-01 23:43:21', 0),
(10, 4, 5, 1, '2018-11-01 23:43:38', 0),
(11, 4, 4, 1, '2018-11-01 23:44:19', 0),
(12, 2, 3, 1, '2018-11-03 14:37:50', 0),
(13, 2, 1, 1, '2018-11-03 14:38:28', 1),
(14, 2, 3, 1, '2018-11-03 14:40:10', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `follow`
--

CREATE TABLE IF NOT EXISTS `follow` (
  `id` int(11) NOT NULL,
  `id_follower` int(11) NOT NULL,
  `id_following` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `follow`
--

INSERT INTO `follow` (`id`, `id_follower`, `id_following`, `datetime_created`, `active`) VALUES
(1, 1, 2, '2018-09-16 16:31:56', 1),
(2, 3, 2, '2018-09-16 16:33:43', 1),
(3, 4, 2, '2018-09-16 16:33:48', 1),
(4, 2, 1, '2018-09-16 16:33:53', 1),
(25, 1, 4, '2018-09-22 00:21:30', 0),
(26, 1, 4, '2018-09-25 08:58:31', 0),
(27, 1, 4, '2018-09-25 09:00:50', 0),
(28, 1, 4, '2018-09-30 16:57:34', 1),
(29, 5, 6, '2018-10-07 14:39:29', 0),
(30, 5, 6, '2018-10-07 14:48:08', 1),
(31, 2, 5, '2018-10-26 23:20:56', 0),
(32, 2, 6, '2018-11-03 14:29:46', 0),
(33, 2, 3, '2018-11-04 10:11:13', 1),
(34, 2, 4, '2018-11-04 10:26:30', 0),
(35, 2, 4, '2018-11-04 10:27:50', 0),
(36, 5, 8, '2018-11-11 14:15:01', 1),
(37, 5, 25, '2018-11-11 14:15:03', 1),
(38, 5, 7, '2018-11-11 14:15:05', 1),
(39, 7, 5, '2018-11-11 14:19:00', 1),
(40, 6, 5, '2018-11-11 14:19:11', 1),
(41, 14, 5, '2018-11-11 14:19:40', 1),
(42, 8, 5, '2018-11-11 14:19:49', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `category_list` varchar(64) NOT NULL,
  `resume` text NOT NULL,
  `text` text NOT NULL,
  `skills` text NOT NULL,
  `type` int(11) NOT NULL,
  `modality` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `is_prae` tinyint(1) NOT NULL,
  `shift` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `date_finish` date NOT NULL,
  `schedule` varchar(64) NOT NULL,
  `workload` int(11) NOT NULL,
  `location` varchar(64) NOT NULL,
  `location_city` varchar(64) NOT NULL,
  `location_state` varchar(2) NOT NULL,
  `need_curriculum` tinyint(1) NOT NULL,
  `need_historic` tinyint(1) NOT NULL,
  `datetime_publication` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_last_edit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `job`
--

INSERT INTO `job` (`id`, `id_author`, `title`, `category_list`, `resume`, `text`, `skills`, `type`, `modality`, `salary`, `semester`, `is_prae`, `shift`, `date_start`, `date_finish`, `schedule`, `workload`, `location`, `location_city`, `location_state`, `need_curriculum`, `need_historic`, `datetime_publication`, `datetime_last_edit`, `active`) VALUES
(1, 2, 'Monitoria Lógica', '12', '', '', 'Lógica,Programação', 0, 1, 400, 2, 0, 2, '2018-09-09', '2019-09-09', 'Manhã / Tarde', 20, 'INF, Campus do Vale', 'Santa Maria', 'RS', 0, 0, '2018-09-09 00:00:00', '2018-10-18 09:42:12', 0),
(2, 2, 'Bolsa CPD UFRGS ', '1', '', '', '', 1, 0, 500, 0, 0, 2, '2018-09-07', '0000-00-00', '', 20, 'Campus Centro', '', '', 0, 1, '0000-00-00 00:00:00', '2018-10-18 09:42:12', 0),
(3, 2, 'Estágio Web', '1,3,7', '', '', 'PHP,SASS,MYSQL,JavaScript,Frontend', 3, 1, 1350, 0, 0, 1, '2018-07-09', '0000-00-00', '', 30, '', 'Porto Alegre', 'RS', 0, 0, '0000-00-00 00:00:00', '2018-10-18 09:42:12', 0),
(4, 2, 'Bolsa Pequisa em Big Data', '1,12', '', '', '', 2, 0, 400, 0, 0, 3, '2018-10-28', '0000-00-00', '', 20, '', 'Porto Alegre', 'RS', 1, 0, '0000-00-00 00:00:00', '2018-10-18 09:42:12', 0),
(5, 3, 'Bolsa Nova para Group', '1,12', '', '', '', 2, 0, 400, 0, 0, 3, '2018-10-24', '0000-00-00', '', 20, '', 'Porto Alegre', 'RS', 1, 0, '0000-00-00 00:00:00', '2018-10-18 09:42:12', 0),
(6, 3, 'Resultado - Seleção CPOS-Centro de Pesquisas em Odontologia Social', '2', 'Descrição: divulgação do Resultado preliminar em: https://plone.ufrgs.br/cpos/news/divulgacao-do-resultado-preliminar-bolsa-uab-ufrgs e, também em: http://www.ufrgs.br/sead/servicos-ead/oportunidades/processos-seletivos-em-andamento', 'Descrição: divulgação do Resultado preliminar em: https://plone.ufrgs.br/cpos/news/divulgacao-do-resultado-preliminar-bolsa-uab-ufrgs e, também em: http://www.ufrgs.br/sead/servicos-ead/oportunidades/processos-seletivos-em-andamento', '', 1, 0, 1100, 0, 0, 4, '2018-11-20', '0000-00-00', '', 20, 'CPOS', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 19:38:05', '2018-11-20 19:38:05', 1),
(7, 3, 'Bolsa Aperfeiçoamento Agosto', '1,2,3,4,5,6,7,8,9,10,11,12', 'Verificar Edital PRAE - Bolsas Aperfeiçoamento Agosto DECORDI – 2018 de 20/11/208 na página da PROGRAD (endereço abaixo). Importante seguir as orientações do Edital. http://www.ufrgs.br/prograd/edital-prae-bolsas-aperfeicoamento-agosto-decordi-2018-1', 'Verificar Edital PRAE - Bolsas Aperfeiçoamento Agosto DECORDI – 2018 de 20/11/208 na página da PROGRAD (endereço abaixo). Importante seguir as orientações do Edital. http://www.ufrgs.br/prograd/edital-prae-bolsas-aperfeicoamento-agosto-decordi-2018-1', '', 1, 0, 400, 0, 0, 4, '2018-11-20', '0000-00-00', '', 16, 'DECORDI', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 19:42:14', '2018-11-20 19:42:14', 1),
(8, 3, 'BOLSA APERFEIÇOAMENTO AGOSTO', '4', 'Critérios de Seleção: 1) Ser estudante de cursos de graduação da área da saúde regularmente matriculado; 2) Ter disponibilidade para exercer suas atividades no “horário bolsa”, cumprindo as 16 h de segunda a sexta-feira em turnos intercalados; 3) Ter disponibilidade para participar de reuniões mensais da CoorSaúde (sexta-feira manhã) e do Comitê Gestor (segunda-feira tarde); 4) Ter experiência em atividades administrativas; 5) Ter noção de gravação de áudios de reuniões gravadas e, noção de digitalização e confecção de atas destas reuniões; 6) Ter conhecimento em informática (Pacote Office); 7) Ter pro atividade; Para as demais informações, acessar o edital completo em: http://www.ufrgs.br/prograd/edital-bolsista-2018-coorsaude', 'Critérios de Seleção: 1) Ser estudante de cursos de graduação da área da saúde regularmente matriculado; 2) Ter disponibilidade para exercer suas atividades no “horário bolsa”, cumprindo as 16 h de segunda a sexta-feira em turnos intercalados; 3) Ter disponibilidade para participar de reuniões mensais da CoorSaúde (sexta-feira manhã) e do Comitê Gestor (segunda-feira tarde); 4) Ter experiência em atividades administrativas; 5) Ter noção de gravação de áudios de reuniões gravadas e, noção de digitalização e confecção de atas destas reuniões; 6) Ter conhecimento em informática (Pacote Office); 7) Ter pro atividade; Para as demais informações, acessar o edital completo em: http://www.ufrgs.br/prograd/edital-bolsista-2018-coorsaude', 'Pacote Office', 1, 0, 400, 0, 0, 0, '2018-11-20', '0000-00-00', '', 20, 'Campus Saúde', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 19:45:25', '2018-11-20 19:45:25', 1),
(9, 3, 'Bolsa Técnico em Eletrônica e Automação Industrial', '6', 'Estudante de Engenharia Elétrica ou Engenharia de Controle e Automação. Atividades: construção de planta piloto para reproduzir o fenômeno de golfadas; construção física, conexão elétrica dos sensores; teste de diferentes estruturas de controle. Critérios de seleção: Avaliação do desempenho acadêmico (I3); avaliação do currículo e entrevista. Submissão: Enviar nome, nro. do cartão UFRGS, Histórico escolar e CV (ou link para lattes) para jorge@enq.ufrgs.br Manifestação de interesse até 21/11/2018 - 23h59 (quarta-feira). O candidato deve ter disponibilidade de horários para realização das atividades no DEQUI – Campus Central da UFRGS. O valor da bolsa é compatível com a formação do Candidado.', 'Estudante de Engenharia Elétrica ou Engenharia de Controle e Automação. Atividades: construção de planta piloto para reproduzir o fenômeno de golfadas; construção física, conexão elétrica dos sensores; teste de diferentes estruturas de controle. Critérios de seleção: Avaliação do desempenho acadêmico (I3); avaliação do currículo e entrevista. Submissão: Enviar nome, nro. do cartão UFRGS, Histórico escolar e CV (ou link para lattes) para jorge@enq.ufrgs.br Manifestação de interesse até 21/11/2018 - 23h59 (quarta-feira). O candidato deve ter disponibilidade de horários para realização das atividades no DEQUI – Campus Central da UFRGS. O valor da bolsa é compatível com a formação do Candidado.', '', 6, 0, 0, 2, 0, 7, '2018-11-19', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 19:52:20', '2018-11-20 19:52:20', 1),
(10, 3, 'Bolsa Aperfeiçoamento Benefício Março 2018', '2', 'Atendimento a clientes internos e externos da UFRGS, comunidade em geral, atendimento no balcão, busca e guarda de livros nas estantes, serviços auxiliares de bibliotecas. Horário das 13 às 17 horas.', 'Atendimento a clientes internos e externos da UFRGS, comunidade em geral, atendimento no balcão, busca e guarda de livros nas estantes, serviços auxiliares de bibliotecas. Horário das 13 às 17 horas.', 'Conversação', 1, 0, 400, 0, 0, 2, '2018-04-26', '0000-00-00', '', 16, 'BibOnu', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 19:57:05', '2018-11-20 19:57:05', 1),
(11, 3, 'Bolsa de Iniciação Científica 2019', '5', 'equisitos: 1 - ser estudante de curso de Pedagogia ou Licenciaturas; 2 - disponibilidade de 20h, em especial às terças e quartas no turno da noite para participação no grupo de pesquisa; 3 - conhecimentos de língua inglesa; 4 - disponibilidade de realizar pesquisas nas escolas públicas; 5 - disposição para aprofundar conceitos de Estudos Culturais e de Estudos Foucaultianos. Enviar as seguintes informações para o email joao.kramer@ufrgs.br: 1 - Justificativa do interesse pela bolsa; 2 - Nome completo, curso, semestre, disponibilidade de horários.', 'equisitos: 1 - ser estudante de curso de Pedagogia ou Licenciaturas; 2 - disponibilidade de 20h, em especial às terças e quartas no turno da noite para participação no grupo de pesquisa; 3 - conhecimentos de língua inglesa; 4 - disponibilidade de realizar pesquisas nas escolas públicas; 5 - disposição para aprofundar conceitos de Estudos Culturais e de Estudos Foucaultianos. Enviar as seguintes informações para o email joao.kramer@ufrgs.br: 1 - Justificativa do interesse pela bolsa; 2 - Nome completo, curso, semestre, disponibilidade de horários.', 'Inglês,Pedagogia,Literatura', 2, 0, 400, 0, 0, 5, '2018-11-18', '0000-00-00', '', 20, 'Faculdade de Educação', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 20:00:55', '2018-11-20 20:00:55', 1),
(12, 3, 'Bolsa de Desenvolvimento Institucional', '2,1,6', 'Conhecimento em atualização de site. Domínio em planilhas do Excel. Boa comunicação. Disponibilidade no turno da tarde.', 'Conhecimento em atualização de site. Domínio em planilhas do Excel. Boa comunicação. Disponibilidade no turno da tarde.', 'Excel,Comunicação,Web', 1, 0, 500, 0, 0, 2, '2018-11-16', '0000-00-00', '', 20, 'Campus Reitoria', 'Porto Alegre', 'RS', 1, 0, '2018-11-20 20:05:06', '2018-11-20 20:05:06', 1),
(13, 3, 'Edital Nº 01 - Nov 2018 - CPOS - Odonto Inscrições Homologadas e Entrevista', '2', 'Verificar inscrições homologadas, dia e hora da entrevista no linck https://plone.ufrgs.br/cpos/news/homologacao-dos-candidatos-para-selecao-de-bolsa Inscrições homologadas: Arthur Marques de Oliveira, Gabrielle de Souza Netto, Mayara Portella Nhoatto, Natália Hedlund Jardim A entrevista será realizada no dia 19 de novembro de 2018 às 11horas no Centro de Pesquisas em Odontologia Social - CPOS 4º andar - Rua Ramiro Barcelos nº 2492 OBS: a entrevista será realizada por ordem de chegada dos candidatos.', 'Verificar inscrições homologadas, dia e hora da entrevista no linck https://plone.ufrgs.br/cpos/news/homologacao-dos-candidatos-para-selecao-de-bolsa Inscrições homologadas: Arthur Marques de Oliveira, Gabrielle de Souza Netto, Mayara Portella Nhoatto, Natália Hedlund Jardim A entrevista será realizada no dia 19 de novembro de 2018 às 11horas no Centro de Pesquisas em Odontologia Social - CPOS 4º andar - Rua Ramiro Barcelos nº 2492 OBS: a entrevista será realizada por ordem de chegada dos candidatos.', '', 1, 0, 1100, 0, 0, 4, '2018-11-16', '0000-00-00', '', 20, 'CPOS', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 20:07:00', '2018-11-20 20:07:00', 1),
(14, 3, 'Bolsa Aperfeiçoamento Agosto', '2,5', 'Vaga de amplo acesso a estudantes da Universidade para atendimento ao público no Núcleo Acadêmico da Faculdade de Arquitetura. Mais informações em: https://webmail.ufrgs.br/chasque/?_task=mail&_action=get&_mbox=INBOX&_uid=1758&_part=2&_frame=1', 'Vaga de amplo acesso a estudantes da Universidade para atendimento ao público no Núcleo Acadêmico da Faculdade de Arquitetura. Mais informações em: https://webmail.ufrgs.br/chasque/?_task=mail&_action=get&_mbox=INBOX&_uid=1758&_part=2&_frame=1', '', 1, 0, 400, 0, 0, 2, '2018-11-14', '0000-00-00', '', 16, 'Faculdade de Arquitetura', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 20:10:01', '2018-11-20 20:10:01', 1),
(15, 3, 'Bolsa Aperfeiçoamento Benefício Março', '2,5', 'Vaga destinada a beneficiário PRAE para atendimento ao público no Núcleo Acadêmico da Faculdade de Arquitetura. Mais informações em: https://webmail.ufrgs.br/chasque/?_task=mail&_action=get&_mbox=INBOX&_uid=1758&_part=2&_frame=1', 'Vaga destinada a beneficiário PRAE para atendimento ao público no Núcleo Acadêmico da Faculdade de Arquitetura. Mais informações em: https://webmail.ufrgs.br/chasque/?_task=mail&_action=get&_mbox=INBOX&_uid=1758&_part=2&_frame=1', '', 1, 0, 400, 0, 1, 2, '2018-11-14', '0000-00-00', '', 16, 'Faculdade de Arquitetura', 'Porto ALegre', 'RS', 0, 0, '2018-11-20 20:11:48', '2018-11-20 20:11:48', 1),
(16, 3, 'Bolsa de Pesquisa no Projeto sobre a Política Nacional de Saúde LGBT', '4', 'Bolsa para ações de pesquisa envolvendo apoio para o projeto de implementação da Política Nacional de Saúde Integral LGBT para estudantes da área da Saúde. Interessados(as) devem acessar o edital divulgado no site do grupo de pesquisas do CNPq - Saúde, Ambiente e Desenvolvimento no endereço www.sad.eco.br.', 'Bolsa para ações de pesquisa envolvendo apoio para o projeto de implementação da Política Nacional de Saúde Integral LGBT para estudantes da área da Saúde. Interessados(as) devem acessar o edital divulgado no site do grupo de pesquisas do CNPq - Saúde, Ambiente e Desenvolvimento no endereço www.sad.eco.br.', '', 2, 0, 1000, 0, 0, 7, '2018-11-13', '0000-00-00', '', 20, 'Campus Reitoria', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 20:14:55', '2018-11-20 20:14:55', 1),
(17, 0, 'Bolsa BIC-PRAE/UFRGS', '3,5', 'Bolsa BIC-PRAE/UFRGS para a pesquisa “Micronarrativas audiovisuais: fragmentos do cotidiano e seus efeitos de sentido para a educação” Orientação: Profa. Dra. Analice Dutra Pillar / Requisitos: - ser beneficiário da Pró - Reitoria de Assuntos Estudantis da UFRGS (PRAE/UFRGS); - ter Curriculum Lattes cadastrado e atualizado na base de dados do CNPq; - interesse na área de Educação e Artes Visuais; - possuir conhecimentos em informática; - ter disponibilidade de 20 horas semanais; - estar matriculado nos Cursos de Pedagogia ou Artes Visuais da UFRGS; - não ser bolsista.', 'Bolsa BIC-PRAE/UFRGS para a pesquisa “Micronarrativas audiovisuais: fragmentos do cotidiano e seus efeitos de sentido para a educação” Orientação: Profa. Dra. Analice Dutra Pillar / Requisitos: - ser beneficiário da Pró - Reitoria de Assuntos Estudantis da UFRGS (PRAE/UFRGS); - ter Curriculum Lattes cadastrado e atualizado na base de dados do CNPq; - interesse na área de Educação e Artes Visuais; - possuir conhecimentos em informática; - ter disponibilidade de 20 horas semanais; - estar matriculado nos Cursos de Pedagogia ou Artes Visuais da UFRGS; - não ser bolsista.', 'Artes Visuais,Educação', 1, 0, 400, 0, 1, 4, '2018-11-12', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 20:16:55', '2018-11-20 20:16:55', 1),
(18, 3, 'Bolsa - Auditoria Interna', '8,7', 'Alunos selecionados: Tainã Carlin Machado e Viviane Evangelista; Lista de alunos suplentes: Otávio Júnior Santos de Deus e Juliana Koiwaske Silveira; Agradecemos a participação de todos os inscritos!', 'Alunos selecionados: Tainã Carlin Machado e Viviane Evangelista; Lista de alunos suplentes: Otávio Júnior Santos de Deus e Juliana Koiwaske Silveira; Agradecemos a participação de todos os inscritos!', '', 3, 0, 1400, 0, 0, 4, '2018-10-25', '0000-00-00', '', 30, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 0, '2018-11-20 20:18:44', '2018-11-20 20:18:44', 1),
(19, 3, 'PROCESSO DE SELEÇÃO SIMPLIFICADA PARA APOIO TÉCNICO/ADMINISTRATIVO', '4', 'A coordenação do Projeto de Extensão: “Promoção da Equidade Racial no SUS no município de Porto Alegre”, parceria entre a Universidade Federal do Rio Grande do Sul, Ministério da Saúde e Secretaria Municipal de Saúde de Porto Alegre, torna pública o presente Edital para o processo seletivo simplificado para a função temporária de apoio técnico/administrativo para atuação na equipe multidisciplinar, em conformidade às Decisões do Conselho Superior da Universidade Federal do Rio Grande do Sul (CONSUN Decisão Nº 210/2017 e CONSUN Decisão N º 21/2017), sendo necessário para o preenchimento da vaga os requisitos conforme edital: https://docs.google.com/document/d/1GuUtmpaaFMwVqELYCHoJZgyzLsMQp_u5padHepHKE1A/edit?usp=sharing Inscrições pelo link: https://docs.google.com/forms/d/e/1FAIpQLSfqdKBp_7eprplcxw9AgBCI3jBXOdulGrbcaO3_cXCstL3kvw/viewform', 'A coordenação do Projeto de Extensão: “Promoção da Equidade Racial no SUS no município de Porto Alegre”, parceria entre a Universidade Federal do Rio Grande do Sul, Ministério da Saúde e Secretaria Municipal de Saúde de Porto Alegre, torna pública o presente Edital para o processo seletivo simplificado para a função temporária de apoio técnico/administrativo para atuação na equipe multidisciplinar, em conformidade às Decisões do Conselho Superior da Universidade Federal do Rio Grande do Sul (CONSUN Decisão Nº 210/2017 e CONSUN Decisão N º 21/2017), sendo necessário para o preenchimento da vaga os requisitos conforme edital: https://docs.google.com/document/d/1GuUtmpaaFMwVqELYCHoJZgyzLsMQp_u5padHepHKE1A/edit?usp=sharing Inscrições pelo link: https://docs.google.com/forms/d/e/1FAIpQLSfqdKBp_7eprplcxw9AgBCI3jBXOdulGrbcaO3_cXCstL3kvw/viewform', '', 3, 7, 1000, 0, 0, 7, '2018-11-10', '0000-00-00', '', 40, 'Campus Saúde', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 20:21:15', '2018-11-20 20:21:15', 1),
(20, 3, 'Bolsa no Jornal da Universidade', '2', 'Atividades do Bolsista: Proposição de pautas; participação de reuniões de trabalho; apuração de informação; execução de entrevistas; e produção de material jornalístico para publicação impressa, site e redes sociais. Forma de inscrição e prazos no link https://drive.google.com/file/d/1KS9oxduFzPxkMepWi71_-sMaK4avhxxW/view?usp=sharing', 'Atividades do Bolsista: Proposição de pautas; participação de reuniões de trabalho; apuração de informação; execução de entrevistas; e produção de material jornalístico para publicação impressa, site e redes sociais. Forma de inscrição e prazos no link https://drive.google.com/file/d/1KS9oxduFzPxkMepWi71_-sMaK4avhxxW/view?usp=sharing', 'Redes sociais, Proatividade', 1, 0, 400, 0, 0, 4, '2018-11-09', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 20:23:02', '2018-11-20 20:23:02', 1),
(21, 3, 'Bolsa de Apefeiçoamento Benefício Agosto - Escola de Administração', '5', 'Edital 11 do Programa de Bolsas da Pró-Reitoria de Assuntos Estudantis Bolsas Aperfeiçoamento Benefício Agosto Biblioteca da Escola de Administração – 2018 BIBLIOTECA Enviar email para biblioteca@ea.ufrgs.br com título “Inscrição bolsa APB Agosto”, informando nome completo, número de cartão UFRGS e nome/código da vaga pretendida, conforme quadro do Anexo I. Prazos Inscrições por e-mail: 09 a 12/11/18 Entrevistas: 13 a 14/11/2018 Divulgação dos resultados: 15/11/2018', 'Edital 11 do Programa de Bolsas da Pró-Reitoria de Assuntos Estudantis Bolsas Aperfeiçoamento Benefício Agosto Biblioteca da Escola de Administração – 2018 BIBLIOTECA Enviar email para biblioteca@ea.ufrgs.br com título “Inscrição bolsa APB Agosto”, informando nome completo, número de cartão UFRGS e nome/código da vaga pretendida, conforme quadro do Anexo I. Prazos Inscrições por e-mail: 09 a 12/11/18 Entrevistas: 13 a 14/11/2018 Divulgação dos resultados: 15/11/2018', '', 1, 0, 400, 0, 0, 5, '2018-11-09', '0000-00-00', '', 20, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 20:26:11', '2018-11-20 20:26:11', 1),
(22, 3, 'Edital 08/2018-CPD Processo Seletivo de Bolsista para CPD', '5', 'Detalhes no Edital 08/2018-CPD Processo Seletivo de Bolsistas para Centro de Processamento de Dados no link: https://www.ufrgs.br/cpd/cpd-abre-edital-para-selecao-de-bolsista-edital-08-2018/', 'Detalhes no Edital 08/2018-CPD Processo Seletivo de Bolsistas para Centro de Processamento de Dados no link: https://www.ufrgs.br/cpd/cpd-abre-edital-para-selecao-de-bolsista-edital-08-2018/', '', 1, 0, 500, 0, 0, 2, '2018-11-08', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 20:27:44', '2018-11-20 20:27:44', 1),
(23, 0, 'Edital 08/2018-CPD Processo Seletivo de Bolsista para CPD', '1', 'Detalhes no Edital 08/2018-CPD Processo Seletivo de Bolsistas para Centro de Processamento de Dados no link: https://www.ufrgs.br/cpd/cpd-abre-edital-para-selecao-de-bolsista-edital-08-2018/', 'Detalhes no Edital 08/2018-CPD Processo Seletivo de Bolsistas para Centro de Processamento de Dados no link: https://www.ufrgs.br/cpd/cpd-abre-edital-para-selecao-de-bolsista-edital-08-2018/', 'PHP, Web, Javascript, Yii', 1, 0, 1100, 0, 0, 4, '2018-11-08', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 1, 0, '2018-11-20 20:30:53', '2018-11-20 20:30:53', 1),
(24, 3, 'Edital 08/2018-CPD Processo Seletivo de Bolsista para CPD', '1', 'Detalhes no Edital 08/2018-CPD Processo Seletivo de Bolsistas para Centro de Processamento de Dados no link: https://www.ufrgs.br/cpd/cpd-abre-edital-para-selecao-de-bolsista-edital-08-2018/', 'Detalhes no Edital 08/2018-CPD Processo Seletivo de Bolsistas para Centro de Processamento de Dados no link: https://www.ufrgs.br/cpd/cpd-abre-edital-para-selecao-de-bolsista-edital-08-2018/', '', 1, 0, 500, 3, 0, 4, '2018-11-08', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 20:32:23', '2018-11-20 20:32:23', 1),
(25, 3, 'Bolsa de Pesquisa para Estudante Cotista - CNPq-AF', '3', 'Bolsa exclusiva para estudante cotista interessado em realizar projeto de pesquisa na área de música e tecnologia com conhecimento em música, áudio e percussão. Interessados que preenchem o perfil enviar e-mail para 00099197@ufrgs.br', 'Bolsa exclusiva para estudante cotista interessado em realizar projeto de pesquisa na área de música e tecnologia com conhecimento em música, áudio e percussão. Interessados que preenchem o perfil enviar e-mail para 00099197@ufrgs.br', 'Música, Aúdio, Percussão', 1, 0, 400, 2, 0, 4, '2018-09-05', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 20:34:42', '2018-11-20 20:34:42', 1),
(26, 3, 'Edital nº 01 - Novembro 2018-Seleção de Bolsista - CPOS/Odontologia/UFRGS', '2', 'Edital na íntegra em na página do CPOS http://http://www.ufrgs.br/cpos/news/edital-para-selecao-de-bolsista e, também em: http://www.ufrgs.br/sead/servicos-ead/oportunidades/copy_of_EDITAL.pdf Vaga: 1 (uma) e cadastro reserva Inscrição: de 07/11/18 a 14/11/18 Atribuições: apoio nas atividades de tradução de material do idioma português para o inglês. Requisitos básicos: aluno regular da UFRGS, matriculado em cursos de graduação ou pós-graduação, preferencialmente na área de Letras-Inglês. da Inscrição, da Seleção, avaliação, Cronograma, Resultado, Recursos, Disposições Finais, e outros itens verificar o Edital na íntegra.', 'Edital na íntegra em na página do CPOS http://http://www.ufrgs.br/cpos/news/edital-para-selecao-de-bolsista e, também em: http://www.ufrgs.br/sead/servicos-ead/oportunidades/copy_of_EDITAL.pdf Vaga: 1 (uma) e cadastro reserva Inscrição: de 07/11/18 a 14/11/18 Atribuições: apoio nas atividades de tradução de material do idioma português para o inglês. Requisitos básicos: aluno regular da UFRGS, matriculado em cursos de graduação ou pós-graduação, preferencialmente na área de Letras-Inglês. da Inscrição, da Seleção, avaliação, Cronograma, Resultado, Recursos, Disposições Finais, e outros itens verificar o Edital na íntegra.', '', 1, 0, 1100, 0, 0, 4, '2018-11-07', '0000-00-00', '', 20, 'Campus Saúde', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 20:36:10', '2018-11-20 20:36:10', 1),
(27, 3, 'Bolsa de Desenvolvimento Institucional - Escola de Administração', '5', 'Leia o edital constante no link abaixo, para informações sobre critérios de seleção, forma de inscrição e prazos: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/10/EDITAL-BOLSAS-PROPG-2018-3.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/11/EDITAL-BOLSAS-PROPG-2018-3_Resultado-1.pdf', 'Leia o edital constante no link abaixo, para informações sobre critérios de seleção, forma de inscrição e prazos: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/10/EDITAL-BOLSAS-PROPG-2018-3.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/11/EDITAL-BOLSAS-PROPG-2018-3_Resultado-1.pdf', '', 1, 0, 500, 0, 0, 4, '2018-10-25', '0000-00-00', '', 20, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 20:40:07', '2018-11-20 20:40:07', 1),
(28, 3, 'Oportunidade: Simulação de Líquidos Iônicos', '1', ' Seleciona-se estudante de graduação em química ou áreas afins para atuar voluntariamente (bolsa provável em 2019) em projeto de modelagem computacional das propriedades de líquidos iônicos para estudo de sua aplicabilidade no Armazenamento de Energia Solar Térmica. Interessados devem enviar currículo e histórico escolar de graduação para jdandrade@iq.ufrgs.br. (Plano de trabalho estabelecido e disponível mediante demonstração de interesse)', ' Seleciona-se estudante de graduação em química ou áreas afins para atuar voluntariamente (bolsa provável em 2019) em projeto de modelagem computacional das propriedades de líquidos iônicos para estudo de sua aplicabilidade no Armazenamento de Energia Solar Térmica. Interessados devem enviar currículo e histórico escolar de graduação para jdandrade@iq.ufrgs.br. (Plano de trabalho estabelecido e disponível mediante demonstração de interesse)', 'Modelagem', 6, 0, 0, 2, 0, 4, '2018-11-05', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 20:41:56', '2018-11-20 20:41:56', 1),
(29, 3, 'Pesquisa Saúde da População Negra - Apoiadores institucionais', '4', 'PRORROGADO - Nível Superior completo e experiência na área da saúde; Conhecimento em Saúde da População Negra, Racismo Institucional e Apoio institucional; Bom relacionamento em equipe, pro-atividade e facilidade de comunicação oral e escrita. - Atividades: Realizar visitas sistemáticas aos municípios; Auxiliar na elaboração do diagnóstico situacional Saúde da População negra nos municípios; Auxiliar na organização da Coordenação Municipal de Saúde da população Negra; Apoiar a Coordenação Municipal de Saúde da População Negra na atualização dos indicadores de avaliação de desempenho pactuados; Auxiliar a equipe da Coordenação Municipal de Saúde da População Negra na construção do plano de ações em saúde, com vistas à superação das dificuldades encontradas no diagnóstico situacional e na análise do território; Nº vagas: 02 Edital: https://drive.google.com/file/d/15gWblno8f25tuF47W9ve_G_EkFg7Tzbk/view?usp=sharing', 'PRORROGADO - Nível Superior completo e experiência na área da saúde; Conhecimento em Saúde da População Negra, Racismo Institucional e Apoio institucional; Bom relacionamento em equipe, pro-atividade e facilidade de comunicação oral e escrita. - Atividades: Realizar visitas sistemáticas aos municípios; Auxiliar na elaboração do diagnóstico situacional Saúde da População negra nos municípios; Auxiliar na organização da Coordenação Municipal de Saúde da população Negra; Apoiar a Coordenação Municipal de Saúde da População Negra na atualização dos indicadores de avaliação de desempenho pactuados; Auxiliar a equipe da Coordenação Municipal de Saúde da População Negra na construção do plano de ações em saúde, com vistas à superação das dificuldades encontradas no diagnóstico situacional e na análise do território; Nº vagas: 02 Edital: https://drive.google.com/file/d/15gWblno8f25tuF47W9ve_G_EkFg7Tzbk/view?usp=sharing', 'Proatividade, Comunicação', 3, 0, 1500, 0, 0, 7, '2018-03-26', '0000-00-00', '', 30, 'Campus Saúde', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 21:46:24', '2018-11-20 21:46:24', 1),
(30, 3, 'PROJETO PROCESSOS INCLUSIVOS', '1,2,3,4,5,9,10', 'Acompanhar sistematicamente estudantes com especificidades na perspectiva de contribuir para a permanência e aprendizagem; acompanhar o estudante em sala de aula.', 'Acompanhar sistematicamente estudantes com especificidades na perspectiva de contribuir para a permanência e aprendizagem; acompanhar o estudante em sala de aula.', '', 1, 0, 400, 0, 0, 4, '2018-11-05', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 21:52:17', '2018-11-20 21:52:17', 1),
(31, 3, 'Apoio Pedagógico - Ciclo Alfabetização', '1,2,3,4,5,9,10,12', 'Acompanhar sistematicamente estudantes com especificidades na perspectiva de contribuir para a permanência e aprendizagem; acompanhar o estudante em sala de aula.', 'Acompanhar sistematicamente estudantes com especificidades na perspectiva de contribuir para a permanência e aprendizagem; acompanhar o estudante em sala de aula.', '', 1, 0, 400, 0, 0, 4, '2018-11-05', '0000-00-00', '', 16, 'Campus Reitoria', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 21:57:21', '2018-11-20 21:57:21', 1),
(32, 3, 'DESIGN DE SISTEMA WEB - PROGRAMAÇÃO E INTERFACE', '6,1,12', 'Aprimorar programação e interface de sistema inovador na área de gestão de projetos para design. HORÁRIOS FLEXÍVEIS. Necessário conhecimentos de: Java, PHP, MySQL, e full stack JavaScript, em sistemas de back-Office e Front-end. Obrigatório conhecimento de Python+django. SELEÇÃO PARA CADASTRO RESERVA DO INSTITUTO DE INOVAÇÃO, COMPETITIVIDADE E DESIGN DA UFRGS (www.ufrgs.br/iicd).', 'Aprimorar programação e interface de sistema inovador na área de gestão de projetos para design. HORÁRIOS FLEXÍVEIS. Necessário conhecimentos de: Java, PHP, MySQL, e full stack JavaScript, em sistemas de back-Office e Front-end. Obrigatório conhecimento de Python+django. SELEÇÃO PARA CADASTRO RESERVA DO INSTITUTO DE INOVAÇÃO, COMPETITIVIDADE E DESIGN DA UFRGS (www.ufrgs.br/iicd).', 'PHP, Java, Python, Django, Javascript, MySQL', 1, 1, 400, 0, 0, 7, '2018-11-01', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 21:59:59', '2018-11-20 21:59:59', 1),
(33, 3, 'Bolsa IT - atuação em equipe pedagógica do NUTED', '5', 'Curso de Pedagogia ou áreas afins Familiaridade com tecnologias digitais Desenvolvimento de conteúdo para objetos de aprendizagem Atuação no campus centro em projetos de pesquisa ligados a aplicação da tecnologia digital na educação', 'Curso de Pedagogia ou áreas afins Familiaridade com tecnologias digitais Desenvolvimento de conteúdo para objetos de aprendizagem Atuação no campus centro em projetos de pesquisa ligados a aplicação da tecnologia digital na educação', '', 1, 0, 400, 0, 0, 7, '2018-10-31', '0000-00-00', '', 20, 'NUTED', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:01:09', '2018-11-20 22:01:09', 1),
(34, 0, 'Processo Seletivo Bolsista 28/2018 – Biblioteconomia', '2,5', '• Ser aluno regularmente matriculado no curso de Biblioteconomia a partir do 5° semestre; • Noções de inglês; • Conhecimento de fontes de informação na grande área de Saúde; • Noções de Comunicação Científica • Conhecimento básico do pacote Office; • Ter preferencialmente 1 turno disponível (manhã ou tarde); • Não possuir outra bolsa via FAURGS ou qualquer outra modalidade de bolsa, interna ou externa à UFRGS. Link do Edital no site do TelessaúdeRS-UFRGS: https://www.ufrgs.br/telessauders/editais/processo-seletivo-bolsista-282018-biblioteconomia/', '• Ser aluno regularmente matriculado no curso de Biblioteconomia a partir do 5° semestre; • Noções de inglês; • Conhecimento de fontes de informação na grande área de Saúde; • Noções de Comunicação Científica • Conhecimento básico do pacote Office; • Ter preferencialmente 1 turno disponível (manhã ou tarde); • Não possuir outra bolsa via FAURGS ou qualquer outra modalidade de bolsa, interna ou externa à UFRGS. Link do Edital no site do TelessaúdeRS-UFRGS: https://www.ufrgs.br/telessauders/editais/processo-seletivo-bolsista-282018-biblioteconomia/', 'Inglês,Pacote Office', 1, 0, 650, 5, 0, 4, '2018-10-29', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:07:49', '2018-11-20 22:07:49', 1),
(35, 3, 'Bolsa de Iniciação Científica (BIC)/UFRGS – 2018/2019', '1,12,6,7,8', 'Bolsa para estudante de graduação de Ciências Contábeis, Administração, Ciência da Computação, Design, Biblioteconomia e áreas afins; sem restrição de semestre em que esteja matriculado. Importante ter interesse na pesquisa em temas relacionados à sistemas de informação, aplicados à administração, gestão e contabilidade. A bolsa terá vigência máxima até 31/07/2019, a depender do desempenho do bolsista. Os interessados deverão enviar por email histórico escolar atualizado e responder as seguintes questões: Qual seu interesse em atuar como Bolsista de Iniciação Científica? Qual sua experiência relacionada à pesquisa? Possui a disponibilidade de 20 horas semanais? Qual o tempo/horário disponível para a pesquisa? Por que você deveria se selecionado? Enviar as informações até às 17:00 hs do dia 01/11/2018 para o e-mail: ariel.behr@ufrgs.br', 'Bolsa para estudante de graduação de Ciências Contábeis, Administração, Ciência da Computação, Design, Biblioteconomia e áreas afins; sem restrição de semestre em que esteja matriculado. Importante ter interesse na pesquisa em temas relacionados à sistemas de informação, aplicados à administração, gestão e contabilidade. A bolsa terá vigência máxima até 31/07/2019, a depender do desempenho do bolsista. Os interessados deverão enviar por email histórico escolar atualizado e responder as seguintes questões: Qual seu interesse em atuar como Bolsista de Iniciação Científica? Qual sua experiência relacionada à pesquisa? Possui a disponibilidade de 20 horas semanais? Qual o tempo/horário disponível para a pesquisa? Por que você deveria se selecionado? Enviar as informações até às 17:00 hs do dia 01/11/2018 para o e-mail: ariel.behr@ufrgs.br', 'Gestão, Contabilidade, Sistemas da informação', 2, 0, 400, 0, 0, 7, '2018-07-11', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 22:12:28', '2018-11-20 22:12:28', 1),
(36, 3, 'Programação PHP (com experiência)', '12', 'Procura-se programadora ou programador PHP que tenha experiência ou amplo conhecimento da linguagem. \r\nTrabalho a ser realizado no CPD (perto do RU da Saúde).\r\nInteressadxs, enviar currículo para cpd-dss@ufrgs.br', 'Procura-se programadora ou programador PHP que tenha experiência ou amplo conhecimento da linguagem. \r\nTrabalho a ser realizado no CPD (perto do RU da Saúde).\r\nInteressadxs, enviar currículo para cpd-dss@ufrgs.br', 'PHP', 1, 0, 750, 0, 0, 4, '2018-10-25', '0000-00-00', '', 20, 'Campus Saúde', 'Porto Alegre', 'RS', 1, 0, '2018-11-20 22:14:05', '2018-11-20 22:14:05', 1),
(37, 3, 'Monitoria na área de música do CAp/UFRGS', '3', 'Ter conhecimentos básicos de música: - tocar algum instrumento; - conhecer afinação de instrumentos de corda (violão, cavaquinho, baixo); - trabalhar com edição de partitura (musescore ou outro programa). *Ser pró-ativo.', 'Ter conhecimentos básicos de música: - tocar algum instrumento; - conhecer afinação de instrumentos de corda (violão, cavaquinho, baixo); - trabalhar com edição de partitura (musescore ou outro programa). *Ser pró-ativo.', 'Música, Proatividade, Partitura', 1, 0, 400, 0, 0, 7, '2018-10-16', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:21:32', '2018-11-20 22:21:32', 1),
(38, 3, 'Programa de Pós-Graduagação em Enfermagem', '1,2,3,4,5,6,7,8,9,10,11,12', 'Critérios de seleção: assiduidade, disciplina, responsabilidade, disponibilidade e conhecimentos de informática. Inscrição: comprovante de matrícula 2018/2 e currículo por email Mais informações: www.ufrgs.br/ppgenf', 'Critérios de seleção: assiduidade, disciplina, responsabilidade, disponibilidade e conhecimentos de informática. Inscrição: comprovante de matrícula 2018/2 e currículo por email Mais informações: www.ufrgs.br/ppgenf', '', 1, 0, 500, 0, 0, 2, '2018-10-11', '0000-00-00', '', 20, 'Campus Saúde', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 22:23:04', '2018-11-20 22:23:04', 1),
(39, 4, 'BOLSA APERFEIÇOAMENTO NOVEMBRO - PROGESP/DAS', '2', 'Procuramos alunos que possuam conhecimento intermediário em plone, WordPress, programação (linguagem PHP) e em softwares de design gráfico. Auxiliar na criação de material de divulgação para as ações do Departamento e na manutenção de nosso site. Maiores informações em www.ufrgs.br/progesp(página inicial) ou pelo fone 3308-2006.', 'Procuramos alunos que possuam conhecimento intermediário em plone, WordPress, programação (linguagem PHP) e em softwares de design gráfico. Auxiliar na criação de material de divulgação para as ações do Departamento e na manutenção de nosso site. Maiores informações em www.ufrgs.br/progesp(página inicial) ou pelo fone 3308-2006.', 'PHP, WorPress, Photoshop', 1, 0, 400, 0, 0, 4, '2018-10-05', '0000-00-00', '', 20, 'PROGESP', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:26:32', '2018-11-20 22:26:32', 1),
(40, 4, 'Secretaria do Programa de Pós-Graduação em Saúde Coletiva', '4', 'Bolsa para desenvolver atividades administrativas na Secretaria. O candidato deve ser aluno de graduação da UFRGS e atender às demais exigências do Edital. Resultado da seleção disponível em https://www.ufrgs.br/ppgcol/. Bolsista selecionada: Tayná Dorneles Sant''anna Mattos.', 'Bolsa para desenvolver atividades administrativas na Secretaria. O candidato deve ser aluno de graduação da UFRGS e atender às demais exigências do Edital. Resultado da seleção disponível em https://www.ufrgs.br/ppgcol/. Bolsista selecionada: Tayná Dorneles Sant''anna Mattos.', '', 1, 0, 500, 0, 0, 2, '2018-06-05', '0000-00-00', '', 20, 'Campus Saúde', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:28:09', '2018-11-20 22:28:09', 1),
(41, 4, 'Bolsa Setor de Divulgação PROPESQ', '2', 'A Pró-Reitoria de Pesquisa seleciona bolsista para o Setor de Divulgação. Criação de conteúdo e gerenciamento de sites e redes sociais são as principais funções da vaga. Requisitos: Aluno de graduação em Jornalismo; Boa redação; Conhecimento intermediário de Wordpress. Diferenciais: Inglês intermediário; Noções de Photoshop e Illustrator. Os interessados devem enviar um currículo e/ou portfólio para o endereço divulgacao@propesq.ufrgs.br até o dia 09/10/18. Será feita uma pré-seleção com base na análise do currículo. Os pré-selecionados serão chamados para entrevista.', 'A Pró-Reitoria de Pesquisa seleciona bolsista para o Setor de Divulgação. Criação de conteúdo e gerenciamento de sites e redes sociais são as principais funções da vaga. Requisitos: Aluno de graduação em Jornalismo; Boa redação; Conhecimento intermediário de Wordpress. Diferenciais: Inglês intermediário; Noções de Photoshop e Illustrator. Os interessados devem enviar um currículo e/ou portfólio para o endereço divulgacao@propesq.ufrgs.br até o dia 09/10/18. Será feita uma pré-seleção com base na análise do currículo. Os pré-selecionados serão chamados para entrevista.', 'Inglês, Photoshop, Illustrator, WordPress', 1, 0, 635, 0, 0, 0, '2018-10-02', '0000-00-00', '', 30, 'PROPESQ', 'Porto Alegre', 'RS', 1, 0, '2018-11-20 22:30:43', '2018-11-20 22:30:43', 1),
(42, 4, 'Bolsa de Extensão PPSC/CERÂMICA', '5', 'Estudante de graduação do Curso de Artes Visuais, para atuar com adolescentes em cumprimento de medida socioeducativa em projeto de extensão com cerâmica. obs.: assunto no e-mail: Bolsa PPSC/CERÂMICA', 'Estudante de graduação do Curso de Artes Visuais, para atuar com adolescentes em cumprimento de medida socioeducativa em projeto de extensão com cerâmica. obs.: assunto no e-mail: Bolsa PPSC/CERÂMICA', '', 1, 0, 400, 0, 0, 2, '2018-10-02', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:34:00', '2018-11-20 22:34:00', 1),
(43, 4, 'Avaliação de Eficácia e Segurança de Medicamentos', '4', 'Aluno de Farmácia ou outro curso da área da saúde humana, ter conhecimentos em Excel e leitura em inglês. Interessados enviar e-mail até 03/10/2018 para tatiane.silva@ufrgs.br, informando no assunto ''bolsa medicamentos''. Anexar: 1) historico escolar; 2) currículo; 3) horarios disponiveis. Alunos que possuem vínculo com outras bolsas na UFRGS ou outras atividades remuneradas fora da UFRGS não poderão candidatar-se a esta vaga.', 'Aluno de Farmácia ou outro curso da área da saúde humana, ter conhecimentos em Excel e leitura em inglês. Interessados enviar e-mail até 03/10/2018 para tatiane.silva@ufrgs.br, informando no assunto ''bolsa medicamentos''. Anexar: 1) historico escolar; 2) currículo; 3) horarios disponiveis. Alunos que possuem vínculo com outras bolsas na UFRGS ou outras atividades remuneradas fora da UFRGS não poderão candidatar-se a esta vaga.', 'Inglês, Excel', 1, 0, 400, 0, 0, 4, '2018-06-12', '0000-00-00', '', 12, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 22:39:00', '2018-11-20 22:39:00', 1),
(44, 4, 'Resultado de Seleção Viver Melhor é Melhor Conviver', '5', 'Estudante selecionada em entrevista realizada no dia 17/09/18: Olívia de Andrade Soares', 'Estudante selecionada em entrevista realizada no dia 17/09/18: Olívia de Andrade Soares', '', 1, 0, 1458, 0, 0, 7, '2018-09-24', '0000-00-00', '', 20, 'Campus Reitoria', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 22:43:13', '2018-11-20 22:43:13', 1),
(45, 4, 'BOLSA PARA DESIGNER OU PROGRAMADOR', '12,5', 'Bolsa para trabalhar no NUTED (Núcleo de Tecnologia Digital Aplicada à Educação), sob coordenação da professora Patricia Behar. Campus UFRGS Centro. Horários Flexíveis. Perfil do bolsista: Conhecimento em HTML e CSS; Elaboração de sites responsivos.', 'Bolsa para trabalhar no NUTED (Núcleo de Tecnologia Digital Aplicada à Educação), sob coordenação da professora Patricia Behar. Campus UFRGS Centro. Horários Flexíveis. Perfil do bolsista: Conhecimento em HTML e CSS; Elaboração de sites responsivos.', 'HTML, CSS', 1, 0, 400, 0, 0, 7, '2018-09-06', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:50:18', '2018-11-20 22:50:18', 1),
(46, 4, 'Processo Seletivo Bolsista 20/2018 - Comunicação/Desenvolvedor Web', '1,12,2,11', 'Ser aluno regularmente matriculado em curso de graduação Ciências da Computação ou Engenharia da Computação; Conhecimento em HTML e CSS; Noções em PHP; Noções na plataforma Wordpress; Não possuir outra bolsa via FAURGS ou qualquer outra modalidade de bolsa, interna ou externa à UFRGS; A Faurgs não possui convênio de bolsa com as seguintes instituições: ? UNIRITTER ? FAPA ? UNISINOS ? UNIASSELVI Somente candidatos que atenderem aos pré-requisitos serão convocados para entrevista presencial; Os candidatos serão informados via telefone data e horário da entrevista. REQUERIMENTO DE INSCRIÇÃO: https://goo.gl/p5nPFc', 'Ser aluno regularmente matriculado em curso de graduação Ciências da Computação ou Engenharia da Computação; Conhecimento em HTML e CSS; Noções em PHP; Noções na plataforma Wordpress; Não possuir outra bolsa via FAURGS ou qualquer outra modalidade de bolsa, interna ou externa à UFRGS; A Faurgs não possui convênio de bolsa com as seguintes instituições: ? UNIRITTER ? FAPA ? UNISINOS ? UNIASSELVI Somente candidatos que atenderem aos pré-requisitos serão convocados para entrevista presencial; Os candidatos serão informados via telefone data e horário da entrevista. REQUERIMENTO DE INSCRIÇÃO: https://goo.gl/p5nPFc', 'PHP, HTML, CSS, WordPress', 1, 0, 650, 0, 0, 4, '2018-09-06', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 22:53:52', '2018-11-20 22:53:52', 1),
(47, 4, 'Recuperação de áreas mineradas integrando resíduos', '6', 'O bolsista interessado irá trabalhar com iniciação tecnológica e inovação, com objetivo de utilizar o produto do processo de compostagem de RSU para recuperação ambiental de áreas impactadas pela atividade de mineração, através de ações que propiciem a recuperação de forma e funções de ecossistemas. Interessados enviar e-mail para leamet@ufrgs.br com histórico escolar atualizado até 4a feira 05/09. Entrevistas 5a feira, 06/09 a partir das 10h no LEAmet- Centro de Tecnologia- Campus do Vale/UFRGS.', 'O bolsista interessado irá trabalhar com iniciação tecnológica e inovação, com objetivo de utilizar o produto do processo de compostagem de RSU para recuperação ambiental de áreas impactadas pela atividade de mineração, através de ações que propiciem a recuperação de forma e funções de ecossistemas. Interessados enviar e-mail para leamet@ufrgs.br com histórico escolar atualizado até 4a feira 05/09. Entrevistas 5a feira, 06/09 a partir das 10h no LEAmet- Centro de Tecnologia- Campus do Vale/UFRGS.', '', 1, 0, 400, 0, 0, 4, '2018-09-03', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 22:55:52', '2018-11-20 22:55:52', 1),
(48, 4, 'EDITAL 05/2018-Restaurante Universitário 03 - 02 vagas suplentes - Nutrição', '4', 'Acompanhamento e controle de mercadorias; Acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos; Elaboração de treinamentos para os funcionários manipuladores de alimentos; Coleta, rotulação e armazenamento de amostras; Aferição de temperaturas de alimentos e equipamentos; Utilização do Sistema de Almoxarifado (SAM), atualizando dados e adicionando dados ao sistema; Gestão de estoque; Auxílio na elaboração de cardápios e seus respectivos pedidos de alimentos; Realização de pesquisa de satisfação com os usuários; Controle de desperdício; Atualizar o cardápio do dia, no mural do Restaurante; Auxílio nas demais atividades pertinentes à função.', 'Acompanhamento e controle de mercadorias; Acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos; Elaboração de treinamentos para os funcionários manipuladores de alimentos; Coleta, rotulação e armazenamento de amostras; Aferição de temperaturas de alimentos e equipamentos; Utilização do Sistema de Almoxarifado (SAM), atualizando dados e adicionando dados ao sistema; Gestão de estoque; Auxílio na elaboração de cardápios e seus respectivos pedidos de alimentos; Realização de pesquisa de satisfação com os usuários; Controle de desperdício; Atualizar o cardápio do dia, no mural do Restaurante; Auxílio nas demais atividades pertinentes à função.', '', 1, 0, 400, 0, 0, 4, '2018-08-22', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:01:10', '2018-11-20 23:01:10', 1),
(49, 4, 'DITAL 05/2018Restaurante Universitário 01 - 03 vagas suplentes - Nutrição', '4', 'Acompanhamento e controle de mercadorias; Acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos; Elaboração de treinamentos para os funcionários manipuladores de alimentos; Coleta, rotulação e armazenamento de amostras; Aferição de temperaturas de alimentos e equipamentos; Utilização do Sistema de Almoxarifado (SAM), atualizando dados e adicionando dados ao sistema; Gestão de estoque; Auxílio na elaboração de cardápios e seus respectivos pedidos de alimentos; Realização de pesquisa de satisfação com os usuários; Controle de desperdício; Atualizar o cardápio do dia, no mural do Restaurante; Auxílio nas demais atividades pertinentes à função.', 'Acompanhamento e controle de mercadorias; Acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos; Elaboração de treinamentos para os funcionários manipuladores de alimentos; Coleta, rotulação e armazenamento de amostras; Aferição de temperaturas de alimentos e equipamentos; Utilização do Sistema de Almoxarifado (SAM), atualizando dados e adicionando dados ao sistema; Gestão de estoque; Auxílio na elaboração de cardápios e seus respectivos pedidos de alimentos; Realização de pesquisa de satisfação com os usuários; Controle de desperdício; Atualizar o cardápio do dia, no mural do Restaurante; Auxílio nas demais atividades pertinentes à função.', '', 1, 0, 400, 0, 0, 4, '2018-08-22', '0000-00-00', '', 16, 'Campus Saúde', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:02:14', '2018-11-20 23:02:14', 1),
(50, 4, 'EDITAL05/2018-RU 06 - 01 VAGA EFETIVA E 03 VAGAS SUPLENTE- ÁREA DA NUTRIÇÃO', '4', 'Acompanhamento e controle de mercadorias; Acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos; Elaboração de treinamentos para os funcionários manipuladores de alimentos; Coleta, rotulação e armazenamento de amostras; Aferição de temperaturas de alimentos e equipamentos; Utilização do Sistema de Almoxarifado (SAM), atualizando dados e adicionando dados ao sistema; Gestão de estoque; Auxílio na elaboração de cardápios e seus respectivos pedidos de alimentos; Realização de pesquisa de satisfação com os usuários; Controle de desperdício; Atualizar o cardápio do dia, no mural do Restaurante; Auxílio nas demais atividades pertinentes à função.', 'Acompanhamento e controle de mercadorias; Acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos; Elaboração de treinamentos para os funcionários manipuladores de alimentos; Coleta, rotulação e armazenamento de amostras; Aferição de temperaturas de alimentos e equipamentos; Utilização do Sistema de Almoxarifado (SAM), atualizando dados e adicionando dados ao sistema; Gestão de estoque; Auxílio na elaboração de cardápios e seus respectivos pedidos de alimentos; Realização de pesquisa de satisfação com os usuários; Controle de desperdício; Atualizar o cardápio do dia, no mural do Restaurante; Auxílio nas demais atividades pertinentes à função.', '', 1, 0, 400, 0, 0, 4, '2018-08-22', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:03:17', '2018-11-20 23:03:17', 1),
(51, 4, 'Bolsa de Desenvolvimento Institucional - Escola de Administração', '5', 'LEIA O EDITAL EM ANEXO para informações sobre perfil do bolsista, forma de inscrição e prazos: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/EDITAL-BOLSAS-PROPG-2018-2.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/2018/08/28/ea-divulga-resultado-de-processo-seletivo-de-bolsista/', 'LEIA O EDITAL EM ANEXO para informações sobre perfil do bolsista, forma de inscrição e prazos: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/EDITAL-BOLSAS-PROPG-2018-2.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/2018/08/28/ea-divulga-resultado-de-processo-seletivo-de-bolsista/', '', 1, 0, 400, 0, 0, 7, '2018-08-20', '0000-00-00', '', 20, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:04:26', '2018-11-20 23:04:26', 1),
(52, 4, 'Bolsa de Aperfeiçoamento Benefício Agosto - Escola de Administração', '5', 'Acesse o Edital em anexo para informações sobre perfil do bolsista, forma e prazos para inscrições: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-10-2018-do-Programa-de-Bolsas-AP-1-AGOSTO.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-10-2018-APagosto_Resultado.pdf', 'Acesse o Edital em anexo para informações sobre perfil do bolsista, forma e prazos para inscrições: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-10-2018-do-Programa-de-Bolsas-AP-1-AGOSTO.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-10-2018-APagosto_Resultado.pdf', '', 1, 0, 400, 0, 1, 7, '2018-08-17', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:08:23', '2018-11-20 23:08:23', 1);
INSERT INTO `job` (`id`, `id_author`, `title`, `category_list`, `resume`, `text`, `skills`, `type`, `modality`, `salary`, `semester`, `is_prae`, `shift`, `date_start`, `date_finish`, `schedule`, `workload`, `location`, `location_city`, `location_state`, `need_curriculum`, `need_historic`, `datetime_publication`, `datetime_last_edit`, `active`) VALUES
(53, 4, 'Bolsa de Aperfeiçoamento Agosto - Escola de Administração', '5', 'Acessar o Edital em anexo para informações sobre perfil do bolsista, forma de inscrição e outras: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-09-2018-do-Programa-de-Bolsas-AP-1-AGOSTO.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-09-2018-APagosto_Resultado-2.pdf', 'Acessar o Edital em anexo para informações sobre perfil do bolsista, forma de inscrição e outras: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-09-2018-do-Programa-de-Bolsas-AP-1-AGOSTO.pdf RESULTADO DA SELEÇÃO: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/08/Edital-09-2018-APagosto_Resultado-2.pdf', '', 1, 0, 400, 0, 0, 2, '2018-08-08', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:09:21', '2018-11-20 23:09:21', 1),
(54, 4, 'UFRGS Ciência - 2 vagas', '2', 'Atividades: Proposição de pautas; apuração de informações; execução de entrevistas; e produção de matérias de jornalismo científico para publicação no site UFRGS Ciência. Para estudantes de Jornalismo que atendam os seguintes requisitos: - conclusão das cadeiras previstas para os 2 (dois) primeiros semestres do curso; - capacidade de leitura básica em inglês. Seleção: - análise de histórico escolar disponível no Portal do Aluno, currículo vitae e texto jornalístico, documentação a ser enviada por e-mail, no ato da inscrição; - entrevista presencial dos aprovados na etapa acima. Inscrição Envio de mensagem de e-mail para ciencia@ufrgs.br com a seguinte documentação: Histórico escolar disponível no Portal do Aluno da UFRGS; Curriculum Vitae; Um texto jornalístico de autoria do aluno. Prazos Inscrições por e-mail: de 06/07/2017 a 05/08/2018 Realização das entrevistas (os agendamentos serão feitos via-email com os candidatos): de 07/08/2018 a 09/08/2018 Resultados: até 10/08/2018', 'Atividades: Proposição de pautas; apuração de informações; execução de entrevistas; e produção de matérias de jornalismo científico para publicação no site UFRGS Ciência. Para estudantes de Jornalismo que atendam os seguintes requisitos: - conclusão das cadeiras previstas para os 2 (dois) primeiros semestres do curso; - capacidade de leitura básica em inglês. Seleção: - análise de histórico escolar disponível no Portal do Aluno, currículo vitae e texto jornalístico, documentação a ser enviada por e-mail, no ato da inscrição; - entrevista presencial dos aprovados na etapa acima. Inscrição Envio de mensagem de e-mail para ciencia@ufrgs.br com a seguinte documentação: Histórico escolar disponível no Portal do Aluno da UFRGS; Curriculum Vitae; Um texto jornalístico de autoria do aluno. Prazos Inscrições por e-mail: de 06/07/2017 a 05/08/2018 Realização das entrevistas (os agendamentos serão feitos via-email com os candidatos): de 07/08/2018 a 09/08/2018 Resultados: até 10/08/2018', 'Inglês', 1, 0, 400, 0, 0, 7, '2018-01-10', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 23:12:44', '2018-11-20 23:12:44', 1),
(55, 4, 'Bolsista de Informática', '12', 'Conhecimento de linguagem de softwares para web Administrar sites com plataforma wordpress, desenvolvendo leiautes específicos para demandas da Comunicação a partir de linguagem html/php; Conhecimento de linguagem de softwares - Adobe, Office Conhecimentos básicos para instalação e manutenção de softwares nos equipamentos da SECOM, estabelecendo contato com fornecedores, viabilizando o correto funcionamento; Conhecimento de hardware Competência para instalação de computadores e de diagnóstico para casos de definição de soluções de manutenção; Outras demandas Conhecimento de linguagens de softwares para soluções em comunicação em plataformas digitais, como murais digitais e aplicativos para smartphones. Enviar e-mail para secretariosecom@ufrgs.br com histórico escolar disponível no Portal do Aluno e uma carta de motivação para a bolsa. Os candidatos serão contatados para uma entrevista.', 'Conhecimento de linguagem de softwares para web Administrar sites com plataforma wordpress, desenvolvendo leiautes específicos para demandas da Comunicação a partir de linguagem html/php; Conhecimento de linguagem de softwares - Adobe, Office Conhecimentos básicos para instalação e manutenção de softwares nos equipamentos da SECOM, estabelecendo contato com fornecedores, viabilizando o correto funcionamento; Conhecimento de hardware Competência para instalação de computadores e de diagnóstico para casos de definição de soluções de manutenção; Outras demandas Conhecimento de linguagens de softwares para soluções em comunicação em plataformas digitais, como murais digitais e aplicativos para smartphones. Enviar e-mail para secretariosecom@ufrgs.br com histórico escolar disponível no Portal do Aluno e uma carta de motivação para a bolsa. Os candidatos serão contatados para uma entrevista.', 'WordPress, HTML, PHP', 1, 0, 400, 0, 0, 4, '2018-06-18', '0000-00-00', '', 16, 'SECOM', 'Porto Alegre', 'RS', 0, 1, '2018-11-20 23:20:46', '2018-11-20 23:20:46', 1),
(56, 4, 'Bolsista Design - Bolsa Aperfeiçoamento Benefício Agosto', '3,2', ' Estudantes matriculados no curso de Design Visual e com benefício PRAE, que tenham concluído as cadeiras previstas para os cinco primeiros semestres e que possuam experiência na criação de materiais gráficos e de identidade visual. Inscrições no prazo de 30/07/2018 a 03/08/2018 pelo envio de mensagem de e-mail para juliana.mota@secom.ufrgs.br com a seguinte documentação: Histórico escolar disponível no Portal do Aluno da UFRGS; Curriculum Vitae; Portfólio de trabalhos de aula. Além da avaliação dos documentos acima citados, os candidatos serão chamados para entrevista no período abaixo descrito. Prazos Inscrições por e-mail: de 30/07/2018 a 03/08/2018 Realização das entrevistas (os agendamentos serão feitos via-email com os candidatos): de 06/08/2018 a 08/08/2018 Divulgação dos resultados: 09/08/2018 Local de divulgação dos resultados Nos sites http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais e https://www.ufrgs.br/bolsas/ . Por e-mail aos candidatos.', ' Estudantes matriculados no curso de Design Visual e com benefício PRAE, que tenham concluído as cadeiras previstas para os cinco primeiros semestres e que possuam experiência na criação de materiais gráficos e de identidade visual. Inscrições no prazo de 30/07/2018 a 03/08/2018 pelo envio de mensagem de e-mail para juliana.mota@secom.ufrgs.br com a seguinte documentação: Histórico escolar disponível no Portal do Aluno da UFRGS; Curriculum Vitae; Portfólio de trabalhos de aula. Além da avaliação dos documentos acima citados, os candidatos serão chamados para entrevista no período abaixo descrito. Prazos Inscrições por e-mail: de 30/07/2018 a 03/08/2018 Realização das entrevistas (os agendamentos serão feitos via-email com os candidatos): de 06/08/2018 a 08/08/2018 Divulgação dos resultados: 09/08/2018 Local de divulgação dos resultados Nos sites http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais e https://www.ufrgs.br/bolsas/ . Por e-mail aos candidatos.', '', 1, 0, 400, 0, 1, 4, '2018-07-27', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 23:23:47', '2018-11-20 23:23:47', 1),
(57, 4, 'Bolsista Design - Bolsa Aperfeiçoamento Março', '3,2', 'Estudantes matriculados no curso de Design Visual, que tenham concluído as cadeiras previstas para os cinco primeiros semestres e que possuam experiência na criação de materiais gráficos e de identidade visual. Inscrições no prazo de 30/07/2018 a 03/08/2018 pelo envio de mensagem de e-mail para juliana.mota@secom.ufrgs.br com a seguinte documentação: Histórico escolar disponível no Portal do Aluno da UFRGS; Curriculum Vitae; Portfólio de trabalhos de aula. Além da avaliação dos documentos acima citados, os candidatos serão chamados para entrevista no período abaixo descrito. Prazos Inscrições por e-mail: de 30/07/2018 a 03/08/2018 Realização das entrevistas (os agendamentos serão feitos via-email com os candidatos): de 06/08/2018 a 08/08/2018 Divulgação dos resultados: 09/08/2018 Local de divulgação dos resultados Nos sites http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais e https://www.ufrgs.br/bolsas/ . Por e-mail aos candidatos.', 'Estudantes matriculados no curso de Design Visual, que tenham concluído as cadeiras previstas para os cinco primeiros semestres e que possuam experiência na criação de materiais gráficos e de identidade visual. Inscrições no prazo de 30/07/2018 a 03/08/2018 pelo envio de mensagem de e-mail para juliana.mota@secom.ufrgs.br com a seguinte documentação: Histórico escolar disponível no Portal do Aluno da UFRGS; Curriculum Vitae; Portfólio de trabalhos de aula. Além da avaliação dos documentos acima citados, os candidatos serão chamados para entrevista no período abaixo descrito. Prazos Inscrições por e-mail: de 30/07/2018 a 03/08/2018 Realização das entrevistas (os agendamentos serão feitos via-email com os candidatos): de 06/08/2018 a 08/08/2018 Divulgação dos resultados: 09/08/2018 Local de divulgação dos resultados Nos sites http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais e https://www.ufrgs.br/bolsas/ . Por e-mail aos candidatos.', '', 1, 0, 400, 0, 0, 4, '2018-07-27', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 23:32:51', '2018-11-20 23:32:51', 1),
(58, 4, 'BOLSA APERFEIÇOAMENTO AGOSTO 2018 PROGESP/DAS', '2', 'Conhecimento intermediário em Plone, WordPress e programação. Conhecimento avançado em softwares de design gráfico.', 'Conhecimento intermediário em Plone, WordPress e programação. Conhecimento avançado em softwares de design gráfico.', 'Plone, WordPress', 1, 0, 0, 0, 0, 4, '2018-08-07', '0000-00-00', '', 20, 'PROGESP', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:35:34', '2018-11-20 23:35:34', 1),
(59, 4, 'Bolsista para Implementação de Recurso Educacional Digital', '6,11,1,12', 'Estudante de graduação ou pós-graduação com conhecimento de programação, em especial PHP e redes sociais, para implementação de plataforma on-line para resolução colaborativa de problemas (Edital SEAD EaD 25). Candidato(a) deve possuir vínculo ativo com a UFRGS e não pode receber outra bolsa.', 'Estudante de graduação ou pós-graduação com conhecimento de programação, em especial PHP e redes sociais, para implementação de plataforma on-line para resolução colaborativa de problemas (Edital SEAD EaD 25). Candidato(a) deve possuir vínculo ativo com a UFRGS e não pode receber outra bolsa.', 'PHP', 1, 0, 800, 0, 0, 4, '2018-08-03', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:46:05', '2018-11-20 23:46:05', 1),
(60, 4, 'Bolsa BIC -Fotossíntese Artificial para Produção de Combustíveis Renováveis', '6,11,1,12', 'Seleciona estudantes de graduação da química ou engenharia química para o desenvolvimento de semicondutores para fotossíntese artificial. Interessados podem enviar Currículo, incluindo histórico escolar da graduação, assim como carta de motivação para o email pedro.migowski@ufrgs.br.', 'Seleciona estudantes de graduação da química ou engenharia química para o desenvolvimento de semicondutores para fotossíntese artificial. Interessados podem enviar Currículo, incluindo histórico escolar da graduação, assim como carta de motivação para o email pedro.migowski@ufrgs.br.', '', 2, 0, 400, 0, 0, 7, '2018-07-23', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-20 23:55:22', '2018-11-20 23:55:22', 1),
(61, 4, 'Bolsa Voluntaria em Sedimentologia', '9,10', 'Alunos de geologia que tenham conhecimentos basicos em sedimentologia e estratigrafia para atuar na análise de imagens de depositos, granulometria e estruturas sedimentares em testemunhos de sondagem gerados em laboratório.', 'Alunos de geologia que tenham conhecimentos basicos em sedimentologia e estratigrafia para atuar na análise de imagens de depositos, granulometria e estruturas sedimentares em testemunhos de sondagem gerados em laboratório.', '', 6, 0, 0, 0, 0, 4, '2018-08-03', '0000-00-00', '', 12, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-20 23:58:30', '2018-11-20 23:58:30', 1),
(62, 4, 'BOLSA DE DESENVOLVIMENTO INSTITUCIONAL (PROPG) - EENG/PPGCI', '6,11', 'Resultado da seleção: Candidato selecionado: Bruno Inghes, cartão: 246843 Primeiro suplente: Ruy Motta, cartão 288169 Segunda suplente: Paolla Souza, cartão 290699', 'Resultado da seleção: Candidato selecionado: Bruno Inghes, cartão: 246843 Primeiro suplente: Ruy Motta, cartão 288169 Segunda suplente: Paolla Souza, cartão 290699', '', 1, 0, 500, 0, 0, 1, '2018-07-20', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 00:11:37', '2018-11-21 00:11:37', 1),
(63, 4, 'Bolsa de graduação - LAMEF', '1,12,6,11', 'Alunos de graduação regularmente matriculados na UFRGS. Valor inicial de R$ 600,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado. Destacar se possui curso técnico.', 'Alunos de graduação regularmente matriculados na UFRGS. Valor inicial de R$ 600,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado. Destacar se possui curso técnico.', '', 1, 0, 600, 0, 0, 4, '2018-08-02', '0000-00-00', '', 20, 'LAMEF', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 00:13:23', '2018-11-21 00:13:23', 1),
(64, 4, 'Bolsas de pós-doutorado', '1,12,6,11', 'Doutores em engenharia regularmente registrados como pós-doutorandos na UFRGS. Valor inicial de R$ 3.000,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado.', 'Doutores em engenharia regularmente registrados como pós-doutorandos na UFRGS. Valor inicial de R$ 3.000,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado.', '', 2, 0, 3000, 0, 0, 4, '2018-08-02', '0000-00-00', '', 30, 'Campus Reitoria', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 00:15:05', '2018-11-21 00:15:05', 1),
(65, 4, 'Bolsa de doutorado - LAMEF', '1,12,6,11', 'Alunos de doutorado em engenharia regularmente matriculados na UFRGS. Valor inicial de R$ 1.800,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado.', 'Alunos de doutorado em engenharia regularmente matriculados na UFRGS. Valor inicial de R$ 1.800,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado.', '', 2, 0, 1800, 0, 0, 4, '2018-08-02', '0000-00-00', '', 30, 'LAMEF', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 00:17:26', '2018-11-21 00:17:26', 1),
(66, 4, 'Bolsa de mestrado - LAMEF', '1,12,6,11', 'Alunos de mestrado em engenharia regularmente matriculados na UFRGS. Valor inicial de R$ 1.500,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado.', 'Alunos de mestrado em engenharia regularmente matriculados na UFRGS. Valor inicial de R$ 1.500,00 podendo chegar aos limites estabelecidos pela Decisão 211/2017 do CONSUN em função das qualificações do candidato. Favor entrar em contato pelo e-mail: bolsas.lamef@gmail.com, informando no assunto da mensagem o seu nome completo e tipo de bolsa a que se candidata. No e-mail, enviar em anexo seu currículo Lattes atualizado e informar os motivos pelos quais considera que deveria ser recrutado.', '', 2, 0, 1500, 0, 0, 4, '2018-08-02', '0000-00-00', '', 30, 'LAMEF', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 00:18:43', '2018-11-21 00:18:43', 1),
(67, 4, 'Bolsa Gerência administrativa Instituto de Psicologia', '2', 'Vaga para bolsista com benefício PRAE. Preferencialmente alunos que não sejam matriculados nos cursos do Instituto de Psicologia (psicologia, serviço social e fonoaudiologia). Turno: vaga para turno da manhã. Atividades administrativas de secretaria. Conhecimento básico do pacote Office e bom atendimento ao público. Edital se encontra no site da PRAE. Enviar currículo e comprovante de matrícula para: instpsico@ufrgs.br As entrevistas serão dia 09/08, às 14h na secretaria do Instituto de Psicologia.', 'Vaga para bolsista com benefício PRAE. Preferencialmente alunos que não sejam matriculados nos cursos do Instituto de Psicologia (psicologia, serviço social e fonoaudiologia). Turno: vaga para turno da manhã. Atividades administrativas de secretaria. Conhecimento básico do pacote Office e bom atendimento ao público. Edital se encontra no site da PRAE. Enviar currículo e comprovante de matrícula para: instpsico@ufrgs.br As entrevistas serão dia 09/08, às 14h na secretaria do Instituto de Psicologia.', 'Pacote Office', 1, 0, 400, 0, 1, 1, '2017-12-20', '0000-00-00', '', 16, 'Campus Saúde', 'Porto Alegre', 'RS', 0, 1, '2018-11-21 00:22:51', '2018-11-21 00:22:51', 1),
(68, 4, 'Resultado Edital Bolsas Aperfeiçoamento Agosto CONSUN', '2,5', 'RESULTADO EDITAL BOLSA APERFEIÇOAMENTO AGOSTO - Auxílio na elaboração de atas do Conselho Universitário https://plone.ufrgs.br/consun/documentos/resultado-selecao-bolsistas-2018-2019', 'RESULTADO EDITAL BOLSA APERFEIÇOAMENTO AGOSTO - Auxílio na elaboração de atas do Conselho Universitário https://plone.ufrgs.br/consun/documentos/resultado-selecao-bolsistas-2018-2019', '', 1, 0, 400, 0, 0, 1, '2018-07-16', '0000-00-00', '', 16, 'Campus Reitoria', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 21:08:19', '2018-11-21 21:08:19', 1),
(69, 4, 'Resultado Edital Bolsas Aperfeiçoamento Agosto Benef. CONSUN', '2,5', 'RESULTADO - Bolsas Aperfeiçoamento Agosto Benefício CONSUN - Auxílio administrativo à Secretaria do Conselho Universitáriohttps://plone.ufrgs.br/consun/documentos/resultado-selecao-bolsistas-2018-2019', 'RESULTADO - Bolsas Aperfeiçoamento Agosto Benefício CONSUN - Auxílio administrativo à Secretaria do Conselho Universitáriohttps://plone.ufrgs.br/consun/documentos/resultado-selecao-bolsistas-2018-2019', '', 1, 0, 400, 0, 1, 2, '2018-07-16', '0000-00-00', '', 16, 'CONSUN', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:17:56', '2018-11-21 22:17:56', 1),
(70, 4, 'Bolsas PRAE Fabico', '2', '02 bolsas para a gerência administrativa da Fabico. As vagas são exclusivas para beneficiários PRAE. Início das atividades em agosto de 2018. Inscrições até 01 de agosto. Informações no site da PRAE ou no link http://www.ufrgs.br/fabico/Aluno/mural-de-oportunidades', '02 bolsas para a gerência administrativa da Fabico. As vagas são exclusivas para beneficiários PRAE. Início das atividades em agosto de 2018. Inscrições até 01 de agosto. Informações no site da PRAE ou no link http://www.ufrgs.br/fabico/Aluno/mural-de-oportunidades', '', 1, 0, 400, 0, 1, 4, '2018-07-10', '0000-00-00', '', 20, 'FABICO', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:19:11', '2018-11-21 22:19:11', 1),
(71, 4, 'Bolsas de Aperfeiçoamento Agosto - Escola de Administração (EA)', '5', 'Vagas para os seguintes setores: Biblioteca, Setor Acadêmico, Setor Acadêmico, e Centro de Estudos e Pesquisa em Extensão (CEPA). Leia atentamente o Edital em anexo para informações sobre critérios de seleção e forma de inscrição para o setor de seu interesse. As inscrições deverão ser enviadas para o email indicado no Edital (ver Setores). Obs.: As vagas para este Edital são sem Benefício PRAE, com exceção de 04 vagas para a Biblioteca da EA. https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/07/Edital-08-2018_APagosto-1.pdf ATENÇÃO! RESULTADO DA SELEÇÃO DE BOLSISTAS: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/07/Edital-08-2018-APagosto_Resultado.pdf', 'Vagas para os seguintes setores: Biblioteca, Setor Acadêmico, Setor Acadêmico, e Centro de Estudos e Pesquisa em Extensão (CEPA). Leia atentamente o Edital em anexo para informações sobre critérios de seleção e forma de inscrição para o setor de seu interesse. As inscrições deverão ser enviadas para o email indicado no Edital (ver Setores). Obs.: As vagas para este Edital são sem Benefício PRAE, com exceção de 04 vagas para a Biblioteca da EA. https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/07/Edital-08-2018_APagosto-1.pdf ATENÇÃO! RESULTADO DA SELEÇÃO DE BOLSISTAS: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/07/Edital-08-2018-APagosto_Resultado.pdf', '', 1, 0, 400, 0, 0, 7, '2018-07-02', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:20:30', '2018-11-21 22:20:30', 1),
(72, 4, 'Bolsa para programação de ferramentas para um AVA', '1,12', 'O NUTED (Núcleo de Tecnologia Digital Aplicada à Educação (http://www.nuted.ufrgs.br/) seleciona bolsista . Atribuição: Implementação de novos recursos em um Ambiente Virtual de Aprendizagem Requisitos básicos necessários: PHP; HTML; Banco de dados, Ruby. Carga horária: 20 horas por semana/flexíveis conforme aulas na Faculdade Local: NUTED - UFRGS (Campus Centro): Av. Paulo Gama, 110 - Prédio 12105 - 4º andar - Sala 401', 'O NUTED (Núcleo de Tecnologia Digital Aplicada à Educação (http://www.nuted.ufrgs.br/) seleciona bolsista . Atribuição: Implementação de novos recursos em um Ambiente Virtual de Aprendizagem Requisitos básicos necessários: PHP; HTML; Banco de dados, Ruby. Carga horária: 20 horas por semana/flexíveis conforme aulas na Faculdade Local: NUTED - UFRGS (Campus Centro): Av. Paulo Gama, 110 - Prédio 12105 - 4º andar - Sala 401', 'PHP, HTML, SQL, Ruby', 1, 0, 400, 0, 0, 4, '2018-01-30', '0000-00-00', '', 20, 'NUTED', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:30:07', '2018-11-21 22:30:07', 1),
(73, 4, 'BOLSA COMGRAD FARMÁCIA', '4', '1- Vagas 4- Suplentes Enviar e-mail para comgradfar@ufrgs.br com título “Inscrição bolsa AP”, informar Nome completo, número de cartão UFRGS e nome/código da vaga pretendida, conforme quadro em Anexo. Entrevista: Os candidatos deverão comparecer às 9h de sexta-feira 27/07/2018 para entrevista. Link para a página que contém o edital. http://www.ufrgs.br/comgradfar/selecionados-pag', '1- Vagas 4- Suplentes Enviar e-mail para comgradfar@ufrgs.br com título “Inscrição bolsa AP”, informar Nome completo, número de cartão UFRGS e nome/código da vaga pretendida, conforme quadro em Anexo. Entrevista: Os candidatos deverão comparecer às 9h de sexta-feira 27/07/2018 para entrevista. Link para a página que contém o edital. http://www.ufrgs.br/comgradfar/selecionados-pag', '', 1, 0, 400, 0, 0, 2, '2018-07-23', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:32:17', '2018-11-21 22:32:17', 1),
(74, 4, 'BOLSA PIBIT-FÍSICA - Efeito Termoelétrico em Materiais Topológicos', '1,12', ' Busca-se por um bolsista para trabalhar com física experimental, foco no estudo de propriedades elétricas e termoelétricas de materiais topológicos para aplicações em energia renovável. Preferências por alunos de física ou engenharia física, em etapa avançada (5 periodo ou superior) do curso.', ' Busca-se por um bolsista para trabalhar com física experimental, foco no estudo de propriedades elétricas e termoelétricas de materiais topológicos para aplicações em energia renovável. Preferências por alunos de física ou engenharia física, em etapa avançada (5 periodo ou superior) do curso.', '', 1, 0, 400, 5, 0, 7, '2018-07-23', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:33:52', '2018-11-21 22:33:52', 1),
(75, 4, 'Bolsas de Doutorado LaSid - Área de Aciaria', '6,11', 'Vagas para bolsistas de doutorado no LaSid - Área de Aciaria: Atuar em projetos de pesquisa e desenvolvimento tecnológico voltados à indústria siderúrgica. Requisitos: Graduação e Mestrado em engenharia metalúrgica. Aprovação na seleção de doutorado do PPGE3M. Conhecimento em processamento de aços via aciaria elétrica. Conhecimento em refino primário e secundário de aços. Conhecimento em simulação termodinâmica computacional. Conhecimento em caracterização de inclusões. Conhecimento na área de reciclagem de resíduos siderúrgicos. Valor de Bolsa: R$ 1.100,00. Obs.: O valor da bolsa poderá variar em função da qualificação do bolsista (experiência) podendo atingir os valores máximos sugeridos pela Decisão 211/2017 do CONSUN. O tempo de duração da bolsa depende dos recursos recebidos nos projetos. Enviar e-mail para wagner@ct.ufrgs.br com nome, telefone de contato, link do currículo lattes.', 'Vagas para bolsistas de doutorado no LaSid - Área de Aciaria: Atuar em projetos de pesquisa e desenvolvimento tecnológico voltados à indústria siderúrgica. Requisitos: Graduação e Mestrado em engenharia metalúrgica. Aprovação na seleção de doutorado do PPGE3M. Conhecimento em processamento de aços via aciaria elétrica. Conhecimento em refino primário e secundário de aços. Conhecimento em simulação termodinâmica computacional. Conhecimento em caracterização de inclusões. Conhecimento na área de reciclagem de resíduos siderúrgicos. Valor de Bolsa: R$ 1.100,00. Obs.: O valor da bolsa poderá variar em função da qualificação do bolsista (experiência) podendo atingir os valores máximos sugeridos pela Decisão 211/2017 do CONSUN. O tempo de duração da bolsa depende dos recursos recebidos nos projetos. Enviar e-mail para wagner@ct.ufrgs.br com nome, telefone de contato, link do currículo lattes.', '', 1, 0, 1100, 0, 0, 4, '2018-07-23', '0000-00-00', '', 20, 'LaSid', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 22:43:36', '2018-11-21 22:43:36', 1),
(76, 4, 'Bolsas de Mestrado LaSid - Área de Aciaria', '6,11', 'Vagas para bolsistas de mestrado no LaSid - Área de Aciaria: Atuar em projetos de pesquisa e desenvolvimento tecnológico voltados à indústria siderúrgica. Requisitos: Graduação em engenharia metalúrgica. Aprovação na seleção de mestrado do PPGE3M. Conhecimento em processamento de aços via aciaria elétrica. Conhecimento em refino primário e secundário de aços. Conhecimento em simulação termodinâmica computacional. Conhecimento em caracterização de inclusões. Conhecimento na área de reciclagem de resíduos siderúrgicos. Valor de Bolsa: R$ 750,00. Obs.: O valor da bolsa poderá variar em função da qualificação do bolsista (experiência) podendo atingir os valores máximos sugeridos pela Decisão 211/2017 do CONSUN. O tempo de duração da bolsa depende dos recursos recebidos nos projetos. Enviar e-mail para wagner@ct.ufrgs.br com nome, telefone de contato, link do currículo lattes.', 'Vagas para bolsistas de mestrado no LaSid - Área de Aciaria: Atuar em projetos de pesquisa e desenvolvimento tecnológico voltados à indústria siderúrgica. Requisitos: Graduação em engenharia metalúrgica. Aprovação na seleção de mestrado do PPGE3M. Conhecimento em processamento de aços via aciaria elétrica. Conhecimento em refino primário e secundário de aços. Conhecimento em simulação termodinâmica computacional. Conhecimento em caracterização de inclusões. Conhecimento na área de reciclagem de resíduos siderúrgicos. Valor de Bolsa: R$ 750,00. Obs.: O valor da bolsa poderá variar em função da qualificação do bolsista (experiência) podendo atingir os valores máximos sugeridos pela Decisão 211/2017 do CONSUN. O tempo de duração da bolsa depende dos recursos recebidos nos projetos. Enviar e-mail para wagner@ct.ufrgs.br com nome, telefone de contato, link do currículo lattes.', '', 1, 0, 750, 0, 0, 4, '2018-07-23', '0000-00-00', '', 20, 'LaSid', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 22:44:44', '2018-11-21 22:44:44', 1),
(77, 4, 'Monitorias de Físico-Química – Campus do Vale', '6,1,12', 'Departamento de Físico-Química - monitoria para o semestre 2018/2: -1 (uma) em EAD para QUI03310 – Físico-Química II B -1 (uma) presencial para QUI03309 – Físico-Química 1 B -1 (uma) presencial para QUI03313 - Físico-Química II A Critério: Ter sido aprovado com bom desempenho na disciplina de inscrição. As inscrições para os alunos devem ser feitas via portal do aluno no período de 16/07 a 23/07/2018.', 'Departamento de Físico-Química - monitoria para o semestre 2018/2: -1 (uma) em EAD para QUI03310 – Físico-Química II B -1 (uma) presencial para QUI03309 – Físico-Química 1 B -1 (uma) presencial para QUI03313 - Físico-Química II A Critério: Ter sido aprovado com bom desempenho na disciplina de inscrição. As inscrições para os alunos devem ser feitas via portal do aluno no período de 16/07 a 23/07/2018.', '', 1, 0, 400, 0, 0, 4, '2018-07-16', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 1, '2018-11-21 22:46:02', '2018-11-21 22:46:02', 1),
(78, 4, 'Remoção de Carbono Orgânico Dissolvido em Águas de Abastecimento por Pré-oz', '6,11', 'Estudante de Engenharia (Civil, Ambiental, Química, Hídrica) e Química. Disponibilidade de turnos manhã ou tarde, ou alternado. Trabalhos de laboratório com escala piloto e monitoramento. Preferencialmente ter completado 4 semestres do curso.', 'Estudante de Engenharia (Civil, Ambiental, Química, Hídrica) e Química. Disponibilidade de turnos manhã ou tarde, ou alternado. Trabalhos de laboratório com escala piloto e monitoramento. Preferencialmente ter completado 4 semestres do curso.', '', 1, 0, 400, 4, 0, 7, '2018-07-18', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:47:23', '2018-11-21 22:47:23', 1),
(79, 4, 'BOLSA PRAE CECOLFAR FARMÁCIA', '4', '4 - Vagas 2- Para estudante de farmácia 1- Vaga pra estudante da área da Saúde 1- Vaga pra área de gestão Enviar email para cecolfar.ufrgs@gmail.com com título “Inscrição bolsa AP”, informar - Nome completo, número de cartão UFRGS e nome/código da vaga pretendida, conforme quadro em Anexo e anexar a carta de interesse. O edital está publicado no site da PRAE', '4 - Vagas 2- Para estudante de farmácia 1- Vaga pra estudante da área da Saúde 1- Vaga pra área de gestão Enviar email para cecolfar.ufrgs@gmail.com com título “Inscrição bolsa AP”, informar - Nome completo, número de cartão UFRGS e nome/código da vaga pretendida, conforme quadro em Anexo e anexar a carta de interesse. O edital está publicado no site da PRAE', '', 1, 0, 400, 0, 0, 4, '2018-07-18', '0000-00-00', '', 16, 'Campus Saúde', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 22:49:23', '2018-11-21 22:49:23', 1),
(80, 4, 'Avaliação da disponibilidade de elementos tóxicos em carvões e cinzas', '6', 'Alunos do Curso de Química ou Engenharia Química ou com curso técnico em Química. Bolsa de iniciação científica para trabalhar na área de Química Analítica. Enviar histórico escolar com disponibilidade de horário para semestre 2018/1 para e-mail para contato.', 'Alunos do Curso de Química ou Engenharia Química ou com curso técnico em Química. Bolsa de iniciação científica para trabalhar na área de Química Analítica. Enviar histórico escolar com disponibilidade de horário para semestre 2018/1 para e-mail para contato.', '', 1, 0, 400, 0, 0, 4, '2018-07-16', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 1, '2018-11-21 22:50:38', '2018-11-21 22:50:38', 1),
(81, 4, 'Escritório de Processos', '6,11,7,8', 'Bolsa para atuação no Escritório de Processos da UFRGS. Atividades: diagramar e documentar processo; analisar e propor melhorias de processos crítico; dar suporte à documentação de processos nas unidades; apoiar a automação e implantação de processos. Curso: Engenharia de Produção ou Administração Interessados devem encaminhar o currículo por email.', 'Bolsa para atuação no Escritório de Processos da UFRGS. Atividades: diagramar e documentar processo; analisar e propor melhorias de processos crítico; dar suporte à documentação de processos nas unidades; apoiar a automação e implantação de processos. Curso: Engenharia de Produção ou Administração Interessados devem encaminhar o currículo por email.', '', 1, 0, 430, 0, 0, 4, '2018-07-13', '0000-00-00', '', 20, 'Escritório de Processos', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 22:53:23', '2018-11-21 22:53:23', 1),
(82, 4, 'olsas para atuar na Secretaria dos Departamentos de Graduação - IFCH', '5', 'Atendimento geral de alunos e professores; apoio às atividades administrativas. Vagas: 02 (uma para cada turno) + 03 suplentes. Inscrição de 16 a 23/7/2018 Enviar currículo por email (com nome completo e número de cartão da UFRGS) Entrevistas serão marcadas por email no período de 25 a 30/7/2018. Deverá apresentar o comprovante de matrícula. Divulgação dos resultados: 30/7/2018 no site http://www.ufrgs.br/ifch/home.php http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais', 'Atendimento geral de alunos e professores; apoio às atividades administrativas. Vagas: 02 (uma para cada turno) + 03 suplentes. Inscrição de 16 a 23/7/2018 Enviar currículo por email (com nome completo e número de cartão da UFRGS) Entrevistas serão marcadas por email no período de 25 a 30/7/2018. Deverá apresentar o comprovante de matrícula. Divulgação dos resultados: 30/7/2018 no site http://www.ufrgs.br/ifch/home.php http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais', '', 1, 0, 400, 0, 1, 4, '2018-07-13', '0000-00-00', '', 16, 'IFCH', 'Porto Alegre', 'RS', 1, 0, '2018-11-21 22:55:43', '2018-11-21 22:55:43', 1),
(83, 4, 'Bolsa IC: Aplicação da Avaliação do Ciclo de Vida à construção civil', '6,11', 'Projeto: Aplicação da Avaliação do Ciclo de Vida (ACV) à construção civil: estudo do impacto ambiental de cidades brasileiras voltado para o planejamento de mitigações. Orientação: Prof. Ana Passuelo Requisitos: - estar cursando engenharia civil, ambiental ou áreas afins na UFRGS, a partir do 4º semestre; - necessário conhecimento em inglês e pacote Office avançado; - desejável conhecimento em Urbanismo; Local: NORIE (Campus Centro) Envio de currículo e histórico escolar até o dia 15/07 para o e-mail: janainetimm@hotmail.com', 'Projeto: Aplicação da Avaliação do Ciclo de Vida (ACV) à construção civil: estudo do impacto ambiental de cidades brasileiras voltado para o planejamento de mitigações. Orientação: Prof. Ana Passuelo Requisitos: - estar cursando engenharia civil, ambiental ou áreas afins na UFRGS, a partir do 4º semestre; - necessário conhecimento em inglês e pacote Office avançado; - desejável conhecimento em Urbanismo; Local: NORIE (Campus Centro) Envio de currículo e histórico escolar até o dia 15/07 para o e-mail: janainetimm@hotmail.com', 'Inglês, Pacote Office, Urbanismo', 2, 0, 400, 0, 0, 7, '2018-07-11', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 1, 1, '2018-11-21 23:00:01', '2018-11-21 23:00:01', 1),
(84, 4, 'Bolsista de IC em Engenharia Civil para trabalhar com REVIT', '6,11', 'Se você é um estudante de Engenharia Civil, que já finalizou o quarto semestre e está interessado em aprender e trabalhar com o REVIT, venha ser um bolsista de nossa equipe! O objetivo principal do trabalho é o desenvolvimento de um curso à distância para o ensino da ferramenta computacional REVIT. É importante que você conheça o MOODLE UFRGS, tenha iniciativa, responsabilidade, saiba trabalhar em equipe. Caso você se enquadre neste perfil, envie um e-mail, anexando currículo e histórico escolar até 22/07.', 'Se você é um estudante de Engenharia Civil, que já finalizou o quarto semestre e está interessado em aprender e trabalhar com o REVIT, venha ser um bolsista de nossa equipe! O objetivo principal do trabalho é o desenvolvimento de um curso à distância para o ensino da ferramenta computacional REVIT. É importante que você conheça o MOODLE UFRGS, tenha iniciativa, responsabilidade, saiba trabalhar em equipe. Caso você se enquadre neste perfil, envie um e-mail, anexando currículo e histórico escolar até 22/07.', '', 2, 0, 400, 4, 0, 7, '2018-07-10', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 1, 1, '2018-11-21 23:01:30', '2018-11-21 23:01:30', 1),
(85, 4, 'Interdisciplinaridade no Ensino de Engenharia', '6,11,5', 'Estudantes dos cursos de Engenharia ou Educação que estejam cursando, pelo menos, o quinto semestre em 2018-2. O projeto de pesquisa tem foco na inclusão da interdisciplinaridade nas práticas pedagógicas adotadas nas disciplinas de Engenharia. É desejável que o aluno tenha o seguinte perfil: proatividade / iniciativa; criatividade; responsabilidade; leitura em inglês; e ter cursado Desenho Técnico II (para candidatos da engenharia) ou ter conhecimento sobre práticas pedagógicas inovadoras (para candidatos da educação). Enviar currículo e histórico escolar para o e-mail de contato, até dia 23/jul. Os selecionados serão comunicados via e-mail e entrevistados, presencialmente, dia 26/jul.', 'Estudantes dos cursos de Engenharia ou Educação que estejam cursando, pelo menos, o quinto semestre em 2018-2. O projeto de pesquisa tem foco na inclusão da interdisciplinaridade nas práticas pedagógicas adotadas nas disciplinas de Engenharia. É desejável que o aluno tenha o seguinte perfil: proatividade / iniciativa; criatividade; responsabilidade; leitura em inglês; e ter cursado Desenho Técnico II (para candidatos da engenharia) ou ter conhecimento sobre práticas pedagógicas inovadoras (para candidatos da educação). Enviar currículo e histórico escolar para o e-mail de contato, até dia 23/jul. Os selecionados serão comunicados via e-mail e entrevistados, presencialmente, dia 26/jul.', '', 1, 0, 400, 5, 0, 4, '2018-07-10', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:07:36', '2018-11-21 23:07:36', 1),
(86, 4, 'Bolsa IC para Investigação do Desempenho de Aplicações Paralelas', '1,12', 'Este trabalho tem como objetivo projetar, desenvolver e analisar o desempenho de aplicações paralelas escritas com o modelo de tarefas. A solução a ser implementada em paralelo de um determinado problema deve combinar pelo menos dois recursos de processamento distintos como multi-core e aceleradores. Tradicionalmente este tipo de projeto se baseia na combinação direta de OpenMP com CUDA. Este trabalho, porém, pretende investigar o uso do ambiente de execução StarPU como camada de software intermediário. Serão investigados os diferentes escalonadores do StarPU de forma que possamos identificar qual o melhor, potencialmente sugerindo modificações que melhorem seu desempenho. Usar diariamente as seguintes ferramentas, ambientes: Linux (desktop e servidor); programação em C, CUDA, bash, R; usar git, gdb, emacs com org-mode. Mais detalhes sobre o plano de trabalho em http://www.inf.ufrgs.br/~schnorr/ic-ufrgs-starpu-2018.pdf', 'Este trabalho tem como objetivo projetar, desenvolver e analisar o desempenho de aplicações paralelas escritas com o modelo de tarefas. A solução a ser implementada em paralelo de um determinado problema deve combinar pelo menos dois recursos de processamento distintos como multi-core e aceleradores. Tradicionalmente este tipo de projeto se baseia na combinação direta de OpenMP com CUDA. Este trabalho, porém, pretende investigar o uso do ambiente de execução StarPU como camada de software intermediário. Serão investigados os diferentes escalonadores do StarPU de forma que possamos identificar qual o melhor, potencialmente sugerindo modificações que melhorem seu desempenho. Usar diariamente as seguintes ferramentas, ambientes: Linux (desktop e servidor); programação em C, CUDA, bash, R; usar git, gdb, emacs com org-mode. Mais detalhes sobre o plano de trabalho em http://www.inf.ufrgs.br/~schnorr/ic-ufrgs-starpu-2018.pdf', 'Linux, C, CUDA, Bash, R, Git', 2, 0, 400, 0, 0, 4, '2018-07-10', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 1, '2018-11-21 23:12:50', '2018-11-21 23:12:50', 1),
(87, 4, 'Pesquisador I', '7,8', 'Estar regularmente matriculado em cursos de pós-graduação em Ciências Humanas e Sociais Aplicadas. Atividades: Colaboração na redação de relatórios de pesquisa, a tabulação de dados, a escrita de relatórios técnicos e a elaboração de tabelas e gráficos. Leia o edital completo no site do NECCULT ou em https://goo.gl/YsNQCe', 'Estar regularmente matriculado em cursos de pós-graduação em Ciências Humanas e Sociais Aplicadas. Atividades: Colaboração na redação de relatórios de pesquisa, a tabulação de dados, a escrita de relatórios técnicos e a elaboração de tabelas e gráficos. Leia o edital completo no site do NECCULT ou em https://goo.gl/YsNQCe', '', 1, 0, 1500, 0, 0, 4, '2018-08-09', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:26:39', '2018-11-21 23:26:39', 1),
(88, 4, 'Bolsa Aperfeiçoamento Benefício BAPBAgosto DireçãoIFCH-RAM', '5', 'BAPBAgosto DIREÇÃO IFCH - RAM - Apoio administrativo à secretaria da XIII Reunião de Antropologia do Mercosul – RAM - Período de Inscrições 02/07 a 06/07 - Consultar Edital http://www.ufrgs.br/ifch/index.php?formulario=noticias&metodo=4', 'BAPBAgosto DIREÇÃO IFCH - RAM - Apoio administrativo à secretaria da XIII Reunião de Antropologia do Mercosul – RAM - Período de Inscrições 02/07 a 06/07 - Consultar Edital http://www.ufrgs.br/ifch/index.php?formulario=noticias&metodo=4', '', 1, 0, 400, 0, 1, 7, '2018-07-05', '0000-00-00', '', 16, 'IFCH', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:28:26', '2018-11-21 23:28:26', 1),
(89, 4, 'BOLSA BENEFICIO PRAE/NAC', '5', 'RESULTADO BOLSA APERFEIÇOAMENTO NO SITE: https://www.ufrgs.br/faced/editais-de-selecao-de-bolsas-e-monitorias/', 'RESULTADO BOLSA APERFEIÇOAMENTO NO SITE: https://www.ufrgs.br/faced/editais-de-selecao-de-bolsas-e-monitorias/', '', 1, 0, 400, 0, 1, 4, '2018-06-12', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:29:46', '2018-11-21 23:29:46', 1),
(90, 4, 'Seleção de Monitoria Indígena', '1,2,3,4,5,6,7,8,9,10,11,12', 'Edital PROGRAD 02/2018. As inscrições devem ser realizadas por e-mail até o dia 29 de junho de 2018. O e-mail deve ser enviado para gradbio@ufrgs.br, intitulado "Seleção de Monitoria Indígena", trazendo em seu corpo a apresentação do aluno com a motivação para a vaga. Deve ser enviado em anexo o histórico escolar e o formulário de inscrição. Maiores informações: gradbio@ufrgs.br', 'Edital PROGRAD 02/2018. As inscrições devem ser realizadas por e-mail até o dia 29 de junho de 2018. O e-mail deve ser enviado para gradbio@ufrgs.br, intitulado "Seleção de Monitoria Indígena", trazendo em seu corpo a apresentação do aluno com a motivação para a vaga. Deve ser enviado em anexo o histórico escolar e o formulário de inscrição. Maiores informações: gradbio@ufrgs.br', '', 0, 0, 400, 0, 0, 7, '2018-06-28', '0000-00-00', '', 20, 'PROGRAD', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:34:48', '2018-11-21 23:34:48', 1),
(91, 4, 'Plataforma de ensino: Fisiologia Humana', '3,2', 'O bolsista atuará na elaboração de ilustrações para a plataforma. Horário flexível. É requisito que tenha domínio de softwares gráficos (ilustrator).', 'O bolsista atuará na elaboração de ilustrações para a plataforma. Horário flexível. É requisito que tenha domínio de softwares gráficos (ilustrator).', 'Adobe Illustrator', 1, 0, 400, 0, 0, 4, '2018-06-27', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:39:43', '2018-11-21 23:39:43', 1),
(92, 4, 'CERIMONIAL - Gabinete do Reitor', '2', 'Alunos a partir do 3º semestre de Relações Públicas; Apoio ao Cerimonial do Gabinete do Reitor; Organização do mailing interno e externo; Organização da base de eventos; Contato com público interno e externo.', 'Alunos a partir do 3º semestre de Relações Públicas; Apoio ao Cerimonial do Gabinete do Reitor; Organização do mailing interno e externo; Organização da base de eventos; Contato com público interno e externo.', '', 1, 0, 400, 3, 0, 4, '2018-02-21', '0000-00-00', '', 16, 'Campus Reitoria', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:43:06', '2018-11-21 23:43:06', 1),
(93, 4, 'Análise de Dados Estatísticos', '2', 'Estudante de Estatística ou áreas afins, com conhecimento de SPSS, R, Excel e softwares de análise estatística', 'Estudante de Estatística ou áreas afins, com conhecimento de SPSS, R, Excel e softwares de análise estatística', 'Excel, R, SPSS', 1, 0, 400, 0, 0, 4, '2018-06-25', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:44:07', '2018-11-21 23:44:07', 1),
(94, 4, 'Bolsa - Química Ambiental', '1,12', 'Descrição: Seleciona-se aluno de graduação em química ou áreas afins para atuação no Laboratório de Processos Ambientais e Contaminantes Emergentes (LAPACE). Auxílio no projeto de pesquisa sobre processos de extração e/ou adsorção de contaminantes ambientais, em atividades como preparo de soluções, procedimentos de extração de contaminantes, etc. Conhecimentos em química geral e analítica. Ser proativo, analítico e propositivo. Requisitos do bolsista: Estar regularmente matriculado em curso de graduação da UFRGS; Ter disponibilidade de 20h semanais para as atividades da bolsa; Receber apenas esta modalidade de bolsa. Interessado enviar currículo e comprovante de matrícula para: andreia.fernandes@ufrgs.br', 'Descrição: Seleciona-se aluno de graduação em química ou áreas afins para atuação no Laboratório de Processos Ambientais e Contaminantes Emergentes (LAPACE). Auxílio no projeto de pesquisa sobre processos de extração e/ou adsorção de contaminantes ambientais, em atividades como preparo de soluções, procedimentos de extração de contaminantes, etc. Conhecimentos em química geral e analítica. Ser proativo, analítico e propositivo. Requisitos do bolsista: Estar regularmente matriculado em curso de graduação da UFRGS; Ter disponibilidade de 20h semanais para as atividades da bolsa; Receber apenas esta modalidade de bolsa. Interessado enviar currículo e comprovante de matrícula para: andreia.fernandes@ufrgs.br', '', 1, 0, 400, 0, 0, 7, '2018-06-25', '0000-00-00', '', 20, 'LAPACE', 'Porto Alegre', 'RS', 1, 1, '2018-11-21 23:45:38', '2018-11-21 23:45:38', 1),
(95, 4, 'Simulação de termeletricidade', '6,11', 'Alunos das engenharias de Energia, Mecânica ou Química Obrigatório: aprovado em Termodinâmica Desejável: aprovado em Transferência de Calor e Massa INSCRIÇÂO até 26/06/18 até às 16:00 por email, contendo Histórico Escolar e CV DINÂMICA dia 27/06, das 14:00 às 15:00 (Prédio DEMEC, sala 206) ENTREVISTA dia 28/06 para os pré-selecionados', 'Alunos das engenharias de Energia, Mecânica ou Química Obrigatório: aprovado em Termodinâmica Desejável: aprovado em Transferência de Calor e Massa INSCRIÇÂO até 26/06/18 até às 16:00 por email, contendo Histórico Escolar e CV DINÂMICA dia 27/06, das 14:00 às 15:00 (Prédio DEMEC, sala 206) ENTREVISTA dia 28/06 para os pré-selecionados', '', 1, 0, 800, 0, 0, 4, '2018-06-19', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-21 23:47:21', '2018-11-21 23:47:21', 1),
(96, 4, 'Bolsa SEAD - ebook Fisiologia Humana', '9,10', 'O bolsista produzirá ilustrações para o ebook após discussão com a equipe. Requisitos: Domínio de softwares gráficos (ilustrator). Horário flexível.', 'O bolsista produzirá ilustrações para o ebook após discussão com a equipe. Requisitos: Domínio de softwares gráficos (ilustrator). Horário flexível.', 'Adobe Illustrator', 1, 1, 400, 0, 0, 7, '2018-06-18', '0000-00-00', '', 20, 'UFRGS', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:54:15', '2018-11-21 23:54:15', 1),
(97, 4, 'olsa de Aperfeiçoamento Benefício Março - Setor de Infraestrutura da EA', '5', 'Leia o edital em anexo para maiores informações: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/05/Edital-07-2018_APmarço.pdf', 'Leia o edital em anexo para maiores informações: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/05/Edital-07-2018_APmarço.pdf', '', 1, 0, 400, 0, 1, 7, '2018-05-21', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-21 23:55:24', '2018-11-21 23:55:24', 1);
INSERT INTO `job` (`id`, `id_author`, `title`, `category_list`, `resume`, `text`, `skills`, `type`, `modality`, `salary`, `semester`, `is_prae`, `shift`, `date_start`, `date_finish`, `schedule`, `workload`, `location`, `location_city`, `location_state`, `need_curriculum`, `need_historic`, `datetime_publication`, `datetime_last_edit`, `active`) VALUES
(98, 4, 'BOLSISTA de desenvolvimento back para ambiente virtual de aprendizagem', '1,12', 'Valor da bolsa: R$400,00 Carga horária: 20h (flexivel, parte pode ser a distância) Requisitos: -ruby -rails -noção de MVC -css/html -javascript', 'Valor da bolsa: R$400,00 Carga horária: 20h (flexivel, parte pode ser a distância) Requisitos: -ruby -rails -noção de MVC -css/html -javascript', '', 1, 0, 400, 0, 0, 7, '2018-06-11', '0000-00-00', '', 20, 'Campus Centro', 'Proto Alegre', 'RS', 0, 0, '2018-11-22 17:57:25', '2018-11-22 17:57:25', 1),
(99, 4, 'Bolsa PROPG na Escola de Administração', '5', 'Leia o edital em anexo para mais detalhes. https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/05/EDITAL-BOLSAS-PROPG-2018.pdf Resultado da seleção: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/06/EDITAL-BOLSAS-PROPG-2018-RESULTADO.pdf', 'Leia o edital em anexo para mais detalhes. https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/05/EDITAL-BOLSAS-PROPG-2018.pdf Resultado da seleção: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/06/EDITAL-BOLSAS-PROPG-2018-RESULTADO.pdf', '', 1, 0, 500, 0, 0, 2, '2018-05-29', '0000-00-00', '', 20, 'UFRGS', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:00:32', '2018-11-22 18:00:32', 1),
(100, 4, 'Bolsista de Design', '3,2,5', 'Bolsa para desenvolvido de layout de um ambiente virtual de aprendizagem (front) Necessário: -Javascript -css3 -Html Preferência: -Realtjs -Sass -Material design lite', 'Bolsa para desenvolvido de layout de um ambiente virtual de aprendizagem (front) Necessário: -Javascript -css3 -Html Preferência: -Realtjs -Sass -Material design lite', 'React, SASS, CSS, HTML, Javascript', 1, 0, 400, 0, 0, 7, '2018-05-11', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:01:57', '2018-11-22 18:01:57', 1),
(101, 4, 'Bolsa Escola de Administração - Informática', '1,12', 'Consultar o edital em anexo para informações sobre perfil do candidato e forma de inscrição: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/04/Edital-06-2018_Bolsa-Inform%C3%A1tica-1.pdf Ver resultado: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/04/Edital-06-2018-Bolsa-Inform%C3%A1tica_Resultado-1.pdf', 'Consultar o edital em anexo para informações sobre perfil do candidato e forma de inscrição: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/04/Edital-06-2018_Bolsa-Inform%C3%A1tica-1.pdf Ver resultado: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/04/Edital-06-2018-Bolsa-Inform%C3%A1tica_Resultado-1.pdf', '', 1, 0, 530, 0, 0, 1, '2018-04-09', '0000-00-00', '', 20, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:18:10', '2018-11-22 18:18:10', 1),
(102, 4, 'Edital03/18 - RU01- Campus Centro - 01 (uma) Vaga de Nutrição', '4', 'Estar matriculado no curso de graduação de nutrição. Poderá estar cursando qualquer semestre do curso, encaminhar grade de horários quando da inscrição. Acompanhamento e controle de mercadorias; acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos e outras atividades do cargo. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', 'Estar matriculado no curso de graduação de nutrição. Poderá estar cursando qualquer semestre do curso, encaminhar grade de horários quando da inscrição. Acompanhamento e controle de mercadorias; acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos e outras atividades do cargo. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', '', 1, 0, 400, 0, 0, 4, '2018-04-19', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:19:26', '2018-11-22 18:19:26', 1),
(103, 4, 'Edital03/18 - RU 04 -Campus Agronomia - 01 (uma) Vaga de Nutrição', '4', 'Estar matriculado no curso de graduação de nutrição. Poderá estar cursando qualquer semestre do curso, encaminhar grade de horários quando da inscrição. Acompanhamento e controle de mercadorias; acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos e outras atividades do cargo. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', 'Estar matriculado no curso de graduação de nutrição. Poderá estar cursando qualquer semestre do curso, encaminhar grade de horários quando da inscrição. Acompanhamento e controle de mercadorias; acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos e outras atividades do cargo. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', '', 1, 0, 400, 0, 0, 4, '2018-04-19', '0000-00-00', '', 16, 'Campus Agronomia', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:19:26', '2018-11-22 18:19:26', 1),
(104, 4, 'Edital03/18 - RU03- Campus do Vale - 02 (duas) Vagas de Nutrição', '4', 'Estar matriculado no curso de graduação de nutrição. Poderá estar cursando qualquer semestre do curso, encaminhar grade de horários quando da inscrição. Acompanhamento e controle de mercadorias; acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos e outras atividades do cargo. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', 'Estar matriculado no curso de graduação de nutrição. Poderá estar cursando qualquer semestre do curso, encaminhar grade de horários quando da inscrição. Acompanhamento e controle de mercadorias; acompanhamento e controle de Boas Práticas de Fabricação nos diversos setores da produção de alimentos e outras atividades do cargo. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', '', 1, 0, 400, 0, 0, 4, '2018-04-19', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:19:26', '2018-11-22 18:19:26', 1),
(105, 4, 'Edital 03/2018 - Divisão de Alimentação - 01 (uma)Vaga Suplente Jornalismo', '2', 'Auxilio na elaboração de textos informativos e site da Divisão de Alimentação, os quais serão publicados à Comunidade Universitária. Auxílio nas demais atividades pertinentes à função. Deverá encaminhar a grade de horários quando se inscrever para a vaga. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', 'Auxilio na elaboração de textos informativos e site da Divisão de Alimentação, os quais serão publicados à Comunidade Universitária. Auxílio nas demais atividades pertinentes à função. Deverá encaminhar a grade de horários quando se inscrever para a vaga. Além do Edital03/2018 há também o Edital de Retificação 03/2018 que a Comgrad do Curso esta divulgando.', '', 1, 0, 400, 0, 0, 4, '2018-04-13', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:24:37', '2018-11-22 18:24:37', 1),
(106, 4, 'Núcleo de Economia Alternativa', '2', 'Estudante de Comunicação (Jornal e/ou PP) no mínimo cursando 4º semestre disposto a trabalhar com empreendimentos de geração de trabalho e renda economia solidária', 'Estudante de Comunicação (Jornal e/ou PP) no mínimo cursando 4º semestre disposto a trabalhar com empreendimentos de geração de trabalho e renda economia solidária', '', 1, 0, 400, 4, 0, 7, '2018-04-15', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:27:23', '2018-11-22 18:27:23', 1),
(107, 4, 'Bolsista de extensão', '4', 'O bolsista deve ser aluno (a) do curso de Nutrição, já ter cursado a disciplina de Técnica Dietética I e ter disponibilidade de 20h semanais. É desejável que seja vegetariano(a), vegano(a) ou com conhecimentos sobre o vegetarianismo. Atividades: realização de testes de preparações vegetarianas; auxílio no planejamento, divulgação e realização de um evento sobre vegetarianismo. Período da bolsa: 01/05/2018 a 31/07/2018. Enviar: a) email para divair@ufrgs.br até 18/04 explicando porque se interessou pela vaga. b) cópia do histórico escolar e comprovante de matrícula. Entrevista com interessados (as) no dia 19/04 (5ª feira), às 16h30min no Laboratório de Técnica Dietética - Sala 107 - Faculdade de Medicina.', 'O bolsista deve ser aluno (a) do curso de Nutrição, já ter cursado a disciplina de Técnica Dietética I e ter disponibilidade de 20h semanais. É desejável que seja vegetariano(a), vegano(a) ou com conhecimentos sobre o vegetarianismo. Atividades: realização de testes de preparações vegetarianas; auxílio no planejamento, divulgação e realização de um evento sobre vegetarianismo. Período da bolsa: 01/05/2018 a 31/07/2018. Enviar: a) email para divair@ufrgs.br até 18/04 explicando porque se interessou pela vaga. b) cópia do histórico escolar e comprovante de matrícula. Entrevista com interessados (as) no dia 19/04 (5ª feira), às 16h30min no Laboratório de Técnica Dietética - Sala 107 - Faculdade de Medicina.', '', 1, 0, 400, 2, 0, 7, '2018-04-13', '0000-00-00', '', 20, 'Campus Saúde', 'Porto Alegre', 'RS', 0, 1, '2018-11-22 18:28:46', '2018-11-22 18:28:46', 1),
(108, 4, 'BOLSAS DE TUTORIA ACADÊMICA PARA A DISCIPLINA DE MAT01191 – VETORES', '1,12', 'Solicite por e-mail o edital de seleção Monitoria disciplina MAT01191 – VETORES E GEOMETRIA ANALÍTICA (Curso de Design Visual e Design de Produto) Compareça ao Núcleo Acadêmico da Faculdade de Arquitetura para realização de um teste de conhecimento até o dia 16/04 - 12h Sala 207 – Faculdade de Arquitetura', 'Solicite por e-mail o edital de seleção Monitoria disciplina MAT01191 – VETORES E GEOMETRIA ANALÍTICA (Curso de Design Visual e Design de Produto) Compareça ao Núcleo Acadêmico da Faculdade de Arquitetura para realização de um teste de conhecimento até o dia 16/04 - 12h Sala 207 – Faculdade de Arquitetura', 'Vetores, Geometria Analítica', 0, 0, 400, 2, 1, 7, '2018-03-16', '0000-00-00', '', 20, 'Faculdade de Arquitetura', 'Porto Alegre', 'RS', 0, 1, '2018-11-22 18:30:05', '2018-11-22 18:30:05', 1),
(109, 4, 'T-MEM - Tecnologias de teste de memórias DDR4', '1,11,6,12,', 'Áreas: Estudante da área de Ciência da Computação, Engenharia de Computação, Engenharia Elétrica, Engenharia de Controle e Automação, Engenharia Física ou Engenharia da Produção. Habilidades: Interesse na área de testes de memórias dinâmicas; Habilidades de configuração de BIOS; Conhecimentos básicos de Arquitetura de Computadores e Conhecimento básico de programação. Critérios de seleção: Avaliação do desempenho acadêmico (I3); avaliação do currículo e entrevista. Submissão: Enviar nome, nro. do cartão UFRGS, Histórico escolar e CV (ou link para lattes) para netto@inf.ufrgs.br Os interessados receberão um texto que servirá de base para a entrevista presencial. Manifestação de interesse até 21/03/2018 - 23h55 (quarta-feira). O candidato deve ter parte dos horários disponíveis para ir ao laboratório de automação e integração de sistemas no Campus do Vale - Instituto de Informática. Processo finalizado em 04/04/2018', 'Áreas: Estudante da área de Ciência da Computação, Engenharia de Computação, Engenharia Elétrica, Engenharia de Controle e Automação, Engenharia Física ou Engenharia da Produção. Habilidades: Interesse na área de testes de memórias dinâmicas; Habilidades de configuração de BIOS; Conhecimentos básicos de Arquitetura de Computadores e Conhecimento básico de programação. Critérios de seleção: Avaliação do desempenho acadêmico (I3); avaliação do currículo e entrevista. Submissão: Enviar nome, nro. do cartão UFRGS, Histórico escolar e CV (ou link para lattes) para netto@inf.ufrgs.br Os interessados receberão um texto que servirá de base para a entrevista presencial. Manifestação de interesse até 21/03/2018 - 23h55 (quarta-feira). O candidato deve ter parte dos horários disponíveis para ir ao laboratório de automação e integração de sistemas no Campus do Vale - Instituto de Informática. Processo finalizado em 04/04/2018', 'BIOS, Arquitetura de computadores, Lógica de programação', 2, 0, 800, 0, 0, 4, '2018-03-18', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-22 18:33:01', '2018-11-22 18:33:01', 1),
(110, 4, 'Grupo de Pesquisa em Psicologia (GPPS)', '5,4', 'Requisitos: • Ser aluno da UFRGS (graduação em Psicologia a partir do segundo semestre) • Não possuir vínculo empregatício, estágio remunerado ou voluntário ou qualquer outra modalidade de bolsa, interna ou externa à UFRGS. Atividades: • Reuniões com a equipe dos projetos e grupo de pesquisa • Acompanhar os procedimentos de pesquisa, auxiliando nas atividades de planejamento, revisão de literatura, coleta de dados, etc. • Participação no Salão de Iniciação Científica UFRGS 2018. A seleção acontecerá através de duas etapas: 1. Eliminatória: análise dos documentos enviados -currículo e carta de motivação 2. Classificatória: entrevista presencial. Envio dos documentos para gpps.lab@gmail.com Prazo para envio 16/04/2018', 'Requisitos: • Ser aluno da UFRGS (graduação em Psicologia a partir do segundo semestre) • Não possuir vínculo empregatício, estágio remunerado ou voluntário ou qualquer outra modalidade de bolsa, interna ou externa à UFRGS. Atividades: • Reuniões com a equipe dos projetos e grupo de pesquisa • Acompanhar os procedimentos de pesquisa, auxiliando nas atividades de planejamento, revisão de literatura, coleta de dados, etc. • Participação no Salão de Iniciação Científica UFRGS 2018. A seleção acontecerá através de duas etapas: 1. Eliminatória: análise dos documentos enviados -currículo e carta de motivação 2. Classificatória: entrevista presencial. Envio dos documentos para gpps.lab@gmail.com Prazo para envio 16/04/2018', '', 6, 0, 0, 0, 0, 7, '2018-04-08', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 1, 0, '2018-11-22 18:36:57', '2018-11-22 18:36:57', 1),
(111, 4, 'Bolsa Mestrado - LAMEF - IAP 156 - Sistema de Cabeça de Poço Submarina', '1,12', 'Mestrandos em engenharia para atuar em projetos de pesquisa envolvendo Petrobras. Dentre as atividades previstas estão: Auxiliar na realização de ensaios, montagem de dispositivos, desenho em Solid Works, modelamento via elementos finitos. Requisitos: - Inscrito no Mestrado no PPGE3M - Graduado em Engenharia Mecânica - Conhecimentos de Modelamento Numérico - Conhecimentos de Projeto Mecânico - Inglês Intermediário Fazer sua inscrição a através do link: https://goo.gl/forms/mblIj1pU4WinxDV92 Obs. O valor da bolsa poderá variar em função da qualificação do bolsista (tempo de curso e experiência) podendo atingir até os valores máximos sugeridos pela Decisão 211/2017 do CONSUN.', 'Mestrandos em engenharia para atuar em projetos de pesquisa envolvendo Petrobras. Dentre as atividades previstas estão: Auxiliar na realização de ensaios, montagem de dispositivos, desenho em Solid Works, modelamento via elementos finitos. Requisitos: - Inscrito no Mestrado no PPGE3M - Graduado em Engenharia Mecânica - Conhecimentos de Modelamento Numérico - Conhecimentos de Projeto Mecânico - Inglês Intermediário Fazer sua inscrição a através do link: https://goo.gl/forms/mblIj1pU4WinxDV92 Obs. O valor da bolsa poderá variar em função da qualificação do bolsista (tempo de curso e experiência) podendo atingir até os valores máximos sugeridos pela Decisão 211/2017 do CONSUN.', '', 2, 0, 1500, 0, 0, 7, '2018-03-28', '0000-00-00', '', 30, 'LAMEF', 'Porto Alegre', 'RS', 1, 1, '2018-11-22 18:39:11', '2018-11-22 18:39:11', 1),
(112, 4, 'Desenvolvedor(a) de software web', '1,12', 'O Mconf é formado por diversos componentes e trabalhamos com diversas tecnologias, incluindo WebRTC, Ruby on Rails, Docker, React e diversas outras. São requisitos básicos ter bom conhecimento de língua inglesa (leitura e escrita), ter conhecimentos sólidos em programação, gostar de programar, gostar de aprender e trabalhar bem em equipe. São conhecimentos desejáveis: Ruby on Rails e/ou programação web, incluindo MVC, HTML, JS, CSS. Site da empresa: http://mconf.com/', 'O Mconf é formado por diversos componentes e trabalhamos com diversas tecnologias, incluindo WebRTC, Ruby on Rails, Docker, React e diversas outras. São requisitos básicos ter bom conhecimento de língua inglesa (leitura e escrita), ter conhecimentos sólidos em programação, gostar de programar, gostar de aprender e trabalhar bem em equipe. São conhecimentos desejáveis: Ruby on Rails e/ou programação web, incluindo MVC, HTML, JS, CSS. Site da empresa: http://mconf.com/', 'Ruby, MVC, HTML, Javascript, CSS', 3, 1, 1300, 0, 0, 4, '2018-03-27', '0000-00-00', '', 30, 'Campus do Vale', 'Porto Alegre', 'RS', 1, 1, '2018-11-22 18:40:53', '2018-11-22 18:40:53', 1),
(113, 4, 'Bolsa Aperfeiçoamento Agosto - Biblioteca da Escola de Administração', '5', 'Leia o edital em anexo para maiores informações: https://www.ufrgs.br/escoladeadministracao/graduacao/estagios-e-oportunidades/ Vaga com benefício disponibilizada: consulte o Edital de Retificação para maiores informações: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/03/Edital-de-Retifica%C3%A7%C3%A3o-01-2018-1.pdf Resultado da seleção: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/03/Edital-05-2018-Apagosto_Resultado.pdf', 'Leia o edital em anexo para maiores informações: https://www.ufrgs.br/escoladeadministracao/graduacao/estagios-e-oportunidades/ Vaga com benefício disponibilizada: consulte o Edital de Retificação para maiores informações: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/03/Edital-de-Retifica%C3%A7%C3%A3o-01-2018-1.pdf Resultado da seleção: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/03/Edital-05-2018-Apagosto_Resultado.pdf', '', 1, 0, 400, 0, 0, 7, '2018-03-08', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:48:32', '2018-11-22 18:48:32', 1),
(114, 4, 'Bolsa Diagramação/Editoração - DEDS', '2', 'O Departamento de Educação e Desenvolvimento Social – DEDS/PROREXT está selecionando bolsista para área de diagramação e editoração gráfica. Podem se inscrever estudantes dos cursos de Design Visual ou Comunicação da UFRGS. Entre os requisitos, estão ter domínio de InDesign e conhecimentos básicos de Photoshop, Illustrator ou Corel. É necessário ter iniciativa e vontade de aprender. A carga horária é de 20 horas semanais, nos turnos da manhã e/ou da tarde, com horário flexível. Interessados devem enviar currículo e portfólio para o e-mail deds@prorext.ufrgs.br', 'O Departamento de Educação e Desenvolvimento Social – DEDS/PROREXT está selecionando bolsista para área de diagramação e editoração gráfica. Podem se inscrever estudantes dos cursos de Design Visual ou Comunicação da UFRGS. Entre os requisitos, estão ter domínio de InDesign e conhecimentos básicos de Photoshop, Illustrator ou Corel. É necessário ter iniciativa e vontade de aprender. A carga horária é de 20 horas semanais, nos turnos da manhã e/ou da tarde, com horário flexível. Interessados devem enviar currículo e portfólio para o e-mail deds@prorext.ufrgs.br', 'Photoshop, Illustrator, Corel Draw', 1, 0, 400, 0, 0, 4, '2018-03-20', '0000-00-00', '', 20, 'DEDS', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:50:29', '2018-11-22 18:50:29', 1),
(115, 4, 'Secretaria do PPGEE - Programa de Pós-Graduação em Engenharia Elétrica', '1,2,3,5,6,7,8,9,10,11,12', 'Espera-se do bolsista: pontualidade, assiduidade, responsabilidade, vontade de aprender e de trabalhar. É necessário ter conhecimentos básicos de informática e do pacote office (Excel, Power Point e Word). Atividades administrativas: atendimento ao público em geral, atualização dos sistemas de pós-graduação, elaborar planilhas, atas, ofícios, certificados, solicitar orçamentos para compras e organizar arquivo e materiais. Enviar currículo resumido por e-mail para (ppgee@ufrgs.br) de 19 a 23/03/2018 e aguardar agendamento para entrevista no dia 27/03/2018. Início da bolsa a partir do dia 01/04/2018. Conforme Edital do Programa de Bolsas da PROPG - Bolsas de Desenvolvimento Institucional- 2018/1 - PPGEE. (http://www.ufrgs.br/ppgee/upload/Edital Bolsas PROPG DI 2018_1_PPGEE.pdf)', 'Espera-se do bolsista: pontualidade, assiduidade, responsabilidade, vontade de aprender e de trabalhar. É necessário ter conhecimentos básicos de informática e do pacote office (Excel, Power Point e Word). Atividades administrativas: atendimento ao público em geral, atualização dos sistemas de pós-graduação, elaborar planilhas, atas, ofícios, certificados, solicitar orçamentos para compras e organizar arquivo e materiais. Enviar currículo resumido por e-mail para (ppgee@ufrgs.br) de 19 a 23/03/2018 e aguardar agendamento para entrevista no dia 27/03/2018. Início da bolsa a partir do dia 01/04/2018. Conforme Edital do Programa de Bolsas da PROPG - Bolsas de Desenvolvimento Institucional- 2018/1 - PPGEE. (http://www.ufrgs.br/ppgee/upload/Edital Bolsas PROPG DI 2018_1_PPGEE.pdf)', 'Pacote Office', 1, 0, 500, 0, 0, 2, '2018-03-19', '0000-00-00', '', 20, 'Escola de Engenharia', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:55:26', '2018-11-22 18:55:26', 1),
(116, 4, 'Bolsista para o NSi', '6,11,1,12', 'Necessário ter conhecimento básico de Informática (identificar/corrigir possíveis problemas de software e hardware) e de Redes de Computadores. Estará junto a outros bolsistas que se ajudam entre si. Horários flexíveis. Contratação imediata. Aluno(a) de graduação, sem vínculo empregatício e sem outra bolsa. Local de trabalho: Colégio de Aplicação da UFRGS - Campus do Vale. Ambiente descontraído e amigável. ;-) INSCRIÇÃO: Será realizada através do envio de um email, contendo o celular, as suas qualificações, inclusive curso, semestre, etc., para o email acima. O agendamento da entrevista será realizado por email.', 'Necessário ter conhecimento básico de Informática (identificar/corrigir possíveis problemas de software e hardware) e de Redes de Computadores. Estará junto a outros bolsistas que se ajudam entre si. Horários flexíveis. Contratação imediata. Aluno(a) de graduação, sem vínculo empregatício e sem outra bolsa. Local de trabalho: Colégio de Aplicação da UFRGS - Campus do Vale. Ambiente descontraído e amigável. ;-) INSCRIÇÃO: Será realizada através do envio de um email, contendo o celular, as suas qualificações, inclusive curso, semestre, etc., para o email acima. O agendamento da entrevista será realizado por email.', '', 1, 0, 400, 0, 1, 7, '2018-03-16', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:56:52', '2018-11-22 18:56:52', 1),
(117, 4, 'Bolsa de Informática - Escola de Administração 2018', '1,12', 'Suporte ao Setor de Tecnologia da Informação da Escola de Administração Ver link: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-03-2018_Bolsa-Informática.pdf Resultado da Seleção: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/03/Edital-02-2018-APmar%C3%A7o_Resultado.pdf', 'Suporte ao Setor de Tecnologia da Informação da Escola de Administração Ver link: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-03-2018_Bolsa-Informática.pdf Resultado da Seleção: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/03/Edital-02-2018-APmar%C3%A7o_Resultado.pdf', '', 1, 0, 530, 0, 0, 1, '2018-02-21', '0000-00-00', '', 20, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:58:22', '2018-11-22 18:58:22', 1),
(118, 4, 'Bolsa Aperfeiçoamento Março 2018 - Escola de Administração', '5', 'Apoio secretaria administrativa e infraestrutura Ver link: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-02-2018_APmarço.pdf Resultado da seleção: https://www.ufrgs.br/escoladeadministracao/2018/03/07/gerencia-da-ea-publica-resultado-de-selecao-de-bolsista/', 'Apoio secretaria administrativa e infraestrutura Ver link: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-02-2018_APmarço.pdf Resultado da seleção: https://www.ufrgs.br/escoladeadministracao/2018/03/07/gerencia-da-ea-publica-resultado-de-selecao-de-bolsista/', '', 1, 0, 400, 0, 1, 4, '2018-02-21', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 18:59:35', '2018-11-22 18:59:35', 1),
(122, 4, 'Incubadora Tecnológica Hestia - Campus do Vale', '1,12', 'Autônomo, pró ativo, organizado, responsável, pontual. As atividades incluem atendimento ao publico, registro de atividades em banco de dados, organização de reuniões, preparação de material de apresentação, postagem em redes sociais, etc. Necessário conhecimento em pacote office, desejável wordpress. Local das atividades : Unidade Física - Campus do Vale.', 'Autônomo, pró ativo, organizado, responsável, pontual. As atividades incluem atendimento ao publico, registro de atividades em banco de dados, organização de reuniões, preparação de material de apresentação, postagem em redes sociais, etc. Necessário conhecimento em pacote office, desejável wordpress. Local das atividades : Unidade Física - Campus do Vale.', '', 1, 0, 400, 0, 0, 7, '2018-03-07', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:07:28', '2018-11-22 19:07:28', 1),
(123, 4, 'Comunicação ambiental', '2', 'Redação de notícias; gerenciamento do site e da página do Instituto Curicaca no Facebook; produção e envio de newsletter; assessoria de imprensa', 'Redação de notícias; gerenciamento do site e da página do Instituto Curicaca no Facebook; produção e envio de newsletter; assessoria de imprensa', '', 1, 0, 400, 0, 0, 4, '2018-03-05', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:09:21', '2018-11-22 19:09:21', 1),
(124, 4, 'EXTENSÃO - CENTRO DE ESTUDOS DE LAZER E ATIVIDADE FÍSICA DO IDOSO/CELARI', '4', 'O RESULTADO DA PRIMEIRA ETAPA SERÁ DIVULGADO EM 02/03/18 VIA EMAIL PARA INSCRITOS. A atuação do bolsista inclui atividades físicas com público idoso no programa de extensão CELARI da ESEFID. A carga horária será de 20 horas semanais. Atribuições: - atuar nas atividades diárias do CELARI correspondente as atividades físicas e socioeducativas, planejando, desenvolvendo e avaliando as mesmas. - auxiliar na parte administrativa do CELARI, tais como: controle de frequência nas atividades, controle de pagamento das taxas de manutenção, organização e manutenção dos materiais utilizados nas atividades, organização e manutenção dos espaços utilizados nas atividades. Processo seletivo: maior valorização de pessoas com experiências anteriores de atividade física regular para idosos. Disponibilidade de carga horária: 20 horas semanais compatível com horários do CELARI. Bolsas para graduação, mestrado e doutorado (Educação Física, PPGCMH, PPGCol).', 'O RESULTADO DA PRIMEIRA ETAPA SERÁ DIVULGADO EM 02/03/18 VIA EMAIL PARA INSCRITOS. A atuação do bolsista inclui atividades físicas com público idoso no programa de extensão CELARI da ESEFID. A carga horária será de 20 horas semanais. Atribuições: - atuar nas atividades diárias do CELARI correspondente as atividades físicas e socioeducativas, planejando, desenvolvendo e avaliando as mesmas. - auxiliar na parte administrativa do CELARI, tais como: controle de frequência nas atividades, controle de pagamento das taxas de manutenção, organização e manutenção dos materiais utilizados nas atividades, organização e manutenção dos espaços utilizados nas atividades. Processo seletivo: maior valorização de pessoas com experiências anteriores de atividade física regular para idosos. Disponibilidade de carga horária: 20 horas semanais compatível com horários do CELARI. Bolsas para graduação, mestrado e doutorado (Educação Física, PPGCMH, PPGCol).', '', 2, 0, 530, 0, 0, 4, '2018-02-23', '0000-00-00', '', 20, 'CELARI', 'Porto Alegre', 'RS', 0, 1, '2018-11-22 19:10:39', '2018-11-22 19:10:39', 1),
(125, 4, 'Bolsa Aperfeiçoamento Agosto 2018 - Escola de Administração', '5', 'Atividades de apoio administrativo Ver link: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-04-2018_APagosto.pdf Resultados da seleção: ver link https://www.ufrgs.br/escoladeadministracao/2018/02/28/ea-publica-resultado-de-estudantes-selecionados-para-bolsas-aperfeicoamento/', 'Atividades de apoio administrativo Ver link: https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-04-2018_APagosto.pdf Resultados da seleção: ver link https://www.ufrgs.br/escoladeadministracao/2018/02/28/ea-publica-resultado-de-estudantes-selecionados-para-bolsas-aperfeicoamento/', '', 1, 0, 400, 0, 0, 4, '2018-02-21', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:12:15', '2018-11-22 19:12:15', 1),
(126, 4, 'Bolsa secretaria PGCIMAT', '1,12', 'Assiduidade, compromisso e responsabilidade, disponibilidade de horário no turno da tarde e gostar de pessoas. Requisitos: Word, Excel, Outlook, Internet e Windows. Principais atividades: Atendimento aos alunos e professores, envio e recebimento de e-mails, encaminhamento de bancas de mestrado e doutorado, atualização e inserção dos dados discentes(Posgrad), digitalização de documentos diversos e demais tarefas administrativas.', 'Assiduidade, compromisso e responsabilidade, disponibilidade de horário no turno da tarde e gostar de pessoas. Requisitos: Word, Excel, Outlook, Internet e Windows. Principais atividades: Atendimento aos alunos e professores, envio e recebimento de e-mails, encaminhamento de bancas de mestrado e doutorado, atualização e inserção dos dados discentes(Posgrad), digitalização de documentos diversos e demais tarefas administrativas.', 'Word, Excel, Outlook, Internet, Windows', 1, 0, 500, 0, 0, 2, '2018-02-26', '0000-00-00', '', 20, 'PGCIMAT', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:14:27', '2018-11-22 19:14:27', 1),
(127, 4, 'CIS - Comissão Interna de Supervisão', '2,5', 'Apoio Administrativo; Tarefas relacionadas à Secretaria; Conhecimento em informática.', 'Apoio Administrativo; Tarefas relacionadas à Secretaria; Conhecimento em informática.', 'Informática', 1, 0, 400, 0, 1, 4, '2018-02-21', '0000-00-00', '', 16, 'CIS', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:15:31', '2018-11-22 19:15:31', 1),
(128, 4, 'EDITAL DE SELEÇÃO BOLSISTA NAPEAD - Parte 1', '1,12', 'Ser aluno regular devidamente matriculado em cursos graduação ou de pós-graduação da UFRGS, experiência comprovada na área (currículo e portfólio) e bom histórico escolar. Vaga a - design visual e motion graphics: domínio dos softwares After Effects, Premiere, Illustrator e Indesign. Experiência no manejo de câmeras, iluminação e áudio em estúdio. Vaga b - design editorial: domínio dos softwares Illustrator, Indesign, Sigil, epubs, conhecimentos básicos em HTML e CSS. Vaga c - programador Unity: domínio do software Unity, usando C# Vaga d - artista 3D: domínio dos softwares Blender/Maya/3DSMax, conhecimentos básicos de Unity. Vaga e - captação e montagem de vídeos: domínio dos softwares Premiere, conhecimentos básicos em Illustrator. Experiência no manejo de câmeras, iluminação e áudio em estúdio. Disponibilidade para filmagens externas (eventualmente à noite e finais de semana/feriado). Acesse o edital pelo link: http://www.ufrgs.br/sead/documentos/edital-04-2018', 'Ser aluno regular devidamente matriculado em cursos graduação ou de pós-graduação da UFRGS, experiência comprovada na área (currículo e portfólio) e bom histórico escolar. Vaga a - design visual e motion graphics: domínio dos softwares After Effects, Premiere, Illustrator e Indesign. Experiência no manejo de câmeras, iluminação e áudio em estúdio. Vaga b - design editorial: domínio dos softwares Illustrator, Indesign, Sigil, epubs, conhecimentos básicos em HTML e CSS. Vaga c - programador Unity: domínio do software Unity, usando C# Vaga d - artista 3D: domínio dos softwares Blender/Maya/3DSMax, conhecimentos básicos de Unity. Vaga e - captação e montagem de vídeos: domínio dos softwares Premiere, conhecimentos básicos em Illustrator. Experiência no manejo de câmeras, iluminação e áudio em estúdio. Disponibilidade para filmagens externas (eventualmente à noite e finais de semana/feriado). Acesse o edital pelo link: http://www.ufrgs.br/sead/documentos/edital-04-2018', 'HTML, CSS, Illustrator, Premiere,Unity, Blender, C#, Blender, Indesign', 1, 0, 1300, 0, 0, 7, '2018-02-19', '0000-00-00', '', 20, 'NAPEAD', 'Porto Alegre', 'RS', 1, 1, '2018-11-22 19:17:40', '2018-11-22 19:17:40', 1),
(129, 4, 'DITAL DE SELEÇÃO BOLSISTA NAPEAD - PARTE 2', '1,12', 'Ser aluno regular devidamente matriculado em cursos graduação ou de pós-graduação da UFRGS, experiência comprovada na área (currículo e portfólio) e bom histórico escolar. Vaga f - apoio à administração de plataforma EaD: conhecimentos avançados de Moodle e básicos de HTML. Vaga g - produção online de curso de cálculo: ter atuado (monitor, ministrante, docência orientada, etc.) nas disciplinas: Pré-Cálculo, Cálculo diferencial e integral IA, Cálculo diferencial e integral IIA. Vaga h - apoio à captação de vídeos e suporte de TI: conhecimentos avançados em configuração de redes e montagem de microcomputadores. Conhecimentos básicos em captação de vídeos com equipamento profissional. Disponibilidade para filmagens externas (eventualmente à noite e finais de semana/feriado). As vagas "c", "f", "g" e "h" estão dispensadas da apresentação do portfólio). Acesse o edital pelo link: http://www.ufrgs.br/sead/documentos/edital-04-2018', 'Ser aluno regular devidamente matriculado em cursos graduação ou de pós-graduação da UFRGS, experiência comprovada na área (currículo e portfólio) e bom histórico escolar. Vaga f - apoio à administração de plataforma EaD: conhecimentos avançados de Moodle e básicos de HTML. Vaga g - produção online de curso de cálculo: ter atuado (monitor, ministrante, docência orientada, etc.) nas disciplinas: Pré-Cálculo, Cálculo diferencial e integral IA, Cálculo diferencial e integral IIA. Vaga h - apoio à captação de vídeos e suporte de TI: conhecimentos avançados em configuração de redes e montagem de microcomputadores. Conhecimentos básicos em captação de vídeos com equipamento profissional. Disponibilidade para filmagens externas (eventualmente à noite e finais de semana/feriado). As vagas "c", "f", "g" e "h" estão dispensadas da apresentação do portfólio). Acesse o edital pelo link: http://www.ufrgs.br/sead/documentos/edital-04-2018', 'Moodle, HTML', 1, 0, 1300, 0, 0, 7, '2018-02-19', '0000-00-00', '', 20, 'NAPEAD', 'Porto Alegre', 'RS', 1, 1, '2018-11-22 19:19:47', '2018-11-22 19:19:47', 1),
(130, 4, 'Bolsas Aperfeiçoamento Benefício Março Escola de Administração – 2018', '2,5', 'Ver edital https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/01/Edital-01-2018-ADM-1.pdf Resultado da seleção https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-01-2018-do-Programa-de-Bolsas-AP_Resultado.pdf', 'Ver edital https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/01/Edital-01-2018-ADM-1.pdf Resultado da seleção https://www.ufrgs.br/escoladeadministracao/wp-content/uploads/2018/02/Edital-01-2018-do-Programa-de-Bolsas-AP_Resultado.pdf', '', 1, 0, 400, 0, 1, 7, '2018-01-05', '0000-00-00', '', 16, 'Escola de Administração', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:30:45', '2018-11-22 19:30:45', 1),
(131, 4, 'Seleção de nutricionistas para tutoria de curso EaD sobre EAN', '4', 'Seleção de profissionais da área de nutrição para atuar como tutores a distância de curso sobre Educação Alimentar e Nutricional (EAN) na modalidadede educação a distância (EaD) Formação acadêmica exigida: Graduação em Nutrição. Estar cursando mestrado ou doutorado na UFRGS. Mais informações: www.ufrgs.br/cecane', 'Seleção de profissionais da área de nutrição para atuar como tutores a distância de curso sobre Educação Alimentar e Nutricional (EAN) na modalidadede educação a distância (EaD) Formação acadêmica exigida: Graduação em Nutrição. Estar cursando mestrado ou doutorado na UFRGS. Mais informações: www.ufrgs.br/cecane', '', 0, 1, 765, 0, 0, 4, '2018-01-15', '0000-00-00', '', 20, 'EAN', 'Porto Alegre', 'RS', 0, 1, '2018-11-22 19:32:33', '2018-11-22 19:32:33', 1),
(132, 4, 'Seleção de bolsistas de graduação em nutrição', '4', 'O Centro Colaborador em Alimentação e Nutrição do Escolar – CECANE UFRGS, sediado na Faculdade de Medicina da Universidade Federal do Rio Grande do Sul (FAMED/UFRGS), está selecionando acadêmicos de graduação do curso de Nutrição da UFRGS interessados em participar das ações previstas para 2018. 02 vagas (6 meses) para auxiliar nos Produtos: “Assessoria aos municípios” e “Oficinas regionais da agricultura familiar” 01 vaga (8 meses) para auxiliar no Produto: “Rede Brasileira de Alimentação Escolar”(REBRAE) 01 vaga (6 meses) para auxiliar no Produto: “Educação Alimentar e Nutricional (curso EAD)” O edital está disponível no site do CECANE UFRGS: www.ufrgs.br/cecane', 'O Centro Colaborador em Alimentação e Nutrição do Escolar – CECANE UFRGS, sediado na Faculdade de Medicina da Universidade Federal do Rio Grande do Sul (FAMED/UFRGS), está selecionando acadêmicos de graduação do curso de Nutrição da UFRGS interessados em participar das ações previstas para 2018. 02 vagas (6 meses) para auxiliar nos Produtos: “Assessoria aos municípios” e “Oficinas regionais da agricultura familiar” 01 vaga (8 meses) para auxiliar no Produto: “Rede Brasileira de Alimentação Escolar”(REBRAE) 01 vaga (6 meses) para auxiliar no Produto: “Educação Alimentar e Nutricional (curso EAD)” O edital está disponível no site do CECANE UFRGS: www.ufrgs.br/cecane', '', 1, 0, 440, 0, 0, 4, '2018-01-15', '0000-00-00', '', 15, 'CECANE', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:33:59', '2018-11-22 19:33:59', 1),
(133, 4, 'ESCOLA DE ENFERMAGEM - BOLSA APERFEIÇOAMENTO BENEFÍCIO MARÇO', '5', 'Acadêmicos da UFRGS, com conhecimentos de informática. Atividades: Atendimento ao público, guarda de livros, revisão das estantes, preparação de acervo para empréstimo (livros, fitas, CDs, etc.) e localização da Produção Intelectual na Biblioteca Setorial da EENF.', 'Acadêmicos da UFRGS, com conhecimentos de informática. Atividades: Atendimento ao público, guarda de livros, revisão das estantes, preparação de acervo para empréstimo (livros, fitas, CDs, etc.) e localização da Produção Intelectual na Biblioteca Setorial da EENF.', '', 1, 0, 400, 0, 1, 7, '2018-01-05', '0000-00-00', '', 16, 'EENF', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:34:56', '2018-11-22 19:34:56', 1),
(134, 4, 'Bolsa Aperfeiçoamento Benefício Março – Letras Confúcio', '2', 'Atuação: planejamento de eventos; atendimento ao público, inclusive por telefone; comunicação por e-mail, tradução de documentos do inglês para o português e vice-versa; redação e revisão de documentos; atualização de registros de informação e acompanhamento de processos, e atividades similares de suporte ao Instituto Confúcio. Acesse o edital pelo site do Instituto de Letras: http://www.ufrgs.br/letras/index.html, ou pelo site da PRAE: http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais-de-bolsas', 'Atuação: planejamento de eventos; atendimento ao público, inclusive por telefone; comunicação por e-mail, tradução de documentos do inglês para o português e vice-versa; redação e revisão de documentos; atualização de registros de informação e acompanhamento de processos, e atividades similares de suporte ao Instituto Confúcio. Acesse o edital pelo site do Instituto de Letras: http://www.ufrgs.br/letras/index.html, ou pelo site da PRAE: http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais-de-bolsas', '', 1, 0, 400, 0, 0, 4, '2017-12-22', '0000-00-00', '', 16, 'Instituto Confúcio', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:38:09', '2018-11-22 19:38:09', 1),
(135, 4, 'Bolsa Aperfeiçoamento Benefício Março – Letras Let1', '2', 'Atuação: atendimento ao público, comunicação por e-mail, redação e revisão de documentos, atualização de registros de informação e acompanhamento de processos, e atividades similares de suporte ao LET1. Acesse o edital pelo site do Instituto de Letras: http://www.ufrgs.br/letras/index.html, ou pelo site da PRAE: http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais-de-bolsas', 'Atuação: atendimento ao público, comunicação por e-mail, redação e revisão de documentos, atualização de registros de informação e acompanhamento de processos, e atividades similares de suporte ao LET1. Acesse o edital pelo site do Instituto de Letras: http://www.ufrgs.br/letras/index.html, ou pelo site da PRAE: http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais-de-bolsas', '', 1, 0, 400, 0, 0, 4, '2017-12-22', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:39:26', '2018-11-22 19:39:26', 1),
(136, 4, 'Bolsa Aperfeiçoamento Benefício Março – Letras Let3', '2', 'Atuação: atendimento ao público, comunicação por e-mail, redação e revisão de documentos, atualização de registros de informação e acompanhamento de processos, e atividades similares de suporte ao LET3. Acesse o edital pelo site do Instituto de Letras: http://www.ufrgs.br/letras/index.html, ou pelo site da PRAE: http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais-de-bolsas', 'Atuação: atendimento ao público, comunicação por e-mail, redação e revisão de documentos, atualização de registros de informação e acompanhamento de processos, e atividades similares de suporte ao LET3. Acesse o edital pelo site do Instituto de Letras: http://www.ufrgs.br/letras/index.html, ou pelo site da PRAE: http://www.ufrgs.br/prae/bolsas-auxilios/bolsas/editais-de-bolsas', '', 1, 0, 400, 0, 0, 4, '2017-12-22', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:39:26', '2018-11-22 19:39:26', 1),
(137, 4, 'Bolsa Aperfeiçoamento Março - Direção/IFCH\r\nHumanas e Sociais', '5', 'Ser estudante de arquitetura para trabalhar no apoio à definição e reestruturação dos espaços físicos e de gestão do IFCH; apoio à elaboração projetos e plantas arquitetônicas básicas; apoio na avaliação da estrutura física do IFCH para fins de solicitação de manutenção e reformas. Maiores informações no site: http://www.ufrgs.br/ifch/?subacao=1&formulario=noticias&metodo=0&id=120&voltar=sim', 'Ser estudante de arquitetura para trabalhar no apoio à definição e reestruturação dos espaços físicos e de gestão do IFCH; apoio à elaboração projetos e plantas arquitetônicas básicas; apoio na avaliação da estrutura física do IFCH para fins de solicitação de manutenção e reformas. Maiores informações no site: http://www.ufrgs.br/ifch/?subacao=1&formulario=noticias&metodo=0&id=120&voltar=sim', 'Arquitetura', 1, 0, 400, 0, 0, 2, '2017-12-22', '0000-00-00', '', 16, 'IFCH', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:41:02', '2018-11-22 19:41:02', 1),
(138, 4, 'Bolsa Aperfeiçoamento Benefício Março - NAGIFCH', '5', '01 Bolsa BAPBMarço (manhã) e 01 Bolsa BAPBMarço (tarde). Bolsistas para o atendimento, de forma presencial (nas dependências do Setor), via e-mail e por telefone, aos estudantes e docentes, com experiência nas rotinas administrativas da UFRGS. Maiores informações no site: http://www.ufrgs.br/ifch/?subacao=1&formulario=noticias&metodo=0&id=120&voltar=sim', '01 Bolsa BAPBMarço (manhã) e 01 Bolsa BAPBMarço (tarde). Bolsistas para o atendimento, de forma presencial (nas dependências do Setor), via e-mail e por telefone, aos estudantes e docentes, com experiência nas rotinas administrativas da UFRGS. Maiores informações no site: http://www.ufrgs.br/ifch/?subacao=1&formulario=noticias&metodo=0&id=120&voltar=sim', '', 1, 0, 400, 0, 1, 4, '2017-12-22', '0000-00-00', '', 16, 'NAGIFCH', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:43:43', '2018-11-22 19:43:43', 1),
(139, 4, 'Bolsa Aperfeiçoamento Beneficio - Laboratório de Informática do IFCH\r\nHumanas e Sociais', '5', 'Conhecimentos básicos de informática; assiduidade; estudar no Campus do Vale; boa comunicação; experiência na função; disponibilidade total par ao turno da noite; currículo e entrevista compatíveis com os critérios estabelecidos.', 'Conhecimentos básicos de informática; assiduidade; estudar no Campus do Vale; boa comunicação; experiência na função; disponibilidade total par ao turno da noite; currículo e entrevista compatíveis com os critérios estabelecidos.', '', 1, 0, 400, 0, 0, 3, '2017-12-20', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:45:03', '2018-11-22 19:45:03', 1),
(140, 4, 'Bolsa Aperfeiçoamento - Laboratório de Infomática IFCH', '5', 'Conhecimento avançado de informática; assiduidade; estudar no Campus do Vale; experiência na função; currículo e entrevista compatíveis com os critérios estabelecidos.', 'Conhecimento avançado de informática; assiduidade; estudar no Campus do Vale; experiência na função; currículo e entrevista compatíveis com os critérios estabelecidos.', '', 1, 0, 400, 0, 0, 2, '2017-12-20', '0000-00-00', '', 16, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:45:03', '2018-11-22 19:45:03', 1),
(141, 4, 'UFRGS TV', '2', 'Estudantes de Jornalismo, de relações Públicas, de Publicidade e Propaganda e de Design Visual Os estudantes selecionados através desse processo poderão ser contemplados com Bolsas Aperfeiçoamento Benefício e Bolsas Aperfeiçoamento, da PRAE, e com demais bolsas vinculadas aos diversos projetos que a UFRGS TV mantém com unidades como o Instituto de Física, a SEDETEC, a FAURGS, a PROREXT, a SECOM, a SEAD, além de outras com as quais podem ser feitas futuras parcerias, uma vez que todas elas envolvem habilidades relacionadas à produção audiovisual, que é o foco dessas oficinas e do trabalho na UFRGS TV', 'Estudantes de Jornalismo, de relações Públicas, de Publicidade e Propaganda e de Design Visual Os estudantes selecionados através desse processo poderão ser contemplados com Bolsas Aperfeiçoamento Benefício e Bolsas Aperfeiçoamento, da PRAE, e com demais bolsas vinculadas aos diversos projetos que a UFRGS TV mantém com unidades como o Instituto de Física, a SEDETEC, a FAURGS, a PROREXT, a SECOM, a SEAD, além de outras com as quais podem ser feitas futuras parcerias, uma vez que todas elas envolvem habilidades relacionadas à produção audiovisual, que é o foco dessas oficinas e do trabalho na UFRGS TV', '', 6, 0, 0, 0, 0, 7, '2017-12-11', '0000-00-00', '', 16, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:51:31', '2018-11-22 19:51:31', 1),
(142, 4, 'Setor Administrativo/ Gerência - FCE', '7,8', 'Informações sobre o processo de seleção em www.ufrgs.br/fce ou pelo ramal 3437.', 'Informações sobre o processo de seleção em www.ufrgs.br/fce ou pelo ramal 3437.', '', 1, 0, 400, 0, 1, 1, '2017-07-13', '0000-00-00', '', 20, 'FCE', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 19:53:05', '2018-11-22 19:53:05', 1),
(143, 4, 'BOLSISTA DE EXTENSÃO', '2,1,12', 'DESENVOLVIMENTO E MANUTENÇÃO DO SITE DA COMISSÃO DE GRADUAÇÃO DA FACULDADE DE FARMÁCIA – UFRGS habilidade com informática habilidade com plataforma Plone disponibilidade de trabalho em EaD', 'DESENVOLVIMENTO E MANUTENÇÃO DO SITE DA COMISSÃO DE GRADUAÇÃO DA FACULDADE DE FARMÁCIA – UFRGS habilidade com informática habilidade com plataforma Plone disponibilidade de trabalho em EaD', 'Plone', 6, 1, 0, 0, 0, 7, '2017-07-31', '0000-00-00', '', 20, 'UFRGS', 'Faculdade de Farmácia', 'RS', 0, 0, '2018-11-22 20:13:53', '2018-11-22 20:13:53', 1),
(144, 4, 'Bolsista voluntário - Informática, Arquivologia ou Biblioteconomia', '1,12,5', 'Procuramos um(a) bolsista(a) voluntário(a) que domine o sistema de construção de Bibliotecas Virtuais Temáticas (IBICT), para trabalhar junto ao LUPPA (Laboratório de Estudos sobre os Usos Políticos do Passado).', 'Procuramos um(a) bolsista(a) voluntário(a) que domine o sistema de construção de Bibliotecas Virtuais Temáticas (IBICT), para trabalhar junto ao LUPPA (Laboratório de Estudos sobre os Usos Políticos do Passado).', '', 6, 0, 0, 0, 0, 7, '2017-07-17', '0000-00-00', '', 20, 'LUPPA', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 20:15:28', '2018-11-22 20:15:28', 1),
(145, 4, 'Vaga para NAUBIO - Núcleo de Avaliação da Unidade', '2,5', 'O bolsista executará atividades como: Auxílio na análise de dados quantitativos e qualitativos; Geração de gráficos; Auxílio na elaboração de relatório. Necessário conhecimento em Excel. Horário a combinar.', 'O bolsista executará atividades como: Auxílio na análise de dados quantitativos e qualitativos; Geração de gráficos; Auxílio na elaboração de relatório. Necessário conhecimento em Excel. Horário a combinar.', 'Excel', 1, 0, 400, 0, 0, 4, '2017-07-14', '0000-00-00', '', 20, 'NAUBIO', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 20:17:14', '2018-11-22 20:17:14', 1),
(146, 4, 'Bolsa de iniciação tecnológica voluntária', '1,12,5', 'O Laboratório de Estudos sobre os Usos Políticos do Passado (LUPPA) procura bolsista voluntário(a) para desenvolver um banco de dados a partir de linguagem compatível com o sistema de hospedagem de sites da UFRGS.', 'O Laboratório de Estudos sobre os Usos Políticos do Passado (LUPPA) procura bolsista voluntário(a) para desenvolver um banco de dados a partir de linguagem compatível com o sistema de hospedagem de sites da UFRGS.', 'Banco de dados', 6, 0, 0, 0, 0, 4, '2017-07-13', '0000-00-00', '', 20, 'LUPPA', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 20:37:11', '2018-11-22 20:37:11', 1);
INSERT INTO `job` (`id`, `id_author`, `title`, `category_list`, `resume`, `text`, `skills`, `type`, `modality`, `salary`, `semester`, `is_prae`, `shift`, `date_start`, `date_finish`, `schedule`, `workload`, `location`, `location_city`, `location_state`, `need_curriculum`, `need_historic`, `datetime_publication`, `datetime_last_edit`, `active`) VALUES
(147, 4, 'Doutorado Sanduiche com CNPq/Univ.Louisville-USA', '1,12', 'Perfil: Mestrado envolvendo química de superfície (biofuncionalização /conjugações). Conhecimento de eletro-química é desejável. Interesse na pós-graduação em materiais, pesquisa em equipe, aplicada e interdisciplinar. Domínio da língua inglesa para estágio nos EUA com bolsa CNPq - auxílios deslocamento e instalação, mensalidades, taxa escolar e seguro saúde (até 12 meses). Informar por e-mail sobre: histórico, dissertação mestrado, qualificações e expectativas - com um parágrafo sobre suas motivações. Candidatos selecionados receberão retorno por e-mail para marcação de entrevista.', 'Perfil: Mestrado envolvendo química de superfície (biofuncionalização /conjugações). Conhecimento de eletro-química é desejável. Interesse na pós-graduação em materiais, pesquisa em equipe, aplicada e interdisciplinar. Domínio da língua inglesa para estágio nos EUA com bolsa CNPq - auxílios deslocamento e instalação, mensalidades, taxa escolar e seguro saúde (até 12 meses). Informar por e-mail sobre: histórico, dissertação mestrado, qualificações e expectativas - com um parágrafo sobre suas motivações. Candidatos selecionados receberão retorno por e-mail para marcação de entrevista.', '', 2, 0, 3894, 0, 0, 4, '2017-06-30', '0000-00-00', '', 30, 'CNPq', 'Lousville', 'KY', 1, 1, '2018-11-22 20:39:33', '2018-11-22 20:39:33', 1),
(148, 4, 'Bolsas PIBITI/CNPq/UFRGS', '1,12', 'Estudante de Química Bolsa no Laboratório de Reatividade e Catálise Projeto: Preparação de catalisadores de óxido de ferro para aplicações industriais Interessados enviar histórico escolar', 'Estudante de Química Bolsa no Laboratório de Reatividade e Catálise Projeto: Preparação de catalisadores de óxido de ferro para aplicações industriais Interessados enviar histórico escolar', '', 2, 0, 400, 0, 0, 7, '2017-06-28', '0000-00-00', '', 20, 'Campus do Vale', 'Porto Alegre', 'RS', 0, 1, '2018-11-22 20:41:55', '2018-11-22 20:41:55', 1),
(149, 4, 'BOLSA LaDCIS de popularização da ciência', '5', 'Estar cursando entre o terceiro e sétimo semestre do Curso de Jornalismo, ter conhecimentos básicos de informática. O bolsista deverá atuar no laboratório nas atividades de popularização de ciência: atualização do site do laboratório e da página do Face book do laboratório e apoiar a criação de uma revista de divulgação de ciência.', 'Estar cursando entre o terceiro e sétimo semestre do Curso de Jornalismo, ter conhecimentos básicos de informática. O bolsista deverá atuar no laboratório nas atividades de popularização de ciência: atualização do site do laboratório e da página do Face book do laboratório e apoiar a criação de uma revista de divulgação de ciência.', '', 1, 0, 400, 0, 0, 4, '2017-06-14', '0000-00-00', '', 20, 'Campus Centro', 'Porto Alegre', 'RS', 0, 0, '2018-11-22 20:46:02', '2018-11-22 20:46:02', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_apply`
--

CREATE TABLE IF NOT EXISTS `job_apply` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accept` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `job_apply`
--

INSERT INTO `job_apply` (`id`, `id_user`, `id_job`, `datetime_created`, `accept`, `active`) VALUES
(1, 1, 2, '2018-10-20 23:44:58', -1, 1),
(2, 1, 4, '2018-10-21 01:14:32', 1, 1),
(3, 6, 3, '2018-10-21 01:24:46', 0, 1),
(4, 6, 1, '2018-10-21 01:25:18', 0, 1),
(5, 1, 3, '2018-10-21 14:49:36', 0, 0),
(6, 1, 1, '2018-10-21 14:49:43', 0, 0),
(7, 1, 3, '2018-10-21 14:51:02', 0, 0),
(8, 1, 1, '2018-10-21 14:51:34', 0, 0),
(9, 1, 3, '2018-10-21 16:14:09', 0, 0),
(10, 5, 2, '2018-10-21 22:50:53', 0, 1),
(11, 6, 2, '2018-10-27 10:25:15', 0, 0),
(12, 6, 2, '2018-10-27 13:56:06', 0, 1),
(13, 4, 2, '2018-10-27 13:56:06', 1, 1),
(14, 4, 1, '2018-10-27 13:56:06', 0, 1),
(15, 4, 3, '2018-10-27 13:56:06', -1, 1),
(16, 1, 1, '2018-10-27 13:56:06', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_category`
--

CREATE TABLE IF NOT EXISTS `job_category` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `job_category`
--

INSERT INTO `job_category` (`id`, `title`, `active`) VALUES
(1, 'Exatas', 1),
(2, 'Comunicação', 1),
(3, 'Artes', 1),
(4, 'Saúde', 1),
(5, 'Humanas', 1),
(6, 'Engenharia', 1),
(7, 'Gestão e negócios', 1),
(8, 'Economia', 1),
(9, 'Agrária', 1),
(10, 'Biológicas', 1),
(11, 'Arquitetura', 1),
(12, 'Tecnologia', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_target` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `log`
--

INSERT INTO `log` (`id`, `id_user`, `id_target`, `type`, `action`, `datetime_created`) VALUES
(1, 1, 2, 1, 1, '2018-10-29 08:49:57'),
(2, 1, 4, 2, 1, '2018-10-29 08:50:07'),
(3, 2, 4, 2, 1, '2018-10-29 08:50:07'),
(4, 1, 6, 1, 3, '2018-10-29 08:49:57'),
(5, 2, 18, 1, 13, '2018-11-03 14:17:23'),
(6, 2, 18, 1, 19, '2018-11-03 14:20:39'),
(7, 2, 10, 1, 16, '2018-11-03 14:20:55'),
(8, 2, 11, 1, 16, '2018-11-03 14:21:26'),
(9, 2, 2, 1, 18, '2018-11-03 14:24:26'),
(10, 2, 6, 1, 4, '2018-11-03 14:29:46'),
(11, 2, 6, 1, 5, '2018-11-03 14:29:56'),
(12, 2, 6, 1, 6, '2018-11-03 14:30:31'),
(13, 2, 6, 1, 7, '2018-11-03 14:30:36'),
(14, 2, 6, 1, 11, '2018-11-03 14:32:18'),
(15, 2, 3, 2, 14, '2018-11-03 14:38:06'),
(16, 2, 1, 2, 14, '2018-11-03 14:38:28'),
(17, 2, 3, 2, 14, '2018-11-03 14:38:32'),
(18, 2, 3, 2, 15, '2018-11-03 14:39:23'),
(19, 2, 3, 2, 14, '2018-11-03 14:40:10'),
(20, 2, 3, 2, 15, '2018-11-03 14:40:12'),
(21, 2, 1, 1, 10, '2018-11-03 14:46:31'),
(22, 2, 1, 1, 9, '2018-11-03 14:46:46'),
(23, 6, 5, 2, 12, '2018-11-03 14:48:50'),
(24, 2, 3, 1, 4, '2018-11-04 10:11:13'),
(25, 2, 4, 1, 4, '2018-11-04 10:26:30'),
(26, 2, 4, 1, 5, '2018-11-04 10:26:41'),
(27, 2, 4, 1, 4, '2018-11-04 10:27:50'),
(28, 2, 4, 1, 5, '2018-11-04 10:27:53'),
(29, 2, 12, 1, 16, '2018-11-04 14:55:13'),
(30, 2, 13, 1, 16, '2018-11-04 14:55:30'),
(31, 2, 14, 1, 16, '2018-11-04 14:58:24'),
(32, 2, 15, 1, 16, '2018-11-04 15:05:18'),
(33, 2, 16, 1, 16, '2018-11-04 15:05:18'),
(34, 2, 17, 1, 16, '2018-11-04 15:06:55'),
(35, 2, 18, 1, 16, '2018-11-04 15:07:13'),
(36, 2, 19, 1, 16, '2018-11-04 15:36:31'),
(37, 5, 5, 1, 18, '2018-11-10 22:34:23'),
(38, 6, 6, 1, 18, '2018-11-11 11:27:41'),
(39, 8, 8, 1, 18, '2018-11-11 11:28:28'),
(40, 7, 7, 1, 18, '2018-11-11 11:28:47'),
(41, 9, 9, 1, 18, '2018-11-11 11:29:56'),
(42, 11, 11, 1, 18, '2018-11-11 11:30:41'),
(43, 12, 12, 1, 18, '2018-11-11 11:31:36'),
(44, 12, 12, 1, 18, '2018-11-11 11:32:14'),
(45, 13, 13, 1, 18, '2018-11-11 11:33:48'),
(46, 10, 10, 1, 18, '2018-11-11 11:34:22'),
(47, 26, 26, 1, 18, '2018-11-11 11:36:24'),
(48, 14, 14, 1, 18, '2018-11-11 11:38:54'),
(49, 27, 27, 1, 18, '2018-11-11 11:39:22'),
(50, 18, 18, 1, 18, '2018-11-11 11:46:35'),
(51, 16, 16, 1, 18, '2018-11-11 11:47:15'),
(52, 25, 25, 1, 18, '2018-11-11 11:48:22'),
(53, 23, 23, 1, 18, '2018-11-11 12:54:52'),
(54, 21, 21, 1, 18, '2018-11-11 12:55:13'),
(55, 24, 24, 1, 18, '2018-11-11 12:56:04'),
(56, 22, 22, 1, 18, '2018-11-11 13:03:17'),
(57, 19, 19, 1, 18, '2018-11-11 13:05:59'),
(58, 15, 15, 1, 18, '2018-11-11 13:07:00'),
(59, 17, 17, 1, 18, '2018-11-11 13:09:41'),
(60, 3, 3, 1, 18, '2018-11-11 13:12:03'),
(61, 20, 20, 1, 18, '2018-11-11 14:05:47'),
(62, 2, 2, 1, 18, '2018-11-11 14:07:48'),
(63, 4, 4, 1, 18, '2018-11-11 14:10:17'),
(64, 5, 8, 1, 4, '2018-11-11 14:15:01'),
(65, 5, 25, 1, 4, '2018-11-11 14:15:03'),
(66, 5, 7, 1, 4, '2018-11-11 14:15:05'),
(67, 5, 3, 1, 6, '2018-11-11 14:16:36'),
(68, 7, 5, 1, 4, '2018-11-11 14:19:00'),
(69, 6, 5, 1, 4, '2018-11-11 14:19:11'),
(70, 14, 5, 1, 4, '2018-11-11 14:19:41'),
(71, 8, 5, 1, 4, '2018-11-11 14:19:49'),
(72, 2, 5, 1, 5, '2018-11-11 14:20:43');

-- --------------------------------------------------------

--
-- Estrutura para tabela `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `text` text NOT NULL,
  `datetime_published` datetime NOT NULL,
  `datetime_last_edit` datetime NOT NULL,
  `privacy` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `post`
--

INSERT INTO `post` (`id`, `id_author`, `text`, `datetime_published`, `datetime_last_edit`, `privacy`, `allow_comments`, `active`) VALUES
(1, 1, '<p>Texto postado pelo usuário <strong>Aluno</strong>.</p>', '2018-09-20 20:00:00', '2018-09-20 22:00:00', 0, 1, 1),
(2, 2, '<p>Texto postado pelo usuário <strong>Professor</strong>.</p>', '2018-09-20 21:30:00', '2018-09-20 21:30:00', 0, 1, 1),
(3, 4, '<p>Texto postado pelo usuário <strong>Secretário</strong>.</p>', '2018-09-20 22:23:00', '2018-09-20 20:30:00', 0, 0, 1),
(4, 2, '<p>Texto postado pelo usuário <strong>Professor</strong> e oculto.</p>', '2018-09-16 22:35:00', '2018-09-16 22:35:00', 1, 1, 1),
(5, 3, '<h4>Texto postado pelo <strong>Administrador</strong></h4>', '2018-09-20 00:00:00', '2018-09-20 00:00:00', 0, 1, 1),
(6, 1, '', '2018-09-30 15:53:26', '2018-09-30 16:46:51', 0, 1, 0),
(7, 1, '\r\n\r\n<!--StartFragment--><strong><em>Teste feito pelo novo&nbsp;</em></strong>Editor<strong><em>!!</em></strong><!--EndFragment-->\r\n\r\n', '2018-09-30 15:54:28', '2018-09-30 15:54:28', 0, 1, 1),
(8, 1, 'Teste privado', '2018-09-30 16:49:11', '2018-10-20 19:26:45', 1, 1, 1),
(9, 5, 'teste', '2018-10-26 23:21:19', '2018-10-28 23:29:51', 0, 1, 0),
(10, 5, 'abc', '2018-10-28 23:35:19', '2018-10-28 23:35:29', 0, 1, 0),
(11, 2, 'teste com log', '2018-11-03 14:13:21', '2018-11-03 14:13:21', 0, 1, 1),
(12, 2, 'teste com log 2', '2018-11-03 14:14:03', '2018-11-03 14:14:03', 0, 1, 1),
(13, 2, 'sas', '2018-11-03 14:14:49', '2018-11-03 14:14:49', 0, 1, 1),
(14, 2, 'qwqw', '2018-11-03 14:15:01', '2018-11-03 14:15:01', 0, 1, 1),
(15, 2, '\r\n				\r\n				wewe editado! com ajax ainda!!', '2018-11-03 14:15:13', '2018-11-04 16:23:39', 0, 1, 0),
(16, 2, 'qwqw', '2018-11-03 14:17:01', '2018-11-03 14:25:12', 0, 1, 0),
(17, 2, 'qwqw', '2018-11-03 14:17:12', '2018-11-03 14:25:04', 0, 1, 0),
(18, 2, 'qwqw', '2018-11-03 14:17:23', '2018-11-03 14:24:50', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_like`
--

CREATE TABLE IF NOT EXISTS `post_like` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `post_like`
--

INSERT INTO `post_like` (`id`, `id_user`, `id_post`, `datetime`, `active`) VALUES
(1, 1, 2, '2018-09-16 23:23:37', 0),
(2, 3, 2, '2018-09-16 23:23:42', 1),
(3, 4, 2, '2018-09-16 23:23:46', 1),
(4, 1, 3, '2018-09-16 23:24:01', 0),
(5, 1, 1, '2018-09-23 18:36:31', 0),
(6, 1, 3, '2018-09-23 18:36:43', 0),
(7, 1, 3, '2018-09-25 08:50:32', 0),
(8, 1, 3, '2018-09-25 08:50:58', 0),
(9, 1, 2, '2018-09-25 08:51:00', 0),
(10, 1, 3, '2018-10-02 15:13:16', 1),
(11, 1, 7, '2018-10-19 09:56:50', 0),
(12, 1, 2, '2018-10-19 09:59:29', 1),
(13, 1, 1, '2018-10-19 09:59:32', 1),
(14, 1, 7, '2018-10-19 09:59:39', 0),
(15, 1, 7, '2018-10-19 10:00:35', 0),
(16, 1, 7, '2018-10-29 13:11:50', 1),
(17, 2, 18, '2018-11-03 14:20:20', 0),
(18, 2, 18, '2018-11-03 14:20:39', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recommendation_job`
--

CREATE TABLE IF NOT EXISTS `recommendation_job` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `text` text NOT NULL,
  `rating` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_last_edit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `recommendation_job`
--

INSERT INTO `recommendation_job` (`id`, `id_user`, `id_job`, `text`, `rating`, `datetime_created`, `datetime_last_edit`, `active`) VALUES
(6, 1, 3, 'Achei muito legal a experiÃªncia!', 0, '2018-09-30 19:24:58', '2018-09-30 19:24:58', 1),
(9, 1, 4, 'Achei muito legal a experiÃªncia!', 0, '2018-09-30 19:24:58', '2018-09-30 19:24:58', 1),
(10, 1, 4, 'Achei muito legal a experiÃªncia!', 0, '2018-09-30 19:24:58', '2018-09-30 19:24:58', 0),
(11, 1, 1, 'Achei muito legal a experiÃªncia!', 0, '2018-09-30 19:24:58', '2018-09-30 19:24:58', 1),
(12, 4, 4, 'Teste com novo avatar', 0, '2018-10-30 10:59:14', '2018-10-30 10:59:14', 1),
(14, 2, 5, 'Recomendo pois foi legal', 0, '2018-11-03 12:48:40', '2018-11-03 12:48:40', 1),
(16, 6, 2, 'nova recomendaÃ§Ã£o dinÃ¢mica editada', 0, '2018-11-03 13:22:38', '2018-11-03 13:22:50', 1),
(17, 6, 5, 'porque curti', 0, '2018-11-03 14:48:19', '2018-11-03 14:48:50', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recommendation_user`
--

CREATE TABLE IF NOT EXISTS `recommendation_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_target` int(11) NOT NULL,
  `text` text NOT NULL,
  `rating` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_last_edit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `recommendation_user`
--

INSERT INTO `recommendation_user` (`id`, `id_user`, `id_target`, `text`, `rating`, `datetime_created`, `datetime_last_edit`, `active`) VALUES
(1, 1, 6, 'asasas', 0, '2018-09-30 19:57:16', '2018-09-30 19:57:16', 1),
(2, 4, 2, 'Teste nova recomendaÃ§Ã£o', 0, '2018-10-30 11:05:56', '2018-10-30 11:05:56', 1),
(3, 2, 4, 'recomendaÃ§Ã£o nova editada', 0, '2018-11-03 13:37:10', '2018-11-03 13:38:33', 1),
(5, 2, 5, 'nova rec por mim', 0, '2018-11-03 13:38:56', '2018-11-03 13:38:56', 1),
(6, 6, 5, 'bom aluno', 0, '2018-11-03 13:39:15', '2018-11-03 13:39:15', 1),
(7, 2, 6, 'pq preciso de logs', 0, '2018-11-03 14:32:17', '2018-11-03 14:32:17', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `search`
--

CREATE TABLE IF NOT EXISTS `search` (
  `id` int(11) NOT NULL,
  `text` varchar(128) NOT NULL,
  `datetime_last_search` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `search`
--

INSERT INTO `search` (`id`, `text`, `datetime_last_search`, `total`) VALUES
(2, 'jean', '2018-11-11 14:20:35', 5),
(4, 'bolsa cpd', '2018-10-29 11:06:28', 10),
(9, 'estágio', '2018-10-28 13:49:55', 3),
(12, 're', '2018-10-28 13:50:19', 1),
(15, 'sec', '2018-11-01 08:46:41', 2),
(17, 'renata', '2018-11-11 17:40:28', 6),
(19, 'lsa', '2018-11-11 14:12:36', 4),
(21, 'sa', '2018-11-11 14:14:05', 2),
(22, 'pimen', '2018-11-11 14:14:50', 1),
(23, 'wi', '2018-11-11 14:14:55', 1),
(24, 'luiz', '2018-11-11 14:16:27', 1),
(25, 'luis', '2018-11-11 14:16:31', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `login` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `age` int(11) NOT NULL,
  `born_in_city` varchar(256) NOT NULL,
  `born_in_state` varchar(2) NOT NULL,
  `live_in_city` varchar(256) NOT NULL,
  `live_in_state` varchar(2) NOT NULL,
  `role` int(11) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `birthday` date NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `personal_link` varchar(512) NOT NULL,
  `short_bio` varchar(800) NOT NULL,
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `show_schollar_info` tinyint(1) NOT NULL DEFAULT '1',
  `show_curriculum` tinyint(1) NOT NULL DEFAULT '1',
  `follower_privacy` tinyint(1) NOT NULL DEFAULT '1',
  `following_privacy` tinyint(1) NOT NULL DEFAULT '1',
  `post_privacy` tinyint(1) NOT NULL DEFAULT '1',
  `datetime_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user`
--

INSERT INTO `user` (`id`, `login`, `email`, `password`, `name`, `age`, `born_in_city`, `born_in_state`, `live_in_city`, `live_in_state`, `role`, `phone`, `birthday`, `gender`, `personal_link`, `short_bio`, `email_notification`, `show_schollar_info`, `show_curriculum`, `follower_privacy`, `following_privacy`, `post_privacy`, `datetime_joined`, `avatar`, `active`) VALUES
(1, 'aluno', 'aluno@ufrgs.br', 'f74f4d08330936fd26306b27d2e56f2ee002d1862d534c563325ee53b8bd0e3a2ca660849782fd44271364dabbf6888380be4d1b7c69a568bd5ecf4b66e2dc09', 'Aluno', 20, '', '', '', '', 4, '', '0000-00-00', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-11-11 00:00:00', 'MTU0MDgzOTIzOTE=.jpg', 1),
(2, 'ribas', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Renato Ribas', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk1MjQ2NzI=.jpg', 1),
(3, 'adm', 'adm@ufrgs.br', '0858562831f7cbb5b461ef0d73c68ead83f2c0910d0f2e0811b455f532653d208b43e3f93a5532508c7ebb70cd7e7be8bb53d58b4c7c69f0764990657f1c4e1b', 'Luis OtÃ¡vio', 50, 'Porto Alegre', 'RS', 'São Leolpoldo', 'RS', 1, '3333333333', '0000-00-00', 0, 'www.inf.ufrgs.br', '', 1, 1, 1, 1, 1, 0, '2018-09-02 00:22:00', 'MTU0MTk0OTEyMjM=.jpg', 1),
(4, 'danielle', 'func@ufrgs.br', '597bb2eaab5d0276a742bb13133ffcc2bdbfcf8d3af72f56ba6a8928c594acd0e286021e4ca9564110a4d5c8f01da74170f088e232f8a62e8ad87c3ba4315f5c', 'Danielle da Rosa', 30, '', '', '', '', 3, '', '0000-00-00', 1, '', 'DescriÃ§Ã£o \r\ninserida\r\ndinamicamente', 1, 1, 1, 1, 1, 0, '2018-11-11 00:00:00', 'MTU0MTk1MjYxNjQ=.png', 1),
(5, 'jean', 'jean@inf.ufrgs.br', '6ff54bc59eb4bb84ad9a2ea2688bb4311fa011c44ffecd37fe1d56f615d1dbb5e0f7d3fbda1b5c130e91d9a212b79b402d0380174eaecb9c62605a09041eea51', 'Jean Flesch', 24, 'Porto Alegre', 'RS', 'Porto Alegre', 'RS', 4, '(51) 9922-1234', '1993-05-05', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-11-10 00:00:00', 'MTU0MTg5NjQ1NDU=.jpg', 1),
(6, 'galante', 'jean@sharehunter.com.br', 'b1eeeeffe4b37f177866be780ee40a15285870c1152b20e3c39ecadecae2870f3d57d3f0516f8ba9f7bf0cc5417ba6257ddd6f6c408b3cfa20085a8c62a6dd71', 'Renata Galante', 0, '', '', '', '', 2, '51333321111', '0000-00-00', 1, '', '', 1, 0, 0, 0, 0, 1, '2018-09-23 00:00:00', 'MTU0MTk0Mjg2MDY=.jpg', 1),
(7, 'pimenta', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Marcelo Pimenta', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MjkyNzc=.jpg', 1),
(8, 'wives', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Leandro Krug Wives', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MjkwNzg=.jpg', 1),
(9, 'marinho', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Marinho Barcellos', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0Mjk5Njk=.jpg', 1),
(10, 'carissimi', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Alexandre Carissimi', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzI2MjEw.jpg', 1),
(11, 'machado', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Rodrigo Machado', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzA0MDEx.jpg', 1),
(12, 'amaciel', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Anderson Maciel', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzEzNDEy.jpg', 1),
(13, 'nedel', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Luciana Nedel', 40, '', '', '', '', 2, '', '1978-09-06', 1, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzIyODEz.jpg', 1),
(14, 'lucineia', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Lucineia Thom', 40, '', '', '', '', 2, '', '1978-09-06', 1, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzUzNDE0.jpg', 1),
(15, 'ritt', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Marcus Ritt', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODgxOTE1.jpg', 1),
(16, 'cecchin', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Sérgio Cecchin', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0NDAzNTE2.jpg', 1),
(17, 'buriol', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Luciana Buriol', 40, '', '', '', '', 2, '', '1978-09-06', 1, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODk4MDE3.jpg', 1),
(18, 'cirano', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Cirano Iochpe', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0Mzk5NTE4.jpg', 1),
(19, 'inunes', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Ingrid Nunes', 40, '', '', '', '', 2, '', '1978-09-06', 1, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODc1ODE5.jpg', 1),
(20, 'kbecker', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Karin Becker', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk1MjM0NjIw.jpg', 1),
(21, 'cmdalsasso', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Carla Maria Dal Sasso', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODExMjIx.jpg', 1),
(22, 'palazzo', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'José Palazzo', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODU5NjIy.jpg', 1),
(23, 'caco', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Antonio Beck', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODA5MTIz.jpg', 1),
(24, 'lmduarte', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Lucio Mauro Duarte', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0ODE2MzI0.jpg', 1),
(25, 'nbrosa', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Newton Braga Rosa', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0NDEwMjI1.jpg', 1),
(26, 'amoreira', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Álvaro Moreira', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzM4MzI2.jpg', 1),
(27, 'mwalter', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'Marcelo Walter', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTk0MzU2MjI3.jpg', 1),
(28, 'comba', 'jean.flesch93@gmail.com', '030a5afc16fd6fbdab3f6d398b3a78ce17c3e924d3cf25bdf6f1eb330a771f5c0a785b85498dfc7b136602cc15d81ad2ecea1961be98b424aa2a4631f5ad077c', 'João Comba', 40, '', '', '', '', 2, '', '1978-09-06', 0, '', '', 1, 1, 1, 1, 1, 0, '2018-09-06 00:00:00', 'MTU0MTI2NTg1ODI=.jpeg', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_education`
--

CREATE TABLE IF NOT EXISTS `user_education` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `subtitle` varchar(256) NOT NULL,
  `resume` text NOT NULL,
  `date_start` date NOT NULL,
  `date_finish` date NOT NULL,
  `location_city` varchar(128) NOT NULL,
  `location_state` varchar(128) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user_education`
--

INSERT INTO `user_education` (`id`, `id_user`, `title`, `subtitle`, `resume`, `date_start`, `date_finish`, `location_city`, `location_state`, `selected`, `active`) VALUES
(1, 1, 'Ciência da Computação', 'UFRGS', '', '0000-00-00', '0000-00-00', '', '', 1, 1),
(2, 1, 'Instituto Educação São Francisco', '', '', '0000-00-00', '0000-00-00', '', '', 0, 1),
(3, 2, 'Engenharia', 'UFRGS', 'wewrw', '2012-02-02', '0000-00-00', 'asj', 'AL', 1, 1),
(4, 6, 'b', '', 'asadd', '2019-10-03', '2020-10-03', 'aawqwq', 'AM', 0, 0),
(5, 6, 'Sistemas da informaÃ§Ã£o', 'PUCRS', 'teste', '2014-01-01', '2018-02-02', 'Porto Alegre', 'RS', 0, 1),
(6, 5, 'ufrgs', 'owiejojsa', 'Ã§l~lÃ§~Ã§lÃ£s\r\napwoaÂ´wa', '0000-00-00', '0000-00-00', 'asas', 'AP', 0, 0),
(7, 2, 'UFRGS', 'CIC', 'wrrrasasa', '2012-02-02', '0000-00-00', 'asawr', 'ES', 0, 1),
(8, 2, 'b', 'a', 'wqe', '8020-07-07', '0000-00-00', 'jd', 'BA', 0, 0),
(9, 2, 'b', 'a', 'wqe', '8020-07-07', '0000-00-00', 'jd', 'BA', 0, 0),
(10, 2, 'b', 'a', 'wew44', '5213-04-02', '0000-00-00', 'sjdsd', 'AL', 0, 0),
(11, 2, 'ba', 'a', 'wq', '3185-02-02', '0000-00-00', 'aosja', 'AL', 0, 0),
(12, 5, 'Ensino MÃ©dio', 'Instituto de EducaÃ§Ã£o SÃ£o Francisco', '', '2008-03-05', '2010-12-02', 'Porto Alegre', 'RS', 0, 1),
(13, 5, 'CiÃªncia da ComputaÃ§Ã£o', 'UFRGS', '', '2012-03-05', '2018-12-14', 'Porto Alegre', 'RS', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_job`
--

CREATE TABLE IF NOT EXISTS `user_job` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `company` varchar(128) NOT NULL,
  `resume` text NOT NULL,
  `date_start` date NOT NULL,
  `date_finish` date NOT NULL,
  `location_city` varchar(256) NOT NULL,
  `location_state` varchar(2) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user_job`
--

INSERT INTO `user_job` (`id`, `id_user`, `title`, `company`, `resume`, `date_start`, `date_finish`, `location_city`, `location_state`, `selected`, `active`) VALUES
(1, 4, 'Gerente de Redes', 'IF-UFRGS', 'abc', '0000-00-00', '0000-00-00', '', '', 1, 1),
(2, 4, 'Coordenador laboratório', 'PUCRS', '', '0000-00-00', '0000-00-00', '', '', 0, 1),
(3, 2, 'Professor', 'INF-UFRGS', 'testea edit', '2018-11-04', '2018-12-06', 'Porto Alegre', 'RS', 1, 1),
(4, 6, 'Professor Adjunto', 'UFRGS', '', '0000-00-00', '0000-00-00', '', '', 1, 0),
(5, 6, 'Novo prof', 'UFRGS', 'teste', '1998-05-05', '2018-10-10', 'Porto Alegre', 'RS', 0, 1),
(6, 5, 'b', 'a', 'asas', '1993-05-05', '1998-05-05', 'abc', 'AM', 0, 0),
(7, 5, 'asas', 'a', 'qwqw', '0000-00-00', '0000-00-00', 'asajs', 'AL', 0, 0),
(8, 5, 'qiwyhq', 'ash', 'lsÃ¡s', '0000-00-00', '0000-00-00', 'qpkwqpow', 'AP', 0, 0),
(9, 5, 'qwqwk', 'qwkqpw', 'asopkapska', '2121-12-12', '0000-00-00', 'asjao', 'MG', 0, 0),
(10, 2, 'asa', 'teste', 'pwq', '2012-02-02', '0000-00-00', 'aoska', 'AM', 0, 0),
(11, 2, 'b', 'a', 'qwqwq3', '4666-02-02', '0000-00-00', 'ask', 'AP', 0, 0),
(12, 2, 'qwr', 'asjk', 'qwwqrer', '4546-03-02', '0000-00-00', 'aaosj', 'AP', 0, 0),
(13, 2, 'wqwe', 'dkljfl', 'qwqw', '2018-04-04', '0000-00-00', 'as', 'AP', 0, 0),
(14, 2, 'wewe', 'lcxÃ§lcl', 'wwewe', '2015-07-07', '2020-02-06', 'qwqwwwwe', 'DF', 0, 0),
(15, 2, 'Auxiliar', 'PUCRS', 'teste editado 2', '2018-03-04', '2020-03-02', 'Belo Horizonte', 'MG', 0, 1),
(16, 2, 'rer', 'wqw', 'wqwqttc\r\njhkjk\r\nty', '2011-01-01', '2012-02-02', 'alsk', 'CE', 0, 0),
(17, 5, 'Desenvolvedor Pleno', 'Share Hunter', 'Trabalho desenvolvendo sistemas e websites com as tecnologias PHP, JavaScript, HTML, CSS e MySQL. Recentemente tenho me envolvido tambÃ©m com projetos em React e na gestÃ£o de equipes.', '2017-08-07', '0000-00-00', 'Porto Alegre', 'RS', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_language`
--

CREATE TABLE IF NOT EXISTS `user_language` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `level` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user_language`
--

INSERT INTO `user_language` (`id`, `id_user`, `title`, `level`, `active`) VALUES
(1, 1, 'Português', 5, 1),
(2, 1, 'Inglês', 4, 1),
(3, 6, 'PortuguÃªs', 5, 1),
(4, 6, 'InglÃªs', 4, 1),
(5, 6, 'Espanhol', 2, 0),
(6, 6, 'Espanhol', 2, 0),
(7, 6, 'AlemÃ£o', 1, 0),
(8, 6, 'AlemÃ£o', 2, 1),
(9, 2, 'PortuguÃªs', 5, 0),
(10, 5, 'PortuguÃªs', 5, 0),
(11, 5, 'PortuguÃªs', 5, 0),
(12, 5, 'Russo', 1, 0),
(13, 2, 'PortuguÃªs', 4, 0),
(14, 2, 'Ucraniano', 1, 0),
(15, 2, 'Ucraniano', 1, 0),
(16, 2, 'Polaco', 2, 0),
(17, 2, 'PortuguÃªs', 5, 0),
(18, 2, 'FrancÃªs', 1, 0),
(19, 2, 'PortuguÃªs', 5, 1),
(20, 2, 'Turco', 3, 0),
(21, 2, 'InglÃªs', 4, 0),
(22, 2, 'InglÃªs', 1, 1),
(23, 5, 'PortuguÃªs', 5, 1),
(24, 5, 'InglÃªs', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_skill`
--

CREATE TABLE IF NOT EXISTS `user_skill` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `level` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user_skill`
--

INSERT INTO `user_skill` (`id`, `id_user`, `title`, `level`, `time`, `active`) VALUES
(1, 1, 'PHP', 5, 4, 1),
(2, 1, 'JavaScript', 4, 4, 1),
(3, 1, 'HTML', 5, 8, 1),
(4, 6, 'nova', 1, 2, 0),
(5, 6, 'wewe', 3, 5, 0),
(6, 6, 'wwewe', 2, 888, 0),
(7, 6, 'asjajk', 1, 22, 0),
(8, 6, 'aw3we', 1, 34343, 0),
(9, 6, 'ewew', 1, 22, 0),
(10, 6, '2323', 2, 2323, 0),
(11, 6, 'Teste', 1, 2, 1),
(12, 6, 'PortuguÃªs', 4, 0, 1),
(13, 6, 'PortuguÃªs', 2, 0, 1),
(14, 6, 'PortuguÃªs', 5, 0, 1),
(15, 6, 'asas', 2, 323, 0),
(16, 5, 'PHP', 1, 2, 0),
(17, 5, 'as', 1, 0, 0),
(18, 5, 'wewe', 1, 0, 0),
(19, 2, 'as', 1, 12, 0),
(20, 2, ' teste editado', 3, 2, 0),
(21, 2, 'qwqw', 1, 3, 0),
(22, 2, 'qwqwq424', 2, 3, 0),
(23, 2, 'akjs', 1, 2, 1),
(24, 2, 'skdk edit', 4, 24, 1),
(25, 5, 'PHP', 4, 4, 1),
(26, 5, 'JavaScript', 4, 4, 1),
(27, 5, 'HTML', 5, 8, 1),
(28, 5, 'CSS', 5, 8, 1),
(29, 5, 'MySQL', 4, 4, 1),
(30, 5, 'Modelagem de Processos', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_timeline`
--

CREATE TABLE IF NOT EXISTS `user_timeline` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_target` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `job_apply`
--
ALTER TABLE `job_apply`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `job_category`
--
ALTER TABLE `job_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `recommendation_job`
--
ALTER TABLE `recommendation_job`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `recommendation_user`
--
ALTER TABLE `recommendation_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user_education`
--
ALTER TABLE `user_education`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user_job`
--
ALTER TABLE `user_job`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user_language`
--
ALTER TABLE `user_language`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user_skill`
--
ALTER TABLE `user_skill`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user_timeline`
--
ALTER TABLE `user_timeline`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `block`
--
ALTER TABLE `block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de tabela `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de tabela `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de tabela `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de tabela `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT de tabela `job_apply`
--
ALTER TABLE `job_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de tabela `job_category`
--
ALTER TABLE `job_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT de tabela `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de tabela `post_like`
--
ALTER TABLE `post_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de tabela `recommendation_job`
--
ALTER TABLE `recommendation_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `recommendation_user`
--
ALTER TABLE `recommendation_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de tabela `user_education`
--
ALTER TABLE `user_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de tabela `user_job`
--
ALTER TABLE `user_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `user_language`
--
ALTER TABLE `user_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de tabela `user_skill`
--
ALTER TABLE `user_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de tabela `user_timeline`
--
ALTER TABLE `user_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
