#!/bin/bash
oc new-project microservices-demo --display-name="OpenShift Microservices Demo"
oc project microservices-demo

# RELAX SCCs FOR ISTIO
# For each identified service account you must update the cluster configuration to ensure they are granted 
# access to the anyuid and privileged SCCs by executing the following commands from an account with cluster 
# admin privileges. Replace <service account> and <namespace> with values specific to your application.
# oc adm policy add-scc-to-user anyuid -z <service account> -n <namespace>
# oc adm policy add-scc-to-user privileged -z <service account> -n <namespace>
# Details on why are here:
# https://docs.openshift.com/container-platform/3.11/servicemesh-install/servicemesh-install.html#configuring-security-constraints-for-application-service-accounts
oc adm policy add-scc-to-user anyuid -z default -n microservices-demo
oc adm policy add-scc-to-user privileged -z default -n microservices-demo

# PULL THE CONTAINERS, CREATE THE SERVICES, PODS, ETC
# oc apply -f ./openshift-configuration/xxx.yaml

# APPLY ISTIO CONFIG (IF USING ISTIO)
# oc apply -f ./istio-configuration/xxx.yaml