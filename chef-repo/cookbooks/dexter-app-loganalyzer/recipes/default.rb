bash "download_loganalyzer" do
  code <<-EOC
    wget -c http://download.adiscon.com/loganalyzer/loganalyzer-4.1.3.tar.gz -O /tmp/loganalyzer-4.1.3.tar.gz
  EOC
  not_if "ls /tmp/loganalyzer-4.1.3.tar.gz"
end

bash "install_loganalyzer" do
  code <<-EOC
    tar xfz /tmp/loganalyzer-4.1.3.tar.gz -C /tmp && mv /tmp/loganalyzer-4.1.3/src /var/www/html/loganalyzer && rm -rf /tmp/loganalyzer-4.1.3
  EOC
  not_if "ls /var/www/html/loganalyzer"
end

cookbook_file '/var/www/html/loganalyzer/config.php' do
  source 'config.php'
  owner node['dexter-app-loganalyzer']['apache']['user']
  group node['dexter-app-loganalyzer']['apache']['user']
  mode '0644'
end

cookbook_file 'loganalyzer.conf' do
  path case node['platform']
    when 'debian', 'ubuntu'
      '/etc/apache2/sites-available/loganalyzer.conf'
    when 'centos', 'redhat'
      '/etc/httpd/conf.d/loganalyzer.conf'
    end
  source 'loganalyzer.conf'
  owner 'root'
  group 'root'
  mode '0644'
end
