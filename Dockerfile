# Select Source OS
FROM ubuntu:12.04.5

# Author
MAINTAINER setswei <kyle.hartigan@cybercrysis.net.au>

# Update APT and install Dependencies
RUN apt-get update -qq
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible

# Create Ansible Inventory File
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

