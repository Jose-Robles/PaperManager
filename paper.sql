-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2019 a las 20:07:20
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `paper`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `IdCli` int(11) NOT NULL,
  `NomCli` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ApeCli` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`IdCli`, `NomCli`, `ApeCli`, `email`, `password`) VALUES
(1, 'Alfonso', 'Duque', 'alfonso@gmail.com', 'Alfonso'),
(2, 'Felipe', ' Martín', 'felipe@gmail.com', 'Felipe'),
(3, 'Thomas', 'Edison', 'thomas@gmail.com', 'Thomas'),
(4, 'Carlos', 'García', 'carlos@gmail.com', 'Carlos'),
(5, 'Maite', 'Echeverria', 'maite@gmail.com', 'Maite'),
(6, 'Geoffrey', 'E. Hinton', 'geoffrey@gmail.com', 'Geoffrey'),
(7, 'Sara', 'Sabour', 'sara@gmail.com', 'Sara'),
(8, 'Nicholas', 'Frosst', 'nicholas@gmail.com', 'Nicholas'),
(9, 'Alicia', 'Cabrera', 'alicia@gmail.com', 'Alicia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientpaper`
--

CREATE TABLE `clientpaper` (
  `IdCli` int(5) NOT NULL,
  `IdPap` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paper`
--

CREATE TABLE `paper` (
  `IdPap` int(5) NOT NULL,
  `NomPap` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `DesPap` varchar(500) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'EMPTY',
  `UrlPap` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `Eco` int(11) NOT NULL DEFAULT '0',
  `Bio` int(11) NOT NULL DEFAULT '0',
  `Mat` int(11) NOT NULL DEFAULT '0',
  `Phy` int(11) NOT NULL DEFAULT '0',
  `Pol` int(11) NOT NULL DEFAULT '0',
  `Psi` int(11) NOT NULL DEFAULT '0',
  `Tec` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `paper`
--

INSERT INTO `paper` (`IdPap`, `NomPap`, `DesPap`, `UrlPap`, `Eco`, `Bio`, `Mat`, `Phy`, `Pol`, `Psi`, `Tec`) VALUES
(1, 'Dynamic Routing Between Capsules', 'A capsule is a group of neurons whose activity vector represents the instantiation parameters of a specific type of entity such as an object or an object part. We use the length of the activity vector to represent the probability that the entity exists and its orientation to represent the instantiation parameters. Active capsules at one level make predictions, via transformation matrices, for the instantiation parameters of higher-level capsules.', 'https://arxiv.org/pdf/1710.09829.pdf', 50, 40, 60, 30, 0, 40, 100),
(2, 'Neural Ordinary Differential Equations', 'We introduce a new family of deep neural network models. Instead of specifying a discrete sequence of hidden layers, we parameterize the derivative of the hidden state using a neural network. The output of the network is computed using a black-box differential equation solver. These continuous-depth models have constant memory cost, adapt their evaluation strategy to each input, and can explicitly trade numerical precision for speed.', 'https://arxiv.org/pdf/1806.07366', 50, 40, 60, 30, 0, 40, 100),
(3, 'BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding', 'BERT is conceptually simple and empirically powerful. It obtains new state-of-the-art results on eleven natural language processing tasks, including pushing the GLUE benchmark to 80.4% (7.6% absolute improvement), MultiNLI accuracy to 86.7 (5.6% absolute improvement) and the SQuAD v1.1 question answering Test F1 to 93.2 (1.5% absolute improvement), outperforming human performance by 2.0%.', 'https://arxiv.org/pdf/1810.04805', 50, 40, 60, 30, 0, 40, 100),
(4, 'Attention Is All You Need', 'The dominant sequence transduction models are based on complex recurrent or convolutional neural networks in an encoder-decoder configuration. The best performing models also connect the encoder and decoder through an attention mechanism. We propose a new simple network architecture, the Transformer, based solely on attention mechanisms, dispensing with recurrence and convolutions entirely.', 'https://arxiv.org/pdf/1706.03762', 50, 40, 60, 30, 0, 40, 100),
(5, 'Distilling the Knowledge in a Neural Network', 'Caruana and his collaborators have shown that it is possible to compress the knowledge in an ensemble into a single model which is much easier to deploy and we develop this approach further using a different compression technique. We achieve some surprising results on MNIST and we show that we can significantly improve the acoustic model of a heavily used commercial system by distilling the knowledge in an ensemble of models into a single model.', 'https://arxiv.org/pdf/1503.02531', 50, 40, 60, 30, 0, 40, 100),
(8, 'Spin Chains, Graphs and State Revival', 'Connections between the 1-excitation dynamics of spin lattices and quantum walks on graphs will be surveyed. Attention will be paid to perfect state transfer (PST) and fractional revival (FR) as well as to the role played by orthogonal polynomials in the study of these phenomena.', 'https://arxiv.org/pdf/1903.00145', 30, 20, 80, 100, 10, 10, 30),
(9, 'Central Limit Theorem for Bose-Einstein Condensates', 'We consider a Bose gas trapped in the unit torus in the Gross-Pitaevskii regime. In the ground state, we prove that fluctuations of bounded one-particle observables satisfy a central limit theorem.', 'https://arxiv.org/pdf/1903.00365', 10, 20, 40, 100, 10, 10, 50),
(10, 'A Nonparametric Dynamic Causal Model for Macroeconometrics', 'This paper uses potential outcome time series to provide a nonparametric framework for quantifying dynamic causal effects in macroeconometrics. This provides sufficient conditions for the nonparametric identification of dynamic causal effects as well as clarify the causal content of several common assumptions and methods in macroeconomics. Our key identifying assumption is shown to be non-anticipating treatments which enables nonparametric inference on dynamic causal effects.', 'https://arxiv.org/pdf/1903.01637', 100, 10, 40, 10, 70, 20, 20),
(11, 'Approximation Properties of Variational Bayes for Vector Autoregressions', 'Variational Bayes (VB) is a recent approximate method for Bayesian inference. It has the merit of being a fast and scalable alternative to Markov Chain Monte Carlo (MCMC) but its approximation error is often unknown. In this paper, we derive the approximation error of VB in terms of mean, mode, variance, predictive density and KL divergence for the linear Gaussian multi-equation regression.', 'https://arxiv.org/pdf/1903.00617', 100, 10, 70, 40, 20, 10, 90),
(12, 'A Nonparametric Multi-view Model for Estimating Cell Type-Specific Gene Regulatory Networks', 'We present a Bayesian hierarchical multi-view mixture model termed Symphony that simultaneously learns clusters of cells representing cell types and their underlying gene regulatory networks by integrating data from two views: single-cell gene expression data and paired epigenetic data, which is informative of gene-gene interactions.', 'https://arxiv.org/pdf/1902.08138', 20, 100, 60, 30, 10, 20, 100),
(13, 'De Broglie-Schrödinger Single Particle Trajectories', 'An introductory approach is given to the virtual pattern of coupled trajectories provided for a single particle (together with its motion law) by the time-independent Schrödinger equation, as a diffractive consequence of the assigned launching wave-front.', 'https://arxiv.org/pdf/1903.01870', 10, 10, 50, 100, 10, 10, 60),
(14, 'Does gravity have to be quantized? Lessons from non-relativistic toy models', 'It is often argued that gravity has to be a quantum theory simply because a fundamentally semiclassical approach would necessarily be inconsistent. These models are not complete theories and should not be considered too seriously, but their consistency shows that semiclassical gravity is hard to dismiss on purely theoretical grounds.', 'https://arxiv.org/pdf/1903.01823', 10, 20, 30, 100, 10, 20, 50),
(15, 'Deep Learning for Cognitive Neuroscience', 'Neural network models can now recognise images, understand text, translate languages, and play many human games at human or superhuman levels. These systems are highly abstracted, but are inspired by biological brains and use only biologically plausible computations. In the coming years, neural networks are likely to become less reliant on learning from massive labelled datasets, and more robust and generalisable in their task performance.', 'https://arxiv.org/pdf/1903.01458', 10, 100, 30, 30, 20, 100, 100),
(16, 'Cognitive and behavioral functions prior to epilepsy in a rat model of 2 subcortical band heteropia', '13 Subcortical band heterotopia (SBH), also known as doublecortex syndrome, is a 14 malformation of cortical development resulting from mutations in the doublecortin gene 15 (DCX). Patients with SBH may present mild to moderate 17 intellectual disability as well as epilepsy. The SBH condition can be modeled in rats by in 18 utero knockdown (KD) of Dcx.', 'https://arxiv.org/pdf/1903.00372', 10, 100, 10, 10, 10, 80, 30),
(17, 'Trust and Trustworthiness in Social Recommender Systems', 'The prevalence of misinformation on online social media has tangible empirical connections to increasing political polarization and partisan antipathy in the United States. Ranking algorithms for social recommendation often encode broad assumptions about network structure (like homophily) and group cognition (like, social action is largely imitative). Assumptions like these can be naïve and exclusionary in the era of fake news and ideological uniformity towards the political poles.', 'https://arxiv.org/pdf/1903.01780', 60, 20, 30, 20, 100, 70, 30),
(18, 'The politics of physicists social models', 'I give an overview of the topic of this special issue, the applications of (statistical) physics to social sciences at large. I discuss several examples of simple social models put forward by physicists and discuss their interest. I argue that while they may be conceptually useful to correct our intuitive models of social mechanisms, their relevance for real social systems is moot.', 'https://arxiv.org/pdf/1903.00964', 60, 20, 30, 80, 100, 50, 30);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IdCli`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `clientpaper`
--
ALTER TABLE `clientpaper`
  ADD PRIMARY KEY (`IdCli`,`IdPap`),
  ADD KEY `IdPap` (`IdPap`);

--
-- Indices de la tabla `paper`
--
ALTER TABLE `paper`
  ADD PRIMARY KEY (`IdPap`),
  ADD UNIQUE KEY `IdPap` (`IdPap`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `IdCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `paper`
--
ALTER TABLE `paper`
  MODIFY `IdPap` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientpaper`
--
ALTER TABLE `clientpaper`
  ADD CONSTRAINT `clientpaper_ibfk_1` FOREIGN KEY (`IdCli`) REFERENCES `client` (`IdCli`),
  ADD CONSTRAINT `clientpaper_ibfk_2` FOREIGN KEY (`IdPap`) REFERENCES `paper` (`IdPap`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
