FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends openjdk-7-jdk
RUN apt-get install -y wget puppet unzip maven git tomcat7 openssh-server

RUN useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' demo) demo
USER demo
WORKDIR /home/demo

# install Artifactory
# This runs on port 8081
RUN wget -O artifactory.zip 'http://downloads.sourceforge.net/project/artifactory/artifactory/3.2.1.1/artifactory-3.2.1.1.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fartifactory%2Ffiles%2Fartifactory%2F3.2.1.1%2F&ts=1402876799&use_mirror=hivelocity'
RUN unzip artifactory.zip; rm artifactory.zip
RUN ln -s artifactory-* artifactory

# install Jenkins
RUN wget -O jenkins.war http://mirrors.jenkins-ci.org/war/latest/jenkins.war

# clone repo and do a build once (to create a local workspace & seed Maven repo)
RUN git clone --bare https://github.com/kohsuke/hello-world-webapp.git; git clone hello-world-webapp.git ws; cd ws; mvn install

ADD demo.sh /home/demo/demo.sh
ADD tomcat/server.xml /etc/tomcat7/server.xml
ADD jenkins /home/demo/jenkins
ADD artifactory /home/demo/artifactory/data
ADD puppet /home/demo/puppet
ADD home /home/demo

USER root
RUN echo 'demo ALL=NOPASSWD: ALL' >> /etc/sudoers
RUN chown -R demo:demo /home/demo
USER demo

# work in progress
#----------------------------
# create a git repo out of puppet recipes
RUN cd puppet; git init; git add .; HOME=/home/demo git commit -am "initial commit"

EXPOSE 8080 8081 8082 22
ENTRYPOINT /home/demo/demo.sh
