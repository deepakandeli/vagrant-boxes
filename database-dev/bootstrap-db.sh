#!/bin/bash

# START Bootstrap script for Database Dev Box provisioning

# core packages
sudo apt-get install ksh # for DB2 client install

# Install DB2 Client
#  client download from http://www-01.ibm.com/support/docview.wss?uid=swg21385217
sudo mkdir /opt/ibm
sudo chown -R vagrant:vagrant /opt/ibm

# copy client install source to/opt/ibm then extract
cp /vagrant/ibm_data_server_driver_package_linuxia32_v10.5.tar.gz /opt/ibm
gunzip ibm_data_server_driver_package_linuxia32_v10.5.tar.gz
tar -xvf ibm_data_server_driver_package_linuxia32_v10.5.tar

# remove source tar ball
rm ibm_data_server_driver_package_linuxia32_v10.5.tar

# run installer
cd dsdriver
./installDSDriver

# Modify bashrc to source db2profile
cat <<EOT >> ~/.bashrc
# source db2 profile
if [ -f /opt/ibm/dsdriver/db2profile ]; then
    source /opt/ibm/dsdriver/db2profile
fi

# force db2 client to open in termnial mode
alias clpplus="clpplus -nw"

EOT

# END Bootstrap script for Database Dev Box provisioning
