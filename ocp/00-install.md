## Install OpenShift in Ubuntu

### Download required software

```bash
## crc software
cd ~/Downloads
wget https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz
tar xvf crc-linux-amd64.tar.xz
mkdir -p ~/bin
cp ~/Downloads/crc-linux-*-amd64/crc ~/bin
export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc


## OC cli
# Ref : https://docs.openshift.com/container-platform/4.11/cli_reference/openshift_cli/getting-started-cli.html
wget https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-07-14-153706-ga/openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz
tar -xvf openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz
sudo mv oc kubectl /usr/local/bin/
oc version
```

### Install required softwares

```bash
sudo apt install qemu-kvm libvirt-daemon libvirt-daemon-system network-manager virtiofsd
```

## CRC Config

```bash
crc status --log-level debug
crc config set consent-telemetry no
crc config set network-mode user
crc config set cpus 10
crc config set memory 49152 #48gb
crc config set disk-size 120
crc config set enable-cluster-monitoring true
crc config set disable-update-check true
crc config set skip-check-vsock true
```


## Issue: CRC Unable to start (Ubuntu 22.04)

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


## Reference
CRC Setup - https://blog.gulfsoft.com/2021/03/increasing-crc-vm-disk-size-for.html
Install openshift - https://docs.redhat.com/en/documentation/red_hat_openshift_local/2.41/html/getting_started_guide/installing#installing_red_hat_openshift_local
