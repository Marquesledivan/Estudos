class apps::loganalyzer {

  include apps::webserver

$conf_perm = $operatingsystem ? { 
  'Debian' => 'www-data', 
  'Ubuntu' => 'www-data', 
  'CentOS' => 'apache', 
 }

file { 'loganalyzer.conf':
path  => $operatingsystem ? {
   'Debian'   => '/etc/apache2/sites-available/loganalyzer.conf',
   'ubuntu'   => '/etc/apache2/sites-available/loganalyzer.conf',
   'CentOS'   => '/etc/httpd/conf.d/loganalyzer.conf',
 },
  ensure => 'present', 
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/apps/loganalyzer.conf',
  require => Package[$package_name],
  notify => Service[$package_name],
 }

exec { 'wget -c http://download.adiscon.com/loganalyzer/loganalyzer-4.1.3.tar.gz -O /tmp/loganalyzer-4.1.3.tar.gz':
  path   => "/usr/bin:/usr/sbin:/bin",
  unless => 'ls /tmp/loganalyzer-4.1.3.tar.gz',
  alias => 'loganalyzer',
 }
exec { 'tar xfz /tmp/loganalyzer-4.1.3.tar.gz -C /tmp && mv /tmp/loganalyzer-4.1.3/src /var/www/html/loganalyzer && rm -rf /tmp/loganalyzer-4.1.3':
  path   => "/usr/bin:/usr/sbin:/bin",
  unless => 'ls /var/www/html/loganalyzer',
  require => Exec[loganalyzer],
  alias => 'loganalyzer_app',
  }
file { 'config.php':
  path  => '/var/www/html/loganalyzer/config.php',
  ensure => 'present', 
  owner => $conf_perm,
  group => $conf_perm,
  mode => '0644',
  source => 'puppet:///modules/apps/config.php',
  require => Exec['loganalyzer_app'],
 }
}
