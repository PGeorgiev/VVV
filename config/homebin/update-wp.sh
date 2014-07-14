#!/bin/bash

# Update specified WordPress installations to the latest release (or a specified release)
# Usage: update-wp.sh [version]
# (optional) version (e.g. 3.9-beta1, 3.9-RC1) to update Core to. Defaults to the latest stable release.

# todo test DOMAINS=( wordcamp.dev wp.dev wpms.dev )
DOMAINS=( wpms.dev )
CORE_VERSION=${1}

if [ -n "$CORE_VERSION" ]; then
        CORE_VERSION="--version=$CORE_VERSION"
fi

# todo wpcli installs core themes in /content dir instead of /wordpress/wp-content

for i in "${DOMAINS[@]}"; do
        WPCLI="/usr/local/bin/wp --path=wordpress --url='http://$i'"

        echo ""
        echo "Updating Core, plugins and themes on $i"
        cd /srv/www/$i

        # todo this runs w/out errors, but the commands don't output anything
        $WPCLI plugin list

        ## Check for latest versions of plugins. Normally this happens twice a day via cron, but we want to force it to get the latest updates now.
        ## TODO: submit pull request to add this as option for wpcli commands
        ## TODO: not working for plugins, maybe not themes eitehr. look at db, it's not the right respons from api or something
                ## maybe it is working. do more testing right after new versions are released.
        ## TODO: after get working, still need to test with real updates from API, like 1 minute after you check in a new version of BGMP or GAPUP
        $WPCLI eval 'wp_version_check( array(), true );'
        $WPCLI eval 'delete_site_transient( "update_plugins" );'
        $WPCLI eval 'wp_update_plugins();'
        $WPCLI eval 'delete_site_transient( "update_themes" );'
        $WPCLI eval 'wp_update_themes();'

        ## Run the updaters
        $WPCLI core update $CORE_VERSION
        $WPCLI plugin update-all
        $WPCLI theme update-all
done

echo ""
exit 0