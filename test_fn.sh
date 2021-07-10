#!/bin/sh

#  fn create context mu --api-url=http://fn.mu.local/api --registry orefalo
# fn use ctx mu

fn version
fn create app first-app
fn list apps

cd /tmp
fn init --runtime go --trigger http first-fn
cd first-fn
fn --verbose deploy --app first-app

# fn invoke first-app first-fn
# echo -n '{"name":"John"}' |  fn invoke first-app first-fn
# fn inspect fn first-app first-fn
# curl -X "POST" -H "Content-Type: application/json" -d '{"name":"Bob"}' http://localhost:8080/invoke

