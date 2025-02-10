Kubernetes Cluster Web Server Deployment

This project demonstrates deploying a Kubernetes cluster using Minikube and setting up a web server (NGINX) that is exposed and accessible through the local machine. Below are the steps followed and deliverables.

Steps Performed

1. Setup Minikube

Minikube Version: v1.35.0

Kubernetes Version: v1.32.0

Driver Used: Docker

minikube version
minikube start

2. Created Deployment and Service

Created a Deployment for the NGINX web server.

Exposed the Deployment using a LoadBalancer Service to ensure accessibility on the local machine.

Deployment and Service YAML configurations were applied:

kubectl apply -f /Users/ZolaTech/Desktop/kubernetes_cluster_resources.yaml

3. Verified Deployment

Checked the status of the Pods and Services to ensure everything was running correctly.

kubectl get all -o yaml

Deliverables

YAML Configuration for Resources

The YAML output for all cluster resources was exported using the following command:

kubectl get all -A -o yaml > kubernetes_cluster_resources.yaml

The file kubernetes_cluster_resources.yaml is included in this repository.

Web Server Accessibility

A Minikube tunnel was created to expose the LoadBalancer service.

minikube tunnel

The NGINX web server was successfully accessed in a browser at http://localhost:80



Commands Summary

Start Minikube:

minikube start

Apply Deployment and Service:

kubectl apply -f <deployment_file>.yaml

Verify Resources:

kubectl get all -o yaml

Expose LoadBalancer Service:

minikube tunnel

Repository Files

kubernetes_cluster_resources.yaml: Contains the YAML configurations for all cluster resources.

Screenshots: Demonstrates successful deployment and access to the web server.

