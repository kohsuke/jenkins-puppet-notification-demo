FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends openjdk-7-jdk
RUN apt-get install -y wget puppet unzip maven git

RUN useradd -m demo
USER demo
WORKDIR /home/demo

# install Artifactory
# This runs on port 8081
RUN wget -O artifactory.zip 'http://downloads.sourceforge.net/project/artifactory/artifactory/3.2.1.1/artifactory-3.2.1.1.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fartifactory%2Ffiles%2Fartifactory%2F3.2.1.1%2F&ts=1402876799&use_mirror=hivelocity'
RUN unzip artifactory.zip
RUN ln -s artifactory-* artifactory

# install Jenkins
RUN wget -O jenkins.war http://mirrors.jenkins-ci.org/war/latest/jenkins.war

# and plugins for demo
RUN mkdir jenkins/plugins
RUN wget -O jenkins/plugins/puppet.jpi https://updates.jenkins-ci.org/latest/puppet.hpi
RUN wget -O jenkins/plugins/deployment-notification.jpi https://updates.jenkins-ci.org/latest/deployment-notification.hpi

ADD demo.sh /home/demo/demo.sh

EXPOSE 8080 8081
ENTRYPOINT /home/demo/demo.sh