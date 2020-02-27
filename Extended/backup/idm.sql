-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: mysql-db
-- Χρόνος δημιουργίας: 26 Φεβ 2020 στις 21:09:18
-- Έκδοση διακομιστή: 5.7.21
-- Έκδοση PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `idm`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `authzforce`
--

CREATE TABLE `authzforce` (
  `az_domain` varchar(255) NOT NULL,
  `policy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `authzforce`
--

INSERT INTO `authzforce` (`az_domain`, `policy`, `version`, `oauth_client_id`) VALUES
('YrHtj1NIEeqtJAJCrBIBEw', '4237188d-3894-4dd7-ac05-3b8162a6a88f', 25, 'ad817d0b-35c7-4497-ad7c-896629aa1879');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `auth_token`
--

CREATE TABLE `auth_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `pep_proxy_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `auth_token`
--

INSERT INTO `auth_token` (`access_token`, `expires`, `valid`, `user_id`, `pep_proxy_id`) VALUES
('15ab4bdb-f214-4c98-985c-d21071d67564', '2020-02-26 22:08:38', 1, NULL, 'pep_proxy_1d18abfb-e8bd-44ab-bedc-3f53d855d7c1'),
('43785731-10a4-4f9e-aac2-07c0ebc237af', '2020-02-21 16:02:05', 1, NULL, 'pep_proxy_1d18abfb-e8bd-44ab-bedc-3f53d855d7c1'),
('6247b883-2aed-4b39-b31a-fccfa78be546', '2020-02-19 15:05:25', 1, 'admin', NULL),
('87ba9860-ca9a-456a-95d9-4eace60f9e9e', '2020-02-21 17:09:09', 1, NULL, 'pep_proxy_1d18abfb-e8bd-44ab-bedc-3f53d855d7c1'),
('8c8676d3-f287-497c-9a00-704197ddb134', '2020-02-19 19:50:32', 1, NULL, 'pep_proxy_1d18abfb-e8bd-44ab-bedc-3f53d855d7c1'),
('98ca14e9-d3e4-4132-899b-ff628a431798', '2020-02-19 14:57:36', 1, 'admin', NULL),
('c57ec214-ba02-429a-afad-736684c702c1', '2020-02-25 09:29:18', 1, NULL, 'pep_proxy_1d18abfb-e8bd-44ab-bedc-3f53d855d7c1');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `eidas_credentials`
--

CREATE TABLE `eidas_credentials` (
  `id` varchar(36) NOT NULL,
  `support_contact_person_name` varchar(255) DEFAULT NULL,
  `support_contact_person_surname` varchar(255) DEFAULT NULL,
  `support_contact_person_email` varchar(255) DEFAULT NULL,
  `support_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `support_contact_person_company` varchar(255) DEFAULT NULL,
  `technical_contact_person_name` varchar(255) DEFAULT NULL,
  `technical_contact_person_surname` varchar(255) DEFAULT NULL,
  `technical_contact_person_email` varchar(255) DEFAULT NULL,
  `technical_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `technical_contact_person_company` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `organization_url` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `organization_nif` varchar(255) DEFAULT NULL,
  `sp_type` varchar(255) DEFAULT 'private',
  `attributes_list` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `iot`
--

CREATE TABLE `iot` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oauth_access_token`
--

CREATE TABLE `oauth_access_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `oauth_access_token`
--

INSERT INTO `oauth_access_token` (`access_token`, `expires`, `scope`, `refresh_token`, `valid`, `extra`, `oauth_client_id`, `user_id`, `iot_id`, `authorization_code`) VALUES
('06baff65d342e1d2dbbbb273d30db2febc21d3a8', '2020-02-19 20:35:26', 'bearer', '06ea60db16f81d8709e53a9a47a93fa2f579b4e4', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '8fa5785a11eb303ecf2dc6ebd0ab4371459a2bcd'),
('0df5d45efa788f250966a2db0ea1ae2947e15c9b', '2020-02-21 18:25:36', 'bearer', 'ac0fa9c2139bd23c760059e15447cd367f856d84', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '798d9447c70496acb0881ba2f096bf09270c87af'),
('0df6136720a79f91e0792a7751720279a46dd3ca', '2020-02-21 16:33:07', 'bearer', '02f7f1d902d84629cab04705c0a6b0915a53eb42', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '8830101dbb9dc01b071e013a74f3260ac0c072fa'),
('0e72eef985ea5a52a4ee9572bb31d9e9c75ebc60', '2020-02-21 16:11:22', 'bearer', '5d1f2525e82ca8b05cb73a0b64e05390d8fca7be', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '9547267b6712f97415cd4601a99f257e7f9ca1d0'),
('123594cea431544ab1f0b0756e5cf10784a6eb74', '2020-02-21 18:40:36', 'bearer', 'edba8e4bf39886bfa0bb05c5c9276f86d5af0d0b', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', NULL, '277a1f1b534e020cea33c1ca87fe08d26f8ab1d6'),
('18d5ef542ca581188242ec5843ded22f54877a27', '2020-02-21 18:33:37', 'bearer', 'b3518378b350ca8b34f17dab524c99eafa3caef5', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '21db6176235540941fad2b639fba81b687f4a161'),
('3056cad8d2567e6462dacecfc67c43b36bcd49d3', '2020-02-21 16:02:32', 'bearer', '5173f7447a19de38d627615b240556adb6149797', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '8518175bf3ec91669d851442d6f958a1619adbe8'),
('327f24b6d7a65dfbb45cd9d77fddd94881b52549', '2020-02-21 16:34:19', 'bearer', '9754fc51690901f38bbac83a134a4d4cea7f5ed4', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'da9b58df8a1c71a7435dd18df52f0380a47e41f7'),
('3832b3f6eb342beec6edb14bae3d1d2ff01aa5b3', '2020-02-19 20:23:33', 'bearer', 'b04f771ed5e23e14f521df024e6339112bba771c', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL),
('3ab43387d693ed3b56e47d01feed59a8ec3abfeb', '2020-02-21 16:32:27', 'bearer', 'ec5ec4845a8a55abb8bff11e8e4776e484e0b42a', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '58da24c65f34820149b00fc844491c89644a182f'),
('4081babf106541c65e61e29d6c9d469a4328e69a', '2020-02-21 16:38:19', 'bearer', '9671c39c5e4fa09422fc49e0de2f50876d83ffe8', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c6cceddbac39af25a76d46f93e7cddc4eff0527b'),
('4324d6a000789a667d68d2efc82ca1fb7a1997af', '2020-02-21 16:20:49', 'bearer', '969bc13be4c089e5fabc2348523cbdd8928f82a3', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c6f39016ad72dd06fc75bd0c13b5d5ac75065d6a'),
('49cef3a4d4e8adfde6cd1d5817cd217f4945d914', '2020-02-25 09:29:28', 'bearer', '731edfacd921cad0d3c20d4c4322220fc9a4611f', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'b02188e94bd86ceb11b7c959cfe98f62c6bdc2dd'),
('4a9c897b4670f8ea7c21179e1c44f767c61fee10', '2020-02-21 16:52:14', 'bearer', '4e95d942e977d50c86d118d7f8021edf720db5d9', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '08e4641ed00d570a0792e5956e3eb8fe2ab24b36'),
('4b2f7a4d058d14b03f30678a1d9a25d229f0318f', '2020-02-25 10:02:04', 'bearer', '7b7b057240392cf60e9c771ce4d36018ce5f9ac3', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'bac9cdbef6f745b8c2bddf0636f3cbbf22f4caaf'),
('5868941288a8c403737a0811ff160236b85a73d0', '2020-02-21 17:10:58', 'bearer', 'b88ba1cb5d4576a11d3092142a2bf193bdbc05cf', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'fbf83fbdf0037859df6755c7c185b7af32759f68'),
('58c834029a0b58032afb4ebb049c0222625ac9ac', '2020-02-21 16:23:23', 'bearer', 'e20434f3e91c0632e793639bdbcf4ad385992146', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '1d9879e18952fc914a701337188f44ea2134263e'),
('6a2418285c22065859ddc44818b0332d596d1f29', '2020-02-21 18:41:43', 'bearer', '3572e5f6e3b79212f1979406a35c627418b47b7a', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'e1aa0775-ee22-4681-94b2-c334ad14253f', NULL, 'ede2c6e554e4b9a6ef0e3f64bde8e0eb1e174c7e'),
('6c0d91b60d31eb8f0397d7e0ef23835a2c850825', '2020-02-21 16:37:55', 'bearer', '54e2364396f5fa20297f3084f886b6164324423d', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '864e41a7b2c1ddc6de2f39cf808c5ec4b9cda2aa'),
('6dd944a929a8903b51ad7f8d1729423af273be32', '2020-02-25 10:04:18', 'bearer', '0df50c8eead537aaf6e7a98ed2ea9bd69832157c', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'e1aa0775-ee22-4681-94b2-c334ad14253f', NULL, 'bef2742836ce7e87f7e27212a12273465c1072fa'),
('6efa8e91c9e0e89c9fb589bc3dd1e115bd348a0a', '2020-02-21 16:17:39', 'bearer', '965f8d9d19f041a08fdc08d01c716fa57b80285b', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '7fec441267b59a37c63e0dc70bb5bfca5d53ec37'),
('7072df966244e996f74b975aab3fe414a964f9d5', '2020-02-21 16:25:30', 'bearer', '63e56ce8b4447988dc1ead96c497d1d8c3685d82', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL),
('72699a43442b414fb8976f14c3c10b486155438f', '2020-02-21 16:04:49', 'bearer', 'b6bb2488c90e35141b00911923ae19085ab02cf5', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '6600a38a756c28817ea51477282f703e6b119b6d'),
('7b363249664769736806d6df18910764dfeae2df', '2020-02-21 16:15:54', 'bearer', 'adda14462d04746a1ab844e3c976616a5c04c693', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c29976c4084a45971681b438eba2252c79a36370'),
('7b828e7e66a0ac3da92433c3146a7bbf7332d4cf', '2020-02-21 18:41:16', 'bearer', '0d4874eba6a1829f1810d98131ee2e49d120c9e8', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', NULL, 'd278b33dbb4367b5bf6faef1e28692dc6929bce9'),
('8a44a983bf4295f7c9b34289d2508a67321e9866', '2020-02-21 16:06:05', 'bearer', 'b5c75f852f63073ed32fade9891658b08b0d8609', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '758402cd59b90a3c75279665f202011b73893bdf'),
('8c5c3d4010dff54ad64f608012754b067cde0610', '2020-02-21 16:24:26', 'bearer', 'a96ac54cdbbec1771bae0379cce247995181afcc', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '7ced73109348287d2a05676c4a841ab62cdbc8e9'),
('90bf6d9463504d446e97b9f798e01b2df7b0a78b', '2020-02-21 16:18:52', 'bearer', '5bc3e978c1c91709095ab85b6f50360b8320cb37', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '99775d1640e016ff30954cb06d757d4c6f3e6ea9'),
('980e26a00ded7a48e27d380d4966750c91b2d3e2', '2020-02-21 17:37:09', 'bearer', 'a4ab529bb10676a51a7d8e933047f0212ef88e4b', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL),
('a24c81fb1714f0c364eb746a988843636bc66459', '2020-02-21 16:23:19', 'bearer', 'e3bc9e76f9694f648217f403e3ccfcb7a97edf03', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '0983401e30794126916a056a02f2cfed230ec1c8'),
('a83107f2998b078c3a2bda0800e6c04c940928d0', '2020-02-21 18:39:51', 'bearer', '2287f2d3ab57025f750a7dcdc94d6789a7744eb3', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', NULL, '8dc15e2cd4e96fb7633a117a938dc03e82b485c8'),
('ac252fe83ef5ae85bd59e09b0c0496732d153d09', '2020-02-21 16:15:40', 'bearer', '3c9c667ccbaf8cc1b9ffa104af480508dbb9ea45', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '9cd2e8c330c8d3824b8080dac39f8a9364c15b78'),
('ac72fe030f56998d4b13fcfc6ec887d8fa711998', '2020-02-21 16:16:17', 'bearer', 'edba6a54fc748b4b76d8e739e7442345292a5c5a', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '5c27610663628e5782b8688e25f31c778078d624'),
('ba534c43717de883586fa38bed8428b6f268728b', '2020-02-21 16:08:11', 'bearer', '379034260bd36964a603a611106569b50aa1fc68', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c4d6acca73559da44ae10ef4e58b0088da7df4b5'),
('baca5ef78f9e24f7ee0b524bfdf599d44b28562b', '2020-02-21 16:22:05', 'bearer', '659accdfe0cc9250b1b799487dcbedb86f3646bd', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '5fa952206d09e42304074174a9b50555cd6fe593'),
('bd26a303d2e588ce1b6ded75240b581ea09dbd66', '2020-02-19 19:50:56', 'bearer', '87f12853125055a47ec2b50f3068d6006b1baf92', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL),
('bda8e8f15a72cff1f67635777eb2ee98156df86c', '2020-02-21 16:10:18', 'bearer', '234bf6aa8b73a5fd4313587281bfcaaab130690f', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'f8734fb5df37d9e3396767a66149498f04033f33'),
('be1b9c55bf71c6a24d09971ed4863a132bc7d884', '2020-02-21 17:30:30', 'bearer', '9a48c2fa8549b50fc8c2ad35998123efea79ace7', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL),
('c1ab02b9747379e08a41a28eaf8de9726d840e27', '2020-02-21 18:39:04', 'bearer', 'd427719cd3c570a05ffc9a29d272f1f074d5993c', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'd44ca4b931b015469ee1fec21a29600b8826724c'),
('c71d28fcb682299e6a6532fefd6038c6fbea1802', '2020-02-21 16:14:52', 'bearer', 'b55ede0b637eab5349d931b44558100afd1098ab', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'b118e130fa51d9e20ed172f73c44317bdc5d9986'),
('ccfa16d56bcae508bb51badc9bc366dede338809', '2020-02-21 16:06:31', 'bearer', '7436b1c3dc905caa1a1c4a1ec5fa3952a3bfbf6b', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'b9e5cf456a963d62fa87ae8a72470f745810e36c'),
('d403073f68c6be2a07523fbec87c5cd2b8738fe6', '2020-02-21 16:18:34', 'bearer', '3ea2112333cfd5dc7996f731832f2ae6f2269e42', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'd55254bdf12d46ea0719cdbc09db9cf4e719a8c0'),
('dc07bd741166070772818b2556abec2a6419a491', '2020-02-21 18:10:44', 'bearer', 'f6aae62ea8af731d80e956a7b99c0b7926c1ec8d', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL),
('f2b03664573eecc4be303b8fa5b6e52e6ec63227', '2020-02-21 16:05:55', 'bearer', '515baf1f68f0e67232773e2b4b4584a01193c172', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '0731d66f96d14af8a92bf766ea4e9c0d6ed4cd75'),
('fdb4aa163bbd0620f18736ddd658cc96670fef73', '2020-02-21 16:17:07', 'bearer', 'ac9edd408398af74d33ad26c3fa2cbce6b752146', 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '32cb75867fa712518170d18055af9bd644541cd9'),
('fedb89817f3ca3292edcaf194b5fa991c9a1fad8', '2020-02-21 18:37:53', 'bearer', '8e7c7453cfe8c9f8b459dc9ed538cdeea2ae888e', 1, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'd8af03afcbc30c6a140f17a6c3ccb7a0446bbe8c');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oauth_authorization_code`
--

CREATE TABLE `oauth_authorization_code` (
  `authorization_code` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `oauth_authorization_code`
--

INSERT INTO `oauth_authorization_code` (`authorization_code`, `expires`, `redirect_uri`, `scope`, `valid`, `extra`, `oauth_client_id`, `user_id`) VALUES
('0731d66f96d14af8a92bf766ea4e9c0d6ed4cd75', '2020-02-21 15:10:55', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('08e4641ed00d570a0792e5956e3eb8fe2ab24b36', '2020-02-21 15:57:14', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('0983401e30794126916a056a02f2cfed230ec1c8', '2020-02-21 15:28:19', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('1d9879e18952fc914a701337188f44ea2134263e', '2020-02-21 15:28:23', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('21db6176235540941fad2b639fba81b687f4a161', '2020-02-21 17:38:37', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('277a1f1b534e020cea33c1ca87fe08d26f8ab1d6', '2020-02-21 17:45:36', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9'),
('32cb75867fa712518170d18055af9bd644541cd9', '2020-02-21 15:22:07', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('58da24c65f34820149b00fc844491c89644a182f', '2020-02-21 15:37:27', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('5c27610663628e5782b8688e25f31c778078d624', '2020-02-21 15:21:17', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('5fa952206d09e42304074174a9b50555cd6fe593', '2020-02-21 15:27:05', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('6600a38a756c28817ea51477282f703e6b119b6d', '2020-02-21 15:09:49', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('758402cd59b90a3c75279665f202011b73893bdf', '2020-02-21 15:11:05', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('798d9447c70496acb0881ba2f096bf09270c87af', '2020-02-21 17:30:36', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('7ced73109348287d2a05676c4a841ab62cdbc8e9', '2020-02-21 15:29:26', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('7fec441267b59a37c63e0dc70bb5bfca5d53ec37', '2020-02-21 15:22:39', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('8518175bf3ec91669d851442d6f958a1619adbe8', '2020-02-21 15:07:32', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('864e41a7b2c1ddc6de2f39cf808c5ec4b9cda2aa', '2020-02-21 15:42:55', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('8830101dbb9dc01b071e013a74f3260ac0c072fa', '2020-02-21 15:38:07', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('8dc15e2cd4e96fb7633a117a938dc03e82b485c8', '2020-02-21 17:44:51', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9'),
('8fa5785a11eb303ecf2dc6ebd0ab4371459a2bcd', '2020-02-19 19:40:26', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('9547267b6712f97415cd4601a99f257e7f9ca1d0', '2020-02-21 15:16:22', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('99775d1640e016ff30954cb06d757d4c6f3e6ea9', '2020-02-21 15:23:52', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('9cd2e8c330c8d3824b8080dac39f8a9364c15b78', '2020-02-21 15:20:40', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('b02188e94bd86ceb11b7c959cfe98f62c6bdc2dd', '2020-02-25 08:34:28', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('b118e130fa51d9e20ed172f73c44317bdc5d9986', '2020-02-21 15:19:52', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('b9e5cf456a963d62fa87ae8a72470f745810e36c', '2020-02-21 15:11:31', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('bac9cdbef6f745b8c2bddf0636f3cbbf22f4caaf', '2020-02-25 09:07:04', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('bef2742836ce7e87f7e27212a12273465c1072fa', '2020-02-25 09:09:18', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'e1aa0775-ee22-4681-94b2-c334ad14253f'),
('c29976c4084a45971681b438eba2252c79a36370', '2020-02-21 15:20:54', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('c4d6acca73559da44ae10ef4e58b0088da7df4b5', '2020-02-21 15:13:11', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('c6cceddbac39af25a76d46f93e7cddc4eff0527b', '2020-02-21 15:43:19', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('c6f39016ad72dd06fc75bd0c13b5d5ac75065d6a', '2020-02-21 15:25:49', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('d278b33dbb4367b5bf6faef1e28692dc6929bce9', '2020-02-21 17:46:16', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9'),
('d44ca4b931b015469ee1fec21a29600b8826724c', '2020-02-21 17:44:04', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('d55254bdf12d46ea0719cdbc09db9cf4e719a8c0', '2020-02-21 15:23:34', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('d8af03afcbc30c6a140f17a6c3ccb7a0446bbe8c', '2020-02-21 17:42:53', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('da9b58df8a1c71a7435dd18df52f0380a47e41f7', '2020-02-21 15:39:19', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('ede2c6e554e4b9a6ef0e3f64bde8e0eb1e174c7e', '2020-02-21 17:46:43', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'e1aa0775-ee22-4681-94b2-c334ad14253f'),
('f8734fb5df37d9e3396767a66149498f04033f33', '2020-02-21 15:15:18', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin'),
('fbf83fbdf0037859df6755c7c185b7af32759f68', '2020-02-21 16:15:58', 'http://localhost/Teacher.php', NULL, 0, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oauth_client`
--

CREATE TABLE `oauth_client` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `secret` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `grant_type` varchar(255) DEFAULT NULL,
  `response_type` varchar(255) DEFAULT NULL,
  `client_type` varchar(15) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `token_types` varchar(2000) DEFAULT NULL,
  `jwt_secret` varchar(255) DEFAULT NULL,
  `redirect_sign_out_uri` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `oauth_client`
--

INSERT INTO `oauth_client` (`id`, `name`, `description`, `secret`, `url`, `redirect_uri`, `image`, `grant_type`, `response_type`, `client_type`, `scope`, `extra`, `token_types`, `jwt_secret`, `redirect_sign_out_uri`) VALUES
('ad817d0b-35c7-4497-ad7c-896629aa1879', 'Database', '-', 'e030504f-b246-4f0d-843a-f18502340088', 'http://localhost', 'http://localhost/Teacher.php', 'default', 'authorization_code,implicit,password,client_credentials,refresh_token', 'code,token', NULL, NULL, NULL, NULL, NULL, 'http://localhost/logout.php'),
('idm_admin_app', 'idm', 'idm', NULL, '', '', 'default', '', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oauth_refresh_token`
--

CREATE TABLE `oauth_refresh_token` (
  `refresh_token` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `oauth_refresh_token`
--

INSERT INTO `oauth_refresh_token` (`refresh_token`, `expires`, `scope`, `oauth_client_id`, `user_id`, `iot_id`, `authorization_code`, `valid`) VALUES
('02f7f1d902d84629cab04705c0a6b0915a53eb42', '2020-03-06 15:33:07', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '8830101dbb9dc01b071e013a74f3260ac0c072fa', 0),
('06ea60db16f81d8709e53a9a47a93fa2f579b4e4', '2020-03-04 19:35:26', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '8fa5785a11eb303ecf2dc6ebd0ab4371459a2bcd', 0),
('0d4874eba6a1829f1810d98131ee2e49d120c9e8', '2020-03-06 17:41:16', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', NULL, 'd278b33dbb4367b5bf6faef1e28692dc6929bce9', 1),
('0df50c8eead537aaf6e7a98ed2ea9bd69832157c', '2020-03-10 09:04:18', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'e1aa0775-ee22-4681-94b2-c334ad14253f', NULL, 'bef2742836ce7e87f7e27212a12273465c1072fa', 1),
('2287f2d3ab57025f750a7dcdc94d6789a7744eb3', '2020-03-06 17:39:51', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', NULL, '8dc15e2cd4e96fb7633a117a938dc03e82b485c8', 1),
('234bf6aa8b73a5fd4313587281bfcaaab130690f', '2020-03-06 15:10:18', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'f8734fb5df37d9e3396767a66149498f04033f33', 0),
('3572e5f6e3b79212f1979406a35c627418b47b7a', '2020-03-06 17:41:43', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'e1aa0775-ee22-4681-94b2-c334ad14253f', NULL, 'ede2c6e554e4b9a6ef0e3f64bde8e0eb1e174c7e', 1),
('379034260bd36964a603a611106569b50aa1fc68', '2020-03-06 15:08:11', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c4d6acca73559da44ae10ef4e58b0088da7df4b5', 0),
('3c9c667ccbaf8cc1b9ffa104af480508dbb9ea45', '2020-03-06 15:15:40', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '9cd2e8c330c8d3824b8080dac39f8a9364c15b78', 0),
('3ea2112333cfd5dc7996f731832f2ae6f2269e42', '2020-03-06 15:18:34', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'd55254bdf12d46ea0719cdbc09db9cf4e719a8c0', 0),
('4e95d942e977d50c86d118d7f8021edf720db5d9', '2020-03-06 15:52:14', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '08e4641ed00d570a0792e5956e3eb8fe2ab24b36', 1),
('515baf1f68f0e67232773e2b4b4584a01193c172', '2020-03-06 15:05:55', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '0731d66f96d14af8a92bf766ea4e9c0d6ed4cd75', 0),
('5173f7447a19de38d627615b240556adb6149797', '2020-03-06 15:02:32', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '8518175bf3ec91669d851442d6f958a1619adbe8', 0),
('54e2364396f5fa20297f3084f886b6164324423d', '2020-03-06 15:37:55', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '864e41a7b2c1ddc6de2f39cf808c5ec4b9cda2aa', 0),
('5bc3e978c1c91709095ab85b6f50360b8320cb37', '2020-03-06 15:18:52', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '99775d1640e016ff30954cb06d757d4c6f3e6ea9', 0),
('5d1f2525e82ca8b05cb73a0b64e05390d8fca7be', '2020-03-06 15:11:22', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '9547267b6712f97415cd4601a99f257e7f9ca1d0', 0),
('63e56ce8b4447988dc1ead96c497d1d8c3685d82', '2020-03-06 15:25:30', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL, 1),
('659accdfe0cc9250b1b799487dcbedb86f3646bd', '2020-03-06 15:22:05', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '5fa952206d09e42304074174a9b50555cd6fe593', 0),
('731edfacd921cad0d3c20d4c4322220fc9a4611f', '2020-03-10 08:29:28', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'b02188e94bd86ceb11b7c959cfe98f62c6bdc2dd', 1),
('7436b1c3dc905caa1a1c4a1ec5fa3952a3bfbf6b', '2020-03-06 15:06:31', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'b9e5cf456a963d62fa87ae8a72470f745810e36c', 0),
('7b7b057240392cf60e9c771ce4d36018ce5f9ac3', '2020-03-10 09:02:04', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'bac9cdbef6f745b8c2bddf0636f3cbbf22f4caaf', 1),
('87f12853125055a47ec2b50f3068d6006b1baf92', '2020-03-04 18:50:56', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL, 1),
('8e7c7453cfe8c9f8b459dc9ed538cdeea2ae888e', '2020-03-06 17:37:53', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'd8af03afcbc30c6a140f17a6c3ccb7a0446bbe8c', 1),
('965f8d9d19f041a08fdc08d01c716fa57b80285b', '2020-03-06 15:17:39', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '7fec441267b59a37c63e0dc70bb5bfca5d53ec37', 0),
('9671c39c5e4fa09422fc49e0de2f50876d83ffe8', '2020-03-06 15:38:19', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c6cceddbac39af25a76d46f93e7cddc4eff0527b', 1),
('969bc13be4c089e5fabc2348523cbdd8928f82a3', '2020-03-06 15:20:49', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c6f39016ad72dd06fc75bd0c13b5d5ac75065d6a', 0),
('9754fc51690901f38bbac83a134a4d4cea7f5ed4', '2020-03-06 15:34:19', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'da9b58df8a1c71a7435dd18df52f0380a47e41f7', 0),
('9a48c2fa8549b50fc8c2ad35998123efea79ace7', '2020-03-06 16:30:30', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL, 1),
('a4ab529bb10676a51a7d8e933047f0212ef88e4b', '2020-03-06 16:37:09', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL, 1),
('a96ac54cdbbec1771bae0379cce247995181afcc', '2020-03-06 15:24:26', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '7ced73109348287d2a05676c4a841ab62cdbc8e9', 0),
('ac0fa9c2139bd23c760059e15447cd367f856d84', '2020-03-06 17:25:36', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '798d9447c70496acb0881ba2f096bf09270c87af', 1),
('ac9edd408398af74d33ad26c3fa2cbce6b752146', '2020-03-06 15:17:07', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '32cb75867fa712518170d18055af9bd644541cd9', 0),
('adda14462d04746a1ab844e3c976616a5c04c693', '2020-03-06 15:15:54', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'c29976c4084a45971681b438eba2252c79a36370', 0),
('b04f771ed5e23e14f521df024e6339112bba771c', '2020-03-04 19:23:33', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL, 1),
('b3518378b350ca8b34f17dab524c99eafa3caef5', '2020-03-06 17:33:37', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '21db6176235540941fad2b639fba81b687f4a161', 1),
('b55ede0b637eab5349d931b44558100afd1098ab', '2020-03-06 15:14:52', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'b118e130fa51d9e20ed172f73c44317bdc5d9986', 0),
('b5c75f852f63073ed32fade9891658b08b0d8609', '2020-03-06 15:06:05', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '758402cd59b90a3c75279665f202011b73893bdf', 0),
('b6bb2488c90e35141b00911923ae19085ab02cf5', '2020-03-06 15:04:49', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '6600a38a756c28817ea51477282f703e6b119b6d', 0),
('b88ba1cb5d4576a11d3092142a2bf193bdbc05cf', '2020-03-06 16:10:58', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'fbf83fbdf0037859df6755c7c185b7af32759f68', 1),
('d427719cd3c570a05ffc9a29d272f1f074d5993c', '2020-03-06 17:39:04', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, 'd44ca4b931b015469ee1fec21a29600b8826724c', 1),
('e20434f3e91c0632e793639bdbcf4ad385992146', '2020-03-06 15:23:23', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '1d9879e18952fc914a701337188f44ea2134263e', 0),
('e3bc9e76f9694f648217f403e3ccfcb7a97edf03', '2020-03-06 15:23:19', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '0983401e30794126916a056a02f2cfed230ec1c8', 0),
('ec5ec4845a8a55abb8bff11e8e4776e484e0b42a', '2020-03-06 15:32:27', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '58da24c65f34820149b00fc844491c89644a182f', 0),
('edba6a54fc748b4b76d8e739e7442345292a5c5a', '2020-03-06 15:16:17', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, '5c27610663628e5782b8688e25f31c778078d624', 0),
('edba8e4bf39886bfa0bb05c5c9276f86d5af0d0b', '2020-03-06 17:40:36', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', NULL, '277a1f1b534e020cea33c1ca87fe08d26f8ab1d6', 1),
('f6aae62ea8af731d80e956a7b99c0b7926c1ec8d', '2020-03-06 17:10:44', 'bearer', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'admin', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `oauth_scope`
--

CREATE TABLE `oauth_scope` (
  `id` int(11) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `organization`
--

CREATE TABLE `organization` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pep_proxy`
--

CREATE TABLE `pep_proxy` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `pep_proxy`
--

INSERT INTO `pep_proxy` (`id`, `password`, `oauth_client_id`, `salt`) VALUES
('pep_proxy_1d18abfb-e8bd-44ab-bedc-3f53d855d7c1', 'e93f266823a06be0f84d783afbc13b90b6b3a5f6', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'b56c6414603c6093');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `permission`
--

CREATE TABLE `permission` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_internal` tinyint(1) DEFAULT '0',
  `action` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `xml` text,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `is_regex` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `is_internal`, `action`, `resource`, `xml`, `oauth_client_id`, `is_regex`) VALUES
('1', 'Get and assign all internal application roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('2', 'Manage the application', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('3', 'Manage roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('36f6969c-8190-4f1a-a546-144827fb5ac1', 'Search Student', '-', 0, 'GET', '/api/student/search', '', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 0),
('4', 'Manage authorizations', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('46819027-c915-43fc-93ee-1b805118e260', 'Show students', '-', 0, 'GET', '/api/student', '', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 0),
('5', 'Get and assign all public application roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('6', 'Get and assign only public owned roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('9b5f47e5-cd7c-4400-98e7-caad88547240', 'Delete Student', '-', 0, 'DELETE', '/api/student', '', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 0),
('9c0c96b9-1073-4a8c-a829-2087c6269bd8', 'Show Teachers', '-', 0, 'GET', '/api/teacher/', '', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 0),
('acd4095b-d8b6-4a6a-8afe-6846f711bd1f', 'Add Students', '-', 0, 'POST', '/api/student/', '', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 0),
('e4aa64b6-1e78-4175-82c9-760defafbe8a', 'Edit Students', '-', 0, 'PUT', '/api/student/', '', 'ad817d0b-35c7-4497-ad7c-896629aa1879', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ptp`
--

CREATE TABLE `ptp` (
  `id` int(11) NOT NULL,
  `previous_job_id` varchar(255) NOT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `role`
--

CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT '0',
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `role`
--

INSERT INTO `role` (`id`, `name`, `is_internal`, `oauth_client_id`) VALUES
('100525f7-8628-43e3-9b96-61a66197950e', 'Observer', 0, 'ad817d0b-35c7-4497-ad7c-896629aa1879'),
('2ee1b964-44da-45ee-b713-80a9c4bf2547', 'Teacher', 0, 'ad817d0b-35c7-4497-ad7c-896629aa1879'),
('c00e73fd-5d98-4cf8-a7cb-85991c257141', 'Adder', 0, 'ad817d0b-35c7-4497-ad7c-896629aa1879'),
('provider', 'Provider', 1, 'idm_admin_app'),
('purchaser', 'Purchaser', 1, 'idm_admin_app');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `role_assignment`
--

CREATE TABLE `role_assignment` (
  `id` int(11) NOT NULL,
  `role_organization` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `role_assignment`
--

INSERT INTO `role_assignment` (`id`, `role_organization`, `oauth_client_id`, `role_id`, `organization_id`, `user_id`) VALUES
(6, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'provider', NULL, 'admin'),
(7, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', '2ee1b964-44da-45ee-b713-80a9c4bf2547', NULL, 'admin'),
(8, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', '100525f7-8628-43e3-9b96-61a66197950e', NULL, 'a04b8931-01e8-44fd-9599-b4cc3d4007d9'),
(9, NULL, 'ad817d0b-35c7-4497-ad7c-896629aa1879', 'c00e73fd-5d98-4cf8-a7cb-85991c257141', NULL, 'e1aa0775-ee22-4681-94b2-c334ad14253f');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `permission_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES
(1, 'provider', '1'),
(2, 'provider', '2'),
(3, 'provider', '3'),
(4, 'provider', '4'),
(5, 'provider', '5'),
(6, 'provider', '6'),
(7, 'purchaser', '5'),
(111, 'c00e73fd-5d98-4cf8-a7cb-85991c257141', 'acd4095b-d8b6-4a6a-8afe-6846f711bd1f'),
(112, 'c00e73fd-5d98-4cf8-a7cb-85991c257141', '36f6969c-8190-4f1a-a546-144827fb5ac1'),
(113, 'c00e73fd-5d98-4cf8-a7cb-85991c257141', '9c0c96b9-1073-4a8c-a829-2087c6269bd8'),
(114, '2ee1b964-44da-45ee-b713-80a9c4bf2547', 'e4aa64b6-1e78-4175-82c9-760defafbe8a'),
(115, '2ee1b964-44da-45ee-b713-80a9c4bf2547', 'acd4095b-d8b6-4a6a-8afe-6846f711bd1f'),
(116, '2ee1b964-44da-45ee-b713-80a9c4bf2547', '9c0c96b9-1073-4a8c-a829-2087c6269bd8'),
(117, '2ee1b964-44da-45ee-b713-80a9c4bf2547', '9b5f47e5-cd7c-4400-98e7-caad88547240'),
(118, '2ee1b964-44da-45ee-b713-80a9c4bf2547', '46819027-c915-43fc-93ee-1b805118e260'),
(119, '2ee1b964-44da-45ee-b713-80a9c4bf2547', '36f6969c-8190-4f1a-a546-144827fb5ac1'),
(120, '100525f7-8628-43e3-9b96-61a66197950e', '9c0c96b9-1073-4a8c-a829-2087c6269bd8'),
(121, '100525f7-8628-43e3-9b96-61a66197950e', '46819027-c915-43fc-93ee-1b805118e260'),
(122, '100525f7-8628-43e3-9b96-61a66197950e', '36f6969c-8190-4f1a-a546-144827fb5ac1');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `role_usage_policy`
--

CREATE TABLE `role_usage_policy` (
  `id` int(11) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `usage_policy_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('201802190000-CreateUserTable.js'),
('201802190003-CreateUserRegistrationProfileTable.js'),
('201802190005-CreateOrganizationTable.js'),
('201802190008-CreateOAuthClientTable.js'),
('201802190009-CreateUserAuthorizedApplicationTable.js'),
('201802190010-CreateRoleTable.js'),
('201802190015-CreatePermissionTable.js'),
('201802190020-CreateRoleAssignmentTable.js'),
('201802190025-CreateRolePermissionTable.js'),
('201802190030-CreateUserOrganizationTable.js'),
('201802190035-CreateIotTable.js'),
('201802190040-CreatePepProxyTable.js'),
('201802190045-CreateAuthZForceTable.js'),
('201802190050-CreateAuthTokenTable.js'),
('201802190060-CreateOAuthAuthorizationCodeTable.js'),
('201802190065-CreateOAuthAccessTokenTable.js'),
('201802190070-CreateOAuthRefreshTokenTable.js'),
('201802190075-CreateOAuthScopeTable.js'),
('20180405125424-CreateUserTourAttribute.js'),
('20180612134640-CreateEidasTable.js'),
('20180727101745-CreateUserEidasIdAttribute.js'),
('20180730094347-CreateTrustedApplicationsTable.js'),
('20180828133454-CreatePasswordSalt.js'),
('20180921104653-CreateEidasNifColumn.js'),
('20180922140934-CreateOauthTokenType.js'),
('20181022103002-CreateEidasTypeAndAttributes.js'),
('20181108144720-RevokeToken.js'),
('20181113121450-FixExtraAndScopeAttribute.js'),
('20181203120316-FixTokenTypesLength.js'),
('20190116101526-CreateSignOutUrl.js'),
('20190316203230-CreatePermissionIsRegex.js'),
('20190429164755-CreateUsagePolicyTable.js'),
('20190507112246-CreateRoleUsagePolicyTable.js'),
('20190507112259-CreatePtpTable.js');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `trusted_application`
--

CREATE TABLE `trusted_application` (
  `id` int(11) NOT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `trusted_oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `usage_policy`
--

CREATE TABLE `usage_policy` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` enum('COUNT_POLICY','AGGREGATION_POLICY','CUSTOM_POLICY') DEFAULT NULL,
  `parameters` json DEFAULT NULL,
  `punishment` enum('KILL_JOB','UNSUBSCRIBE','MONETIZE') DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `odrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `gravatar` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `date_password` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `extra` json DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `starters_tour_ended` tinyint(1) DEFAULT '0',
  `eidas_id` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`id`, `username`, `description`, `website`, `image`, `gravatar`, `email`, `password`, `date_password`, `enabled`, `admin`, `extra`, `scope`, `starters_tour_ended`, `eidas_id`, `salt`) VALUES
('a04b8931-01e8-44fd-9599-b4cc3d4007d9', 'user1', '', '', 'default', 0, 'user1@test.com', '58588ded85c141f22fd728ff6dbb3ffd9946d9e0', '2020-02-21 17:35:21', 1, 0, NULL, NULL, 0, NULL, '94a134a6533e67f3'),
('admin', 'pgiannakopoulos1', NULL, NULL, 'default', 0, 'pgiannakopoulos1@isc.tuc.gr', '00b1abee79deb2923f49d2c16c1cf2f52cb03435', '2020-02-19 13:42:49', 1, 1, NULL, NULL, 0, NULL, 'a02fe0178d40db27'),
('e1aa0775-ee22-4681-94b2-c334ad14253f', 'user2', '', '', 'default', 0, 'user2@test.com', 'cdfe726ef4fc70c67ca2951df20ad61bf26c773f', '2020-02-21 17:35:45', 1, 0, NULL, NULL, 0, NULL, 'c53961c10fa276e1');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user_authorized_application`
--

CREATE TABLE `user_authorized_application` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `user_authorized_application`
--

INSERT INTO `user_authorized_application` (`id`, `user_id`, `oauth_client_id`) VALUES
(1, 'admin', 'ad817d0b-35c7-4497-ad7c-896629aa1879'),
(2, 'a04b8931-01e8-44fd-9599-b4cc3d4007d9', 'ad817d0b-35c7-4497-ad7c-896629aa1879'),
(3, 'e1aa0775-ee22-4681-94b2-c334ad14253f', 'ad817d0b-35c7-4497-ad7c-896629aa1879');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user_organization`
--

CREATE TABLE `user_organization` (
  `id` int(11) NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user_registration_profile`
--

CREATE TABLE `user_registration_profile` (
  `id` int(11) NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_expires` datetime DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `verification_key` varchar(255) DEFAULT NULL,
  `verification_expires` datetime DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `authzforce`
--
ALTER TABLE `authzforce`
  ADD PRIMARY KEY (`az_domain`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `auth_token`
--
ALTER TABLE `auth_token`
  ADD PRIMARY KEY (`access_token`),
  ADD UNIQUE KEY `access_token` (`access_token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pep_proxy_id` (`pep_proxy_id`);

--
-- Ευρετήρια για πίνακα `eidas_credentials`
--
ALTER TABLE `eidas_credentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `iot`
--
ALTER TABLE `iot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD PRIMARY KEY (`access_token`),
  ADD UNIQUE KEY `access_token` (`access_token`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `iot_id` (`iot_id`),
  ADD KEY `refresh_token` (`refresh_token`),
  ADD KEY `authorization_code_at` (`authorization_code`);

--
-- Ευρετήρια για πίνακα `oauth_authorization_code`
--
ALTER TABLE `oauth_authorization_code`
  ADD PRIMARY KEY (`authorization_code`),
  ADD UNIQUE KEY `authorization_code` (`authorization_code`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Ευρετήρια για πίνακα `oauth_client`
--
ALTER TABLE `oauth_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Ευρετήρια για πίνακα `oauth_refresh_token`
--
ALTER TABLE `oauth_refresh_token`
  ADD PRIMARY KEY (`refresh_token`),
  ADD UNIQUE KEY `refresh_token` (`refresh_token`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `iot_id` (`iot_id`),
  ADD KEY `authorization_code_rt` (`authorization_code`);

--
-- Ευρετήρια για πίνακα `oauth_scope`
--
ALTER TABLE `oauth_scope`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Ευρετήρια για πίνακα `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Ευρετήρια για πίνακα `pep_proxy`
--
ALTER TABLE `pep_proxy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `ptp`
--
ALTER TABLE `ptp`
  ADD PRIMARY KEY (`id`,`previous_job_id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `organization_id` (`organization_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Ευρετήρια για πίνακα `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Ευρετήρια για πίνακα `role_usage_policy`
--
ALTER TABLE `role_usage_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `usage_policy_id` (`usage_policy_id`);

--
-- Ευρετήρια για πίνακα `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Ευρετήρια για πίνακα `trusted_application`
--
ALTER TABLE `trusted_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `trusted_oauth_client_id` (`trusted_oauth_client_id`);

--
-- Ευρετήρια για πίνακα `usage_policy`
--
ALTER TABLE `usage_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Ευρετήρια για πίνακα `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Ευρετήρια για πίνακα `user_organization`
--
ALTER TABLE `user_organization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Ευρετήρια για πίνακα `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `oauth_scope`
--
ALTER TABLE `oauth_scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `ptp`
--
ALTER TABLE `ptp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `role_assignment`
--
ALTER TABLE `role_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT για πίνακα `role_usage_policy`
--
ALTER TABLE `role_usage_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `trusted_application`
--
ALTER TABLE `trusted_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `user_organization`
--
ALTER TABLE `user_organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `authzforce`
--
ALTER TABLE `authzforce`
  ADD CONSTRAINT `authzforce_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `auth_token`
--
ALTER TABLE `auth_token`
  ADD CONSTRAINT `auth_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_token_ibfk_2` FOREIGN KEY (`pep_proxy_id`) REFERENCES `pep_proxy` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `eidas_credentials`
--
ALTER TABLE `eidas_credentials`
  ADD CONSTRAINT `eidas_credentials_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `iot`
--
ALTER TABLE `iot`
  ADD CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD CONSTRAINT `authorization_code_at` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refresh_token` FOREIGN KEY (`refresh_token`) REFERENCES `oauth_refresh_token` (`refresh_token`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `oauth_authorization_code`
--
ALTER TABLE `oauth_authorization_code`
  ADD CONSTRAINT `oauth_authorization_code_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_authorization_code_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `oauth_refresh_token`
--
ALTER TABLE `oauth_refresh_token`
  ADD CONSTRAINT `authorization_code_rt` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `pep_proxy`
--
ALTER TABLE `pep_proxy`
  ADD CONSTRAINT `pep_proxy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `ptp`
--
ALTER TABLE `ptp`
  ADD CONSTRAINT `ptp_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD CONSTRAINT `role_assignment_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `role_usage_policy`
--
ALTER TABLE `role_usage_policy`
  ADD CONSTRAINT `role_usage_policy_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_usage_policy_ibfk_2` FOREIGN KEY (`usage_policy_id`) REFERENCES `usage_policy` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `trusted_application`
--
ALTER TABLE `trusted_application`
  ADD CONSTRAINT `trusted_application_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trusted_application_ibfk_2` FOREIGN KEY (`trusted_oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `usage_policy`
--
ALTER TABLE `usage_policy`
  ADD CONSTRAINT `usage_policy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  ADD CONSTRAINT `user_authorized_application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_authorized_application_ibfk_2` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `user_organization`
--
ALTER TABLE `user_organization`
  ADD CONSTRAINT `user_organization_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  ADD CONSTRAINT `user_registration_profile_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
