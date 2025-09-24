# docker-stunnel

[![Docker Hub](https://img.shields.io/docker/image-size/kurmisrainas/stunnel?label=Docker%20Hub&logo=docker)](https://hub.docker.com/r/kurmisrainas/stunnel)

A simple Docker image for stunnel that supports both client and server modes.

## Client Mode (Default)

``` yaml
stunnel-client:
  image: kurmisrainas/stunnel:latest
  environment:
    - CLIENT=yes
    - ACCEPT=8000
    - CONNECT=your.server.com:443
  ports:
    - "8000:8000"
```

## Server Mode

``` yaml
stunnel-server:
  image: kurmisrainas/stunnel:latest
  environment:
    - CLIENT=no
    - ACCEPT=8000
    - CONNECT=nginx:80
  ports:
    - "8000:8000"
```

## Environment Variables

- `CLIENT`: Set to "no" for server mode, "yes" for client mode (defaults to "yes")
- `ACCEPT`: Port to accept connections on
- `CONNECT`: Target to connect to (host:port)
