class apps::roundcube {

  include apps::webserver

$conf_perm = $operatingsystem ? { 
  'Debian' => 'www-data', 
  'Ubuntu' => 'www-data', 
  'CentOS' => 'apache', 
 }

file { 'roundcubemail.conf':
path  => $operatingsystem ? {
   'Debian'   => '/etc/apache2/sites-available/roundcubemail.conf',
   'ubuntu'   => '/etc/apache2/sites-available/roundcubemail.conf',
   'CentOS'   => '/etc/httpd/conf.d/roundcubemail.conf',
 },
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/apps/roundcubemail.conf',
  require => Package[$package_name],
  notify => Service[$package_name],
 }

exec { 'wget https://downloads.sourceforge.net/project/roundcubemail/roundcubemail/1.1.3/roundcubemail-1.1.3-complete.tar.gz -O /tmp/roundcubemail-1.1.3-complete.tar.gz':
  path   => "/usr/bin:/usr/sbin:/bin",
  unless => 'ls /tmp/roundcubemail-1.1.3-complete.tar.gz',
  alias => 'roundcube',
 }

exec { 'tar xfz /tmp/roundcubemail-1.1.3-complete.tar.gz -C /var/www/html && mv /var/www/html/roundcubemail-1.1.3 /var/www/html/roundcubemail':
  path   => "/usr/bin:/usr/sbin:/bin",
  unless => 'ls /var/www/html/roundcubemail',
  require => Exec[roundcube],
  alias => 'roundcube_app',
 }

file { 'config.inc.php':
  path  => '/var/www/html/roundcubemail/config/config.inc.php',
  ensure => 'present', 
  owner => $conf_perm,
  group => $conf_perm,
  mode => '0644',
  source => 'puppet:///modules/apps/config.inc.php',
  require => Exec['roundcube_app'],
 }
}
