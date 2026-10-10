# Remote Docker on LAN

Docker Host

- OS: Ubuntu Server 24.04
- RAM: 16GB
- Disk: 300GB

## No Sleep

```sh
sudo nano /etc/systemd/logind.conf
```

```conf
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
LidSwitchIgnoreInhibited=no
```

```sh
sudo service systemd-logind restart
```

## Static IP Configuration

Edit the existing Netplan file

```sh
sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak
sudo nano /etc/netplan/00-installer-config.yaml
```

Update the `wlo1` settings below, keeping Wi-Fi name, password, and any other interface settings

```yaml
network:
  version: 2
  wifis:
    wlo1:
      dhcp4: false
      addresses:
        - 192.168.1.37/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses:
          - 192.168.1.1
      access-points:
        "<wifi-name>":
          password: "<wifi-password>"
```

Validate and apply from the Ubuntu machine's local console, since changing the IP can disconnect SSH.

Press Enter to accept when connectivity works.

```sh
sudo chmod 600 /etc/netplan/00-installer-config.yaml
sudo netplan generate
sudo netplan try
```

Check the address and connection

```sh
ip -4 address show wlo1
ping -c 3 192.168.1.1
resolvectl query ubuntu.com
```

## Enable SSH Server

Run this command on the Ubuntu machine to install the SSH server, start it, and enable it at boot:

```sh
make start-ssh-server
```

If UFW is active, allow SSH with `sudo ufw allow OpenSSH`.
Find the machine's LAN IP address with `hostname -I`, then connect from another
computer using an existing account on the Ubuntu machine:

```sh
ssh <username>@<machine-ip>
```
