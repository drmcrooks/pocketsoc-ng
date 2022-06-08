#! /bin/bash

key_location="/usr/local/apache2/conf/cert"

openssl req -new -x509 -nodes -out $key_location/server.crt -keyout $key_location/server.key -subj '/CN=localhost'

ls $key_location
