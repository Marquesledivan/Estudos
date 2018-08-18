class webserver {

$packages_debian_ubuntu = [ 'htop','apache2','apache2.2-common','libapache2-mod-php5','php5','php5-curl','php5-gd','php5-intl','php5-xmlrpc','php5-pgsql','php-pear','php5-mcrypt','php5-ldap','php-net-ldap2','php5-imagick','php-fpdf','php5-mysql' ]

$packages_centos = [ 'htop','epel-release','httpd','php','php-pgsql','php-gd','php-ldap','php-xmlrpc','php-intl','php-mysql' ]

$package_name = $operatingsystem ? {
  'Debian'  => $packages_debian_ubuntu,
  'Ubuntu'  => $packages_debian_ubuntu,
  'CentOS'  => $packages_centos,
 }

$conf_perm = $operatingsystem ? { 
  'Debian' => 'www-data', 
  'Ubuntu' => 'www-data', 
  'CentOS' => 'apache', 
 }

package { $package_name:
   ensure  => present,
 }

file { '/var/www/html/index.html':
  ensure => absent,
 }

file { '/var/www/html/index.php':
  ensure => file,
  source => 'puppet:///modules/webserver/index.php',
  owner => $conf_perm,
  group => $conf_perm,
  mode => '0644',
  require => Package[$package_name],
 }

file { 'php.ini':
 path  => $operatingsystem ? {
      'Debian'   => '/etc/php5/apache2/php.ini',
      'ubuntu'   => '/etc/php5/apache2/php.ini',
      'CentOS'   => '/etc/php.ini',
   },
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/webserver/php.ini',
    require => Package[$package_name],
    notify => Service[$service_name],
 }

$service_name = $operatingsystem ? {
  'Debian'    => 'apache2',
  'Ubuntu'    => 'apache2',
  'CentOS'    => 'httpd', 
 }

service { $service_name:
  ensure => running,
  enable => true,
  require => Package[$package_name],
 }
}
