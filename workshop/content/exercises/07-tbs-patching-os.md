As mentioned previously, an image **build** will be triggered anytime an image is created, when the application's source code is updated, our when one of the underlying resources is updated (stack or buildpack for example).  By updating the stack (the base operating system for the image), the Tanzu Build Service will automatically trigger a build of any images that are using that stack.

This can be done manually, or automatically as part of the [depenency updater](https://docs.pivotal.io/build-service/1-2/updating-deps.html#dependency-updater) service that was released in version 1.2 of Tanzu Build Service.  For the purposes of this workshop, we'll update the image by switching the cluster-builder to one with a more recent current stack.  The previous cluster-builder we used was an exact copy of the "base" cluster-builder, just with an older stack used.  Update the Spring Pet Clinic application image to the "base" cluster-builder with the following command:

```terminal:execute
command: kp image patch spring-petclinic --cluster-builder base
session: 1
```

As that runs, let's inpsect the logs to see what it's doing.


```terminal:execute
command: kp build logs spring-petclinic
session: 1
```

You'll notice that this build happens very quickly, and the only step is a "rebase".  That is because the Tanzu Build Service detected that this was just a switch in the stack, and the rebase simply updated the app image’s layer metadata to reference the newer base image version.

Now, we can re-inspect the image in Harbor - to ensure the vulnerabilities have been reduced.  

As a DevOps engineer, this frees Alana from the tedius task of identifying a vulnerability, locating the dockerfile used to build an image, updating the dockerfile, rebuilding the image,and pushing it to the container registry.  While this demonstrated this workflow in singularity, Alana saves a significant amount of time when the Tanzu Build Service does this across her enteprise's entire container library automatically.  When teamed with the automated dependency updater, Alana, with very little effort, can ensure all images are constantly updated to mitigate the latest vulnerabilities and adhere to newly adapted best practices for all her container runtimes!