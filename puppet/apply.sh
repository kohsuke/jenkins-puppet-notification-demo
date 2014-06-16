#!/bin/bash -ex
# run puppet to deploy xyz.war, and push the result to Jenkins
exec puppet apply --reports http --reporturl=http://localhost:8080/puppet/report webapp.pp
