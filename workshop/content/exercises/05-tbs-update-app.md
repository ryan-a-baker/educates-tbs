Cody is excited that the Spring Pet Clinic is up and running in production so quickly and easily!  However, a request has come in to make the welcome message more "welcoming" to the user.

Let's take a look at how the Tanzu Build Service can build a new container image when a code update is made.  Cody has notified Alana that he has updated the welcome message from "Welcome!" to "Welcome to the Spring Pet Clinic" and created a tag for the `1.0.1` version.

Let's update our image definition to point to the new tag and observe the build to see what differences we observe.

```terminal:execute
command: kp image save spring-petclinic --git-revision 1.0.1
session: 1
```

Keep in mind, if we would have used a branch as our `git-revision`, the Tanzu Build Service would automatically detect a commit and trigger a build.  However, in order to keep the external dependencies to a minumum and not require a GitHub account for this workshop, we used a tag to build the initial application.  This could also easily be done as part of CI/CD pipeline.  An example of doing so is outlined in [documentation](https://docs.pivotal.io/build-service/1-2/tbs-in-ci.html).

Now that we've updated the revision to `1.0.1`, let's look at the build logs and compare the differences:

```terminal:execute
command: kp build logs spring-petclinic
session: 1
```

This time, the build will go through all six phases again.  However, we'll notice that during the Analyze and Restore phases, action will be taken instead of skipped.  This is because the Tanzu Build Service has identified that there are layers of the image that have not been impacted by the code changes, and therefore, do not need to rebuilt.  In order to save time and resources, the Tanzu Build Service will instead use these layers from cache.  You should notice that the build time should drop to only a couple minutes instead of the original 10-15 minutes.

Once the image has finished building successfully, let's restart the application.  Since the image pull policy was set to "Always" on the deployment configuration, the latest image will be pulled from Harbor, and we should see our changes. pod so that the latest image will be pulled.

```terminal:execute
command: kubectl delete pod -l app=spring-petclinic
session: 1
```

Once the pod returns to a running state, the welcome message should be updated to "Welcome to the Spring Pet Clinic!"  Let's reload the application to see the changes.

```dashboard:reload-dashboard
name: Spring Pet Clinic
url: http://spring-petclinic.{{ session_namespace }}.{{ ingress_domain }}
```