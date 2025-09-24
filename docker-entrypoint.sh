#!/bin/sh

CLIENT_MODE="${CLIENT:-yes}"

cd /etc/stunnel

# Generate self-signed certificate if running in server mode
if [ "${CLIENT_MODE}" = "no" ]; then
    if [ ! -f stunnel.crt ] || [ ! -f stunnel.key ]; then
        echo "Generating self-signed certificate for server mode..."
        openssl req -x509 -newkey rsa:4096 -keyout stunnel.key -out stunnel.crt -days 3650 -nodes -subj "/C=US/ST=State/L=City/O=Stunnel/CN=localhost" 2>/dev/null
        chmod 600 stunnel.key
        chmod 644 stunnel.crt
        echo "Certificate generated successfully"
    else
        echo "Using existing certificate"
    fi
fi

# Generate stunnel.conf
cat > stunnel.conf <<_EOF_

foreground = yes
sslVersionMin = TLSv1.2
client = ${CLIENT_MODE}

[tunnel]
accept = ${ACCEPT}
connect = ${CONNECT}
delay = yes

_EOF_

# Add certificate configuration for server mode
if [ "$CLIENT_MODE" = "no" ]; then
    cat >> stunnel.conf <<_EOF_

cert = /etc/stunnel/stunnel.crt
key = /etc/stunnel/stunnel.key

_EOF_
fi

exec stunnel "$@"
