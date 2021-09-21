Now that Cody has built the container for the Spring Pet Clinic, Alana is going to deploy the application.  She does this using a helm chart and points it to the image that was just created:


```terminal:execute
command: helm upgrade --install --wait spring-petclinic chart/spring-petclinic
session: 1
```

This will deploy a simple pod and service.  In order to view the web application, let's use port forwarding to be able to connect to the private kubernetes IP.

```terminal:execute
kubectl port-forward service/spring-petclinic 8080:80
session: 2
```

Once that is complete, let's open the application to view it.


```dashboard:open-url
url: http://localhost:8080
```