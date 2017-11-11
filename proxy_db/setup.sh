#!/usr/bin/env bash


# create datacenters and populate
echo '-> create datacenters and populate...'
curl -X PUT http://localhost:5984/datacenters/
curl -X PUT \
    --data '{"location": "Some Street 0" }' \
    http://localhost:5984/datacenters/dc0
curl -X PUT \
    --data '{"location": "Some Street 1" }' \
    http://localhost:5984/datacenters/dc1


# create hosts and populate
echo '-> create hosts and populate...'
curl -X PUT http://localhost:5984/hosts/
curl -X PUT \
    --data '{"address": "10.0.0.10" }' \
    http://localhost:5984/hosts/h0
curl -X PUT \
    --data '{"address": "10.0.0.11" }' \
    http://localhost:5984/hosts/h1


# create services and populate
echo '-> create services and populate...'
curl -X PUT http://localhost:5984/services/
curl -X PUT \
    --data '{"name": "Service-0" }' \
    http://localhost:5984/services/s0
curl -X PUT \
    --data '{"name": "Service-1" }' \
    http://localhost:5984/services/s1


# continuously replicate from registry for datacenters
echo '-> continuously replicate from registry for datacenters...'
curl -X PUT http://localhost:5985/datacenters/
curl -X POST \
    -H 'Content-Type: application/json' \
    --data '{"source":"http://registry:5984/datacenters","target":"datacenters","continuous":true}' \
    http://localhost:5985/_replicate

# continuously replicate from registry for hosts
echo '-> continuously replicate from registry for hosts...'
curl -X PUT http://localhost:5986/hosts/
curl -X POST \
    -H 'Content-Type: application/json' \
    --data '{"source":"http://registry:5984/hosts","target":"hosts","continuous":true}' \
    http://localhost:5986/_replicate

# continuously replicate from registry for services
echo '-> continuously replicate from registry for services...'
curl -X PUT http://localhost:5987/services/
curl -X POST \
    -H 'Content-Type: application/json' \
    --data '{"source":"http://registry:5984/services","target":"services","continuous":true}' \
    http://localhost:5987/_replicate


# verify replication of data for datacenters
echo '-> verify replication of data for datacenters...'
curl http://localhost:8080/datacenters/_all_docs

# verify replication of data for hosts
echo '-> verify replication of data for hosts...'
curl http://localhost:8080/hosts/_all_docs

# verify replication of data for services
echo '-> verify replication of data for services...'
curl http://localhost:8080/services/_all_docs