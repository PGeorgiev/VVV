echo ""

CURRENT_SITE="/srv/www/misc.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d $CURRENT_SITE/wptest ]]; then
	git clone --recursive https://github.com/manovotny/wptest.git $CURRENT_SITE/wptest
fi


CURRENT_SITE="/srv/www/supportpress.dev"
echo "Provisioning $CURRENT_SITE"
if [ ! -d $CURRENT_SITE ]; then
	svn co https://supportpress.svn.wordpress.org/trunk $CURRENT_SITE
	cp $CURRENT_SITE/config-sample.php $CURRENT_SITE/config.php

	sed -i 's/putyourdbnamehere/supportpress_dev/'  $CURRENT_SITE/config.php
	sed -i 's/usernamehere/macenzie/'               $CURRENT_SITE/config.php
	sed -i 's/yourpasswordhere/password/'           $CURRENT_SITE/config.php

	# todo sed other config values
	# error_reporting( E_ALL ^ E_STRICT );
fi


CURRENT_SITE="/srv/www/wordcamp.dev"
echo "Provisioning $CURRENT_SITE"
if [ ! -d $CURRENT_SITE ]; then
	wp core download --path=$CURRENT_SITE/wordpress
	svn co https://wordcamp.svn.wordpress.org/bin        $CURRENT_SITE/bin        --username=iandunn
	svn co https://wordcamp.svn.wordpress.org/wp-content $CURRENT_SITE/wp-content --username=iandunn

	cp $CURRENT_SITE/wp-config-sample.php                $CURRENT_SITE/wp-config.php
	sed -i 's/database_name_here/wordcamp_dev/'          $CURRENT_SITE/wp-config.php
	sed -i 's/username_here/macenzie/'                   $CURRENT_SITE/wp-config.php
	sed -i 's/password_here/password/'                   $CURRENT_SITE/wp-config.php

	# todo misc bits from wp-config like content_dir/url, multisite
	# todo sandbox-functionality.php -- save to version control somewhere or something?
	# todo disable error handler
fi


CURRENT_SITE="/srv/www/wp.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d $CURRENT_SITE ]]; then
	git clone https://github.com/iandunn/WordPress-Skeleton.git $CURRENT_SITE

	cd $CURRENT_SITE
	git submodule init
	git submodule update $CURRENT_SITE/content/plugins/wordpress-functionality-plugin-skeleton
   	rm -rf .git* .htaccess README.md content/plugins/wordpress-functionality-plugin-skeleton/.git content/plugins/akisment
   	wp core download --path=$CURRENT_SITE/wordpress

	mv $CURRENT_SITE/environment-config-sample.php    $CURRENT_SITE/environment-config.php
	sed -i 's/database_name_here/wp_dev/'             $CURRENT_SITE/environment-config.php
	sed -i 's/username_here/macenzie/'                $CURRENT_SITE/environment-config.php
	sed -i 's/password_here/password/'                $CURRENT_SITE/environment-config.php

	# todo svn/git co your plugins from wporg repo?
fi


# todo wp-develop.dev


CURRENT_SITE="/srv/www/wp-skeleton.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d $CURRENT_SITE ]]; then
	git clone --recursive https://github.com/iandunn/WordPress-Skeleton.git $CURRENT_SITE

	cp $CURRENT_SITE/environment-config-sample.php   $CURRENT_SITE/environment-config.php
	sed -i "s/database_name_here/wp_skeleton_dev/"   $CURRENT_SITE/environment-config.php
	sed -i "s/username_here/macenzie/"               $CURRENT_SITE/environment-config.php
	sed -i 's/password_here/password/'               $CURRENT_SITE/environment-config.php
fi


CURRENT_SITE="/srv/www/wpms.dev"
echo "Provisioning $CURRENT_SITE"
if [[ ! -d $CURRENT_SITE ]]; then
	git clone https://github.com/iandunn/WordPress-Skeleton.git $CURRENT_SITE

	cd $CURRENT_SITE
	git submodule init
	git submodule update $CURRENT_SITE/content/plugins/wordpress-functionality-plugin-skeleton
   	rm -rf .git* .htaccess README.md content/plugins/wordpress-functionality-plugin-skeleton/.git content/plugins/akisment
   	wp core download --path=$CURRENT_SITE/wordpress

	mv $CURRENT_SITE/environment-config-sample.php    $CURRENT_SITE/environment-config.php
	sed -i 's/database_name_here/wpms_dev/'           $CURRENT_SITE/environment-config.php
	sed -i 's/username_here/macenzie/'                $CURRENT_SITE/environment-config.php
	sed -i 's/password_here/password/'                $CURRENT_SITE/environment-config.php

	# todo svn/git co your plugins from wporg repo?
	# todo config values specific for multisite?
fi
