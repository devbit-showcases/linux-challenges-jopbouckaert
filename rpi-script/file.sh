#!/usr/bin/env bash
flag=false
valid=false
i=0
mac_long=""
touch ./filter.txt
file="./filter.txt"

while :
do
    tail -n 4 ./output.txt > ./filter.txt
    while IFS= read line; do
        i=$((i+1))
        if [ "${i}" = "1" ];
        then
            if [ "${line}" = "${date}" ];
            then
                date=$line
                flag=false
            else
                flag=true
                date=$line
            fi
        elif [ "${i}" = "2" ];
        then
            mac=$line
        elif [ "${i}" = "3" ];
        then
            ip=$line
        elif [ "${i}" = "4" ];
        then
            name=$line
        fi
    done < "$file"
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        valid=true
    fi
    if [[ "$flag" = true && "$valid" = true ]]; then
         echo "[${date}] ${mac} => ${ip} from ${name}";
         curl -H 'Content-Type: application/json' -X POST -d "{\"update\":{\"name\":\"${name}\",\"mac\":\"${mac}\",\"ip_address\":\"${ip}\"}}" http://172.16.102.20:3000/updates.json -o ./jsondump.txt > /dev/null 2>&1
         flag=false;
         valid=false;
    fi
    i=0
    valid=false
done