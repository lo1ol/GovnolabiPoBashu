#!/bin/bash

source conf.conf

WORK_DIR=$PWD
cd $CONTROL_DIR

for DATA_PATH in `ls`
do
	echo $DATA_PATH
	openssl cms -sign -signer $CERT -inkey $PRIV -binary -outform DER -in $DATA_PATH -out $DATA_PATH.sig
	tar cf $DATA_PATH.tar $DATA_PATH $DATA_PATH.sig
	rm $DATA_PATH $DATA_PATH.sig
done

cd $WORK_DIR
