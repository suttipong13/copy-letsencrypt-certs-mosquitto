# Copy LetsEncrypt Cert to Mosquitto 

- install and auto renew LetsEncrypt
- config mosquitto certs 
```
    listener 8883
    protocol protocal_name
    certfile /etc/mosquitto/certs/server.pem
    cafile  path_to_ca
    keyfile /etc/mosquitto/certs/server.key
    dhparamfile path_to_daparam
```
- copy mosquitto-copy.sh to 
    - /etc/letsencrypt/renewal-hooks/deploy/
- edit MY_DOMAIN
- change file permission
    - sudo chmod +x /etc/letsencrypt/renewal-hooks/deploy/mosquitto-copy.sh
- if use nginx add command at the end of the file /etc/letsencrypt/renewal/your_domain_name.conf
```
    pre_hook = sudo systemctl stop nginx
    post_hook = sudo systemctl start nginx
```
ref : https://www.howtoforge.com/how-to-install-and-secure-the-mosquitto-mqtt-messaging-broker-on-ubuntu-20-04/