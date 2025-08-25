# Server Automation

This is automated provisioning of cloud servers using Terraform and Hetzner Cloud, with Ansible handling post-provisioning configuration.

## What I Built

- Automated deployment of Ubuntu servers on Hetzner Cloud.
- Scripted generation of an Ansible inventory file.
- Integrated Ansible playbooks for server setup.

## How I Use It

I set my Hetzner Cloud token and SSH key in `terraform.tfvars`, then run `terraform apply` to provision servers and trigger Ansible configuration.

## Tools & Services

- Terraform
- Ansible
- Hetzner Cloud

## Project Structure

- `terraform/main.tf`: Infrastructure code for server provisioning.
- `ansible/inventory.ini`: Auto-generated inventory for Ansible.
- `ansible/playbook.yml`: Playbook for configuring the servers.
