# ktbartholomew-infra

This is an **extremely WIP** set of Ansible playbooks intended to set up a Kubernetes cluster on pre-existing virtual machines. No cloud provisioning for you!

As I said, it's **extremely WIP**. The variable files are full of assumptions and/or specific IP addresses from my environment, and parts of the deployment are probably still broken and/or insecure.

## OK, so what's _not_ broken?

On a new existing VM, the playbooks should do the following:

* Create a new CA certificate on `localhost`
* Set up etcd on at least one node (not yet clustered etcd)
* Set up flannel on each node and configure the docker daemon to use the flannel network interface
* Run a kubelet that applies manifests from `/etc/kubernetes/manifests`, which should effectively create all the components of a master node for you.

## Getting Started

1. Create a `hosts` file with contents something like this:

  ```ini
  k8s-master-1 ansible_host=<ipaddress> ansible_ssh_user=<username>

  [ca]
  k8s-master-1

  [etcd]
  k8s-master-1

  [masters]
  k8s-master-1

  [workers]
  k8s-master-1
  ```

1. Run the `site.yml` playbook:
  ```sh
  ansible-playbook -i hosts site.yml
  ```

1. Cross your fingers!
