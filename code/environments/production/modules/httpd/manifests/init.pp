class httpd {

$php_perl_packages = [ 'php','php-pgsql','php-gd','php-ldap','php-xmlrpc','php-intl','policycoreutils-python','perl(ExtUtils::MakeMaker)','perl(Sys::Syslog)','perl(Archive::Tar)','perl(Archive::Zip)','perl(Crypt::Eksblowfish::Bcrypt)','perl(Crypt::SSLeay)','perl(Date::Format)','perl(DBD::Pg)','perl(Encode::HanExtra)','perl(JSON::XS)','perl(Mail::IMAPClient)','perl(IO::Socket::SSL)','perl(ModPerl::Util)','perl(Net::DNS)','perl(Net::LDAP)','perl(Template)','perl(Template::Stash::XS)','perl(Text::CSV_XS)','perl(Time::Piece)','perl(XML::LibXML)','perl(XML::LibXSLT)','perl(XML::Parser)','perl(YAML::XS)' ]

package { 'epel-release':
  ensure => present,
 }
package { 'httpd':
  ensure => present,
 }
package { $php_perl_packages:
  ensure => present,
 }

file { '/var/www/html/index.html':
  ensure => file,
  owner => 'apache',
  group => 'apache',
  mode => '0644',
  source => 'puppet:///modules/httpd/index.html',
  require => Package['httpd'],
 }

service { 'httpd':
  ensure => running,
  enable => true,
 require => Package['httpd'],
 }
}
