-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 juin 2024 à 14:03
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutiqueart`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `name`, `image`, `price`, `description`, `category_id`, `type`, `created_at`) VALUES
(1, 'Console Ps4', 'console-ps4.jpg', 299, 'Pour l\'achat d\'une console PS4 ou d\'un accessoire de la sélection profitez du jeu Destiny 2 offert si vous l\'ajoutez au panier !', 1, 'new', NULL),
(2, 'Console Wii U', 'Console-Wii-U.jpg', 489, 'Pack Nintendo Premium Console Wii U + Mario Kart 8 + Code Splatoon ', 1, 'new', NULL),
(3, 'Console-Xbox-360', 'Console-Xbox-360.jpg', 309, 'Console Xbox 360 4 Go Microsoft + capteur Kinect', 1, 'old', NULL),
(4, 'Assassin\'s Creed PS4', 'Aain-s-Creed-Origins-PS4.jpg', 56, 'Un nouvel opus de la saga Assassin\'s Creed qui regorge de nouveautés techniques.', 2, 'new', NULL),
(5, 'Dragon Ball Fighter', 'Dragon-Ball-Fighter-Z-Xbox-One.jpg', 55, 'DRAGON BALL FighterZ reprend les éléments qui ont fait le succès de la série DRAGON BALL : des combats spectaculaires avec des combattants aux pouvoirs incroyables. ', 2, 'new', NULL),
(6, 'Zombi U - Wii U', 'Zombi-U-Wii-U.jpg', 19, 'Londres est au bord du chaos ! Etes-vous prêt ? Nous sommes en 2012 et la fin des temps est là. ', 2, 'new', NULL),
(40, 'Fifa 20 (PS4)', '6e4b67899b1d7877af2d8340ed1b92e4', 39.9, 'Doté du moteur Frostbite, EA SPORTS FIFA 20 sur PlayStation®4, Xbox One et PC vous propose deux facettes du Jeu Universel : le prestige du football professionnel et une nouvelle expérience réaliste ', 2, NULL, NULL),
(41, 'Fortnite', '6e8d77ac2f52108b0dda58d5d6fdf09c', 69.9, 'Faites équipe avec vos amis dans une arène de combat colossale proposant deux modes de jeu et pouvant accueillir jusqu\'à 150 joueurs.', 2, NULL, NULL),
(50, 'Fortnite', NULL, 43.99, 'Super Jeu', 1, NULL, '2024-06-10 11:19:17');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Consoles'),
(2, 'Jeux');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `idOrder` int(11) NOT NULL,
  `dateOrder` datetime NOT NULL DEFAULT current_timestamp(),
  `amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`idOrder`, `dateOrder`, `amount`, `user_id`, `status`) VALUES
(23, '2019-09-05 11:30:14', 710, 1, 'panier');

-- --------------------------------------------------------

--
-- Structure de la table `orderslines`
--

CREATE TABLE `orderslines` (
  `id` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL,
  `idArticle` int(11) NOT NULL,
  `quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `orderslines`
--

INSERT INTO `orderslines` (`id`, `idOrder`, `idArticle`, `quantity`) VALUES
(28, 23, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `pseudo` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `username`, `firstname`, `lastname`, `address`, `code`, `city`) VALUES
(1, 'mail@mail.fr', '[]', '$argon2i$v=19$m=65536,t=4,p=1$S3Z0YmRQeG93QlNCZDgvcQ$bQgyR+4TdrfeiCJbbb9NI0zkoLcbLuRCoNCYMTt43DY', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'admin@admin.fr', '[\"ROLE_ADMIN\"]', '$argon2i$v=19$m=65536,t=4,p=1$ekNTZm5TdE5BVjAzTE9vaQ$tw5c+gCOB60gzcNRX7tgI9OmA5ZJR1WJ2sJQcMASWNo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'a@a.fr', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$UmtFRExQY3FLYWp4Y3hWaA$DaBOvY+EK8lpw2PaOoBZCoL4+3mRm0ANrNaOQM93PKM', NULL, 'Vince', 'V', 'T', '45', 45, 'Poitiers');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BFDD316855EF339A` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `IDX_E52FFDEEA76ED395` (`user_id`);

--
-- Index pour la table `orderslines`
--
ALTER TABLE `orderslines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Article` (`idArticle`),
  ADD KEY `fk_orders_id` (`idOrder`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `orderslines`
--
ALTER TABLE `orderslines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_BFDD316855EF339A` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `orderslines`
--
ALTER TABLE `orderslines`
  ADD CONSTRAINT `FK_BCF13D2612836594` FOREIGN KEY (`idArticle`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_BCF13D26E2EDD085` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
