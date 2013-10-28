# Description
Nupic cookbook. Takes care of setting up CentOS 6.4 or Amazon Linux to have
all the pre-requisites required by NuPIC.

# Requirements
CentOS 6.4 or Amazon Linux.
For building a vm instance, VirtualBox, Vagrant, and the vagrant-berkshelf plugin.

## Caveats
As of 2013.10.28, Vagrant 1.3.5 and VirtualBox 4.3.0 are confirmed to work together on OS 10.9.

# Usage
Install VirtualBox, Vagrant and vagrant-berkshelf on your machine.

## Using Vagrant directly
**vagrant up** - Downloads a basebox (when necessary) and updates it to nupic requirements for you. It will run chef solo every time you bring up the VM, so if you make changes to the nupic requirements list, they will be reverted when you run vagrant up or vagrant provision.

## Building a basebox
**rake base_box** - Builds the nupic Vagrant base box from scratch, then exports it to nupic.box. You can then add that to your vagrant installation with "vagrant box add nupic nupic.box", and refer to nupic in your other Vagrantfiles. You'll get the advantage of having all the nupic requirements installed, but not the penalty of having to wait for chef to run every start.
