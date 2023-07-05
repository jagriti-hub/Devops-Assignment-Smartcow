# Application Deployment Documentation

This documentation provides step-by-step instructions for deploying the application using Kubernetes.

## Prerequisites

Before getting started with the deployment, ensure that the following prerequisites are met:

- Docker is installed and configured on your system.
- minikube and kubectl is installed and properly set up.

```
minikube start --driver=docker
minikube addons enable ingress
minikube tunnel
```
- We have to use docker as driver because built in network QEMU was not supporting minikube tunnel.

## Getting Started

1.  Go to /deploy directiry and run the following command.

```
kubectl apply -f .
```

2.  Now you can wait for pods to become ready then hit below url in your browser.

```
https://192.168.49.2/
```

