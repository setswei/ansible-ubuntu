# Select Source OS
FROM ubuntu

# Author
MAINTAINER setswei <kyle.hartigan@cybercrysis.net.au>

# Update APT and install Dependencies
RUN apt-get update -qq && \
    apt-get install -y software-properties-common && \

    # Add Ansible Repo and Install Ansible
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \

    # Aot Clean up
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* && \

    # Create Ansible Inventory File
    echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

