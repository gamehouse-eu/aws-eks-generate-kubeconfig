export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3
export K8S_CLUSTER=$4

aws eks update-kubeconfig --name $4
cp ~/.kube/config ./kubeconfig
cat ~/.kube/config
echo "::set-output name=kubeconfig::$(cat ~/.kube/config)"