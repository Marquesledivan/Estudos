cookbook_file '/tmp/mysql-initial-syslog.sql' do
  source 'mysql-initial-syslog.sql'
  owner 'root'
  group 'root'
  mode '0644'
end

package 'mariadb-server' do
  action :install
  notifies :start, 'service[mariadb]', :immediately
end

service 'mariadb' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

bash "mysql_secure_installation" do
  code <<-EOC
    mysqladmin -u root password 4linux
  EOC
  not_if "mysql -u root -p4linux"
end

bash "mysql_database_create" do
  code <<-EOC
    mysql -u root -p4linux -e "CREATE DATABASE Syslog;"
  EOC
  not_if "mysql -u root -p4linux -e 'SHOW DATABASES;' | grep Syslog"
end

bash "mysql_import_tables" do
  code <<-EOC
    mysql -u root -p4linux Syslog < /tmp/mysql-initial-syslog.sql
  EOC
  not_if "mysql -u root -p4linux -e 'SELECT * FROM Syslog.logcon_users;'"
end

bash "mysql_user_create" do
  code <<-EOC
    mysql -u root -p4linux -e "GRANT ALL ON Syslog.* TO syslog@localhost IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "GRANT ALL ON Syslog.* TO syslog@homolog.dexter.com.br IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "GRANT ALL ON Syslog.* TO syslog@security.dexter.com.br IDENTIFIED BY '4linux';"
    mysql -u root -p4linux -e "FLUSH PRIVILEGES;"
  EOC
  not_if "mysql -u root -p4linux -e 'SELECT * FROM mysql.user;' | grep syslog"
end
