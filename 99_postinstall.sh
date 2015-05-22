#!/bin/bash
#
# Update all the packages!
yum -y update

# Install everything we need
yum -y install vim-enhanced tcpdump ltrace strace git git-annex ruby193 scl-utils tito telnet rpm-build mock finger

# Simple VIM config
cat << EOF >>/etc/vimrc
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
EOF

# Add non priviledged user for rpmbuilding
adduser rpmbuild
mkdir -p /home/rpmbuild/rpm/tmp
cat << EOF >> /home/rpmbuild/.rpmmacros
%_topdir               /home/rpmbuild/rpm
%_tmppath              /home/rpmbuild/rpm/tmp

%scl                   ruby193
EOF
chown -R rpmbuild:rpmbuild /home/rpmbuild


# Copy mock config
cp mock/* /etc/mock
