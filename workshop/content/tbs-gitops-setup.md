Welcome to the overview on the Tanzu Build Service! In this workshop, we'll explore how the Tanzu Build Service can produce OCI Compliant container images from source code in a repeatable, scalable, and secure manner.  

We're going to take a sample application, use the Tanzu Build Service to build a container, deploy it, update it, and finally, patch it.

In order to successfully complete this workshop, we'll need the following resources available.

## Harbor

Use the following link to sign into the Harbor Web UI with the username "admin" and password "{{ ENV_HARBOR_PASSWORD }}". (You will be redirected to the sign-in page)

```dashboard:create-dashboard
name: Harbor
url: https://harbor-demo.{{ ingress_domain }}/harbor/projects/73/repositories
```
TODO: Fix this link when I know the real link location.  Insert the "harbor project id"