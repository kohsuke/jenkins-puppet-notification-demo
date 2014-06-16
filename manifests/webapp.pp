class xyz {
    exec { 'xyz.war':
        command => "/usr/bin/wget -O /tmp/xyz.war --timestamping http://localhost:8081/artifactory/libs-snapshot-local/org/kohsuke/test/xyz/1.0-SNAPSHOT/xyz-1.0-SNAPSHOT.war",
        cwd => "/tmp",
    }

    file { "/var/lib/tomcat7/webapps/xyz.war":
        ensure => present,
        source => "/tmp/xyz.war",
        require => Exec["xyz.war"]
    }
}

include xyz
