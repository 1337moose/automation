# inet4031
---
## Overview
This is an ansible playbook that installs NFS on an arbitrary number of servers and clients. Simply add the IP addresses of the server and clients to the host file. Currently, the name scheme was implemented assuming LDAP was going to be implemented on the same servers. This is going to be removed

## Procedure
After running `install_py_nfs.yaml`, `install_python.yaml` is first run. Ansible connects to the server and clients and installs python2.7. This is because ansible uses python2.7 to perform its functions. This is performed in `install_python.yaml`.

TO BE UPDATED
---

### Improvements
- Remove 'ldap' from all function names
- Implement install_nfs_client.yaml to use server private IP rather than public IP
