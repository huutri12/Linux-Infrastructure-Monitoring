#!/bin/bash
# Kiểm tra dịch vụ Nginx và MySQL
services=("nginx" "mysql")
for service in "${services[@]}"; do
    if ! systemctl is-active --quiet $service; then
        echo "$(date): $service is down. Restarting..." >> /var/log/sys_health.log
        sudo systemctl start $service
    fi
done
