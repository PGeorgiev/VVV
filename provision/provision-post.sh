echo "Running provision-post.sh"
sudo /etc/cron.daily/mlocate

sudo wget http://codeception.com/codecept.phar -O /srv/tools/codecept.phar
