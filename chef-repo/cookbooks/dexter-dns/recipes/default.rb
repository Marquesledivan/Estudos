apt_update 'all platforms' do
  frequency 86400
  action :periodic
end
package 'bind9' do
  action :install
  notifies :start, 'service[bind9]', :immediately
end
cookbook_file '/etc/bind/named.conf.local' do
  source 'named.conf.local'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[bind9]', :immediately
end
cookbook_file '/etc/bind/named.conf.options' do
  source 'named.conf.options'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[bind9]', :immediately
end
cookbook_file '/var/cache/bind/db.dexter.interna' do
  source 'db.dexter.interna'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[bind9]', :immediately
end
cookbook_file '/var/cache/bind/rev.dexter.interna' do
  source 'rev.dexter.interna'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[bind9]', :immediately
end
service 'bind9' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
