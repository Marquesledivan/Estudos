class mailserver {

$mail_packages = [ 'postfix','maildrop','courier-imap','courier-pop' ]

package { $mail_packages:
  ensure => present,
 }
file { 'maildirmake.sh':
  path    =>'/etc/postfix/maildirmake.sh',
  ensure  => present, 
  owner   => 'root',
  group   => 'root',
  mode    => '0755',
  source => 'puppet:///modules/mailserver/maildirmake.sh',
}
service { 'postfix':
  ensure        => running,
  enable        => true,
  hasrestart    => true,
  hasstatus     => true,
  require       => Package[$mail_packages],
  }
exec { "/bin/bash /etc/postfix/maildirmake.sh":
  provider => shell,
  path   => "/usr/bin:/usr/sbin:/bin", 
  unless => 'ls /home/suporte/Maildir',
  require => File['maildirmake.sh'],
 }
}
