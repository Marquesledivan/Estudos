user { 'suporte': 
  ensure           => 'present', 
  comment          => 'Suporte Dexter', 
  home             => '/home/suporte', 
  managehome       => true, 
  password         => '$1$7xb/g7zD$IHDaljkfB9vObNrqmY/5M0',
  password_max_age => '99999',
  password_min_age => '0', 
  shell            => '/bin/bash', 
}
user { 'ledivan': 
  ensure           => 'present', 
  comment          => 'Ledivan Dexter', 
  home             => '/home/ledivan', 
  managehome       => true, 
  password         => '$1$7xb/g7zD$IHDaljkfB9vObNrqmY/5M0',
  password_max_age => '99999',
  password_min_age => '0', 
  shell            => '/bin/bash', 
}
user { 'helpdesk': 
  ensure         => 'present', 
  comment        => 'HelpDesk Dexter', 
  home           => '/home/helpdesk', 
  managehome     => true, 
  password       => '$1$7xb/g7zD$IHDaljkfB9vObNrqmY/5M0', 
  password_max_age => '99999', 
  password_min_age => '0', 
  shell            => '/bin/bash', 
}

$packages_debian_ubuntu = [ 'tzdata','dnsutils','bash-completion','unzip','bzip2','htop','vim','mlocate','nfs-common' ]

$packages_centos = [ 'tzdata','bind-utils','unzip','bzip2','vim-enhanced','mlocate','nfs-utils','htop' ]

#node 'security.dexter.com.br', 'loadbalancer.dexter.com.br', 'webserver01.dexter.com.br', 'database.dexter.com.br' {
#package { $packages_debian_ubuntu:
#ensure => present,
#  }
#}
#node "webserver02.dexter.com.br" {
#package { $packages_centos:
#ensure => present,
# }
#}
node "security.dexter.com.br" {
include dns
include motd  
include stdlib
include bashrc
include rsyslog
#include roundcube
}

node "database.dexter.com.br" {
include roundcube
class { '::mysql::server':
   override_options => {
   mysqld => { bind-address => '0.0.0.0'}
   },
   root_password           => '4linux',
   remove_default_accounts => true,
  }
   include loganalyzer
   include logclient
}
node "loadbalancer.dexter.com.br" {
include logclient
include mailserver
mailserver::config  { 'loadbalancer.dexter.com.br': 
  myhostname    => 'loadbalancer',
  myorigin      => 'loadbalancer.dexter.com.br',
  mydomain      => 'dexter.com.br',
  mydestination => 'dexter.com.br, smtp.dexter.com.br, mailserver.dexter.com.br, webmail.dexter.com.br, pop.dexter.com.br,imap.dexter.com.br, localhost',
  mynetworks    => '192.168.100.0/24',
}
}
node "webserver01.dexter.com.br" {
#include apache
include motd  
include logclient
include stdlib
include bashrc
#include webserver
include apps

}
node "webserver02.dexter.com.br" {
#include httpd
include logclient
include motd  
include stdlib
include bashrc
include apps
#include webserver
}
