-- Adminer 4.2.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `content` text COLLATE utf8_czech_ci,
  `anotace` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `articles` (`id`, `title`, `content`, `anotace`, `created`) VALUES
(1,	'UŽIJTE SI LÉTO DÍKY COOL APLIKACÍM ZDARMA',	'Na trhu je dnes nepřeberné množství aplikací pro vaše počítače i mobilní miláčky. Stačí se jen rozhlédnout a dopřát svému stroji instalaci některé z těchto cool vychytávek, které vám nejen usnadní práci, ale pomohou se třeba odreagovat po náročném pracovním dni. Na vlastní kůži jsem si vyzkoušela a oblíbila hned několik z nich. Inspirujte se.',	'aplikace zdarma pro usnadnění práce',	NULL),
(2,	'TIPY A TRIKY PRO SYSTÉMY ABBA: AUTOMATICKÉ AKTUALIZACE',	'Od verze 15.01.06 systémů ABBA G3 a G4 (SK 15.02.01) se v okně pro spouštění agend nachází tlačítko Zkontrolovat aktualizace (objeví se uživatelům, kteří mají příslušné oprávnění \"Dovolit aplikovat automatické aktualizace\"). Pomocí tohoto tlačítka můžete do informačního systému ABBA stáhnout nová znění vybraných definičních částí systému, aniž byste museli provádět plnohodnotný update.',	'aktualizace aplikací',	NULL),
(12,	'ZAJISTÍ EET SPRAVEDLNOST V PODNIKÁNÍ?',	'Bude elektronická evidence tržeb (EET) nástrojem práva nebo novou politickou kauzou? Statistický úřad odhaduje, že nevykázané příjmy převyšují v ČR částku 160 mld. ročně, tedy dvojnásobek schodku státního rozpočtu. To je docela dost, že? Myslím, že je čas, aby daně platili všichni a podnikatelé měli rovné podmínky. Přečtěte si zamyšlení jednoho z 2,1 miliónu živnostníků v ČR nad tím, jestli vůbec mohou politici při svých zájmových šarvátkách zprovoznit mechanismus, který povede k vyšší úspěšnosti výběru daní a eliminaci daňových úniků?',	'elektronická evidence tržeb a daňové ńiky',	NULL);

-- 2015-07-20 10:07:00