## Start NGINX
```
$ kubectl apply -f 1-nginx.yaml
```

## Bad Deployment
Simulate a rolling update of a bad deployment. It is pulling from an non-existing tag.
This deployment causes 25% reduction in capacity.
```
$ kubectl apply -f 1-nginx.yaml
$ kubectl apply -f 2-failed-deployment.yaml
```

## Deployed but Not Ready
Simulate a deployment that failed all readiness probe, and thus pods are not automatically restarted.
This deployment causes 100% outage.
```
$ kubectl apply -f 1-nginx.yaml
$ kubectl apply -f 3-not-ready.yaml
```

## Crashloop Backoff
Simulate a deployment where it was ready, but got restarted due to failed liveness probe.
This deployment causes sporadic outages, and eventually, 100% outage.
```
$ kubectl apply -f 1-nginx.yaml
$ kubectl apply -f 4-crash-loop.yaml
```

## Unknown Restarts
Simulate a deployment where everything is fine, except one pod is restarting continuously.
This causes sporadic but minimal outages.
```
$ kubectl apply -f 1-nginx.yaml
$ ./5-unknown-restarts.sh
```

## Chaos Monkey
Simulate a chaos monkey that continuesly kill random pods.
This causes sporadic outages.
```
$ kubectl apply -f 1-nginx.yaml
$ ./6-chaos-monkey.sh
```
