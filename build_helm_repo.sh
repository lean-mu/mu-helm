#!/usr/bin/env bash
helm dep update mu
helm package mu
helm repo index .
