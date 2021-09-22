A **build** will be triggered when an image is created, or when the application's source code is updated. Use this command to stream the build logs as you describe the buildpack process.

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

As you can see by looking that the logs, the Tanzu Build Service recognizes Cody's source code as Spring Boot and Maven, and employs the correspondering buildpacks to create a container image that runs the application. The container image will include VMware's best practices for container design, and the latest dependencies. Cody does not need to be a containerization expert to produce a secure, performant image.

Tanzu Build Service is an important tool for Day 2 Operations as well. Alana can update the buildpacks, or the stacks, and TBS will automatically trigger a rebuild of all affected containers in her environment. This means Alana doesn't have to work through Cody to keep her container runtimes patched and secure.

Surprise! In the previous command, we actually told Tanzu Build Service to run that build with an outdated OS image, riddled with security vulnerabilities. Let's see what happens when our Alana tells Tanzu Build Service to use publishes a new stack (base image), triggering a rebuild of the affected container without getting Cody involved:

```terminal:execute
command: kp image patch spring-webdb --cluster-builder default
session: 1
```

See how the image is quickly rebuilt:

```terminal:execute
command: kp build logs spring-webdb
session: 1
```

And check out the build history of the image. The first build was triggered when we defined the image, the second when we provided a new base OS layer:

```terminal:execute
command: kp build list spring-webdb
session: 1
```
