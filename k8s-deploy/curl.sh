kubectl run -it curler --image=tutum/curl --env="SERVICES_DOMAIN=default.svc.cluster.local" bash
# watch curl -s http://order.default.svc.cluster.local:5000



