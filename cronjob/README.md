# Cronjob

> Cronjob that sends stats with POST request

This cronjob will POST various stats of your device.
Stats that can be posted are:

-   MAC address
-   disk
    -   free disk space
    -   total disk space
-   memory
    -   free memory
    -   total memory
-   kernel
-   hostname
-   uptime

## Installation

Paste this in your `crontab -e` file:

```bash
* * * * * /home/`PATH_TO_THIS_SCRIPT`/cronjob.sh
```

You can set the timestamp of the POST request by changing te wildcard stars:

```
 * * * * *
 ┬ ┬ ┬ ┬ ┬
 │ │ │ │ │
 │ │ │ │ │
 │ │ │ │ └───── day of week (0 - 7) (0 to 6 are Sunday to Saturday, or use names; 7 is Sunday, the same as 0)
 │ │ │ └────────── month (1 - 12)
 │ │ └─────────────── day of month (1 - 31)
 │ └──────────────────── hour (0 - 23)
 └───────────────────────── min (0 - 59)
```

Make sure to make the script executable:

```bash
chmod +x ./cronjob.sh
```

## Example

An example of the json that is posted to the API:

```json
{
    "stat": {
        "mac": "AA:BB:CC:DD:EE:FF",
        "disk": {
            "free": "12G",
            "total": "15G"
        },
        "memory": {
            "free": "803M",
            "total": "927M"
        },
        "kernel": "4.14.98-v7+",
        "hostname": "joppi",
        "uptime": "1609.05"
    }
}
```

## Meta

Jop Bouckaert – [@Jop09071999](https://twitter.com/Jop09071999) – jop.bouckaert@outlook.com

Distributed under the Apache-2.0 license. See `LICENSE` for more information.

[https://github.com/jopbouckaert](https://github.com/jopbouckaert)
