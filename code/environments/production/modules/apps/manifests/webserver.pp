class apps::webserver {

$packages_debian_ubuntu = [ 'apache2','apache2.2-common','libapache2-mod-php5','php5','php5-curl','php5-gd','php5-intl','php5-xmlrpc','php5-pgsql','php-pear','php5-mcrypt','php5-ldap','php-net-ldap2','php5-imagick','php-fpdf','php5-mysql' ]

$packages_centos = [ 'epel-release','httpd','php','php-pgsql','php-gd','php-ldap','php-xmlrpc','php-intl','php-mysql' ]

$package_name = $operatingsystem ? {
  'Debian'  => $packages_debian_ubuntu,
  'Ubuntu'  => $packages_debian_ubuntu,
  'CentOS'  => $packages_centos,
}

package { $package_name:
   ensure  => present,
 }

file { '/var/www/html/index.html':
  ensure => absent,
 }
file { '/var/www/html/index.php':
  ensure => absent,
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
    source => 'puppet:///modules/apps/php.ini',
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
