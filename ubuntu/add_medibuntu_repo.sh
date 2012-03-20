#!/bin/bash

# TODO: verify that this is indeed Ubuntu
# uname -a | grep -i ubuntu
# another example may be in the SipX configuration script

# TODO: verify that the repository doesn't already exist (spend some time on this)
# otherwise it is added multiple times

# Add the Medibuntu repository.
echo deb http://packages.medibuntu.org/ karmic free non-free | sudo tee -a /etc/apt/sources.list

# Add the verification key
wget -q http://packages.medibuntu.org/medibuntu-key.gpg -O- | sudo apt-key add -

# Update the installation :
apt-get update

# other resources
# http://www.unixmen.com/linux-tutorials/501-enchance-your-ubuntu904-and-910-karmic-koala-repositories-with-midibuntu
