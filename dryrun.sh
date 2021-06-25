#!/usr/bin/env bash
set -ex
helm install --dry-run --debug --create-namespace mu -n mu mu
