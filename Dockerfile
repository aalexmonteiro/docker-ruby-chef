FROM ubuntu:14.04
MAINTAINER Alex Monteiro "aalexmonteiro@gmail.com"

RUN apt-get update

## Default Packages
RUN apt-get install -y -q ruby1.9.1 ruby1.9.1-dev build-essential 
RUN apt-get install -y nano wget links curl rsync bc git git-core apt-transport-https libxml2 libxml2-dev libcurl4-openssl-dev openssl sqlite3 libsqlite3-dev
RUN apt-get install -y gawk libreadline6-dev libyaml-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

## Install RVM and Ruby
RUN curl -L https://get.rvm.io | bash -s stable
#Set env just in case
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Install chefdk
RUN wget https://packages.chef.io/files/stable/chefdk/2.1.11/ubuntu/14.04/chefdk_2.1.11-1_amd64.deb
RUN dpkg -i chefdk_2.1.11-1_amd64.deb
