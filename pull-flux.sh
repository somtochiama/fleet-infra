kind delete cluster && kind create cluster
images=$(flux install --export | grep ghcr.io | cut -d ':' -f 2,3)
while IFS= read -r line; do
  docker pull $line
  kind load docker-image $line
done <<< "$images"
export GITHUB_TOKEN=$(cat ~/.config/hub | grep oauth_token | cut -d : -f 2 | tr -d " ")
flux bootstrap github --owner=somtochiama --token-auth --repository=fleet-infra --personal --path clusters/my-cluster
