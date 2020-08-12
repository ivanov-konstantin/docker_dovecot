#!/bin/bash

for file in $(ls /usr/local/dovecot/conf.d)
do
    cp -av  /usr/local/dovecot/conf.d/$file /etc/dovecot/conf.d/$file
done 

useradd -m ${USER}
echo "${USER}:${PASSWORD}" | chpasswd
if [ ! -d /home/${USER}/mdbox/storage ]; then mkdir -pv /home/${USER}/mdbox/storage ; chown ${USER} /home/${USER}/mdbox ; fi
if [ ! -d /home/${USER}/sdbox/mailboxes ]; then mkdir -pv /home/${USER}/sdbox/mailboxes ; chown ${USER} /home/${USER}/sdbox ; fi
if [ ! -d /home/${USER}/Maildir/cur ]; then mkdir -pv /home/${USER}/Maildir/cur ; chown ${USER} /home/${USER}/Maildir ; fi
if [ ! -d /home/${USER}/mail/inbox ]; then mkdir -pv /home/${USER}/mail/inbox ; chown ${USER} /home/${USER}/mail ; fi
if [ ! -d /home/${USER}/mail/mbox ]; then mkdir -pv /home/${USER}/mail/mbox ; chown ${USER} /home/${USER}/mail/mbox ; fi
if [ ! -d /home/${USER}/mail/.imap ]; then mkdir -pv /home/${USER}/mail/.imap ; chown ${USER} /home/${USER}/mail/.imap ; fi
/usr/sbin/dovecot -F