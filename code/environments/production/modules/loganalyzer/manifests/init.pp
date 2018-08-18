class loganalyzer {

file { 'mysql-initial-syslog.sql':
  path  => '/tmp/mysql-initial-syslog.sql',
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/loganalyzer/mysql-initial-syslog.sql',
 }
  mysql::db { 'Syslog':
  user     => 'syslog',
  password => '4linux',
  host     => '%',
  grant    => ['ALL'],
  sql      => '/tmp/mysql-initial-syslog.sql',
  import_timeout => 900,
  require  => File['mysql-initial-syslog.sql'],
 }
}

