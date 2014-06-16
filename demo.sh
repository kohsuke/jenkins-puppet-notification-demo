#!/bin/bash
sudo mkdir /var/run/sshd
sudo /etc/init.d/ssh start

cd /home/demo
./artifactory/bin/artifactory.sh > artifactory.log 2>&1 &

export JENKINS_HOME=./jenkins
java -jar jenkins.war > jenkins.log 2>&1 &

sudo /etc/init.d/tomcat7 start

tail -F jenkins.log artifactory.log
