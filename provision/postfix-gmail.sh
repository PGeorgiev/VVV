echo "Configuring outbound mail to relay through Gmail"

RELAYHOST="relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_CAfile = /etc/postfix/cacert.pem
smtp_use_tls = yes"

echo -n "Enter full username (e.g., foo@gmail.com): "
read USERNAME
echo -n "Enter password: "
read PASSWORD

sudo sed -i '/relayhost/d' /etc/postfix/main.cf
sudo echo -e "$RELAYHOST" >> /etc/postfix/main.cf

sudo echo "[smtp.gmail.com]:587 $USERNAME:$PASSWORD" >> /etc/postfix/sasl_passwd_tmp
sudo chmod 400 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd
cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | sudo tee -a /etc/postfix/cacert.pem_tmp
sudo /etc/init.d/postfix reload

echo "Postfix configuration done."