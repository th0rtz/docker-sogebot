# WIP : docker-sogebot

> docker run -it -e SOGEBOT_PORT=20000 \
	-e SOGEBOT_WEB_USERNAME="toto" \
	-e SOGEBOT_WEB_PASSWORD="toto" \
	-e SOGEBOT_BOT_NAME="TOTOBOT" \
	-e SOGEBOT_BOT_OAUTH="oauth:AZERTYUIOP" \
	-e SOGEBOT_BOT_BROADCASTER_USERNAME="thortz" \
	-e SOGEBOT_BOT_BROADCASTER_OAUTH="oauth:AZERTYUIOP" \
	-e SOGEBOT_BOT_CLIENTID="1243756SUGFQDS" \
	-e SOGEBOT_DOMAIN="stream.acme.lan" \
	-e SOGEBOT_MONGODB_SERVER="127.0.0.1:27017/sogebot" \
	-e SOGEBOT_DEBUG=false \
	-p 20000:20000 \
	thortz/docker-sogebot:latest


- SOGEBOT_WEB_USERNAME & _PASSWORD
Set webui password for sogebot

- SOGEBOT_BOT_NAME
Get some sweet name for your bot

- SOGEBOT_BOT_OAUTH & SOGEBOT_BOT_BROADCASTER_OAUTH & SOGEBOT_BOT_CLIENTID
See sogebot documentation at "https://github.com/sogehige/sogeBot/blob/master/docs/configuration/clientid.md"

- SOGEBOT_DOMAIN
Provide the FQDN witch the webui will be.

- SOGEBOT_MONGODB_SERVER
For the use of mongoDB in place of netDB


