# Mu Serverless platform Helm Chart

Mu is a serverless faas platform based on the [Fn project](http://fnproject.io)

## Introduction

This chart deploys a fully functioning instance of  [Mu](https://github.com/lean-mu/mu) on a Kubernetes cluster using the [Helm 3](https://helm.sh/) package manager.

## Installation

### Development Environement

To setup a local development environment, start minikube as follows:

```shell
# please alter configuration to your likings
$ minikube start --vm-driver=hyperkit --memory=6144 --cpus=4 --disk-size=50g
$ minikube addons enable ingress

# building functions locally requires docker. Let's leverage minikube's internal dockerd
$ eval $(minikube docker-env)

```

### Preparing chart values

Please take the time to review the default settings in `mu/values.yaml`

### Configuring Database Persistence 

Mu persists function's metadata in MySQL. This is configured using the MySQL Helm Chart.

By default this uses container storage. If required, you may configure a persistent volume by setting the `mysql.*` values in the chart values to that which corresponds to your storage requirements.

## Deploying the Chart

```shell
$ git clone https://github.com/lean-mu/mu-helm.git
$ cd mu-helm/mu
# Install chart dependencies
$ helm dep build .
$ helm install --create-namespace -n mu mu .
```

Deployment is performed as a background task.
I strongly recommend to use [k9s](https://k9scli.io/) to check on status. It's much simplier than the cli and you can quickly browser though deployments, pods, services and ingress to ensure all is fine and dandy.

## Accessing the cluster

Assuming all went well, you should now have a live instance of mu deployed on the cluster.
Accessing the instance requires to define its ingress in the DNS.

Get the ingres ip using the command below, and make it match the ingres' **fn.mu.local** defined in `values.yaml`

```shell
 $ kubectl get ingress mu-ingress-controller -o jsonpath="{.status.loadBalancer.ingress[0].ip}"
```

You are done!  Using a browser, open a browser to `http//fn.mu.local` and the Mu user interface should show.

When properly configured, the following URLs are available

```text
           UI endpoint - http://fn.mu.local/ui
          API endpoint - http://fn.mu.local/api
FN invocation endpoint - http://fn.mu.local/
         FLOW endpoint - http://fn.mu.local/flow
   monitoring endpoint - http://fn.mu.local/grafana
```

> Note:  Those endpoints can be fully configured by adjusting the chart, for instance you could setup virtual hosts rather than context paths

## Configuring the Fn context

At this point, and since `mu` is built on `project fn`, it is a good idea to install the fn client.

```bash
$ brew install fn
# Then set you context to your instance
$ fn create context mu --api-url http://fn.mu.local/api
Successfully created context: mu
# set the default context
$ fn use ctx mu
Now using context: mu
# run a quick test to check cluster connectivity
$ fn version
Client version is latest version: 0.6.7
Server version:  0.3.749
```

Further reading about functions development can be found in the Getting Started guides or the chart notes.

## Default Passwords

- Fn: 1234567890
- grafana: admin/admin

## Uninstalling the Chart

```bash
helm delete mu
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

> Note: Please make sure to run the command from the correct namespace
