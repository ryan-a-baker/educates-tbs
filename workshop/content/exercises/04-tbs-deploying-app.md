Now that Cody has built the container for the Spring Pet Clinic, Alana is going to deploy the application.  She does this using a helm chart and points it to the image that was just created:


```terminal:execute
command: helm upgrade --install --wait spring-petclinic chart/spring-petclinic
session: 1
```

This will deploy a simple pod and service.  In order to view the web application, let's use port forwarding to be able to connect to the private kubernetes IP.

```terminal:execute
command: kubectl port-forward service/spring-petclinic 8080:80
session: 2
```

Once that is complete, let's open the application to view it.

```dashboard:create-dashboard
name: Spring Pet Clinic
url: http://localhost:8080
```

```dashboard:create-dashboard
name: Harbor
url: https://harbor-demo.{{ ingress_domain }}/harbor/projects/{{ harbor_project_id }}/repositories
```