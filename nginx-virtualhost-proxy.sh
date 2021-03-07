#!/bin/bash

if [ "$(whoami)" != 'root' ]; then
	echo "You have no permission to run $0 as non-root user. Use sudo"
	exit 1;
fi

domain=$1
rootPath=$2
sitesEnable='/etc/nginx/sites-enabled/'
sitesAvailable='/etc/nginx/sites-available/'
serverRoot='/srv/'

while [ "$domain" = "" ]
do
	echo "Please provide domain:"
	read domain
done


if [ -e $sitesAvailable$domain ]; then
	echo "This domain already exists.\nPlease Try Another one"
	exit;
fi


if [ "$rootPath" = "" ]; then
	rootPath=$serverRoot$domain
fi

if ! [ -d $sitesEnable ]; then
	mkdir $sitesEnable
	chmod 777 $sitesEnable
fi

if ! [ -d $sitesAvailable ]; then
	mkdir $sitesAvailable
	chmod 777 $sitesAvailable
fi

configName=$domain

if ! echo "server {
listen      80;
server_name $domain; www.$domain.com;
location / {
try_files $uri $uri/ /index.php?$query_string;
}location /blog {
proxy_pass http://blog.domain.com;proxy_http_version                 1.1;
proxy_cache_bypass                 $http_upgrade;

# Proxy headers
proxy_set_header Upgrade           $http_upgrade;
proxy_set_header Connection        'upgrade';
proxy_set_header Host              $host;
proxy_set_header X-Real-IP         $remote_addr;
proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
proxy_set_header X-Forwarded-Host  $host;
proxy_set_header X-Forwarded-Port  $server_port;

# Proxy timeouts
proxy_connect_timeout              60s;
proxy_send_timeout                 60s;
proxy_read_timeout                 60s;
}" > $sitesAvailable$configName
then
	echo "There is an ERROR create $configName file"
	exit;
else
	echo "New Virtual Host Created"
fi

if ! echo "127.0.0.1	$domain" >> /etc/hosts
then
	echo "ERROR: Not able write in /etc/hosts"
	exit;
else
	echo "Host added to /etc/hosts file"
fi

ln -s $sitesAvailable$configName $sitesEnable$configName

service nginx restart

echo "Complete! \nYou now have a new Virtual Host \nYour new host is: http://$domain \nAnd its located at $rootPath"
exit;



