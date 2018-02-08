#!/bin/sh

sed -e 's/$RABBIT_USER/'$RABBIT_USER'/' \
	-e 's/$RABBIT_PASSWORD/'$RABBIT_PASSWORD'/' \
	-e 's/$RABBIT_HOST/'$RABBIT_HOST'/' \
	-e 's/$RABBIT_PORT/'$RABBIT_PORT'/' \
	-e 's/$RABBIT_VHOST/'$RABBIT_VHOST'/' \
	-i config.json

exec coffee index.coffee > /dev/stdout 2> /dev/stderr &
NODE_PID=$!

trap 'kill -TERM $NODE_PID' SIGTERM

wait $NODE_PID