# Aws Kubeconfig Generator for your cluster

Creates a kubeconfig file for your cluster given your AWS credentials. Make sure IAM role has the EKS permissions needed.

## Inputs

### `aws-access-key-id`

**Required** AWS Access Key ID 

### `aws-secret-access-key`

**Required** AWS Secret Access Key

### `aws-default-region`

**Required** AWS Default Region

### `aws-cluster-name`

**Required** AWS EKS Cluster Name

## Outputs

### `kubeconfig`

kubeconfig generated file

## Example usage

```
uses: actions/aws-eks-generate-kubeconfig@v1
with:
  aws-access-key-id: '<YOUR-aws-access-key-id>'
  aws-secret-access-key: '<YOUR-aws-secret-access-key>'
  aws-default-region: '<YOUR-aws-default-region>'
  aws-cluster-name: '<YOUR-aws-cluster-name>'
  helm-release: '<YOUR-helm-release>'
  k8s-namespace: '<YOUR-k8s-namespace>'
```