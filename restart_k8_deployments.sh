#! /bin/bash

set -euo pipefail

read -rp "
Let's get started! :)

Choose the cluster in which you'd like to work in. Options are:

1. Development cluster
2. Production cluster

Type your option here ( choose a number ): " env_option

case "$env_option" in
    1)
    export K8_CLUSTER_NAME=devs.k8s.local
    export KOPS_STATE_STORE=s3://kubernetes-navenio-com
    kops export kubecfg devs.k8s.local
    echo "
    Context set to devs.k8s.local
    "
;;
    2)
    echo "

    You are now in a ==== PRODUCTION ==== environment. Be VERY careful from now on :)

    "
    export KOPS_STATE_STORE=s3://prod-k8s-navenio-com
    kops export kubecfg wta-prod-eu-west-1.k8s.local
;;
    *)
echo "
You have chosen an invalid option. Please re-run the script and select values 1 or 2
"
exit 1
;;
esac
echo ""
kubectl get ns
echo ""
read -rp "Choose a namespace from the list above (please type it in) : " namespace
echo ""
kubectl config set-context --current --namespace "$namespace"
echo ""
kubectl get deployments
echo ""
read -rp "Choose the deployment that you want to restart (please type it in): " deployment_name
kubectl -n "$namespace" rollout restart deployment "$deployment_name"
echo "Rollout restart in progress. Please use -- kubectl get pods -- as a command for querying the status of the pods after the restart"
