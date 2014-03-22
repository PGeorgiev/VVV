# Any SQL files included in the database/backups directory will be
# imported as Vagrant boots up. To best manage expectations, these
# databases should be created in advance with proper user permissions
# so that any code bases configured to work with them will start
# without trouble.

DROP DATABASE IF EXISTS `test`;

CREATE DATABASE IF NOT EXISTS `supportpress_dev`;
GRANT ALL PRIVILEGES ON `supportpress_dev`.* TO 'veronica'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wordcamp_dev`;
GRANT ALL PRIVILEGES ON `wordcamp_dev`.* TO 'veronica'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wp_dev`;
GRANT ALL PRIVILEGES ON `wp_dev`.* TO 'veronica'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wp_skeleton_dev`;
GRANT ALL PRIVILEGES ON `wp_skeleton_dev`.* TO 'veronica'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `wpms_dev`;
GRANT ALL PRIVILEGES ON `wpms_dev`.* TO 'veronica'@'localhost' IDENTIFIED BY 'password';
