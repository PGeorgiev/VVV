CREATE DATABASE IF NOT EXISTS `supportpress_dev`;
CREATE DATABASE IF NOT EXISTS `wordcamp_dev`;
CREATE DATABASE IF NOT EXISTS `wp_dev`;
CREATE DATABASE IF NOT EXISTS `wp_develop_dev`;
CREATE DATABASE IF NOT EXISTS `wp_skeleton_dev`;
CREATE DATABASE IF NOT EXISTS `wpms_dev`;

GRANT ALL PRIVILEGES ON `wordcamp_dev`.*     TO 'wp'@'localhost' IDENTIFIED BY 'wp';
GRANT ALL PRIVILEGES ON `supportpress_dev`.* TO 'wp'@'localhost' IDENTIFIED BY 'wp';
GRANT ALL PRIVILEGES ON `wp_dev`.*           TO 'wp'@'localhost' IDENTIFIED BY 'wp';
GRANT ALL PRIVILEGES ON `wp_develop_dev`.*   TO 'wp'@'localhost' IDENTIFIED BY 'wp';
GRANT ALL PRIVILEGES ON `wp_skeleton_dev`.*  TO 'wp'@'localhost' IDENTIFIED BY 'wp';
GRANT ALL PRIVILEGES ON `wpms_dev`.*         TO 'wp'@'localhost' IDENTIFIED BY 'wp';
