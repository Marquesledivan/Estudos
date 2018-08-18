case node['platform']
when "debian", "ubuntu"
  default['dexter-app-roundcube']['apache']['user'] = "www-data"
when "redhat", "centos", "fedora"
  default['dexter-app-roundcube']['apache']['user'] = "apache"
end

