# aws-appmesh-demo
Simple appmesh demo - canary releases


Pre-requisites
1. EKS Cluster in us-west-2
2. Latest AWS CLI

## Steps for V1
1. Create the service mesh and its components for all the microservices

```
cd appmesh-config
./create-mesh.sh
```

2. Deploy Services in Kubernetes Cluster

```
cd ../k8s-deploy
./deploy_v1.sh
```

3. Deploy Curler to check the output of services

use ```kubectl svc``` to get the ELB endpoint of ```order``` service.
run:
```watch curl -s http://<ELB endpoint>```

This should show the output of all the three services. (Keep it running in different terminal)

## Canary checking

### Deploy v1.5 of Customer SVC
1. Deploy services of v1.5 in EKS cluster
```
./deploy_v15.sh
```
2. Deploy appmesh config for canary
```
cd ../appmesh-config
./deploy-canary-v15.sh
```
Here you will see the change in output of CustomerSVC 

### Deploy v2 of Product SVC
1. Deploy services of v2 in EKS cluster
```
cd ../k8s-deploy
./deploy_v2.sh
```
2. Deploy appmesh config for canary
```
cd ../appmesh-config
./deploy-canary-v2.sh
```
3. All-in to Product v2
```
aws appmesh update-route --cli-input-json file://V2/product-all-in-v2-r.json

```

## Cleanup the Service Mesh and Deploys

1. Cleaning up appmesh

```
cd appmesh-config
./delete-mesh.sh
```
2. Delete K8s Deploys
```
cd k8s-app
./remove_deploys.sh
```




