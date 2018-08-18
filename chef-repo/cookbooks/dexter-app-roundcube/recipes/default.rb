bash "download_roundcube" do
  code <<-EOC
    wget https://downloads.sourceforge.net/project/roundcubemail/roundcubemail/1.1.3/roundcubemail-1.1.3-complete.tar.gz -O /tmp/roundcubemail-1.1.3-complete.tar.gz
  EOC
  not_if "ls /tmp/roundcubemail-1.1.3-complete.tar.gz"
end

bash "install_roundcube" do
  code <<-EOC
    tar xfz /tmp/roundcubemail-1.1.3-complete.tar.gz -C /var/www/html && mv /var/www/html/roundcubemail-1.1.3 /var/www/html/roundcubemail
  EOC
  not_if "ls /var/www/html/roundcubemail"
end

cookbook_file '/var/www/html/roundcubemail/config/config.inc.php' do
  source 'config.inc.php'
  owner node['dexter-app-roundcube']['apache']['user']
  group node['dexter-app-roundcube']['apache']['user']
  mode '0644'
end

cookbook_file 'roundcubemail.conf' do
  path case node['platform']
    when 'debian', 'ubuntu'
      '/etc/apache2/sites-available/roundcubemail.conf'
    when 'centos', 'redhat'
      '/etc/httpd/conf.d/roundcubemail.conf'
    end
  source 'roundcubemail.conf'
  owner 'root'
  group 'root'
  mode '0644'
end
