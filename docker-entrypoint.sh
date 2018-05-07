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
	SOGEBOT_DEBUG
)

#Check last version
lastver=`curl -s https://github.com/sogehige/sogeBot/releases\ |grep "/sogehige/sogeBot/releases/tag/" | grep -o -P '(?<=>).*(?=<)' | head -n 1|cut -d ' ' -f2`

#Check if var is empty and set default value if not set

#Copy the template config to the good place
cp config.example.json config.json

# Check Mongo Var and enable it if set

if [ -n $SOGEBOT_MONGODB_SERVER ]; then
	var_srv=`echo $SOGEBOT_MONGODB_SERVER |cut -d '/' -f1`	
	var_port=`echo $SOGEBOT_MONGODB_SERVER |cut -d '/' -f2`
	sed -i "s/\"type\": \"nedb\",.*/\"type\": \"mongodb\",/g" config.json
	sed -i "s/localhost:27017\/your-db-name.*/$var_srv\/$var_port\"/g" config.json
fi

if [ $SOGEBOT_DEBUG == 'true' ]; then
	sed -i "s/\"all\": false,.*/\"all\": true,/g" config.json
	sed -i "s/\"console\": false.*/\"console\": true/g" config.json
fi
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

npm install
npm start

