package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name ['epel-release','httpd','php','php-pgsql','php-gd','php-ldap','php-xmlrpc','php-intl','php-mysql']
    action :install
    notifies :start, 'service[Web Service]', :immediately
  when 'ubuntu', 'debian'
    package_name ['apache2','libapache2-mod-php5','php5','php5-curl','php5-gd','php5-intl','php5-xmlrpc','php5-pgsql','php-pear','php5-mcrypt','php5-ldap','php-net-ldap2','php5-imagick','php-fpdf','php5-mysql']
    action :install
    notifies :start, 'service[Web Service]', :immediately
  end
end
cookbook_file '/var/www/html/index.php' do
  source 'index.php'
  owner 'root'
  group 'root'
  mode '0644'
end
cookbook_file 'php.ini' do
  path case node['platform']
    when 'debian', 'ubuntu'
      '/etc/php5/apache2/php.ini'
    when 'centos', 'redhat'
      '/etc/php5.ini'
    end
  source 'php.ini'
  owner 'root'
  group 'root'
  mode '0644'
end
service 'Web Service' do
  case node[:platform]
  when 'redhat', 'centos'
    service_name 'httpd'
    supports :status => true, :restart => true, :reload => true
    action [:enable, :start]
  when 'ubuntu', 'debian'
    service_name 'apache2'
    supports :status => true, :restart => true, :reload => true
    action [:enable, :start]
  end
end
