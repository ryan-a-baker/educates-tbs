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