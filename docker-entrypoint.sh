#!/bin/bash
set -euo pipefail

envs=(
	SOGEBOT_PORT
	SOGEBOT_USERNAME
	SOGEBOT_PASSWORD
	SOGEBOT_BOT_NAME
	SOGEBOT_BOT_OAUTH
	SOGEBOT_BOT_BROADCASTER_USERNAME
	SOGEBOT_BOT_BROADCASTER_OAUTH
	SOGEBOT_BOT_CLIENTID
)

SOGEBOT_USERNAME=toto
SOGEBOT_BOT_OAUTH=AZERTYUIOP1234567890

cp config.example.json config.json

sed -i "s/bot_username_here.*/$SOGEBOT_USERNAME\"/g" config.json
sed -i "s/bot_oauth_here.*/$SOGEBOT_BOT_OAUTH\"/g" config.json

sleep 60000

#npm start
