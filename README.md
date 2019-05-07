# docker-sogebot

[![CircleCI](https://circleci.com/gh/th0rtz/docker-sogebot/tree/master.svg?style=svg)](https://circleci.com/gh/th0rtz/docker-sogebot/tree/master)

> docker run -it -e SOGEBOT_PORT=20000 \
	-e SOGEBOT_WEB_USERNAME="toto" \
	-e SOGEBOT_WEB_PASSWORD="toto" \
	-e SOGEBOT_TOKEN="1243756SUGFQDS" \
	-e SOGEBOT_DOMAIN="stream.acme.lan" \
	-e SOGEBOT_MONGODB=true \
	-e SOGEBOT_DB_URL="127.0.0.1:27017/sogebot" \
	-e SOGEBOT_DEBUG=false \
	-p 20000:20000 \
	thortz/docker-sogebot:latest

############################################################

> SOGEBOT_PORT (*)
Provide the port of node server

> SOGEBOT_WEB_USERNAME (*)
User for web authentication

> SOGEBOT_WEB_PASSWORD (*)
Password for web authentication

> SOGEBOT_TOKEN (*)
Twitch api token

> SOGEBOT_DOMAIN (*)
Domain to access the web URL you can provide multiple domain 'twitch.acme.lan,stream.acme.lan,XXX.XXX.XXX.XXX'

> SOGEBOT_MONGODB (*)
False = Use NetDB storage
True = Use Mongodb storage

> SOGEBOT_DB_URL
Mongodb URL

> SOGEBOT_DEBUG (*)
Add some debug to the app.

/!\ For netdb use create docker volume to store db file.
> docker volume create sogebot_db
And add '-v sogebot_db:/app/db'