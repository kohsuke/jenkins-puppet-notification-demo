#!/bin/bash
cd /home/demo
./artifactory/bin/artifactory.sh > artifactory.log 2>&1 &

export JENKINS_HOME=./jenkins
java -jar jenkins.war > jenkins.log 2>&1 &

tail -F jenkins.log artifactory.log
