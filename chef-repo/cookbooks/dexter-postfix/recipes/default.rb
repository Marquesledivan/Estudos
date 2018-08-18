package 'postfix' do
  action :install
  notifies :start, 'service[postfix]', :immediately
end
package 'dovecot' do
  action :install
  notifies :start, 'service[dovecot]', :immediately
end
template '/etc/postfix/main.cf' do
  source 'main.cf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :minha_rede => node[:postfix][:config]
  })
  notifies :restart, 'service[postfix]', :immediately
end
cookbook_file '/etc/dovecot/dovecot.conf' do
  source 'dovecot.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[dovecot]', :immediately
end
cookbook_file '/etc/dovecot/conf.d/10-mail.conf' do
  source '10-mail.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[dovecot]', :immediately
end
cookbook_file '/etc/dovecot/conf.d/10-auth.conf' do
  source '10-auth.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[dovecot]', :immediately
end
cookbook_file '/etc/dovecot/conf.d/10-master.conf' do
  source '10-master.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[dovecot]', :immediately
end
service 'postfix' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
service 'dovecot' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
