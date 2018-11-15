# automation
Repository for anything automation

---

## Requirements
Prerequisite packages that must be installed are: aws-cli, python (both versions to be safe), ansible, and terraform. aws-cli should contain your aws_secret_access_key and aws_access_key_ids. See improvements for security concerns. Ansible config may need to be configured to appropriately address the hosts file.

---

## Ansible

### inet4031
Ansible currently SSH's into two ec2 instances (Ubuntu 16.04 Server) creating one as an NFS server and one as an NFS client. Since the Ubuntu 16.04 Server instances do not come with python2.7 installed, the playbook first installs it, then begins the NFS installation. The NFS server is first created and configured appropriately. The client installs nfs-common configures it's fileshare connection, then creates a directory in the NFS file share to prove that it successfully connected.

The playbook assumes that the AWS configuration is set up correctly with NFS ports being opened.

---

## Terraform

### inet4007
Currently the terraform folder contains a project for inet4007 labs 9 & 10. This includes creating 4 subnets (two public, and two private) attached to one VPC. Each subnet contains two ec2 instances totaling to 8 instances. These instances use a Ubuntu 16.04 Server image.

### inet4031
inet4031 creates a simple VPC that contains 6 Ubuntu 16.04 Server images, one being intended for a NFS Server and five others for NFS clients.

#### Instructions
`git clone https://github.com/1337moose/automation.git`

`cd automation/terraform/inet4031`

`terraform init`

`terraform plan`

`terraform apply`

Uncomment lines in output.tf

`terraform refresh`

`DONE!`


## Improvements
- This document should be improved to better document AWS key and IAM security along with implementing this repository's projects with such security.
- Update inet4031 Terraform readme to better describe configuration
- Creating a script that fetches host information from Terraform (output) and puts it into a Ansible host file.
- Restructure directories to have Projects be a parent directory and the automation tool be sub-directories within each project


### References
- [create-aws-infrastructure-with-terraform](https://jee-appy.blogspot.com/2018/07/create-aws-infrastructure-with-terraform.html)
- [Automating with Ansible: Building a VPC](https://medium.com/@tomwwright/automating-with-ansible-building-a-vpc-c252944d3d2e)
