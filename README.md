# Resilio sync

### Resources

Ports:

-   8888 - web UI port, TCP;
-   55555 - communication port, TCP, UDP;

Volumes:

-   /var/local/rslsync/data - default sync folders location;
-   /var/local/rslsync/.sync - cache;

### Install

```sh
mkdir /var/local/rslsync

cd /var/local/rslsync

curl -fsSLO https://bitbucket.org/softvisio/rslsync/raw/master/rslsync.sh && chmod +x rslsync.sh

/var/local/rslsync/rslsync.sh

echo Connect to webui: http://$(hostname):8888/gui/
```
