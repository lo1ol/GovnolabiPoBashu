#!/bin/bash

source conf.conf

openssl req -x509 -sha256 -nodes -days $TRUSTED_DAYS -newkey rsa:2048 -keyout $PRIV -out $CERT -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$COMPANY/OU=$ORG_UNIT/CN=$COMMON_NAME"
