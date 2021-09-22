Now that Cody has built the container for the Spring Pet Clinic, Alana is going to deploy the application.  She does this using a helm chart and points it to the image that was just created:


```terminal:execute
command: helm upgrade --install --wait spring-petclinic chart/spring-petclinic --set image.repository=harbor-demo.{{ ingress_domain }}/{{ session_namespace }}/spring-petclinic --set url=spring-petclinic.{{ session_namespace }}.{{ ingress_domain }}
session: 1
```

This will deploy a simple pod, a service, and an ingress.

```terminal:execute
command: kubectl get services
session: 1
```

Once that is complete, let's open the Spring Pet Clinic application to view it.  Please note that the ingress is creating a DNS record, which may take up to 5 minutes to propagate.

```dashboard:create-dashboard
name: Spring Pet Clinic
url: http://spring-petclinic.{{ session_namespace }}.{{ ingress_domain }}
```
