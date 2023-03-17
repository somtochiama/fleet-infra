# fleet-infra
```sh
kubectl patch ks -n flux-system flux-system --subresource='status' -p '{"status":{"lastAppliedRevision":"main@sha1:4d1ed5d6d130f806a393323ee6292969b554046x0"}}' --type='merge'

```
