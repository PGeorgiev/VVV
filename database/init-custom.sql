# Any SQL files included in the database/backups directory will be
# imported as Vagrant boots up. To best manage expectations, these
# databases should be created in advance with proper user permissions
# so that any code bases configured to work with them will start
# without trouble.

DROP DATABASE IF EXISTS `test`;

CREATE DATABASE IF NOT EXISTS `supportpress_macenzie_dev`;
GRANT ALL PRIVILEGES ON `supportpress_macenzie_dev`.* TO 'macenzie'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wordcamp_macenzie_dev`;
GRANT ALL PRIVILEGES ON `wordcamp_macenzie_dev`.* TO 'macenzie'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wp_macenzie_dev`;
GRANT ALL PRIVILEGES ON `wp_macenzie_dev`.* TO 'macenzie'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wp_skeleton_macenzie_dev`;
GRANT ALL PRIVILEGES ON `wp_skeleton_macenzie_dev`.* TO 'macenzie'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wpms_macenzie_dev`;
GRANT ALL PRIVILEGES ON `wpms_macenzie_dev`.* TO 'macenzie'@'localhost' IDENTIFIED BY 'password';
