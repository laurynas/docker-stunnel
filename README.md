# docker-stunnel

``` yaml
stunnel-proxy:
  image: kurmisrainas/stunnel:latest
  environment:
    - ACCEPT=8888
    - CONNECT=your.server.com:443
  ports:
    - "8888:8888"  

```
