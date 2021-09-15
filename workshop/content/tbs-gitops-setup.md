Welcome to the Tanzu End to End demo!  In this session, we'll be exploring the capabilitites of Tanzu Advanced Edition, and see how they would be used in an actual software lifecycle scenario.

We're going to be using Tanzu to deploy an application, deploy dependent services for that application, observe the metrics for that application and supporting infrastructure, and manage the cluster hosting that application.

## Harbor

Use the following link to sign into the Harbor Web UI with the username "admin" and password "{{ ENV_HARBOR_PASSWORD }}". (You will be redirected to the sign-in page)

```dashboard:create-dashboard
name: Harbor
url: https://harbor-demo.{{ ingress_domain }}/harbor/projects/{{ harbor_project_id }}/repositories
```