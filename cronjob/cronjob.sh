#!/usr/bin/env bash
MAC=$(cat /sys/class/net/eth0/address)
FREEDISK=$(df / -h | awk 'NR>1{print $4}')
TOTALDISK=$(df / -h | awk 'NR>1{print $2}')
FREERAM=$(free -h | awk 'NR==2{print $4}')
TOTALRAM=$(free -h | awk 'NR==2{print $2}')
KERNEL=$(uname -r)
HOSTNAME=$(cat /etc/hostname)
UPTIME=$(uptime -p)

echo "{
\"stat\": {
  \"mac\": \"${MAC}\",
  \"disk\": {
    \"free\": \"${FREEDISK}\",
    \"total\": \"${TOTALDISK}\"
  },
  \"memory\": {
    \"free\": \"${FREERAM}\",
    \"total\": \"${TOTALRAM}\"
  },
  \"kernel\": \"${KERNEL}\",
  \"hostname\": \"${HOSTNAME}\",
  \"uptime\": \"${UPTIME}\"
  }
}" >> /home/jop/linux_projects/linux-challenges-jopbouckaert/cronjob/cronjob.txt


curl --header 'Content-Type: application/json' -w "\n" --request POST -d "{\"stat\":{\"mac\": \"${MAC}\",\"disk\": {\"free\": \"${FREEDISK}\",\"total\": \"${TOTALDISK}\"},\"memory\": {\"free\": \"${FREERAM}\",\"total\": \"${TOTALRAM}\"},\"kernel\": \"${KERNEL}\",\"hostname\": \"${HOSTNAME}\",\"uptime\": \"${UPTIME}\"}}" http://mydevices.labict.xyz/stats.json 2> /dev/null >> ./statlog.txt
