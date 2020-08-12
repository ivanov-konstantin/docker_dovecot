##
# Latest centos images with full tag
FROM centos:centos7.8.2003

##
# Adding repository for Dovecot (https://doc.dovecot.org/installation_guide/dovecot_community_repositories/centos_packages)
COPY dovecot.repo /etc/yum.repos.d/

##
# Updating packages and install dovecot 
RUN yum clean all && \
yum update -y && \
yum install -y \ 
which \
dovecot \
dovecot-debuginfo \
dovecot-devel \
dovecot-imaptest \
dovecot-imaptest-debuginfo \
dovecot-lua \
dovecot-mysql \
dovecot-pgsql \
dovecot-pigeonhole \
dovecot-pigeonhole-debuginfo \
dovecot-pigeonhole-devel 

##
# Copying default configuration in /usr/local/dovecot/conf.d
RUN mkdir /usr/local/dovecot 
COPY conf.d /usr/local/dovecot/conf.d
COPY templating.sh /

##
# Templating configuration (see README.md for configuration from enviroment)
# RUN /templating.sh

##
# Entrypoint to Devocot
CMD [ "/templating.sh" ]
