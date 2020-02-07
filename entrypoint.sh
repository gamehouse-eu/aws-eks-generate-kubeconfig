#!/bin/bash      

export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3

K8S_CLUSTER=$4
HELM_CHART_FOLDER=$5
HELM_RELEASE=$6
NAMESPACE=$7
VALUES=$8

aws eks update-kubeconfig --name $K8S_CLUSTER
helm repo update
helm upgrade --install --set $VALUES --namespace $NAMESPACE $HELM_RELEASE $HELM_CHART_FOLDER --wait --timeout 30s
