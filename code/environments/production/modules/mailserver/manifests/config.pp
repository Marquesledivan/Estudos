define mailserver::config($myorigin, $myhostname, $mydomain, $mydestination, $mynetworks){
file { 'main.cf':
  path    =>'/etc/postfix/main.cf',
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template("mailserver/main.cf.erb"),
  require => Package[$mail_packages],
  notify   => Service['postfix'],
}
}
