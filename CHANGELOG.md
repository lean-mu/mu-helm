Change Log
=========

All notable changes to the project will be documented in this file.

Versioned according to [Semantic Versioning](http://semver.org/).

## TODO

- Authentication
- Add distributed tracing
- Implement runner elasticity
- Rework Authorization
- Reintroduce async using nats

## 1.0

Added:

* Runner nodes are now discovered dynamically and can therefore be scaled up/down manually
* Better Notes & instructions
* Only one hostname to access the different Fn services
* Added Prometheus, Grafana for Centralized metering
* Added Vector & Loki for Centralized logging
* a service account and a matching role to allow dynamic discovery of runner nodes
* remove redis from chart - it is not used anymore as async has been removed
