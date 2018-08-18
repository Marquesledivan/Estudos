package 'memcached' do
  action :install
  notifies :start, 'service[memcached]', :immediately
end
cookbook_file '/etc/memcached.conf' do
  source 'memcached.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[memcached]', :immediately
end
service 'memcached' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
