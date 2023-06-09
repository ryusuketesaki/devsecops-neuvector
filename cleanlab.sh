#! /bin/bash

source mylab_aws_region.sh
source mylab_vm_prefix.sh
source setup/_awsls_functions.sh
cat setup/_banner.txt
echo
echo "Welcome to SUSE Rancher DevSecOps Hands-on Lab on AWS Lightsail ..."
echo

function cleanup() {
  delete-vm $VM_PREFIX-rancher
  delete-vm $VM_PREFIX-devsecops 
  rm -f {mylab.*,ssh-mylab*.*,mylab*.txt,mylab-ssh-config,mylab_vm_prefix.sh,mylab*.sh,*.log}
  echo "Your lab environment has been cleaned up."
}

echo "This script will clean up all the VMs provisioned in your AWS Lightsail environment."
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) cleanup;; 
  n|N ) echo "Aborted.";;
  *   ) echo "invalid";;
esac

