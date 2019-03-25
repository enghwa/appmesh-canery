aws appmesh create-virtual-node --cli-input-json file://V2/product-v2-vn.json
aws appmesh update-route --cli-input-json file://V2/product-canary.json
## all in v2 
##aws appmesh update-route --cli-input-json file://V2/product-all-in-v2-r.json
