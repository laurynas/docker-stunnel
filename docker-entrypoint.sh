#!/bin/sh

cd /etc/stunnel

cat > stunnel.conf <<_EOF_

foreground = yes
client = ${CLIENT:-yes}

[tunnel]
accept = ${ACCEPT}
connect = ${CONNECT}
delay = yes

_EOF_

exec stunnel "$@"
