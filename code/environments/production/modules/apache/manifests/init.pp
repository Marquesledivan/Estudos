class apache {

$php_perl_packages = [ 'libapache2-mod-php5','php5','php5-curl','php5-gd','php5-intl','php5-xmlrpc','php5-pgsql','php-pear','php5-mcrypt','php5-ldap','php-net-ldap2','php5-imagick','php-fpdf','libapache2-mod-perl2','libtimedate-perl','libnet-dns-perl','libnet-ldap-perl','libio-socket-ssl-perl','libpdf-api2-perl','libdbd-mysql-perl','libsoap-lite-perl','libgd-text-perl','libtext-csv-xs-perl','libjson-xs-perl','libgd-graph-perl','libapache-dbi-perl','libarchive-zip-perl','libcrypt-eksblowfish-perl','libdbd-odbc-perl','libdbd-pg-perl','libencode-hanextra-perl','libmail-imapclient-perl','libtemplate-perl','libyaml-libyaml-perl' ]

package { 'apache2':
  ensure => present,
 }
package { 'apache2.2-common':
  ensure => present,
 }
package { $php_perl_packages:
  ensure => present,
 }

file { '/var/www/html/index.html':
  ensure => file,
  owner => 'www-data',
  group => 'www-data',
  mode => '0644',
  source => 'puppet:///modules/apache/index.html',
  require => Package['apache2'],
 }

service { 'apache2':
  ensure => running,
  enable => true,
 require => Package['apache2'],
 }
}
