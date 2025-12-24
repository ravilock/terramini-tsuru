#!/usr/bin/env bash

kconfig=${KUBECONFIG:-"$HOME/.kube/config"}
kconfig=$(echo "$kconfig" | cut -d: -f1)

export KUBE_SERVER=$(yq -r '.clusters[] | select(.name == "minikube") | .cluster.server' "${kconfig}")
export KUBE_CA=$(yq -r '.clusters[] | select(.name == "minikube") | .cluster["certificate-authority"]' "${kconfig}")
export KUBE_CLIENT_CERT=$(yq -r '.users[] | select(.name == "minikube") | .user["client-certificate"]' "${kconfig}")
export KUBE_CLIENT_KEY=$(yq -r '.users[] | select(.name == "minikube") | .user["client-key"]' "${kconfig}")
