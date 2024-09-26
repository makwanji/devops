# OpenShift

## Install OpenShift in Ubuntu

### Install required softwares

Ref: https://docs.redhat.com/en/documentation/red_hat_openshift_local/2.41/html/getting_started_guide/installing#installing_red_hat_openshift_local

```bash
sudo apt install qemu-kvm libvirt-daemon libvirt-daemon-system network-manager
```

```bash
crc status --log-level debug
crc config set consent-telemetry no
```


## Issue with Ubuntu 22.04

```bash
#https://github.com/crc-org/crc/wiki/VPN-support--with-an--userland-network-stack
crc delete
crc cleanup
rm -Rf $HOME/.crc
sudo rmmod vmw_vsock_vmci_transport
sudo modprobe vhost_vsock
crc setup
crc start
crc setup
```
