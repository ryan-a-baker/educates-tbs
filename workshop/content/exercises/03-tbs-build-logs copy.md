A **build** will be triggered when an image is created, when the application's source code is updated, our when one of the underlying resources is updated (stack or buildpack for example).  Since we just triggered a build, use this command to view the build logs and understand the process an image build goes through.

```terminal:execute
command: kp build logs spring-petclinic
session: 1
```

The build will go through 6 phases on an initial build:

1. **Prepare**: This is where TBS identifies that a change was made, loads any secrets (for the registry to push as well as any source code location secrets), and downloads the source code for image creation.
2. **Detect**: TBS executes all of the available build packs against the source code, looking for signatures in the source from the build packs to determine if the build pack should be executed. 
3. **Analyze**:  Determine if there is any cached layers that can be used to speed up the build time.
4. **Restore**: If any layers were detected that could be used from cache, restore them to prepare for image assembly
5. **Build**:  Build the container by running the detected applicable Cloud Native Build Packs
6. **Export**:  Compile all the layers together to create the final image and push it to the specified registry

As you can see by looking that the logs, the Tanzu Build Service recognizes Cody's source code as Spring Boot and Maven, and employs the corresponding buildpacks to create a container image that runs the application. The container image will include VMware's best practices for container design, and the latest dependencies. Cody does not need to be a containerization expert to produce a secure, performant image.

Notice that in the detect and analyze phase, no action is taken.  This is because this is an initial image creation, and there are not yet any cached layers that can be reused.  We'll see how this would work in a later module.

Watch the logs until the build completes and the image is pushed to our Harbor container registry.  On intial build, this could take 10-15 minutes.

