# manage filetest
class filetest {
      file { '/tmp/archive.txt':
      	   source => 'puppet:///modules/filetest/archive.txt',
      }
}