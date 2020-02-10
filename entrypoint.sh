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

APP_VERSION=$10

helm package $HELM_CHART_FOLDER --app-version $APP_VERSION --version $APP_VERSION
HELM_PACKAGE_FILE=$(readlink -f $(ls|grep $HELM_CHART_FOLDER|grep $APP_VERSION|grep "tgz"))

aws eks update-kubeconfig --name $K8S_CLUSTER

# Create namespace if it doesn't exists
NAMESPACE_EXISTS=$(kubectl get namespace|grep -w $NAMESPACE|wc -l|awk '{print $1}')
if [ "$NAMESPACE_EXISTS" -eq "0" ]; then
   kubectl create namespace $NAMESPACE || true
fi

# Create the package

helm upgrade --install $VALUES --namespace $NAMESPACE $HELM_RELEASE $HELM_PACKAGE_FILE $TIMEOUT --wait
