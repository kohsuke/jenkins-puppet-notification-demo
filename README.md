# Demo setup

This image contains [Jenkins on port 8080](http://localhost:8080/), [Artifactory on 8081](http://localhost:8081/artifactory/), and [Tomcat on 8082](http://localhost:8082/)

Jenkins contains a simple build job that builds a webapp `xyz.war` and deploys to [Artifactory](http://localhost:8081/artifactory/libs-snapshot-local/org/kohsuke/test/xyz/1.0-SNAPSHOT/). The idea is to use puppet to deploy this to Tomcat by placing the file under `/var/lib/tomcat7/webapps`. 



# Running this image

    docker run -i -t -p 8080:8080 -p 8081:8081 -p 8082:8082 kohsuke/jenkins-puppet-demo

