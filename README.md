### Prerequisites
* Vagrant
* Ansible

### Note
I use Vagrant + Vagrant Libvirt because my lab environment using KVM Hypervisor. :)
You need to change provider if you use other hypervisor.

### How to use
```bash
root@mylab$ vagrant up
```
Above command will create VM + Kubernetes Cluster using kubeadm --> Calico CNI and Containerd.
