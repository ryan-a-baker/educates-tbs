Cody is excited that the Spring Pet Clinic is up and running in production so quickly and easily!  However, a request has come in to make the welcome message more "welcoming" to the user.

Let's take a look at how the Tanzu Build Service can build a new container image when a code update is made.  Cody has notified Alana that he has updated the welcome message from "Welcome!" to "Welcome to the Spring Pet Clinic" and created a tag for the `1.0.1` version.

Let's update our image definition to point to the new tag and observe the build to see what differences we observe.

```terminal:execute
command: kp image save spring-petclinic-1 --git-revision 1.0.1
session: 1
```

Keep in mind, if we would have used a branch as our `git-revision`, the Tanzu Build Service would automatically detect a commit and trigger a build.  However, in order to keep the external dependencies to a minumum and not require a GitHub account for this workshop, we used a tag to build the initial application.  This could also easily be done as part of CI/CD pipeline.  An example of doing so is outlined in [documentation](https://docs.pivotal.io/build-service/1-2/tbs-in-ci.html).

This time, the build will go through 6 phases on an initial build:

1. **Prepare**: This is where TBS identifies that a change was made, loads any secrets (for the registry to push as well as any source code location secrets), and downloads the source code for image creation.
2. **Detect**: TBS executes all of the available build packs against the source code, looking for signatures in the source from the build packs to determine if the build pack should be executed. 
3. **Analyze**:  Determine if there is any cached layers that can be used to speed up the build time.
4. **Restore**: If any layers were detected that could be used from cache, restore them to prepare for image assembly
5. **Build**:  Build the container by running the detected applicable Cloud Native Build Packs
6. **Export**:  Compile all the layers together to create the final image and push it to the specified registry

As you can see by looking that the logs, the Tanzu Build Service recognizes Cody's source code as Spring Boot and Maven, and employs the corresponding buildpacks to create a container image that runs the application. The container image will include VMware's best practices for container design, and the latest dependencies. Cody does not need to be a containerization expert to produce a secure, performant image.

Notice that in the detect and analyze phase, no action is taken.  This is because this is an initial image creation, and there are not yet any cached layers that can be reused.  We'll see how this would work in a later module.

Watch the logs until the build completes and the image is pushed to our Harbor container registry.  On intial build, this could take 10-15 minutes.

