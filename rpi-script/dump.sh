#!/usr/bin/env bash
touch ./output.txt
sudo dhcpdump -i eth0 -h^b8:27:eb | mawk -W interactive '/OPTION:  50 / {print $8} /OPTION:  61 / {print $6} /TIME: / {print $2 " " $3}'  | tee ./output.txt