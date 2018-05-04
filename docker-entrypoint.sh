#!/bin/bash
set -euo pipefail

envs=(
	SOGEBOT_PORT
	SOGEBOT_WEB_USERNAME
	SOGEBOT_WEB_PASSWORD
	SOGEBOT_BOT_NAME
	SOGEBOT_BOT_OAUTH
	SOGEBOT_BOT_BROADCASTER_USERNAME
	SOGEBOT_BOT_BROADCASTER_OAUTH
	SOGEBOT_BOT_CLIENTID
	SOGEBOT_DOMAIN
	SOGEBOT_MONGODB_SERVER
)

#Check if var is empty and set default value if not set
#haveconfig=
#for e in "${envs[@]}"; do
#	if [ -z "$haveConfig" ] && [ -n "${!e}" ]; then
#		haveConfig=1
#	fi
#done


#Copy the template config to the good place
cp config.example.json config.json

# Check Mongo Var and enable it if set

if [ -n $SOGEBOT_MONGODB_SERVER ]; then
	sed -i "s/\"type\": \"nedb\",.*\"type\": \"mongodb\",/g" config.json
	sed -i "s/mongodb:\/\/localhost:27017\/your-db-name.*mongodb:\/\/$SOGEBOT_MONGODB_SERVER/g" config.json
done

# Sed for replacing all the VAR

	sed -i "s/bot_username_here.*/$SOGEBOT_BOT_NAME\",/g" config.json
	sed -i "s/bot_oauth_here.*/$SOGEBOT_BOT_OAUTH\",/g" config.json
	sed -i "s/broadcaster_username_here.*/$SOGEBOT_BOT_BROADCASTER_USERNAME\",/g" config.json
	sed -i "s/broadcaster_oauth_here.*/$SOGEBOT_BOT_BROADCASTER_OAUTH\",/g" config.json
	sed -i "s/1wjn1i3792t71tl90fmyvd0zl6ri2vg.*/$SOGEBOT_BOT_CLIENTID\"/g" config.json
	sed -i "s/20000.*/$SOGEBOT_PORT,/g" config.json
	sed -i "s/\"username\": \"admin\",.*/\"username\": \"$SOGEBOT_WEB_USERNAME\",/g" config.json
	sed -i "s/\"password\": \"admin\",.*/\"password\": \"$SOGEBOT_WEB_PASSWORD\",/g" config.json
	sed -i "s/\"domain\": \"localhost\",.*/\"domain\": \"$SOGEBOT_DOMAIN\",/g" config.json

npm start

