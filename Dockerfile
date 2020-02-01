FROM node:alpine

ENV RABBIT_HOST=rabbit \
	RABBIT_PORT=5672 \
	RABBIT_VHOST=taiga \
	RABBIT_USER=taiga \
	RABBIT_PASSWORD=password \
	TAIGA_SECRET=secret

WORKDIR /usr/src/

RUN apk add --no-cache --virtual .build-dependencies git \
	&& git clone https://github.com/Alivekeep/taiga-events taiga-events && cd taiga-events \
	&& apk del .build-dependencies \
	&& yarn --production

WORKDIR /usr/src/taiga-events

EXPOSE 8888

COPY .env.example ./.env
COPY start.sh /

CMD ["/start.sh"]
