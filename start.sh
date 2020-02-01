#!/bin/sh

sed -e 's/$RABBIT_USER/'$RABBIT_USER'/' \
	-e 's/$RABBIT_PASSWORD/'$RABBIT_PASSWORD'/' \
	-e 's/$RABBIT_HOST/'$RABBIT_HOST'/' \
	-e 's/$RABBIT_PORT/'$RABBIT_PORT'/' \
	-e 's/$RABBIT_VHOST/'$RABBIT_VHOST'/' \
	-e 's/$TAIGA_SECRET/'$TAIGA_SECRET'/' \
	-i .env

export NODE_ENV=production
exec node ./src/index.js > /dev/stdout 2> /dev/stderr
