Change Log
=========

All notable changes to the project will be documented in this file.

Versioned according to [Semantic Versioning](http://semver.org/).

## TODO

- Obviously the LB is configured only with one node
- update NOTES.txt
- add prometheus & grafana
- remove redis, was removed along with async
- add distributed tracing
- implement runner elasticity

## Unreleased

Added:

* a service account and a matching role to allow dynamic discovery of runner nodes
* remove redis from chart - not used anymore as async more has been removed
