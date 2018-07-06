DROP TABLE IF EXISTS `sequence_key`;
CREATE TABLE `sequence_key` (
  `id` int(11) NOT NULL,
  `key` varchar(25) NOT NULL,
  `start_with` bigint(20) DEFAULT '1',
  `inc_span` int(11) DEFAULT '1',
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sequence_key` (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sequence_key` VALUES ('1000', 'TUTORIAL', '100003400', '100', '示例随机数生成种子');
