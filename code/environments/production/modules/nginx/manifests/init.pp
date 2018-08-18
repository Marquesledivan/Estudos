class nginx {

package { 'nginx':
  ensure => present,
 }
service { 'nginx':
  ensure => running,
  enable => true,
 }
file { '/etc/nginx/nginx.conf':
  ensure => file,
  source => 'puppet:///modules/nginx/nginx.conf',
  owner => 'root',
  group => 'root',
  mode => '0644',
  require => Package['nginx'],
  notify => Service['nginx'],
 }
}
