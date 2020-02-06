export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3
aws eks update-kubeconfig --name f2p-cluster > /dev/null 2>&1
cp /root/.kube/config ./kubeconfig
cat /root/.kube/config
