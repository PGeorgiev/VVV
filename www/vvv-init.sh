echo ""

CURRENT_SITE="misc.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d /srv/www/$CURRENT_SITE/wptest ]]; then
	git clone --recursive https://github.com/manovotny/wptest.git /srv/www/$CURRENT_SITE/wptest
fi


CURRENT_SITE="supportpress.dev"
echo "Provisioning $CURRENT_SITE"
if [ ! -d /srv/www/$CURRENT_SITE ]; then
	svn co https://supportpress.svn.wordpress.org/trunk /srv/www/$CURRENT_SITE
	cp /srv/www/$CURRENT_SITE/config-sample.php /srv/www/$CURRENT_SITE/config.php

	sed -i '' 's/putyourdbnamehere/supportpress_dev/'  /srv/www/$CURRENT_SITE/config.php
	sed -i '' 's/usernamehere/macenzie/'               /srv/www/$CURRENT_SITE/config.php
	sed -i '' 's/yourpasswordhere/password/'           /srv/www/$CURRENT_SITE/config.php

	# todo sed other config values
fi


CURRENT_SITE="wordcamp.dev"
echo "Provisioning $CURRENT_SITE"
if [ ! -d /srv/www/$CURRENT_SITE ]; then
	wp core download --path=/srv/www/$CURRENT_SITE/wordpress
	svn co https://wordcamp.svn.wordpress.org/bin        /srv/www/$CURRENT_SITE/bin        --username=iandunn
	svn co https://wordcamp.svn.wordpress.org/wp-content /srv/www/$CURRENT_SITE/wp-content --username=iandunn

	cp /srv/www/$CURRENT_SITE/wp-config-sample.php    /srv/www/$CURRENT_SITE/wp-config.php
	sed -i '' 's/database_name_here/wordcamp_dev/'    /srv/www/$CURRENT_SITE/wp-config.php
	sed -i '' 's/username_here/macenzie/'             /srv/www/$CURRENT_SITE/wp-config.php
	sed -i '' 's/password_here/password/'             /srv/www/$CURRENT_SITE/wp-config.php

	# todo misc bits from wp-config like content_dir/url, multisite
	# todo sandbox-functionality.php -- save to version control somewhere or something?
	# todo disable error handler
fi


CURRENT_SITE="wp.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d /srv/www/$CURRENT_SITE ]]; then
	git clone --recursive https://github.com/iandunn/WordPress-Skeleton.git /srv/www/$CURRENT_SITE

	mv /srv/www/$CURRENT_SITE/environment-config-sample.php    /srv/www/$CURRENT_SITE/environment-config.php
	sed -i '' 's/database_name_here/wp_dev/'                   /srv/www/$CURRENT_SITE/environment-config.php
	sed -i '' 's/username_here/macenzie/'                      /srv/www/$CURRENT_SITE/environment-config.php
	sed -i '' 's/password_here/password/'                      /srv/www/$CURRENT_SITE/environment-config.php

	# todo svn/git co your plugins from wporg repo?
fi


# todo wp-develop.dev


CURRENT_SITE="wp-skeleton.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d /srv/www/$CURRENT_SITE ]]; then
	git clone --recursive https://github.com/iandunn/WordPress-Skeleton.git /srv/www/$CURRENT_SITE

	cp /srv/www/$CURRENT_SITE/environment-config-sample.php   /srv/www/$CURRENT_SITE/environment-config.php
	sed -i "s/database_name_here/wp_skeleton_dev/"            /srv/www/$CURRENT_SITE/environment-config.php
	sed -i "s/username_here/macenzie/"                        /srv/www/$CURRENT_SITE/environment-config.php
	sed -i 's/password_here/password/'                        /srv/www/$CURRENT_SITE/environment-config.php
fi


# todo wpms.dev
	# specific setup for multisite?
