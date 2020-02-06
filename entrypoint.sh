export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3
export K8S_CLUSTER=$4

export

aws eks update-kubeconfig --name $4
cp /root/.kube/config ./kubeconfig
cat /root/.kube/config
