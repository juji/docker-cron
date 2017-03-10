# Cron for docker

Cron with other things for docker

## Tags
- `cron`,`latest` -> cron + curl
- `node` -> cron + curl + node.js 6.10


## Docker Compose
To use this, simply attach cron file to `/etc/crontab`
```yaml
version: "3"

services:
  cron:
  	image: jujiyangasli/cron:latest
  	volumes:
  		- ./mycron:/etc/crontab
```

