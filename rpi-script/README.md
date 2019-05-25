# Raspberry Pi script

> A script that will detect raspberry pi's on your network

With the use of a `dhcpdump` this script is able to get the IP address, MAC address, timestamp and hostname of your raspberry pi.

## Run

Run the script with following command:

```bash
bash ./script.sh
```

OR make it executable:

```bash
chmod +x ./script.sh
./script.sh
```

## Output

This script will output into two files.

1. Device log:

    The `devicelog.txt` contains all the devices that has been found.

2. Curl log:

    The `curllog.txt` contains all the responses from the `my-devices` API.

## Meta

Jop Bouckaert – [@Jop09071999](https://twitter.com/Jop09071999) – jop.bouckaert@outlook.com

Distributed under the Apache-2.0 license. See `LICENSE` for more information.

[https://github.com/jopbouckaert](https://github.com/jopbouckaert)
