# Demo setup

This image contains [Jenkins on port 8080](http://localhost:8080/), and [Artifactory on 8081](http://localhost:8081/artifactory/).

Jenkins contains a simple build job that builds a webapp and deploys to [Artifactory](http://localhost:8081/artifactory/libs-snapshot-local/org/kohsuke/test/xyz/1.0-SNAPSHOT/)



# Running this image

    docker run -i -t -p 8080:8080 -p 8081:8081 kohsuke/jenkins-puppet-demo

