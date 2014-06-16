#!/bin/bash -x
docker-attach $1 bash -c 'cd /home/demo/jenkins; tar cvzf - --exclude=war .' | (rm -rf jenkins; mkdir jenkins; cd jenkins; tar xvzf -)
docker-attach $1 bash -c 'cd /home/demo/artifactory/data; tar cvzf - --exclude=tmp .' | (rm -rf artifactory; mkdir artifactory; cd artifactory; tar xvzf -)
