We've been publishing our container images to Harbor, the open source registry that's supported as part of the Tanzu portfolio. Harbor provides capabilities for hosting container images that go far beyond a simple container registry.  Harbor acts as another control point in your infrastructure that prevents images that don't meet your security standards from ever reaching your application clusters.  It shifts security checks to an earlier phase in the application lifecycle, and enables Alana to manage a secure software supply chain.

Let's look at Harbor to see how this works. Click the link below to navigate to your project page in Harbor.

```dashboard:reload-dashboard
name: Harbor
url: https://harbor.{{ ingress_domain }}/harbor/projects/{{ harbor_project_id }}/repositories
```

We can see that Tanzu Build Service has created multiple container images for the Spring Pet Clinic builds. Click on the image name.

Surprise!  When we built the initial Spring Pet Clinic images, we were intintially using an outdated base operating system that has vulnerabilities on it.

We have multiple options to mitigate this risks.  Out of the box, Harbor has the ability to prevent 

Let's take a bit deeper look at our scan results.  Hover over the "X Total" count in the Vulnerabilities columns to see an overview of the security scan results. 

Next, click on one of the `sha256:....` links, and scroll down to show the CVE list for that image.  Open up a CVE and and you can view the description, as well as click on the "I" icon to show the links to the relevant CVE reports.

Now, scroll back up to the top of the page, click on the project name (e2e-workshop-...) and go to the "configuration" tab in the top-level menu.  Notice that there is an "Automatically scan images on push" checkbox, as well as a "Prevent vulnerable images from running" options.  These two features together allows Alana to block images from being pulled that have a certain level of severity of CVE.

Now that we've discovered the vulnerabilities, let's discover how the Tanzu Build Service can help ensure that vulnerabilities are remediated automatically.