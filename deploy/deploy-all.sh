#!/bin/bash

kubectl create ns catalog-demo
kubectl label namespace catalog-demo istio-injection=enabled
kubectl create secret generic paymentbackend -n catalog-demo --from-literal=stripe-api-key=c2tfdGVzdF81MUhqcXMzQVdkdmxTUk5UUW1NeFZCc0ZNSzFuVjA5UEVPcHlWYTJuTVgzSVg0UlllM2JlZDN2Mkg3dnF1ZkhKdmxTQUVnMTd5ellCOWxpQk9LQlYzdUVwcTAweGU3ZnpONHg=
kubectl apply -f stripe-service-entry.yaml
kubectl apply -f rabbitmq.yaml
kubectl apply -f payment-history.yaml
kubectl apply -f payments.yaml
kubectl apply -f orders.yaml
kubectl apply -f catalog.yaml
kubectl apply -f frontend.yaml
kubectl apply -f frontend-gateway.yaml
#kubectl apply -f loadgenerator.yaml

exit 0
