define :rsyslog_mysql_setup do
  package "rsyslog-mysql" do
  action :install
  notifies :start, 'service[rsyslog]', :immediately
  end
cookbook_file '/etc/rsyslog.d/mysql.conf' do
  source 'mysql.conf'
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
