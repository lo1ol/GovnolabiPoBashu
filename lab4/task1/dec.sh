#!/bin/bash

source conf.conf

WORK_DIR=$PWD
cd $CONTROL_DIR

for DATA_PATH in `ls`
do
	tar xf $DATA_PATH
	DATA_PATH=${DATA_PATH::-4}
	echo $DATA_PATH
	openssl cms -verify -CAfile $CERT -inform DER -in $DATA_PATH.sig -binary -content $DATA_PATH
	rm $DATA_PATH.tar $DATA_PATH.sig
done

cd $WORK_DIR
