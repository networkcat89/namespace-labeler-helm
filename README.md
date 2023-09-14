### Helm chart for installing labels in Kubernetes namespaces.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add namespace-labeler https://networkcat89.github.io/namespace-labeler-helm/charts
helm install namespace-labeler namespace-labeler/namespace-labeler --namespace kube-system
```