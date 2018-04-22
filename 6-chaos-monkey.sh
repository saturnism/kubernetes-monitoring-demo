#!/bin/bash


for i in $(seq 1 100); do
  PODS=($(kubectl get pods -l run=nginx -o jsonpath='{.items..metadata.name}' --field-selector=status.phase=Running))
  IDX=$(($RANDOM % ${#PODS[@]}))
  POD=${PODS[$IDX]}
  echo "Chaos Monkey with Pod: $POD"
  kubectl delete pod $POD
  sleep 5;
done
