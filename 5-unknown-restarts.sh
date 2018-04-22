#!/bin/bash

PODS=($(kubectl get pods -l run=nginx -o jsonpath='{.items..metadata.name}'))

IDX=$(($RANDOM % ${#PODS[@]}))
POD=${PODS[$IDX]}

echo "Chaos Monkey with Pod: $POD"

for i in $(seq 1 5); do
  echo "$i triggering restart..."
  kubectl exec -ti $POD -- /bin/bash -c "kill 1"
  echo "... waiting 15 seconds"
  sleep 15
done

