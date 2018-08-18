class memcached {

package { 'memcached':
  ensure => present,
 }
service { 'memcached':
  ensure => running,
  enable => true,
 }
file { '/etc/memcached.conf':
  ensure => file,
  source => 'puppet:///modules/memcached/memcached.conf',
  owner => 'root',
  group => 'root',
  mode => '0644',
  require => Package['memcached'],
  notify => Service['memcached'],
 }
}
