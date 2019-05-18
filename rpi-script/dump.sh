#!/usr/bin/env bash
ip=0
mac=0
time=0
hostname=0
data=""
i=0
valid=false
sudo dhcpdump -i eth0 -h ^c0:ee:fb | mawk -W interactive '/OPTION:  50 / {print $8} /IP: / {gsub(/[()]/,"");print $3} /TIME: / {print $2 " " $3} /OPTION:  12 / {print $7}' | while read dump; do
        i=$((i+1))
        if [ "${i}" = "1" ];
        then
            time=$dump
        elif [ "${i}" = "2" ];
        then
            mac=$dump
        elif [ "${i}" = "3" ];
        then
            hostname=$dump
        elif [ "${i}" = "6" ];
        then
            ip=$dump
            if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                valid=true
            fi
            if [[ "$valid" = true ]]; then
                echo "[${time}] ${mac} => ${ip} from ${hostname}" | tee ./log.txt;
                curl -H 'Content-Type: application/json' -X POST -d "{\"update\":
                                    {\"name\":\"${hostname}\",
                                    \"mac\":\"${mac}\",
                                    \"ip_address\":\"${ip}\"}
                                }" http://192.168.1.110:3000/updates.json -o ./curllog.txt > /dev/null 2>&1
            fi
        elif [ "${i}" = "7" ];
        then
            valid=false;
            i=0;
        fi
    done