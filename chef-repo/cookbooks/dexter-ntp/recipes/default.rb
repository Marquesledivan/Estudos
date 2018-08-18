package 'ntp' do
  action :install
end
cookbook_file '/etc/ntp.conf' do
  source 'ntp.conf'
  owner 'root'
  group 'root'
   mode '0644'
end
service 'ntpd' do
     supports :status => true, :restart => true, :reload => true
     action [:enable, :start]
end 
