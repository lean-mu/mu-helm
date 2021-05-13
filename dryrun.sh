#!/usr/bin/env bash

set -ex
helm install --dry-run --debug mu mu
