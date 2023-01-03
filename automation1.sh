tar -cvf Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /var/log/apache2

aws s3 cp ./Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar s3://upgradtanvi/Tanvi-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar
