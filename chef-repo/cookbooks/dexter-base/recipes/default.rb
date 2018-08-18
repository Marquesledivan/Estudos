user 'suporte' do
  manage_home true
  action :create
  comment 'Suporte DevOps'
  home '/home/suporte'
  shell '/bin/bash'
  password '$1$HVidQZU9$ADd9eCoszq6dewMntl0u80'
end
user 'helpdesk' do
  manage_home true
  action :create
  comment 'HelpDesk DevOps'
  home '/home/helpdesk'
  shell '/bin/bash'
  password '$1$HVidQZU9$ADd9eCoszq6dewMntl0u80'
end
user 'ledivan' do
  manage_home true
  action :create
  comment 'Ledivan DevOps'
  home '/home/ledivan'
  shell '/bin/bash'
  password '$1$HVidQZU9$ADd9eCoszq6dewMntl0u80'
end
apt_update 'all platforms' do
  frequency 86400
  action :periodic
end
package 'utilitarios' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name ['htop', 'epel-release','tzdata', 'bind-utils', 'unzip', 'bzip2', 'mlocate', 'vim-enhanced', 'nfs-utils'] 
    action :install
  when 'ubuntu', 'debian'
    package_name ['htop','iotop','vim','figlet','elinks'] 
    action :install
  end
end
cookbook_file '/etc/hosts' do
  source 'hosts'
  owner 'root'
  group 'root'
  mode '0644'
end
cookbook_file '/etc/resolv.conf' do
  source 'resolv.conf'
  owner 'root'
  group 'root'
  mode '0644'
end
bash 'motd' do
    code <<-EOH
    figlet Chef Client > /etc/motd
    EOH
end
