#!/bin/bash      

export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3

K8S_CLUSTER=$4
HELM_CHART_FOLDER=$5
HELM_RELEASE=$6
NAMESPACE=$7

if [ -z "$8" ]
then
    VALUES=""
else
    VALUES="--set $8"
fi

if [ -z "$9" ]
then
    TIMEOUT=""
else
    TIMEOUT="--timeout $9"
fi

aws eks update-kubeconfig --name $K8S_CLUSTER
kubectl create namespace $NAMESPACE || true
helm upgrade --install $VALUES --namespace $NAMESPACE $HELM_RELEASE $HELM_CHART_FOLDER $TIMEOUT --wait
