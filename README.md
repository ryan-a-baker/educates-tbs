LAB - Markdown Sample
=====================

Sample workshop content using Markdown formatting for pages.

For more detailed information on how to create and deploy workshops, consult
the documentation for Educates at:

* https://docs.edukates.io

If you already have the Educates operator installed and configured, to
deploy and view this sample workshop, run:

```
kubectl apply -f https://raw.githubusercontent.com/ryan-a-baker/educates-tbs/master/resources/workshop.yaml
kubectl apply -f https://raw.githubusercontent.com/ryan-a-baker/educates-tbs/master/resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/lab-markdown-sample
```

The training portal is configured to allow anonymous access. For your own
workshop content you should consider removing anonymous access.


```
kp secret create harbor-demo-creds --registry harbor-educates.ryanbaker.io --registry-user admin
```

```
kp image create spring-petclinic-2 --tag harbor-demo.ryanbaker.io/demo-tbs/spring-petclinic --git https://github.com/ryan-a-baker/spring-petclinic.git --git-revision main --cluster-builder base --wait
```


# Fresh Cluster Setup

Install Contour

```kubectl apply -f https://projectcontour.io/quickstart/contour.yaml```

Apply Operator

```
kubectl apply -k "github.com/eduk8s/eduk8s?ref=master"
```

Set Domain

```
kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_DOMAIN=ryanbaker.io
```


Redeploy

```
k delete TrainingPortal lab-markdown-sample; k delete workshop lab-markdown-sample; k delete pods -n eduk8s -l deployment=eduk8s-operator; sleep 120; k apply -f resources/workshop.yaml; k apply -f resources/training-portal.yaml
```

Push docker image  to harbor

```docker push harbor-educates.ryanbaker.io/library/tbs-educates:latest
```

Using the 100.0.58 Build Version

```
docker pull registry.pivotal.io/tbs-dependencies/build-base@sha256:b788d90e57d3ce64a7144dca187cad0dace90b37e454ef07c8af9551a7f744b1
docker pull registry.pivotal.io/tbs-dependencies/run-base@sha256:891d87e0380f06152565b8c59f871750fa0535ab1c1b548112d671412fb8c4d9
```



kp clusterstack create demo-stack --build-image harbor-demo.ryanbaker.io/educates-tbs/tbs/build@sha256:82c6a2e1a16217418be6c08bdbccdf7bfb22ddf2f09340bf2a7eb0e55359182c --run-image harbor-demo.ryanbaker.io/educates-tbs/tbs/run@sha256:47481aa496959d425f4a7d306875c0e17babe3981cc98a406b177f1491e5a27d
kp clusterstack update demo-stack --build-image registry.pivotal.io/tanzu-base-bionic-stack/build:1.0.12-base-cnb --run-image registry.pivotal.io/tanzu-base-bionic-stack/run:1.0.12-base-cnb
kp clusterbuilder create demo-cluster-builder --order ./full-order-100.0.18.yaml --stack demo-stack --store default


Create Synced Secret:
```
k apply -f secret.yaml -n build-service
```