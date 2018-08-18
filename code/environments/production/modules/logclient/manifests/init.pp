class logclient {

package { 'rsyslog':
  ensure => present,
 }
file { '/etc/rsyslog.d/logclient.conf':
  ensure => file,
  source => 'puppet:///modules/logclient/logclient.conf',
  owner => 'root',
  group => 'root',
  mode => '0644',
  require => Package['rsyslog'],
  notify => Service['rsyslog'],
 }
service { 'rsyslog':
  ensure => running,
  enable => true,
 }
}
