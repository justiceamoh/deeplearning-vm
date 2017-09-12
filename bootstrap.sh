#!/bin/bash
## Author: Justice Amoh
## Description: Bootstrap script for Vagrant Machine. The VM image is configured
## for the course ENGS108, Applied Machine Learning, Dartmouth College
## Adapted from: bootstrap.sh by Holberton School

# Anaconda
apt-get update -q
su - vagrant

echo installing Anaconda
miniconda=Miniconda2-4.3.21-Linux-x86_64.sh
cd /vagrant
if [[ ! -f $miniconda ]]; then
    wget --quiet http://repo.continuum.io/miniconda/$miniconda
fi
chmod +x $miniconda
./$miniconda -b -p /home/vagrant/anaconda

echo 'export PATH="/home/vagrant/anaconda/bin:$PATH"' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
chown -R vagrant:vagrant /home/vagrant/anaconda
/home/vagrant/anaconda/bin/conda install conda-build anaconda-client anaconda-build -y -q


# Conda Installations
/home/vagrant/anaconda/bin/conda install -y numpy
/home/vagrant/anaconda/bin/conda install -y matplotlib
/home/vagrant/anaconda/bin/conda install -y pandas
/home/vagrant/anaconda/bin/conda install -y ipython
/home/vagrant/anaconda/bin/conda install -y h5py
/home/vagrant/anaconda/bin/conda install -y jupyter


# Tensorflow
/home/vagrant/anaconda/bin/pip install 'tensorflow' --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.3.0-cp27-none-linux_x86_64.whl
 
# Keras
/home/vagrant/anaconda/bin/pip install 'keras' keras



