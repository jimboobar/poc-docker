# DOCKER - PROXY DB
This is example shows how to setup a `proxy-` and a `couchdb-`server locally with _docker-compose_, to serve content in a easy way.

## How-to-start
To start, run `./start.sh` or `docker-compose up` to start the services.

When started, run `./setup.sh` to create databases, populate some data, setup and verify replication.

To stop, run `./stop.sh` or hit `CTRL+C` to stop running the services.


## How-to-clean
ON YOUR OWN RISK(!), run `docker system prune` to clean up things that are not in use...