
#!/bin/bash
#

FOREMAN_RELEASE="1.7"

cat /etc/redhat-release | grep -q "release 6"
if [ $? == 0 ]
then
    # ruby193
    rpm -ihv https://www.softwarecollections.org/en/scls/rhscl/ruby193/epel-6-x86_64/download/rhscl-ruby193-epel-6-x86_64.noarch.rpm

    # v8 java script engine
    rpm -ihv https://www.softwarecollections.org/en/scls/rhscl/v8314/epel-6-x86_64/download/rhscl-v8314-epel-6-x86_64.noarch.rpm

    # EPEL
    rpm -ihv http://ftp.wrz.de/pub/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

    # Puppet 3
    rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

    # Foreman 
    rpm -ihv http://yum.theforeman.org/releases/${FOREMAN_RELEASE}/el6/x86_64/foreman-release.rpm

fi
cat /etc/redhat-release | grep -q "release 7"
if [ $? == 0 ]
then
    # ruby193
    rpm -ihv https://www.softwarecollections.org/en/scls/rhscl/ruby193/epel-7-x86_64/download/rhscl-ruby193-epel-7-x86_64.noarch.rpm

    # v8 java script engine
    rpm -ihv https://www.softwarecollections.org/en/scls/rhscl/v8314/epel-7-x86_64/download/rhscl-v8314-epel-7-x86_64.noarch.rpm

    # GIT 1.9
    rpm -ihv https://www.softwarecollections.org/en/scls/rhscl/git19/epel-7-x86_64/download/rhscl-git19-epel-7-x86_64.noarch.rpm

    # EPEL
    rpm -ihv http://ftp.wrz.de/pub/fedora-epel/7/x86_64/e/epel-release-7-5.noarch.rpm

    # Puppet 3
    rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

    # Foreman
    rpm -ihv http://yum.theforeman.org/releases/${FOREMAN_RELEASE}/el7/x86_64/foreman-release.rpm
fi


# fix EPEL https bug (https://community.hpcloud.com/article/centos-63-instance-giving-cannot-retrieve-metalink-repository-epel-error)
sed -e 's/https/http/g' -i /etc/yum.repos.d/epel*repo
# Import all the keys!
rpm --import /etc/pki/rpm-gpg/*
