# DOCKER - PROXY STATIC
This is example shows how to setup a `proxy-` and a `static-`server locally with _docker-compose_, to serve content in a easy way.

## How-to-start
Run `docker-compose up` to start serving static content located under `static/html`. Hit `CTRL+C` to stop running the services.

## How-to-scale
When running, run `docker-compose scale static=5` in a terminal window to increase the number of static instances to 5 to be load-balanced through the proxy.

NOTE: Do not use in production!

## How-to-clean
ON YOUR OWN RISK(!), run `docker system prune` to clean up things that are not in use...