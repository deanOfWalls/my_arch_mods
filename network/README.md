# Network Bridge Configuration README

This README documents the setup of a network bridge on an Arch Linux system using `systemd-networkd`. 
The bridge, named `br0`, allows a Windows 10 VM to access the local area network (LAN) directly.

## Configuration Overview

The setup involves three configuration files in the `/etc/systemd/network/` directory:

- `br0.netdev`: Defines the bridge network device.
- `br0.network`: Applies network settings to the bridge.
- `br0-member.network`: Attaches the physical network interface to the bridge.

## File Descriptions

### 1. `br0.netdev`

Defines the virtual network bridge.

[NetDev]
Name=br0
Kind=bridge

**Details:**
- `Name=br0`: Names the bridge interface `br0`.
- `Kind=bridge`: Specifies the type of device as a network bridge.

### 2. `br0.network`

Configures the network settings for the bridge.

[Match]
Name=br0

[Network]
DHCP=yes

**Details:**
- `[Match] Name=br0`: Targets the configuration to the `br0` interface.
- `DHCP=yes`: Enables DHCP on `br0` to obtain an IP address and network settings automatically from a DHCP server.

### 3. `br0-member.network`

Associates the physical network interface (`enp7s0`) with the bridge.

[Match]
Name=enp7s0

[Network]
Bridge=br0

**Details:**
- `[Match] Name=enp7s0`: Specifies the physical network interface to be included in the bridge.
- `Bridge=br0`: Adds `enp7s0` to the `br0` bridge, enabling it to participate in network traffic through the bridge.

## Operational Flow

- `br0` acts as a virtual network switch connecting `enp7s0` and the VM's network interface.
- The VM, using `br0`, appears on the LAN as a regular network device, facilitating direct communication with other devices on the network.

## Activation

After creating these files, activate the configuration:

sudo systemctl enable systemd-networkd
sudo systemctl restart systemd-networkd


Make sure the VM's network adapter is configured to use the `br0` bridge.

