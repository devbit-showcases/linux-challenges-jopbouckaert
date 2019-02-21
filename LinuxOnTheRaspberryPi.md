## Linux on the Raspberry Pi challenges

### Build an operational Raspbian system

#### Create an SD card with Raspbian Stretch Lite
1. Go to <https://www.raspberrypi.org/downloads/raspbian/>
2. Download the `Raspbian Stretch Lite` image.
3. Download and install [balenaEtcher ](https://www.balena.io/etcher/)
4. Flash the image on an SD card using balenaEtcher.

#### Set up SSH connection
1. Add an `ssh` file to the `boot` partition.
2. Boot your pi.
3. Discover the ip address of the pi. This can be done with [Wireshark](https://www.wireshark.org/) using `bootp`as display filter.
4. On your pc set up a ssh connection using [Putty](https://www.putty.org/). Use the ip address of your pi on port 22.
5. login as `pi` with password `raspberry`.

#### Updating the system and change the default password
1. Run the commands below to update the system:
```
sudo apt-get update
sudo apt-get upgrade
```
2. Run the `passwd` command to update your password.

#### Changing hostname of the device
1. To change the hostname of the device we have to run this command:
```
sudo nano /etc/hostname
```
2. Replace the hostname with a sensible name.
3. Save the file.
4. Reboot your pi with `sudo reboot`.