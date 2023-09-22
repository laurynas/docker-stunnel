#!/bin/sh

cd /etc/stunnel

cat > stunnel.conf <<_EOF_

foreground = yes
client  = yes

[stunnel-client]
accept = ${ACCEPT}
connect = ${CONNECT}

_EOF_

exec stunnel "$@"
