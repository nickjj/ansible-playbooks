#!/bin/bash

# modified from: https://github.com/ginas/ginas/

set -e

# read in which version to install
if [ $# -eq 0 ]; then
  echo "you must supply a version, ie. v1.6.3 or master for latest dev"
  exit 1
else
  branch=$1
fi

# create temporary directory for build
build_dir=$(mktemp -d)
trap "rm -rf ${build_dir}" EXIT

cd ${build_dir}

# install required packages
sudo apt-get update
sudo apt-get --no-install-recommends -q -y install git python-setuptools \
	python-paramiko python-yaml python-jinja2 python-httplib2 \
	cdbs debhelper dpkg-dev python-support fakeroot sshpass \
	python-nose python-passlib asciidoc xmlto

# clone ansible from main project repository
git clone git://github.com/ansible/ansible.git ansible --branch $branch
cd ansible

# install debian package
make deb
version=$(cat VERSION)
sudo dpkg -i ../ansible_${version}_all.deb
