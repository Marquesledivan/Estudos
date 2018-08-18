class dns { 

package { 'bind9': 
  ensure  => 'installed', 
 }
service { "bind9":
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
 }
file { 'named.conf.local':
  path => '/etc/bind/named.conf.local',
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/dns/named.conf.local',
  require => Package['bind9'],
  notify => Service['bind9'],
 }
file { 'named.conf.options':
  path => '/etc/bind/named.conf.options',
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/dns/named.conf.options',
  require => Package['bind9'],
  notify => Service['bind9'],
 }
file { 'db.dexter.interna':
  path => '/var/cache/bind/db.dexter.interna',
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/dns/db.dexter.interna',
  require => Package['bind9'],
  notify => Service['bind9'],
 }
file { 'rev.dexter.interna':
  path => '/var/cache/bind/rev.dexter.interna',
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/dns/rev.dexter.interna',
  require => Package['bind9'],
  notify => Service['bind9'],
 }
}
