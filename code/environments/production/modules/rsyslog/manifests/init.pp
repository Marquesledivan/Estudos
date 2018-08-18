class rsyslog {

package { 'rsyslog':
  ensure => present,
 }
package { 'rsyslog-mysql':
  ensure => present,
 }
service { 'rsyslog':
  ensure => running,
  enable => true,
 }
file { '/etc/rsyslog.conf':
  ensure => file,
  source => 'puppet:///modules/rsyslog/rsyslog.conf',
  owner => 'root',
  group => 'root',
  mode => '0644',
  require => Package['rsyslog'],
  notify => Service['rsyslog'],
 }
file { '/etc/rsyslog.d/mysql.conf':
  ensure => file,
  source => 'puppet:///modules/rsyslog/mysql.conf',
  owner => 'root',
  group => 'root',
  mode => '0644',
  require => Package['rsyslog-mysql'],
  notify => Service['rsyslog'],
 }
}
