# Demo setup

This image demonstrates the artifact traceability of Jenkins via its [deployment notification plugin](https://wiki.jenkins-ci.org/display/JENKINS/Deployment+Notification+Plugin).

It consists of [a webapp that the team is hypothetically working on](https://github.com/kohsuke/hello-world-webapp), [Jenkins that builds it](http://localhost:8080/), which deploys the war to [Artifactory](http://localhost:8081/artifactory/). Puppet then fetches this war and deploys that to [production web server](http://localhost:8082/xyz/).
 
The priary user in the image is `demo` (with password `demo`), and sshd is configured so that you can login and act as the demo user remotely.

Jenkins contains a simple build job that builds a webapp `xyz.war` and deploys to [Artifactory](http://localhost:8081/artifactory/libs-snapshot-local/org/kohsuke/test/xyz/1.0-SNAPSHOT/).

To run puppet, login via ssh into the demo box and run `cd /home/demo/puppet; sudo ./apply.sh`. This will run puppet and submit the result back to Jenkins.

`/home/demo/ws` contains a local checkout of the webapp that can be edited, committed, and pushed to change the webapp.

The Jenkins job `webapp` has a build promotion setup to perform promotion when the artifact is deployed. Another `smoke-test` job is configured to perform a post-deployment smoke test against the deployment.



# Running this image

    docker run -i -t -p 8080:8080 -p 8081:8081 -p 8082:8082 -p 8022:22 kohsuke/jenkins-puppet-demo

# Demo cheat sheet

* Go to `http://localhost:8080/` and walk through the job setup
* Manually start a `webapp` build and watch it deploy to Artifactory
* Go to terminal and run puppet to deploy the image to the production server.
* Go to `http://localhost:8082/xyz/` and see the deployment
* Go back to Jenkins and see the smoke test run and the promotion
* Go to `/home/demo/ws` and make some changes to the webapp, and push the change to `origin`
* Build `webapp` a couple of times to simulate the reality that not every build gets deployed
* Run puppet again, see that the change is reflected in `http://localhost:8082/xyz/`, and deployment side-effects have run


