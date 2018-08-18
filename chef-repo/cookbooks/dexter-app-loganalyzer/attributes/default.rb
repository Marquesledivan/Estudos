case node['platform']
when "debian", "ubuntu"
  default['dexter-app-loganalyzer']['apache']['user'] = "www-data"
when "redhat", "centos", "fedora"
  default['dexter-app-loganalyzer']['apache']['user'] = "apache"
end
