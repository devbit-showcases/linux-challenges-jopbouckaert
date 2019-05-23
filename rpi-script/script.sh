sudo dhcpdump -i eth0 -h ^b8:27:eb | while read dump; do
    case $dump in
     *TIME:*)     
          time=$(echo $dump | mawk -W interactive '/TIME: / {print $2 " " $3}')
          ;;
     *IP:*)      
          mac=$(echo $dump | mawk -W interactive '/IP: / {gsub(/[()]/,"");print $3}')
          ;;
     *OPTION:\ \ 50\ *)
          ip=$(echo $dump | mawk -W interactive '{print $8} ')
          ;; 
     *OPTION:\ \ 12\ *)
          hostname=$(echo $dump | mawk -W interactive '{print $7}')
          ;;
     *-----*)
            echo "[${time}] ${mac} => ${ip} from ${hostname}" | tee ./devicelog.txt;
            curl --header 'Content-Type: application/json' --request POST -d "{\"update\":{\"name\":\"${name}\",\"mac\":\"${mac}\",\"ip_address\":\"${ip}\"}}" http://mydevices.labict.xyz/updates.json 2> /dev/null >> ./curllog.txt
          ;;
     *)
    esac
done