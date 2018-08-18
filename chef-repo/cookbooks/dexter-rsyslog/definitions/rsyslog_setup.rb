define :rsyslog_setup do
package 'rsyslog' do
  action :install
  notifies :start, 'service[rsyslog]', :immediately
end
cookbook_file '/etc/rsyslog.conf' do
  source 'rsyslog.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[rsyslog]', :immediately
end
service 'rsyslog' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
 end
end
