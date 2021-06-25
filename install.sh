#!/usr/bin/env bash
helm dep update mu
helm install --create-namespace -n mu mu mu