#!/bin/bash
set -euo pipefail

envs=(
	SOGEBOT_PORT
	SOGEBOT_WEB_USERNAME
	SOGEBOT_WEB_PASSWORD
	SOGEBOT_DOMAIN
	SOGEBOT_TOKEN
	SOGEBOT_MONGODB_SERVER
	SOGEBOT_DEBUG
)

#Check last version
lastver=`curl -s https://github.com/sogehige/sogeBot/releases\ |grep "/sogehige/sogeBot/releases/tag/" | grep -o -P '(?<=>).*(?=<)' | head -n 1|cut -d ' ' -f2`
echo "- Last version Online : $lastver"

#Check if var is empty and set default value if not set

#Copy the template config to the good place
echo "- Copying config example to main config"
cp config.example.json config.json


# Check Mongo Var and enable it if set
echo "- Configuring Database"
if [ -n $SOGEBOT_MONGODB_SERVER ]; then
	var_srv=`echo $SOGEBOT_MONGODB_SERVER |cut -d '/' -f1`	
	var_db=`echo $SOGEBOT_MONGODB_SERVER |cut -d '/' -f2`
	sed -i "s/\"type\": \"nedb\",.*/\"type\": \"mongodb\",/g" config.json
	sed -i "s/localhost:27017\/your-db-name.*/$var_srv\/$var_db\"/g" config.json
fi

# Enable  debug sogebot
if [ $SOGEBOT_DEBUG == 'true' ]; then
	echo "- DEBUG : ENABLE"
	sed -i "s/\"all\": false,.*/\"all\": true,/g" config.json
	sed -i "s/\"console\": false.*/\"console\": true/g" config.json
fi
# Sed for replacing all the VAR
	sed -i "s/\"username\": \"admin\",.*/\"username\": \"$SOGEBOT_WEB_USERNAME\",/g" config.json
	sed -i "s/\"password\": \"admin\",.*/\"password\": \"$SOGEBOT_WEB_PASSWORD\",/g" config.json
	echo "- Setting configuration"
	sed -i "s/20000.*/$SOGEBOT_PORT,/g" config.json
	sed -i "s/\"domain\": \"localhost\",.*/\"domain\": \"$SOGEBOT_DOMAIN\",/g" config.json
	sed -i "s/\"token\": \"7911776886\",.*/\"token\": \"$SOGEBOT_TOKEN\",/g" config.json
	echo "- Configuration Ok"

echo "- Starting npm install"
npm install
echo "- Starting npm"
npm start

