-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Giu 24, 2023 alle 12:29
-- Versione del server: 10.5.19-MariaDB-0+deb11u2-log
-- Versione PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nebuladev`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `community`
--

CREATE TABLE `community` (
  `id` int(11) NOT NULL,
  `tg_group_name` varchar(255) DEFAULT NULL,
  `tg_group_id` bigint(20) DEFAULT NULL,
  `tg_group_link` longtext DEFAULT NULL,
  `language` varchar(3) NOT NULL DEFAULT 'IT',
  `type` varchar(20) NOT NULL DEFAULT 'supergroup'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `custom_commands`
--

CREATE TABLE `custom_commands` (
  `id` int(11) NOT NULL,
  `tg_group_id` bigint(20) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `command` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `custom_handler`
--

CREATE TABLE `custom_handler` (
  `id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `id_group` bigint(50) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `welcome_text` text NOT NULL,
  `welcome_buttons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{  "buttons": [   {      "id": 0,       "title": "Bot Logs",       "url": "https://t.me/nebulalogs"   }  ] }',
  `rules_text` text NOT NULL,
  `community` tinyint(1) NOT NULL DEFAULT 0,
  `languages` varchar(20) DEFAULT 'EN',
  `set_welcome` tinyint(2) NOT NULL DEFAULT 1,
  `max_warn` int(11) NOT NULL DEFAULT 3,
  `set_silence` tinyint(2) NOT NULL DEFAULT 0,
  `exe_filter` tinyint(1) NOT NULL DEFAULT 0,
  `block_new_member` tinyint(1) NOT NULL DEFAULT 0,
  `set_arabic_filter` tinyint(1) NOT NULL DEFAULT 1,
  `set_cirillic_filter` tinyint(1) NOT NULL DEFAULT 1,
  `set_chinese_filter` tinyint(1) NOT NULL DEFAULT 1,
  `set_user_profile_picture` tinyint(1) NOT NULL DEFAULT 0,
  `gif_filter` tinyint(1) NOT NULL DEFAULT 0,
  `set_cas_ban` tinyint(1) NOT NULL DEFAULT 1,
  `type_no_username` int(1) NOT NULL DEFAULT 1,
  `log_channel` varchar(50) NOT NULL DEFAULT '-1001359708474',
  `group_photo` varchar(255) NOT NULL DEFAULT 'https://naos.hersel.it/group_photo/default.jpg',
  `total_users` int(50) NOT NULL DEFAULT 0,
  `zip_filter` tinyint(1) NOT NULL DEFAULT 0,
  `targz_filter` tinyint(1) NOT NULL DEFAULT 0,
  `jpg_filter` tinyint(1) NOT NULL DEFAULT 0,
  `docx_filter` tinyint(1) NOT NULL DEFAULT 0,
  `apk_filter` tinyint(1) NOT NULL DEFAULT 0,
  `zoophile_filter` tinyint(1) NOT NULL DEFAULT 1,
  `sender_chat_block` tinyint(1) NOT NULL DEFAULT 1,
  `spoiler_block` tinyint(1) NOT NULL DEFAULT 0,
  `set_no_vocal` tinyint(1) NOT NULL DEFAULT 0,
  `set_antiflood` tinyint(1) NOT NULL DEFAULT 1,
  `ban_message` text NOT NULL DEFAULT '{mention} has been <b>banned</b> from: {chat}',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_badwords`
--

CREATE TABLE `groups_badwords` (
  `id` int(11) NOT NULL,
  `word` varchar(255) NOT NULL,
  `tg_group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_blacklist`
--

CREATE TABLE `groups_blacklist` (
  `id` int(11) NOT NULL,
  `tg_id_group` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `group_users`
--

CREATE TABLE `group_users` (
  `id` int(11) NOT NULL,
  `tg_id` bigint(20) DEFAULT NULL,
  `tg_group_id` bigint(20) DEFAULT NULL,
  `warn_count` int(11) NOT NULL DEFAULT 0,
  `user_score` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `nebula_antispam`
--

CREATE TABLE `nebula_antispam` (
  `id` int(11) NOT NULL,
  `logic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `nebula_updates`
--

CREATE TABLE `nebula_updates` (
  `id` int(11) NOT NULL,
  `update_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  `tg_group_id` bigint(20) NOT NULL,
  `tg_user_id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `owner_list`
--

CREATE TABLE `owner_list` (
  `id` int(11) NOT NULL,
  `tg_id` bigint(20) NOT NULL,
  `tg_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `superban_table`
--

CREATE TABLE `superban_table` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_first_name` varchar(255) NOT NULL DEFAULT 'Unknown',
  `motivation_text` varchar(255) NOT NULL,
  `user_date` datetime NOT NULL,
  `id_operator` bigint(20) NOT NULL,
  `username_operator` varchar(50) NOT NULL,
  `first_name_operator` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `tg_id` bigint(20) NOT NULL,
  `tg_username` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `whitelist_channel`
--

CREATE TABLE `whitelist_channel` (
  `id` int(11) NOT NULL,
  `tg_channel_id` bigint(20) NOT NULL,
  `tg_group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `whitelist_table`
--

CREATE TABLE `whitelist_table` (
  `id` int(11) NOT NULL,
  `tg_id` bigint(20) NOT NULL,
  `tg_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `community`
--
ALTER TABLE `community`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tg_group_id` (`tg_group_id`);

--
-- Indici per le tabelle `custom_commands`
--
ALTER TABLE `custom_commands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `composite_index` (`tg_group_id`,`alias`);

--
-- Indici per le tabelle `custom_handler`
--
ALTER TABLE `custom_handler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `composite_index` (`chat_id`,`question`);

--
-- Indici per le tabelle `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`id_group`);

--
-- Indici per le tabelle `groups_badwords`
--
ALTER TABLE `groups_badwords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `word_index` (`word`,`tg_group_id`);

--
-- Indici per le tabelle `groups_blacklist`
--
ALTER TABLE `groups_blacklist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tg_group_index` (`tg_id_group`);

--
-- Indici per le tabelle `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_user_group` (`tg_id`,`tg_group_id`);

--
-- Indici per le tabelle `nebula_antispam`
--
ALTER TABLE `nebula_antispam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `spam_index` (`logic`);

--
-- Indici per le tabelle `nebula_updates`
--
ALTER TABLE `nebula_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `update_index` (`update_id`);

--
-- Indici per le tabelle `owner_list`
--
ALTER TABLE `owner_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_index_tg` (`tg_id`);

--
-- Indici per le tabelle `superban_table`
--
ALTER TABLE `superban_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_key` (`user_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tg_id_key` (`tg_id`);

--
-- Indici per le tabelle `whitelist_channel`
--
ALTER TABLE `whitelist_channel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_c_c` (`tg_channel_id`,`tg_group_id`);

--
-- Indici per le tabelle `whitelist_table`
--
ALTER TABLE `whitelist_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_index` (`tg_id`,`tg_username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `community`
--
ALTER TABLE `community`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `custom_commands`
--
ALTER TABLE `custom_commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `custom_handler`
--
ALTER TABLE `custom_handler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups_badwords`
--
ALTER TABLE `groups_badwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups_blacklist`
--
ALTER TABLE `groups_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `nebula_antispam`
--
ALTER TABLE `nebula_antispam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `nebula_updates`
--
ALTER TABLE `nebula_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `owner_list`
--
ALTER TABLE `owner_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `superban_table`
--
ALTER TABLE `superban_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `whitelist_channel`
--
ALTER TABLE `whitelist_channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `whitelist_table`
--
ALTER TABLE `whitelist_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
