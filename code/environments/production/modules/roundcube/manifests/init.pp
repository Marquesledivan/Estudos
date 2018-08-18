class roundcube {

$packages_postgresql = [ 'postgresql-9.4','postgresql-client-9.4','postgresql-contrib-9.4' ]

package { $packages_postgresql:
   ensure  => present,
}
service { 'postgresql':
  ensure => running,
  enable => true,
 require => Package[$packages_postgresql],
 }
file { 'postgresql.conf':
    path  => '/etc/postgresql/9.4/main/postgresql.conf',
    ensure => 'present', 
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/roundcube/postgresql.conf',
    require => Package[$packages_postgresql],
    notify => Service['postgresql'],
 }
file { 'pg_hba.conf':
    path  => '/etc/postgresql/9.4/main/pg_hba.conf',
    ensure => 'present', 
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/roundcube/pg_hba.conf',
    require => Package[$packages_postgresql],
    notify => Service['postgresql'],
 }
file { 'postgres.initial.sql':
    path  => '/tmp/postgres.initial.sql',
    ensure => 'present', 
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/roundcube/postgres.initial.sql',
 }
file { 'postgresql_create.sh':
  path    => '/var/lib/postgresql/postgresql_create.sh',
  ensure  => 'present', 
  owner   => 'postgres',
  group   => 'postgres',
  mode    => '0755',
  source  => 'puppet:///modules/roundcube/postgresql_create.sh',
  require => Package[$packages_postgresql],
  before => File['postgres.initial.sql'],
 }
exec { 'su - postgres -c "bash postgresql_create.sh"': 
  path  => [ '/bin','/usr/bin','/usr/sbin' ],
  require => File['postgresql_create.sh'],
  unless  => 'su - postgres -c "psql roundcubemail"',
 }
}
