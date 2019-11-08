#! /bin/bash

set -euo pipefail

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

SELECTED_NAMESPACE=''
SELECTED_DEPLOYMENT=''


select_cluster(){
    read -rp "
    Let's get started! :)

    Choose the cluster in which you'd like to work in. Options are:

    1. Development cluster
    2. Production cluster

    Type your option here ( choose a number ): " selected_cluster
    echo "$selected_cluster"
}


handle_cluster_selection(){
    case "$1" in
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
}


set_namespace(){
    selected_namespace=$1
    kubectl config set-context --current --namespace "$selected_namespace"
    echo ""
}


perform_rolling_restart(){
    selected_namespace="$1"
    selected_deployment="$2"
    printf "\nYou are about to perform a rolling restart on $GREEN%s$RESET in $GREEN%s$RESET namespace\n" "$selected_deployment" "$selected_namespace"
    read -rp "Press enter to continue..."
    printf "%bAre you sure!!! Press enter to continue...:%b" "$RED" "$RESET"; read -r

    kubectl -n "$selected_namespace" rollout restart deployment "$selected_deployment"
    echo "Rollout restart in progress. Please use -- watch -n 5 'kubectl get pods' -- as a command for querying the status of the pods after the restart"
}


handle_ns_selection(){
    ns=$(kubectl get ns | tail -n +2 | nl -s":  ")
    echo "$ns"; printf "    ------------------------------------------------\n"
    printf "    Please select a namespace: "; read -r namespace_number
    SELECTED_NAMESPACE=$(echo "$ns" | sed -n "${namespace_number}"p | awk '{print $2}')
    set_namespace "$SELECTED_NAMESPACE"
}


handle_deployment_selection(){
    deployments=$(kubectl get deployments | tail -n +2 | nl -s":  ")
    echo "$deployments"
    printf "    -----------------------------------------------\n"
    printf "    Please select a deployment: "; read -r deployment_number
    SELECTED_DEPLOYMENT=$(echo "$deployments" | sed -n "${deployment_number}"p | awk '{print $2}')
}


main(){
    selected_cluster=$(select_cluster)
    handle_cluster_selection "$selected_cluster"

    handle_ns_selection

    handle_deployment_selection

    perform_rolling_restart "$SELECTED_NAMESPACE" "$SELECTED_DEPLOYMENT"
}

main
