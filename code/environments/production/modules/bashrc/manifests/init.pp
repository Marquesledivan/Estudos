class bashrc {

file { "/root/.bashrc":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => "0644",
    source  => "puppet:///modules/bashrc/.bashrc" 
    }
exec { "source /root/.bashrc":
  cwd     => '/root/.bashrc',
  creates => '/root/.bashrc',
  refreshonly => true,
  command     => "bash -c 'source /root/.bashrc'",
  path    => ['/usr/bin', '/usr/sbin',],
}
#    provider => shell,
#    refreshonly => true,
#    subscribe   => File["/root/.bashrc"], 
#  } 
}

