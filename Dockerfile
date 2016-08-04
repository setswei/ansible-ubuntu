# Select Source OS
FROM ubuntu:12.04.5

# Author
MAINTAINER setswei <kyle.hartigan@cybercrysis.net.au>

# Update APT and install Dependencies
RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu precise multiverse" && \
    apt-get update -qq && \
    apt-get install -y software-properties-common python-software-properties && \

    # Add Apt Repository and install Ansible
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \

    # Apt Cleanup
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* && \

    # Create Ansible Inventory File
    echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

