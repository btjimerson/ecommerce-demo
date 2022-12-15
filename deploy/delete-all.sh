#!/bin/bash

kubectl delete -f stripe-service-entry.yaml
kubectl delete -f rabbitmq.yaml
kubectl delete -f payments.yaml
kubectl delete -f orders.yaml
kubectl delete -f catalog.yaml
kubectl delete -f frontend.yaml
kubectl delete -f frontend-gateway.yaml
kubectl delete -f loadgenerator.yaml
kubectl delete ns catalog-demo

exit 0
