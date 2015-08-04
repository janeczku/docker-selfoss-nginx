# Selfoss for Docker

This Dockerfile provides the [janeczku/selfoss](https://registry.hub.docker.com/u/janeczku/selfoss/) Selfoss image based on CentOS 7 and a [high performant Nginx and PHP5-FPM stack](https://github.com/million12/docker-nginx-php).

## About selfoss

[Selfoss](http://selfoss.aditu.de/) is a web-based mobile ready RSS reader and aggregator with built-in support for fulltext RSS scraping.

GitHub project:

https://github.com/SSilence/selfoss

## Getting Started

The selfoss data and configuration is stored in the persistent `/data` volume. Port 80 is exposed for the web application.
The `/data` volume is initialized on first launch with all necessary files allowing one to host-bind the volume to an empty local folder if necessary.

### Run the image

    docker run -d --name selfoss -p 8080:80 janeczku/selfoss

### Configuration and maintenance

The configuration and data files are located on the persisted volume under `/data/www/default`. To edit the configuration you can use a separate container which mounts the `/data volume`:

	docker run -ti --volumes-from=selfoss --rm busybox
	[root@selfoss] vi /data/www/default/config.ini
	
For configuration directives, follow the [selfoss documentation](http://selfoss.aditu.de/#documentation). Generally no changes to the configuration are required. However changing the configuration is necessary to make selfoss password protected.
Selfoss will automatically upgrade the database. For other maintenance tasks during upgrades, refer to the [selfoss documentation](http://selfoss.aditu.de/#documentation).

## Updating the feeds

This image is setup to automatically fetch feed updates every 30 minutes via a cron job.

## Build your own image

    git clone http://github.com/janeczku/docker-selfoss-nginx.git && cd docker-selfoss-nginx
    docker build -t janeczku/selfoss .
