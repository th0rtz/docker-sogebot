FROM debian:9

RUN apt-get update

RUN apt-get install -y git unzip wget curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /app && \
	cd /app && \
	wget https://github.com/sogehige/sogeBot/releases/download/7.4.0/sogeBot-7.4.0.zip && \
	unzip -d . sogeBot-7.4.0.zip && \
	rm sogeBot-7.4.0.zip

WORKDIR /app

RUN npm install

EXPOSE 20000/tcp

ADD docker-entrypoint.sh /app/docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
