#!/usr/bin/env bash
flag=false
valid=false
i=0
touch ./filter.txt
file="./filter.txt"

while :
do
    tail -n 3 ./output.txt > ./filter.txt
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
        fi
    done < "$file"
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        valid=true
    fi
    if [[ "$flag" = true && "$valid" = true ]]; then
         echo "[${date}] ${mac} => ${ip}";
         flag=false;
         valid=false;
    fi
    i=0
    valid=false
done