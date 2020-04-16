FROM debian:9

ENV SOGEBOT_VERSION="10.14.1"

RUN apt-get update && \
	apt-get install -y git unzip wget curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /app && \
	cd /app && \
	wget -q https://github.com/sogehige/sogeBot/releases/download/$SOGEBOT_VERSION/sogeBot-$SOGEBOT_VERSION.zip && \
	unzip -d . sogeBot-$SOGEBOT_VERSION.zip && \
	rm sogeBot-$SOGEBOT_VERSION.zip

WORKDIR /app

RUN npm install

EXPOSE 20000/tcp

ADD docker-entrypoint.sh /app/docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
