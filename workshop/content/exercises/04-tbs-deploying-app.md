Now that Cody has built the container for the Spring Pet Clinic, Alana is going to deploy the application.  She does this using a helm chart, setting environment specific values such as the image location and url:


```terminal:execute
command: helm upgrade --install --wait spring-petclinic chart/spring-petclinic --set image.repository=harbor-demo.{{ ingress_domain }}/{{ session_namespace }}/spring-petclinic --set url=spring-petclinic.{{ session_namespace }}.{{ ingress_domain }}
session: 1
```

Alana has now deployed a very basic application using a pod, service, and ingress.  We can take a look at all of the resources that are part of the application:

```terminal:execute
command: kubectl get pods
session: 1
```

```terminal:execute
command: kubectl get services
session: 1
```

```terminal:execute
command: kubectl get ingress
session: 1
```

Let's open the Spring Pet Clinic application to verify it is functional.

```dashboard:create-dashboard
name: Spring Pet Clinic
url: http://spring-petclinic.{{ session_namespace }}.{{ ingress_domain }}
```

 Please note that the ingress is creating a DNS record, which may take a few minutes to propagate.  You may need to reload the dashboard if the DNS record was not yet available.

```dashboard:reload-dashboard
name: Spring Pet Clinic
url: http://spring-petclinic.{{ session_namespace }}.{{ ingress_domain }}
```
