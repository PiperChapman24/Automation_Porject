tar -cvf Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /var/log/apache2

aws s3 cp ./Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar s3://upgradtanvi/Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar

webpage="/var/www/html"
if [[ ! -f ${webpage}/inventory.html ]];
then
	echo -e "LogType\tTimeCreated\tType\tsize">>${webpage}/inventory.html
fi
if [[ -f ${webpage}/inventory.html ]];
then
	size=$(du -h ./Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar | awk '{print $1}')
	echo -e "httpd-logs\t$(date '+%d%m%Y-%H%M%S')\ttar\t${size}">>${webpage}/inventory.html
fi

if [[ ! -f /etc/cron.d/automation ]];
then
	echo "0 10 * * * bash root/automation_project/automation1.sh">> /etc/cron.d/automation
fi


